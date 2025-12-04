// Builtin Variables
object_set_depth(argument0,-4);
object_set_mask(argument0,noone);
object_set_parent(argument0,fog_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    fog_var = true;
    fog_color_var = c_black;
    fog_start_var = 80; // Estimated
    fog_end_var = 128;
    fog_dark_var = true;
    event_inherited();
    step_var = 16;
    num_var = 8;
    spd_var = 0.25;
    image_alpha = 0.5;
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    direction += spd_var*global.delta_time_var;
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_transform_set_identity();
        d3d_transform_add_rotation_z(direction);
        d3d_transform_add_translation(global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]);
        draw_set_color(global.fog_color_var); draw_set_alpha(image_alpha);
        for (local.i=0; local.i<num_var; local.i+=1;)
        {
            local.size = lerp_scr(fog_end_var,fog_start_var,local.i/num_var);
            d3d_draw_ellipsoid(-local.size,-local.size,-local.size,local.size,local.size,local.size,tex_var,4,4,step_var);
        }
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
    event_inherited();
');