// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,spawn_leave_door_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    safe_var = false;
    event_inherited();
    // 
    str_len_var = 4;
    ini_open(global.lang_var);
    str_arr_var[0] = ini_read_string("UI","brain_01","UI_brain_01");
    str_arr_var[1] = ini_read_string("UI","brain_02","UI_brain_02");
    str_arr_var[2] = ini_read_string("UI","brain_03","UI_brain_03");
    str_arr_var[3] = ini_read_string("UI","brain_04","UI_brain_04");
    ini_close();
');
// Lock Event
object_event_add
(argument0,ev_other,ev_user3,'
    if instance_exists(interact_target_var)
    {
        if !instance_exists(brain_eff_obj)
        {
            local.str = str_arr_var[irandom(str_len_var-1)];
            with instance_create(0,0,brain_eff_obj)
            {
                par_var = other.id;
                str_var = local.str;
                str_draw_var = string_copy(str_var,0,char_var);
                cam_id_var = other.interact_target_var.cam_id_var;
                persistent = false;
            }
            fmod_snd_play_scr(deny_snd);
        }
    }
');