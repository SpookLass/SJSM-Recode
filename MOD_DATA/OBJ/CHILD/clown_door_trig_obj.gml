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
(argument0,ev_create,0,'
    clown_delay_var = 60;
    // Inherited
    event_inherited();
    // Alarm
    alarm_len_var = 2;
    alarm_ini_scr();
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
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
    // Thingy
    with instance_create(0,0,fade_eff_obj)
    {
        image_blend = c_black; 
        set_alarm_scr(0,other.delay_var); 
        invert_var = true;
        stay_var = true;
        cam_id_var = other.player_id_var.cam_id_var;
    }
');
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
                            if local.remaining != 0
                            {
                                with instance_create(0,0,fade_eff_obj)
                                {
                                    image_blend = c_black;
                                    image_alpha = 0;
                                    set_alarm_scr(0,local.door.delay_var); 
                                    invert_var = true;
                                    stay_var = true;
                                    cam_id_var = local.player.cam_id_var;
                                }
                                fmod_snd_play_scr(choose(door_01_snd,door_02_snd,door_03_snd,door_04_snd));
                            }
                            else { other.player_id_var = local.player; }
                            other.player_var += 1;
                        }
                        else if !instance_exists(txt_obj)
                        {
                            with instance_create(0,0,txt_obj)
                            {
                                cam_id_var = local.player.cam_id_var;
                                str_var = local.door.txt_lock_var;
                            }
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
            if instance_exists(clown_obj)
            {
                with clown_obj
                {
                    if dur_var == 1
                    { event_user(15); }
                }
                set_alarm_scr(1,clown_delay_var);
            }
            else { event_perform(ev_alarm,0); }
            global.in_door_var = true;
        }
    }
');