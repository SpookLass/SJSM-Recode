// Builtin Variables
object_set_depth(argument0,-100);
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
    // Assets
    if instance_exists(load_par_obj)
    {
        bg_var = load_par_obj.bg_arr_var[23,0];
        mdl_var = load_par_obj.mdl_arr_var[7,0];
        surf_var = load_par_obj.surf_arr_var[0,0];
        surf_w_var = load_par_obj.surf_arr_var[0,1];
        surf_h_var = load_par_obj.surf_arr_var[0,2];
        path_var = load_par_obj.path_arr_var[0,0];
    }
    // Variables
    load_var = true;
    x_spd_var = 0;
    y_spd_var = 0;
    radius_var = 256;
    skybox_var = true; // true
    hd_var = true;
    // Path
    if global.reduce_flash_var { x_spd_var = 0.5; }
    else { path_start(path_var,0.5*global.delta_time_var,1,true); }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    path_speed = 0.5*global.delta_time_var;
    if x_spd_var > 0 { x = mod_scr(x+(x_spd_var*global.delta_time_var),surf_w_var); }
    if y_spd_var > 0 { y = mod_scr(y+(y_spd_var*global.delta_time_var),surf_h_var); }
    // Draw Surface
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    d3d_set_projection_ortho(0,0,surf_w_var,surf_h_var,0);
    d3d_set_hidden(false);
    d3d_set_fog(false,c_black,0,0);
    draw_background_tiled_ext(bg_var,x,y,surf_w_var/background_get_width(bg_var),surf_h_var/background_get_height(bg_var),c_white,1);
    d3d_set_hidden(true);
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    surface_reset_target();
');