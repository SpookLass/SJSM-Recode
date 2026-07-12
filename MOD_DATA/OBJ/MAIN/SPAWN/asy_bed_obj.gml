// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
globalvar asy_bed_coll;
asy_bed_coll[1] = 9.5;
asy_bed_coll[2] = 12;
asy_bed_coll[3] = 20;
asy_bed_coll[0] = p3dc_begin_mdl_scr();
p3dc_set_trimask_scr(mask_metal_const);
p3dc_add_block_scr(-4,-8,4,-5,-9,0);
p3dc_add_block_scr(-4,9,4,-5,8,0);
p3dc_add_block_scr(5,-8,4,4,-9,0);
p3dc_add_block_scr(5,9,4,4,8,0);
p3dc_set_trimask_scr(mask_basic_const);
p3dc_add_block_scr(6,10,5,-6,-10,4);
p3dc_end_mdl_scr();
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    {
        store_tex_var = background_get_texture(load_par_obj.bg_arr_var[14,0]);
        store_tex_02_var = background_get_texture(load_par_obj.bg_arr_var[12,0]);
        tex_02_var = store_tex_02_var;
        store_tex_03_var = background_get_texture(load_par_obj.bg_arr_var[13,0]);
        tex_03_var = store_tex_03_var;
    }
    snap_var = 1;
    event_inherited();
    solid_var = true;
    w_var = 12;
    h_var = 9.5;
    l_var = 20;
    type_var = 7; // I guess?
    // Collisions
    coll_var[0] = asy_bed_coll[0];
    coll_var[1] = asy_bed_coll[1];
    coll_var[2] = asy_bed_coll[2];
    coll_var[3] = asy_bed_coll[3];
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_transform_set_identity();
    // Check if billboard
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    // Reflection handling
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var*2,0,0); break; }
            case 1: { d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var*2,0); break; }
            case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var*2); break; }
        }
    }
    // Draw
    draw_set_alpha(image_alpha);
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Legs
        d3d_draw_block(-4,-8,4,-5,-9,0,tex_02_var,1,4);
        d3d_draw_block(-4,9,4,-5,8,0,tex_02_var,1,4);
        d3d_draw_block(5,-8,4,4,-9,0,tex_02_var,1,4);
        d3d_draw_block(5,9,4,4,8,0,tex_02_var,1,4);
    // Top
        d3d_draw_wall(6,-10,4,-6,-10,5,tex_03_var,1,1);
        d3d_draw_wall(6,10,4,-6,10,5,tex_03_var,1,1);
        d3d_draw_wall(6,10,4,6,-10,5,tex_03_var,1,1);
        d3d_draw_wall(-6,10,4,-6,-10,5,tex_03_var,1,1);
        d3d_draw_floor(-6,-10,5,6,10,5,tex_var,1,1);
        d3d_draw_floor(6,10,4,-6,-10,4,tex_03_var,1,1);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');