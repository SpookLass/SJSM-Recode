// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
globalvar drawer_coll;
drawer_coll[1] = 12;
drawer_coll[2] = 12;
drawer_coll[3] = 12;
drawer_coll[0] = prop_to_coll_scr(7,'',drawer_coll[2],drawer_coll[3],drawer_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,'
    snap_var = 1;
    store_tex_var = wood_02_bg_tex;
    event_inherited();
    solid_var = true;
    w_var = 12;
    h_var = 12;
    l_var = 12;
    type_var = 7;
    store_tex_02_var = drawer_bg_tex;
    tex_02_var = store_tex_02_var;
    // Collisions
    coll_var[0] = drawer_coll[0];
    coll_var[1] = drawer_coll[1];
    coll_var[2] = drawer_coll[2];
    coll_var[3] = drawer_coll[3];
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
    local.width = w_var/2;
    local.length = l_var/2;
    local.tex_height = tex_h_var*sign(h_var);
    d3d_draw_wall(-local.width,-local.length,h_var,local.width,-local.length,0,tex_var,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,local.length,h_var,local.width,local.length,0,tex_var,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,-local.length,h_var,-local.width,local.length,0,tex_var,tex_l_var,local.tex_height);
    d3d_draw_wall(local.width,-local.length,h_var,local.width,local.length,0,tex_02_var,tex_l_var,local.tex_height);
    d3d_draw_floor(-local.width,-local.length,0,local.width,local.length,0,tex_var,tex_w_var,tex_l_var);
    d3d_draw_floor(-local.width,-local.length,h_var,local.width,local.length,h_var,tex_var,tex_w_var,tex_l_var);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');