// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create event
object_event_add
(argument0,ev_create,0,"
    // I'm gonna plusinate!
    if !irandom(63) { instance_create(0,0,choose(med_color_obj,purp_color_obj,lass_color_obj)); }
    else if frac_chance_scr(2,3) { instance_create(0,0,choose(dark_color_obj,dark_rand_color_obj)); }
    if frac_chance_scr(4,9) { with (torch_obj) { on_var = false; } }
");