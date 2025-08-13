// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
Particle variables
part_len_var: How many particles are allowed
part_arr
    0: Active
    1, 2, and 3: X, Y, and Z
    4, 5, and 6: Speed, yaw, and pitch
    7, 8, and 9: width, height, and rotation
    10 and 11: Color and Alpha
    12: Whether texture (false) or sprite(true)
    13: Texture
    14, 15, 16: Sprite, Sprite index, and Sprite speed
    17: Time (-1 for eternal, not recommended)
*/
// Step
object_event_add
(argument0,ev_step,ev_step_normal,"
    part_num = 0;
    for (local.i=0; local.i<part_len_var; local.i+=1;)
    {
        if part_arr[local.i,0]
        {
            local.spd = part_arr[local.i,4]*global.delta_time_var;
            part_arr[local.i,1]+=lengthdir_x(lengthdir_x(local.spd,part_arr[local.i,5]),part_arr[local.i,6]);
            part_arr[local.i,2]+=lengthdir_x(lengthdir_y(local.spd,part_arr[local.i,5]),part_arr[local.i,6]);
            part_arr[local.i,3]+=-lengthdir_y(local.spd,part_arr[local.i,6]);
            if part_arr[local.i,12]
            {
                part_arr[local.i,15] = (part_arr[local.i,15]+(global.delta_time_var*part_arr[local.i,16])) mod sprite_get_number(part_arr[local.i,14]);
                part_arr[local.i,13] = sprite_get_texture(part_arr[local.i,14],part_arr[local.i,15]);
            }
            if part_arr[local.i,17] > 0
            {
                part_arr[local.i,17] -= global.delta_time_var;
                if part_arr[local.i,17] <= 0
                {
                    part_arr[local.i,0] = false;
                    for (local.j=0; local.j<18; local.j+=1)
                    { part[local.i,local.j] = 0; }
                }
                else { part_num += 1; }
            }
            else { part_num += 1; }
        }
    }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    for (local.i=0; local.i<part_len_var; local.i+=1;)
    {
        if part_arr[local.i,0]
        {
            d3d_transform_set_identity();
            d3d_transform_add_rotation_x(part_arr[local.i,9]);
            d3d_transform_add_rotation_y(-point_direction_3d_scr(part_arr[local.i,1],part_arr[local.i,2],part_arr[local.i,3],global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]));
            d3d_transform_add_rotation_z(point_direction(part_arr[local.i,1],part_arr[local.i,2],global.cam_x_var[view_current],global.cam_y_var[view_current]));
            d3d_transform_add_translation(part_arr[local.i,1],part_arr[local.i,2],part_arr[local.i,3]);
            draw_set_color(part_arr[local.i,10]); draw_set_alpha(part_arr[local.i,11]);
            d3d_draw_wall(0,-part_arr[local.i,7]/2,part_arr[local.i,8]/2,0,part_arr[local.i,7]/2,-part_arr[local.i,8]/2,part_arr[local.i,13],1,1);
            d3d_transform_set_identity();
            draw_set_color(c_white); draw_set_alpha(1);
        }
    }
");