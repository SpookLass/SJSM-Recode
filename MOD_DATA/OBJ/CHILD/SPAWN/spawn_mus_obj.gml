// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,mus_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    if instance_exists(load_par_obj)
    {
        prio_var = mon_mus_prio_const;
        snd_var = load_par_obj.snd_arr_var[0,0];
    }
    
');