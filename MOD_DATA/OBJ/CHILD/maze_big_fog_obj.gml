// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,fog_big_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    fog_var = true;
    fog_color_var = c_black;
    fog_base_start_var = 32;
    fog_base_end_var = 200;
    fog_start_var = fog_base_start_var; // OG: 32, HD: 106.r6
    fog_end_var = fog_base_end_var; // OG: 200, HD: 320?
    fog_dark_var = true;
    event_inherited();
');