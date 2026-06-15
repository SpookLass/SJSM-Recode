// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,fog_water_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    fog_var = true;
    fog_color_var = c_black;
    fog_start_var = 32; // OG: 32, HD: 106.r6
    fog_end_var = 200; // OG: 200, HD: 266.r6
    fog_dark_var = true;
    fog_water_var = true;
    fog_water_color_var = make_color_rgb(46,115,64);
    fog_water_dark_var = false;
    fog_water_start_var = 0;
    fog_water_end_var = 96;
    event_inherited();
');