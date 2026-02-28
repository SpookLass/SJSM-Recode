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
    y_spd_var = -0.25;
    image_xscale = 1280;
    image_yscale = 720;
    cam_mult_var = 4;
    small_mult_var = 0.5;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    y = (y+(y_spd_var*global.delta_time_var)) mod (background_get_height(bg_var)*image_yscale);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    local.xtmp = image_xscale*round(cam_mult_var*360/image_xscale)*global.cam_yaw_var[view_current]/360;
    local.ytmp = y+(global.cam_pitch_var[view_current]*cam_mult_var);
    draw_bg_tiled_scale_ext_scr(bg_var,local.xtmp*small_mult_var,local.ytmp*small_mult_var,image_xscale*small_mult_var,image_yscale*small_mult_var,2,image_angle,image_blend,image_alpha);
    draw_bg_tiled_scale_ext_scr(bg_var,local.xtmp,local.ytmp,image_xscale,image_yscale,2,image_angle,image_blend,image_alpha);
    d3d_set_hidden(true);
');