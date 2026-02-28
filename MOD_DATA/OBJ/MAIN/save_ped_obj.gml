// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
globalvar save_ped_coll;
save_ped_coll[1] = 9.5;
save_ped_coll[2] = 12;
// Collision
save_ped_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-5,-5,9,5,5,0,true,6);
p3dc_add_block_scr(-6,-6,9.5,6,6,9);
p3dc_end_mdl_scr();
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = save_ped_01_bg_tex;
    event_inherited();
    solid_var = true;
    type_var = 3;
    w_var = 10;
    l_var = 10;
    h_var = 9;
    close_var = false;
    step_var = 6;
    tex_w_var = 4;
    tex_h_var = 1;
    // Top
    store_tex_02_var = save_ped_02_bg_tex;
    tex_02_var = store_tex_02_var;
    top_w_var = 12;
    top_l_var = 12;
    top_h_var = 0.5;
    top_tex_w_var = 1;
    top_tex_l_var = 1;
    top_tex_h_var = 0.01;
    // Collisions
    coll_var[0] = save_ped_coll[0];
    coll_var[1] = save_ped_coll[1];
    coll_var[2] = save_ped_coll[2];
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    // Transformation
    d3d_transform_set_identity();
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    // Reflection handling
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var,0,0); break; }
            case 1: { d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var,0); break; }
            case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var); break; }
        }
    }
    // Draw
    draw_set_alpha(image_alpha);
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Draw
    d3d_draw_cylinder(-w_var/2,-l_var/2,9.3,w_var/2,l_var/2,0,tex_var,tex_w_var,tex_h_var*sign(h_var),close_var,step_var)

    local.width = top_w_var/2;
    local.length = top_l_var/2;
    local.height = h_var+top_h_var;
    d3d_draw_wall(-local.width,-local.length,local.height,local.width,-local.length,h_var,tex_02_var,top_tex_w_var,top_tex_h_var);
    d3d_draw_wall(-local.width,local.length,local.height,local.width,local.length,h_var,tex_02_var,top_tex_w_var,top_tex_h_var);
    d3d_draw_wall(local.width,-local.length,local.height,local.width,local.length,h_var,tex_02_var,top_tex_l_var,top_tex_h_var);
    d3d_draw_wall(-local.width,-local.length,local.height,-local.width,local.length,h_var,tex_02_var,top_tex_l_var,top_tex_h_var);
    d3d_draw_floor(-local.width,-local.length,local.height,local.width,local.length,local.height,tex_02_var,top_tex_w_var,top_tex_l_var);
    d3d_draw_floor(-local.width,-local.length,h_var,local.width,local.length,h_var,tex_02_var,top_tex_w_var,top_tex_l_var);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');