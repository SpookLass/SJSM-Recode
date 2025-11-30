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
(argument0,ev_create,0,'
    event_inherited();
    // Vanilla stuff, nothing fancy
    if frac_chance_scr(5,9) { instance_create(0,0,dark_color_obj); }
');
// Room Start
// Despite the depth being super low, it still doesnt run last, weird
object_event_add
(argument0,ev_other,ev_room_start,'
    if frac_chance_scr(4,9) { with torch_obj { on_var = false; } }
');