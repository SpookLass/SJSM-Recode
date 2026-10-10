// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,argument2.obj_arr_var[argument3,0]);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    par_var = '+string(argument2)+'
    if par_var.door_var
    {
        mdl_var = '+string(argument2.mdl_arr_var[argument4,0])+'
        mdl_02_var = '+string(argument2.mdl_arr_var[argument5,0])+'
        type_var = 0;
    }
');