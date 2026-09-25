// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,pac_control_obj.pac_ghost_obj_var);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    image_blend = make_color_rgb(255,213,150);
    rand_dist_var = 8;
');
// Chase target event
object_event_add
(argument0,ev_other,ev_user1,'
    event_inherited();
    if target_dist_var <= rand_dist_var
    { target_rand_var = true; }
');