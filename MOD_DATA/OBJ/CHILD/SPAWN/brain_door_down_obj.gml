// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,lab_door_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    if instance_exists(load_par_obj)
    {
        if load_par_obj.door_var
        {
            mdl_var = load_par_obj.mdl_arr_var[2,0];
            mdl_02_var = load_par_obj.mdl_arr_var[3,0];
            type_var = 0; // Model
        }
    }
');