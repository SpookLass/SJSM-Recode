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
    image_blend = make_color_rgb(255,101,101);
    pellet_var = 20;
    pellet_rate_var = 10;
');
// Scatter target event
object_event_add
(argument0,ev_other,ev_user2,'
    if par_var.pellet_var < pellet_var+(pellet_rate_var*par_var.lvl_var) { event_user(1); }
    else { event_inherited(); }
');