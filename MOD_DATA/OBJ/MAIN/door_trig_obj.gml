// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Collision
    coll_var[0] = global.door_trig_coll[0];
    coll_var[1] = global.door_trig_coll[1];
    coll_var[2] = global.door_trig_coll[2];
    // Text
    do_txt_var = true;
    ini_open(global.lang_var)
    txt_var = ini_read_string("UI","open","UI_open");
    txt_lock_var = ini_read_string("UI","lock","UI_lock");
    ini_close();
    shadow_off_var = 2;
    // Sound
    snd_len_var = 4;
    snd_arr[0] = door_01_snd;
    snd_arr[1] = door_02_snd;
    snd_arr[2] = door_03_snd;
    snd_arr[3] = door_04_snd;
    // Function
    rm_count_var = 1;
    delay_var = 20;
    zone_var = -1;
    // Alarm
    alarm_len_var = 1;
');
// Room Start Event
// Moved here to prevent monster conflicts
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited(); 
    if rm_var == 0
    {
        // Elevator
        switch global.ele_type_var
        {
            case 2:
            {
                if mod_scr(global.rm_count_var+1,global.ele_rate_03_var) == 0
                { rm_var = ele_rm; }
                if global.rm_count_var >= global.ele_end_02_var { break; }
            }
            case 1:
            {
                if mod_scr(global.rm_count_var+1,global.ele_rate_02_var) == 0
                { rm_var = ele_rm; }
                if global.rm_count_var >= global.ele_end_01_var { break; }
            }
            case 0:
            {
                if mod_scr(global.rm_count_var+1,global.ele_rate_01_var) == 0
                { rm_var = ele_rm; }
                break;
            }
        }
        if rm_var == 0
        {
            // Rare Rooms
            if !instance_exists(mon_par_obj) && global.rare_chance_var > 0 && frac_chance_scr(1,global.rare_chance_var)
            { rm_var = ds_list_find_value(global.rare_zone_var,irandom(ds_list_size(global.rare_zone_var)-1)); }
            else
            {
                zone_var = global.zone_var;
                event_user(0);
            }
        }
    }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    if room_exists(rm_var) && rm_var != 0 { rm_goto_scr(rm_var); }
    else { show_error("Room "+string(rm_var)+" does not exist!",false); rm_goto_scr(hall_01_rm); }
    global.rm_count_var += rm_count_var;
')
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    visible = false;
    local.door = id;
    local.active = false;
    local.remaining = 0;
    // Check remaining players
    with player_obj { if !in_door_var && !dead_var { local.remaining += 1; }}
    // Check for eligable players
    with player_obj
    {
        if !in_door_var && !dead_var
        {
            // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
            if box_coll_scr(x,y,z,coll_var[2],coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[2],other.coll_var[1])
            {
                other.visible = other.do_txt_var;
                other.cam_id_var = cam_id_var
                if global.input_press_arr[interact_input_const,player_id_var] == 1
                {
                    if !other.lock_var
                    {
                        on_var = false;
                        in_door_var = true;
                        local.active = true;
                        local.player = id;
                        local.remaining -= 1;
                        with instance_create(0,0,fade_eff_obj)
                        {
                            image_blend = c_black;
                            image_alpha = 0;
                            set_alarm_scr(0,local.door.delay_var); 
                            invert_var = true;
                            stay_var = true;
                            cam_id_var = local.player.cam_id_var;
                        }
                        other.player_var += 1;
                    }
                    else if !instance_exists(txt_obj)
                    {
                        local.txt = instance_create(0,0,txt_obj);
                        local.txt.txt_var = other.txt_lock_var;
                        fmod_snd_play_scr(deny_snd);
                    }
                }
            }
        }
    }
    // If no remaining players, check most voted door
    if !global.in_door_var && local.remaining == 0
    && (local.active || global.player_len_var > 1 || !global.debug_var) // Dont go in single player if not opened (testing)
    {
        local.bestdoor = id;
        local.bestnum = player_var;
        with door_trig_obj
        {
            if player_var > local.bestnum
            {
                local.bestdoor = id;
                local.bestnum = player_var;
            }
        }
        with local.bestdoor
        { set_alarm_scr(0,delay_var); }
        global.in_door_var = true;
        // Play sound
        fmod_snd_play_scr(snd_arr[irandom(snd_len_var-1)]);
    }
');
// Recalculate Door
object_event_add
(argument0,ev_other,ev_user0,'
    if zone_var >= 0
    {
        local.set = false;
        with door_trig_obj
        {
            if zone_var == other.zone_var && rm_var != 0 && id != other.id
            {
                other.rm_var = rm_var;
                local.set = true;
            }
        }
        if !local.set
        {
            if ds_list_size(global.rm_list_var) <= 0
            {
                ds_list_copy(global.rm_list_var,global.zone_var);
                ds_list_shuffle(global.rm_list_var);
            }
            rm_var = ds_list_find_value(global.rm_list_var,0);
            ds_list_delete(global.rm_list_var,0);
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var 
    {
        if view_wview[view_current] >= view_hview[view_current]
        { local.scale = view_hview[view_current]/720; }
        else { local.scale = view_wview[view_current]/1280; }

        if lock_var { local.txt = txt_lock_var; }
        else {local.txt = txt_var; }

        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);

        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);

        local.xtmp = view_wview[view_current]/2;
        local.ytmp = view_hview[view_current]*0.9;

        local.shadow = shadow_off_var*local.scale;

        draw_set_color(make_color_rgb(30,0,50));
        draw_text_transformed(local.xtmp-(local.shadow*2),local.ytmp+(local.shadow*2),local.txt,local.scale,local.scale,0);
        draw_text_transformed(local.xtmp-local.shadow,local.ytmp+local.shadow,local.txt,local.scale,local.scale,0);
        
        draw_set_color(c_white);
        draw_text_transformed(local.xtmp,local.ytmp,local.txt,local.scale,local.scale,0);

        draw_set_halign(fa_left);
        draw_set_valign(fa_top);

        d3d_set_hidden(true);
    }
');