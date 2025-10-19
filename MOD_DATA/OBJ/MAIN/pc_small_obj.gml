// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
global.pc_small_coll[1] = 12;
global.pc_small_coll[2] = 12;
global.pc_small_coll[3] = 12;
global.pc_small_coll[0] = prop_to_coll_scr(7,'',global.pc_small_coll[2],global.pc_small_coll[3],global.pc_small_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,"
    snap_var = 1;
    store_tex_var = pc_sm_bg_tex;
    event_inherited();
    solid_var = true;
    w_var = 12;
    h_var = 12;
    l_var = 12;
    type_var = 7;
    store_tex_02_var = machine_01_bg_tex;
    tex_02_var = store_tex_02_var;
    // Collisions
    coll_var[0] = global.pc_small_coll[0];
    coll_var[1] = global.pc_small_coll[1];
    coll_var[2] = global.pc_small_coll[2];
    coll_var[3] = global.pc_small_coll[3];
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
        case 5: { d3d_draw_wall(0,-w_var/2,h_var,0,w_var/2,0,tex_var,tex_w_var,tex_h_var*sign(h_var)); break; }
        case 6:
        {
            d3d_draw_wall(0.1,-w_var/2,h_var,0.1,w_var/2,0,tex_var,tex_w_var,tex_h_var*sign(h_var));
            d3d_draw_wall(-0.1,-w_var/2,h_var,-0.1,w_var/2,0,tex_var,tex_w_var,tex_h_var*sign(h_var));
            break;
        }
        case 7:
        {
            local.width = w_var/2;
            local.length = l_var/2;
            local.tex_height = tex_h_var*sign(h_var);
            d3d_draw_wall(-local.width,-local.length,h_var,local.width,-local.length,0,tex_02_var,tex_w_var,local.tex_height);
            d3d_draw_wall(-local.width,local.length,h_var,local.width,local.length,0,tex_02_var,tex_w_var,local.tex_height);
            d3d_draw_wall(-local.width,-local.length,h_var,-local.width,local.length,0,tex_var,tex_l_var,local.tex_height);
            d3d_draw_wall(local.width,-local.length,h_var,local.width,local.length,0,tex_var,tex_l_var,local.tex_height);
            d3d_draw_floor(-local.width,-local.length,0,local.width,local.length,0,tex_02_var,tex_w_var,tex_l_var);
            d3d_draw_floor(-local.width,-local.length,h_var,local.width,local.length,h_var,tex_02_var,tex_w_var,tex_l_var);
            break;
        }
    }
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
");