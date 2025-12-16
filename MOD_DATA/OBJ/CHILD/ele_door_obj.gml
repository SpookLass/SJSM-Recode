// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,ele_flat_door_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = ele_door_bg_tex;
    z_start_var = 160;
    z_end_var = 0;
    event_inherited();
    direction = 180;
');