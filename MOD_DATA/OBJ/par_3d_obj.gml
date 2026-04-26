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
    if !variable_local_exists("color_var") { color_var = false; }
    if !variable_local_exists("reflect_var") { reflect_var = false; }
    if !variable_local_exists("z") { z = 0; }
    spd_var = 0;
    x_spd_var = 0;
    y_spd_var = 0;
    z_spd_var = 0;
    yaw_var = 0;
    pitch_var = 0;
    
    zstart = z;
    do_coll_var = false;
    grav_var = 0;
    depth_base_var = depth;
    did_coll_var = false;
    did_slide_var = false;
    fall_var = true;
    fall_temp_var = false;
    on_floor_var = false;
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
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_inherited();
    if color_var && persistent
    { image_blend = c_white; }
');
