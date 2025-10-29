// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,door_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,"
    clown_delay_var = 60;
    // Inherited
    event_inherited();
    // Alarm
    alarm_len_var = 2;
");
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,"
    with instance_create(0,0,fade_eff_obj)
    {
        image_blend = c_black; 
        set_alarm_scr(0,other.delay_var); 
        invert_var = true;
        stay_var = true;
        cam_id_var = other.player_var.cam_id_var;
    }
    fmod_snd_play_scr(choose(door_01_snd,door_02_snd,door_03_snd,door_04_snd));
    set_alarm_scr(0,delay_var);
");
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
                        if local.remaining != 0
                        {
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
                        else { other.player_var = local.player; }
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
    {
        with clown_obj
        {
            if dur_var == 1
            { event_user(15); }
        }
        set_alarm_scr(1,clown_delay_var);
    }
");