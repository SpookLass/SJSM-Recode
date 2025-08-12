// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,fog_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create event
object_event_add
(argument0,ev_create,0,"
    fog_var = true;
    fog_color_var = c_white;
    fog_start_var = 0;
    fog_end_var = 128;
    fog_dark_var = false;
    event_inherited();
");