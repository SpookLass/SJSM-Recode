// Builtin Variables
object_set_depth(argument0,-99);
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
    y_spd_var = -1;
    image_xscale = 4;
    image_yscale = 4;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    y = (y+(y_spd_var*global.delta_time_var)) mod (background_get_height(bg_var)*image_yscale);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_wview[view_current] >= view_hview[view_current]
    { local.scale = view_hview[view_current]/720; }
    else { local.scale = view_wview[view_current]/1280; }
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    local.ytmp = y+(global.cam_pitch_var[view_current]*16);
    if abs(yaw_prev_var[view_current]-global.cam_yaw_var[view_current]) > 180
    {
        if x_off_var[view_current] != 0 { x_off_var[view_current] = 0; }
        else { x_off_var[view_current] = 5760/*background_get_width(bg_var)*image_xscale;*/ }
    }
    local.xtmp = x_off_var[view_current]+(global.cam_yaw_var[view_current]*16);
    yaw_prev_var[view_current] = global.cam_yaw_var[view_current];
    draw_background_tiled_ext(bg_var,local.scale*local.xtmp/2,local.scale*local.ytmp/2,local.scale*image_xscale/2,local.scale*image_yscale/2,image_blend,image_alpha/2);
    draw_background_tiled_ext(bg_var,local.scale*local.xtmp,local.scale*local.ytmp,local.scale*image_xscale,local.scale*image_yscale,image_blend,image_alpha); 
    d3d_set_hidden(true);
');