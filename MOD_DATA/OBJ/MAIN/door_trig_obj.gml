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
(argument0,ev_create,0,"
    event_inherited();
    // Collision
    coll_var[0] = global.trig_coll[0];
    coll_var[1] = global.trig_coll[1];
    coll_var[2] = global.trig_coll[2];
    // Text
    do_txt_var = true;
    txt_var = 'Open';
    txt_lock_var = 'Locked.';
    // Function
    rm_count_var = 1;
    delay_var = 20;
    if rm_var == 0
    {
        zone_var = true;
        event_user(0);
    }
    // Alarm
    alarm_len_var = 1;
");
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,"
    if room_exists(rm_var) && rm_var != 0 { room_goto_scr(rm_var); }
    else { show_error('Room '+string(rm_var)+' does not exist!',false); room_goto_scr(hall_01_rm); }
    global.rm_count_var += rm_count_var;
")
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    visible = false;
    local.door = id;
    local.active = false;
    local.remaining = 0;
    with player_obj { if !in_door_var && !dead_var { local.remaining += 1; }}
    with player_obj
    {
        if !in_door_var && !dead_var
        {
            // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
            if box_coll_scr(x,y,z,coll_var[2],coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[2],other.coll_var[1])
            {
                other.visible = other.do_txt_var;
                other.cam_id_var = cam_id_var
                if global.interact_input_press_var == 1
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
                            set_alarm_scr(0,local.door.delay_var); 
                            invert_var = true;
                            stay_var = true;
                            cam_id_var = local.player.cam_id_var;
                        }
                        fmod_snd_play_scr(choose(door_01_snd,door_02_snd,door_03_snd,door_04_snd));
                    }
                    else if !instance_exists(txt_obj)
                    {
                        local.txt = instance_create(0,0,txt_obj);
                        local.txt.txt_var = other.txt_lock_var;
                    }
                }
            }
        }
    }
    if local.active && local.remaining == 0
    { set_alarm_scr(0,delay_var); }
");
// Recalculate Door
object_event_add
(argument0,ev_other,ev_user0,'
    if zone_var
    {
        if ds_list_size(global.rm_list_var) <= 0
        {
            ds_list_copy(global.rm_list_var,global.zone_var);
            ds_list_shuffle(global.rm_list_var);
        }
        rm_var = ds_list_find_value(global.rm_list_var,0);
        ds_list_delete(global.rm_list_var,0);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if view_current == cam_id_var 
    {
        if lock_var { local.txt = txt_lock_var; }
        else {local.txt = txt_var; }

        d3d_set_projection_ortho(0,0,1280,720,0);
        d3d_set_hidden(false);

        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);

        draw_set_color(make_color_rgb(30,0,50));
        draw_text_transformed(638,650,local.txt,1,1,0);
        draw_text_transformed(636,652,local.txt,1,1,0);

        draw_set_color(c_white);
        draw_text_transformed(640,648,local.txt,1,1,0);

        draw_set_halign(fa_left);
        draw_set_valign(fa_top);

        d3d_set_hidden(true);
    }
");