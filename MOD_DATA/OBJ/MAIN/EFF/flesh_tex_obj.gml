// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Surface
    surf_var = surface_create(256,256);
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    surface_reset_target();
    tex_var = surface_get_texture(surf_var);
    // Path
    path_var = path_add();
    path_set_kind(path_var,1); // Smooth
    path_set_closed(path_var,true);
    path_set_precision(path_var,4);
    path_add_point(path_var,0,0,100);
    path_add_point(path_var,-80,-80,100);
    path_add_point(path_var,-176,16,100);
    path_add_point(path_var,-208,176,100);
    path_add_point(path_var,16,176,100);
    path_add_point(path_var,80,16,100);
    path_add_point(path_var,240,-48,100);
    path_add_point(path_var,112,-208,100);
    path_start(path_var,2*global.delta_time_var,1,true);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    surface_free(surf_var);
    path_delete(path_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    path_speed = 2*global.delta_time_var;
    // Draw Surface
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    d3d_set_projection_ortho(0,0,256,256,0);
    d3d_set_hidden(false);
    d3d_set_fog(false,c_black,0,0);
    draw_background_tiled_ext(bg_var,x,y,256/background_get_width(bg_var),256/background_get_width(bg_var),c_white,1);
    d3d_set_hidden(true);
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    surface_reset_target();
');