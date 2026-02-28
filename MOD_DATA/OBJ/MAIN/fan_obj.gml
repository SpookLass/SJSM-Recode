// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
global.fan_coll[1] = 32;
global.fan_coll[2] = 32;
global.fan_coll[3] = 96;
global.fan_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_cylinder_scr(-1,-3.2,8.7,1,3.2,2.3,true,12);
p3dc_add_block_scr(-2,-0.5,6.5,-1,0.5,0.5);
p3dc_add_block_scr(-2.2,-2,0.5,2,2,0);
p3dc_end_mdl_scr();
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = machine_02_bg_tex;
    event_inherited();
    type_var = 0;
    solid_var = 1;
    z += 9.5;
    angle_var = 0;
    angle_spd_var = 10;
    store_tex_02_var = fan_bg_tex;
    tex_02_var = store_tex_02_var;
    store_tex_03_var = fan_blade_bg_tex;
    tex_03_var = store_tex_03_var;
    direction = 180;
    coll_var[0] = global.fan_coll[0]
    coll_var[1] = global.fan_coll[1]
    coll_var[2] = global.fan_coll[2]
    coll_var[3] = global.fan_coll[3]
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    angle_var += angle_spd_var*global.delta_time_var;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if tex_var == -1 { local.tex = wall_bg_tex; } 
    else { local.tex = tex_var; }
    // Draw
    draw_set_alpha(image_alpha);
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Transform
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
    // Fan
    d3d_draw_ellipsoid(-1,-3.2,8.7,1,3.2,2.3,tex_02_var,2,1,12);
    d3d_draw_block(-2,-0.5,6.5,-1,0.5,0.5,local.tex,1,1);
    d3d_draw_block(-2.2,-2,0.5,2,2,0,local.tex,1,1);
    // Fan Blade
    d3d_transform_set_identity();
    d3d_transform_add_rotation_x(angle_var);
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z+5.5);
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
    d3d_draw_wall(0,-3,3,0,3,-3,tex_03_var,1,1);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');