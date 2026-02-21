// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,enemy_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    on_var = false;
    spr_id_var = 0;
    x_off_var = 0;
    y_off_var = 0;
    z_off_var = 0;
    w_var = 1;
    h_var = 1;
    pitch_var = 0;
    yaw_var = 0;
    rotate_var = false;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var
    {
        yaw_var = point_direction(x,y,follow_var.x,follow_var.y);
        pitch_var = point_direction_3d_scr(x,y,z,follow_var.x,follow_var.y,follow_var.z);
        x = follow_var.x-lengthdir_x(lengthdir_x(dist_var,yaw_var),pitch_var);
        y = follow_var.y-lengthdir_x(lengthdir_y(dist_var,yaw_var),pitch_var);
        z = follow_var.z+lengthdir_y(dist_var,pitch_var);
        spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
        tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
        image_blend = par_var.image_blend;
        image_alpha = par_var.image_alpha;
    }
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
        d3d_draw_wall(0,w_var/2,h_var/2,0,-w_var/2,-h_var/2,tex_var,1,1);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
');