// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,bone_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    if global.diff_var != 0 && !irandom(2) && (global.rm_count_var >= 250 || global.mode_var != 0)
    { event_inherited(); }
    else { instance_destroy(); }
');