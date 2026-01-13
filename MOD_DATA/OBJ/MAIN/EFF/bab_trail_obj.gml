// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    alpha_base_var = 1;
    alarm_len_var = 1;
    alarm_arr[0,2] = true;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if alarm_arr[0,0] > 0 { image_alpha = alpha_base_var*alarm_arr[0,0]/alarm_arr[0,1]; }
');
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    instance_destroy();
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_transform_set_identity();
    // Reflection handling (more complex for billboarded sprites)
    local.xtmp = x;
    local.ytmp = y;
    local.ztmp = z;
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { local.xtmp = global.reflect_pos_var-local.xtmp; d3d_transform_add_scaling(-1,1,1); break; }
            case 1: { local.ytmp = global.reflect_pos_var-local.ytmp; d3d_transform_add_scaling(1,-1,1); break; }
            case 2: { local.ztmp = global.reflect_pos_var-local.ztmp; d3d_transform_add_scaling(1,1,-1); break; }
        }
    }
    // Transformations
    d3d_transform_add_rotation_z(point_direction(local.xtmp,local.ytmp,global.cam_x_var[view_current],global.cam_y_var[view_current]));
    d3d_transform_add_translation(local.xtmp,local.ytmp,local.ztmp);
    // Draw
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_draw_wall(0,w_01_var,h_var,0,-w_02_var,0,tex_var,1,1);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');