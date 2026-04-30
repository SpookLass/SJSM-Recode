// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
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
    10: Single Plane. Uses w_var, h_var, dist_var, tex_w_var, and tex_h_var. Like double plane, but only one.
    11: Cross. Uses w_var, h_var, tex_w_var, and tex_h_var. Useful if you want Minecraft grass I guess.
    12: Doorway. Uses w_var, l_var, h_var, tex_w_var, tex_l_var, and tex_h_var.
snap_var
    0: No snap
    1: Snap to floor
    2: Snap to ceiling
*/
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    { store_tex_var = background_get_texture(load_par_obj.bg_arr_var[9,0]); }
    store_tex_02_var = white_bg_tex;
    tex_02_var = store_tex_02_var;
    tone_02_var = make_color_rgb(35,53,29);
    color_var = 3;
    type_var = 10;
    h_var = 28; // 20
    w_var = 32;
    size_var = 0; // 4
    tex_w_var = 2;
    dist_var = -8;
    event_inherited();
    //z += 4;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.fog_dark_var
    { d3d_set_fog(false,c_black,0,0); }
    draw_set_alpha(image_alpha);
    event_inherited();
    // Transform 1
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
    // Draw 1
    if tone_02_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_02_var)); }
    else { draw_set_color(image_blend); }
    d3d_draw_wall(0,(-w_var*0.5)+size_var,h_var,dist_var,(-w_var*0.5)+size_var,0,tex_02_var,1,1);
    d3d_draw_wall(0,(w_var*0.5)-size_var,h_var,dist_var,(w_var*0.5)-size_var,0,tex_02_var,1,1);
    if size_var != 0 { d3d_draw_wall(0,-size_var,h_var,dist_var,-size_var,0,tex_02_var,1,1); }
    d3d_draw_wall(0,size_var,h_var,dist_var,size_var,0,tex_02_var,1,1);
    // Draw 2
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Transform 2
    d3d_transform_set_identity();
    d3d_transform_add_rotation_z(direction+90);
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
    else { d3d_draw_floor((-w_var*0.5)+size_var,0,0,(w_var*0.5)-size_var,dist_var,0,tex_var,2,1); }
    d3d_draw_floor((-w_var*0.5)+size_var,0,h_var,(w_var*0.5)-size_var,dist_var,h_var,tex_var,2,1);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
    if global.fog_dark_var
    { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
');