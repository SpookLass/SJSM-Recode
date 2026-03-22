// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,door_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Interact Event
object_event_add
(argument0,ev_other,ev_user1,'
    event_inherited();
    // WHY (te Face)
    if !irandom(1) && instance_exists(par_var) && instance_exists(interact_target_var)
    {
        fmod_snd_play_scr(par_var.glitch_snd_arr[irandom(par_var.glitch_snd_len_var-1)]);
        with instance_create(0,0,fade_eff_obj)
        {
            if !irandom(1) { image_blend = c_black; }
            else { image_blend = c_red; }
            set_alarm_scr(0,other.par_var.eff_02_alarm_var); 
            invert_var = 2;
            stay_var = false;
            cam_id_var = other.interact_target_var.cam_id_var;
        }
    }
');