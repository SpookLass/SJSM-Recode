// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,note_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    str_color_var = c_red;
    ini_open(global.lang_var);
    if global.gel_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.gel_type_var; }
    switch local.type
    {
        case 0: { str_var = ini_read_string("NOTE","gel","NOTE_gel"); break; }
        case 2: { str_var = ini_read_string("NOTE","gel_hd","NOTE_gel_hd"); break; }
        default: { str_var = ini_read_string("NOTE","gel_og","NOTE_gel_og"); break; }
    }
    ini_close();
    event_inherited();
    z += 9.5;
    spawn_var = false;
');
// Put down note
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    if !spawn_var
    {
        if ds_list_find_index(global.mon_list,gel_obj) < 0
        { ds_list_add(global.mon_list,gel_obj); }
        local.note = id;
        with instance_create(0,0,gel_obj)
        {
            if do_slime_spawn_var
            {
                // Variables
                on_var = true;
                enter_var = false;
                if type_var > 0 { do_coll_var = true; }
                slime_spawn_var = 1;
                move_var = false;
                atk_var = false;
                // Alarms
                set_alarm_scr(8,slime_alarm_var);
                set_alarm_scr(1,slime_alarm_var);
                set_alarm_scr(4,slime_alarm_var);
                set_motion_scr(0,true);
                // Stupid wake sound
                if slime_snd_var[0]
                {
                    if fmod_inst_is_play_scr(inst_var) && fmod_inst_is_3d_scr(inst_var)
                    { fmod_inst_stop_scr(inst_var); }
                    inst_var = fmod_snd_3d_play_scr(slime_snd_var[1]);
                    sub_var[0] = slime_snd_var[2];
                    sub_var[1] = slime_snd_var[3];
                    set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_max_var));
                }
                // Spawn From Puddle
                local.gel = id;
                with spawn_slime_obj
                {
                    local.gel.x = x;
                    local.gel.y = y;
                    local.gel.z = z;
                    local.gel.slime_angle_var = direction;
                    instance_destroy();
                }
            }
        }
        with spawn_leave_door_trig_obj
        { lock_var = false; }
        spawn_var = true;
    }
');