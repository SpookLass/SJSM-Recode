// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,fog_overlay_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_set_blend_mode(bm_add);
    event_inherited();
    draw_set_blend_mode(bm_normal);
');