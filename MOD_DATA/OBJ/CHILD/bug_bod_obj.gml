// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,bod_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var
    {
        if do_wiggle_var
        {
            wiggle_time_var = par_var.wiggle_time_var+(bod_id_var*wiggle_off_var);
            // wiggle_time_var = (wiggle_time_var+global.delta_time_var) mod wiggle_rate_var;
            wiggle_var = sin(2*wiggle_time_var*pi/wiggle_rate_var)*wiggle_mult_var/2;
        }
        if spd_anim_var
        { spr_spd_var = spr_spd_base_var*par_var.spd_var/par_var.spd_base_var; }
    }
    event_inherited();
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if on_var
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        if rotate_var
        {
            d3d_transform_add_rotation_y(pitch_var);
            d3d_transform_add_rotation_z(yaw_var);
        }
        else { d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current])); }
        d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var+(h_var/2));
        d3d_draw_wall(0,(w_var/2)+wiggle_var,h_var/2,0,(-w_var/2)+wiggle_var,-h_var/2,tex_var,1,1);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
');