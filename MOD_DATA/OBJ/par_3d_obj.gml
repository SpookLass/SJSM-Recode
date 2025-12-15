// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    depth_base_var = depth;
');
// End Step
object_event_add
(argument0,ev_step,ev_step_end,'
    // Update movement (put here to not interfere with vanilla xprevious and yprevious)
    update_motion_scr(global.delta_time_var);
    // Set depth
    depth = depth_base_var+(point_distance_3d_scr(x,y,z,global.cam_x_var[0],global.cam_y_var[0],global.cam_z_var[0])/10000);
    // Inherit
    event_inherited();
');
