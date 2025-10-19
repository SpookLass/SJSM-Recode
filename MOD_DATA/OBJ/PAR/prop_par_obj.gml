// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
type_var
    0: Model. Uses model and model string to do rendering and collisions.
    1: Plane. Uses w_var, h_var, tex_w_var, tex_h_var, and radius_var. Renders like a wall, but uses block collisions.
    2: Block. Uses w_var, l_var, h_var, tex_w_var, and tex_h_var.
    3: Cylinder. Uses w_var, l_var, h_var, tex_w_var, tex_h_var, close_var, and step_var.
    4: Floor. Uses w_var, l_var, tex_w_var, and tex_h_var
    5: Billboard. Uses w_var, h_var, tex_w_var, tex_h_var, and step_var. Has a cylinder collision
    6: Double Plane. Uses w_var, h_var, dist_var, tex_w_var, and tex_h_var. For wall decor
    7: Better Block. Uses w_var, l_var, h_var, tex_w_var, tex_l_var, and tex_h_var.
    8: Offset Plane. Uses w_var, h_var, tex_w_var, tex_h_var, and radius_var. Origin is south.
    9: Jumpscare. Duplicate of Offset Plane with front and back sprites. Uses dist_var
snap_var
    0: No snap
    1: Snap to floor
    2: Snap to ceiling
*/
// Create event
object_event_add
(argument0,ev_create,0,"
    tex_var = store_tex_var;
    tex_w_var = 1;
    tex_l_var = 1;
    tex_h_var = 1;
    color_var = true;
    if snap_var > 0
    {
        switch snap_var
        {
            case 1: { z = instance_nearest(x,y,floor_par_obj).z; break; }
            case 2: { z = instance_nearest(x,y,ceil_par_obj).z; break; }
        }
    }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    d3d_transform_set_identity();
    if type_var == 5 { d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current])); }
    else { d3d_transform_add_rotation_z(direction); }
    d3d_transform_add_translation(x,y,z);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    switch type_var
    {
        case 0: { d3d_model_draw(mdl_var,0,0,0,tex_var); break; }
        case 1: { d3d_draw_wall(0,-w_var/2,h_var,0,w_var/2,0,tex_var,tex_w_var,tex_h_var*sign(h_var)); break; }
        case 2: { d3d_draw_block(-w_var/2,-l_var/2,h_var,w_var/2,l_var/2,0,tex_var,tex_w_var,tex_h_var*sign(h_var)); break; }
        case 3: { d3d_draw_cylinder(-w_var/2,-l_var/2,h_var,w_var/2,l_var/2,0,tex_var,tex_w_var,tex_h_var*sign(h_var),close_var,step_var); break; }
        case 4: { d3d_draw_floor(-w_var/2,-l_var/2,0,w_var/2,l_var/2,0,tex_var,tex_w_var,tex_h_var); break; }
        case 5: { d3d_draw_wall(0,w_var/2,h_var,0,-w_var/2,0,tex_var,tex_w_var,tex_h_var*sign(h_var)); break; }
        case 6:
        {
            d3d_draw_wall(dist_var,w_var/2,h_var,dist_var,-w_var/2,0,tex_var,tex_w_var,tex_h_var*sign(h_var));
            d3d_draw_wall(-dist_var,-w_var/2,h_var,-dist_var,w_var/2,0,tex_var,tex_w_var,tex_h_var*sign(h_var));
            break;
        }
        case 7:
        {
            local.width = w_var/2;
            local.length = l_var/2;
            local.tex_height = tex_h_var*sign(h_var);
            d3d_draw_wall(-local.width,-local.length,h_var,local.width,-local.length,0,tex_var,tex_w_var,local.tex_height);
            d3d_draw_wall(-local.width,local.length,h_var,local.width,local.length,0,tex_var,tex_w_var,local.tex_height);
            d3d_draw_wall(-local.width,-local.length,h_var,-local.width,local.length,0,tex_var,tex_l_var,local.tex_height);
            d3d_draw_wall(local.width,-local.length,h_var,local.width,local.length,0,tex_var,tex_l_var,local.tex_height);
            d3d_draw_floor(-local.width,-local.length,0,local.width,local.length,0,tex_var,tex_w_var,tex_l_var);
            d3d_draw_floor(-local.width,-local.length,h_var,local.width,local.length,h_var,tex_var,tex_w_var,tex_l_var);
            break;
        }
        case 8: { d3d_draw_wall(0,-w_var,h_var,0,0,0,tex_var,tex_w_var,tex_h_var*sign(h_var)); break; }
        case 9:
        {
            d3d_draw_wall(dist_var,0,h_var,dist_var,w_var,0,tex_var,tex_w_var,tex_h_var*sign(h_var));
            d3d_draw_wall(-dist_var,0,h_var,-dist_var,w_var,0,tex_02_var,tex_w_var,tex_h_var*sign(h_var));
            break;
        }
    }
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
");