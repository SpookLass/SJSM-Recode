// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    if !variable_local_exists("color_var") { color_var = 2; }
    event_inherited();
    if !variable_local_exists("do_hurt_var") { do_hurt_var = false; }
    if !variable_local_exists("do_possess_var") { do_possess_var = true; }
    hurt_var = false;
    on_var = false;
    possess_var = false;
    player_id_var = 0;
    cam_id_var = -1;
    active_var = false;
');