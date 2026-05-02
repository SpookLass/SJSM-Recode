// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
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
    if !variable_local_exists("txt_var") { txt_var = ini_read_string("UI","open","UI_open"); }
    if !variable_local_exists("txt_lock_var") { txt_lock_var = ini_read_string("UI","lock","UI_lock"); }
    ini_close();
    min_scale_var = 0.125;
    str_x_var = 0;
    str_y_var = -72;
    halign_var = fa_center;
    valign_var = fa_bottom;
    sep_var = -1;
    margin_var = 108;
    // Shadow
    shadow_x_var = -4;
    shadow_y_var = 4;
    shadow_var = 2;
    shadow_color_var = make_color_rgb(30,0,50);
    // Sound
    snd_len_var = 4;
    snd_arr[0] = door_01_snd;
    snd_arr[1] = door_02_snd;
    snd_arr[2] = door_03_snd;
    snd_arr[3] = door_04_snd;
    // Function
    interact_target_var = noone;
    delay_var = 20;
    zone_var = -1;
    ele_var = false;
    if !variable_local_exists("rm_count_var") { rm_count_var = 1; }
    if !variable_local_exists("lock_var") { lock_var = false; }
    if !variable_local_exists("safe_var") { safe_var = !instance_exists(mon_par_obj); }
    player_var = 0;
    // Alarm
    alarm_len_var = 1;
    alarm_ini_scr();
');
// Room Start Event
// Moved here to prevent monster conflicts
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited(); 
    if !variable_local_exists("rm_var")
    {
        local.set = false;
        ele_var = false;
        // Elevator
        switch global.ele_type_var
        {
            case 2:
            {
                if mod_scr(global.rm_count_var+1,global.ele_rate_03_var) == 0
                { rm_var = ele_rm; ele_var = true; local.set = true; break; }
                if global.rm_count_var >= global.ele_end_02_var { break; }
            }
            case 1:
            {
                if mod_scr(global.rm_count_var+1,global.ele_rate_02_var) == 0
                { rm_var = ele_rm; ele_var = true; local.set = true; break; }
                if global.rm_count_var >= global.ele_end_01_var { break; }
            }
            default:
            {
                if mod_scr(global.rm_count_var+1,global.ele_rate_01_var) == 0
                { rm_var = ele_rm; ele_var = true; local.set = true; break; }
                break;
            }
        }
        // Rare Rooms
        if safe_var && !local.set
        {
            // Dev
            if global.save_name_var == "1235" && frac_chance_scr(1,235) { rm_var = dev_rm; local.set = true; }
            // Other
            if !local.set && global.rare_chance_var > 0 && frac_chance_scr(1,global.rare_chance_var)
            { rm_var = ds_list_find_value(global.rare_zone_var,irandom(ds_list_size(global.rare_zone_var)-1)); local.set = true; }
        }
        // Default
        if !local.set
        {
            zone_var = global.zone_var;
            event_user(0);
        }
    }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    global.rm_count_var += rm_count_var;
    if ele_var { zone_scr(-1,true); tex_scr(-1); }
    if room_exists(rm_var) && rm_var != 0 { rm_goto_scr(rm_var); }
    else { show_error("Room "+string(rm_var)+" does not exist!",false); rm_goto_scr(hall_01_rm); }
')
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if !global.pause_var
    {
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
                    other.visible = other.do_txt_var && !instance_exists(txt_obj);
                    other.cam_id_var = cam_id_var;
                    if global.input_press_arr[interact_input_const,player_id_var] == 1
                    {
                        local.player = id;
                        local.active = true;
                        if !other.lock_var
                        {
                            in_door_var = true;
                            local.remaining -= 1;
                            other.player_var += 1;
                        }
                    }
                }
            }
        }
        // Activate
        if local.active
        {
            interact_target_var = local.player;
            if lock_var { event_user(3) }
            else { event_user(1); }
        }
        // If no remaining players, check most voted door
        if !lock_var && !global.in_door_var && local.remaining == 0
        && (local.active || global.player_len_var > 1 || !global.debug_var) // Dont go in single player if not opened (testing)
        { event_user(2); }
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
            if zone_var == other.zone_var && variable_local_exists("rm_var") && id != other.id
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
// Interact Event
object_event_add
(argument0,ev_other,ev_user1,'
    if instance_exists(interact_target_var)
    {
        with instance_create(0,0,fade_eff_obj)
        {
            image_blend = c_black;
            image_alpha = 0;
            set_alarm_scr(0,other.delay_var); 
            invert_var = true;
            stay_var = true;
            cam_id_var = other.interact_target_var.cam_id_var;
        }
    }
');
// Open Event
object_event_add
(argument0,ev_other,ev_user2,'
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
    if snd_len_var > 0
    { fmod_snd_play_scr(snd_arr[irandom(snd_len_var-1)]); }
');
// Lock Event
object_event_add
(argument0,ev_other,ev_user3,'
    if instance_exists(interact_target_var)
    {
        if !instance_exists(txt_obj)
        {
            with instance_create(0,0,txt_obj)
            {
                cam_id_var = other.interact_target_var.cam_id_var;
                str_var = other.txt_lock_var;
            }
            fmod_snd_play_scr(deny_snd);
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var || cam_id_var == -1
    {
        if lock_var { local.txt = txt_lock_var; }
        else {local.txt = txt_var; }

        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false); draw_set_alpha(image_alpha);
        draw_set_halign(halign_var); draw_set_valign(valign_var);
        draw_str_ext_shadow_scr(local.txt,str_x_var,str_y_var,image_xscale,image_yscale,min_scale_var,halign_var,valign_var,sep_var,margin_var,shadow_x_var,shadow_y_var,shadow_color_var,image_blend,shadow_var,image_angle);
        draw_set_halign(fa_left); draw_set_valign(fa_top);
        draw_set_alpha(1); d3d_set_hidden(true);
    }
');