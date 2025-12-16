// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
p3dc_set_trimask_scr(mask_metal_const);
global.tank_coll[0] = prop_to_coll_scr(0,tank_mdl_path);
p3dc_set_trimask_scr(mask_basic_const);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = sprite_get_texture(tank_spr,0);
    event_inherited();
    solid_var = true;
    mdl_var = tank_mdl;
    mdl_path_var = tank_mdl_path;
    // For grid (I dont really know how wide it is)
    w_var = 22;
    l_var = w_var;
    // Collisions
    coll_var[0] = global.tank_coll[0];
    // More stuff
    store_tex_02_var = sprite_get_texture(tank_spr,1);
    tex_02_var = store_tex_02_var;
    mdl_02_var = tank_top_mdl;
    mdl_02_path_var = tank_top_mdl_path;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_transform_set_identity();
    if type_var == 5 { d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current])); }
    else { d3d_transform_add_rotation_z(direction); }
    d3d_transform_add_translation(x,y,z);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    switch type_var
    {
        case 0:
        {
            d3d_model_draw(mdl_var,0,0,0,tex_var);
            d3d_model_draw(mdl_02_var,0,0,0,tex_var);
            draw_set_color(c_white); d3d_set_culling(true);
            if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
            d3d_model_draw(mdl_var,0,0,0,tex_02_var);
            if global.fog_dark_var 
            { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
            d3d_set_culling(false);
            break;
        }
    }
    d3d_transform_set_identity();
    draw_set_alpha(1);
');