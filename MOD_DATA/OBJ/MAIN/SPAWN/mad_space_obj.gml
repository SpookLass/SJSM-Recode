// Builtin Variables
object_set_depth(argument0,98);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Position (jank)
    x_var = x;
    y_var = y;
    x = 0;
    y = 0;
    // Variables
    load_var = true;
    x_spd_var = 0;
    y_spd_var = 0;
    radius_var = 256;
    skybox_var = true;
    // Surface
    surf_var = surface_create(256,256);
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    surface_reset_target();
    tex_var = surface_get_texture(surf_var);
    // Path
    path_var = path_add();
    path_set_kind(path_var,1); // Smooth
    path_set_closed(path_var,false);
    path_set_precision(path_var,4);
    path_add_point(path_var,0,0,100);
    path_add_point(path_var,-32,-32,100);
    path_add_point(path_var,-80,-32,100);
    path_add_point(path_var,-112,0,70);
    path_add_point(path_var,-192,32,130);
    path_add_point(path_var,-256,0,100);
    if global.reduce_flash_var { x_spd_var = 0.5; }
    else { path_start(path_var,0.5*global.delta_time_var,1,true); }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    event_user(0);
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_end,'
    event_inherited();
    event_user(0);
');
// User 0 Event
object_event_add
(argument0,ev_other,ev_user0,'
    if load_var
    {
        surface_free(surf_var);
        path_delete(path_var);
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    path_speed = 0.5*global.delta_time_var;
    // Draw Surface
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    d3d_set_projection_ortho(0,0,256,256,0);
    d3d_set_hidden(false);
    d3d_set_fog(false,c_black,0,0);
    draw_background_tiled_ext(bg_var,x,y,256/sprite_get_width(spr_var),256/sprite_get_height(spr_var),c_white,1);
    d3d_set_hidden(true);
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    surface_reset_target();
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if !global.reflect_var
    {
        d3d_set_fog(false,c_black,0,0);
        draw_set_alpha(image_alpha); draw_set_color(image_blend); d3d_set_hidden(false);
        d3d_transform_set_identity();
        d3d_transform_add_rotation_z(direction);
        if skybox_var
        { d3d_transform_add_translation(global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]); }
        else { d3d_transform_add_translation(x_var,y_var,z); }
        d3d_draw_ellipsoid(radius_var,radius_var,radius_var,-radius_var,-radius_var,-radius_var,tex_var,4,4,8);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1); d3d_set_hidden(true);
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    }
');