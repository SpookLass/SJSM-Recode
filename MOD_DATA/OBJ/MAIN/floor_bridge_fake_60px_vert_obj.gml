// Builtin Variables
object_set_depth(argument0,1);
object_set_mask(argument0,noone);
object_set_parent(argument0,floor_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    stored_tex_var = bridge_fake_bg_tex;
    direction = 90;
    event_inherited();
    no_grid_var = true;
    z_var = 60;
");