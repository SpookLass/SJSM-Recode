// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// End Step
object_event_add
(argument0,ev_step,ev_step_end,"
    // Update movement (put here to not interfere with vanilla xprevious and yprevious)
    update_motion_scr(global.delta_time_var);
    event_inherited();
");
