// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
globalvar school_desk_teacher_coll;
school_desk_teacher_coll[1] = 9.5;
school_desk_teacher_coll[2] = 10;
school_desk_teacher_coll[3] = 16;
local.width = school_desk_teacher_coll[2]/2;
local.length = school_desk_teacher_coll[3]/2;
local.legwidth = 2;
school_desk_teacher_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_block_scr(local.width,-local.length+local.legwidth,school_desk_teacher_coll[1]-local.legwidth,-local.width,-local.length,0);
p3dc_add_block_scr(local.width,local.length,school_desk_teacher_coll[1]-local.legwidth,-local.width,local.length-local.legwidth,0);
p3dc_add_block_scr(local.width,local.length-local.legwidth,school_desk_teacher_coll[1]-local.legwidth,local.width-local.legwidth,-local.length+local.legwidth,0);
p3dc_add_block_scr(local.width,local.length,school_desk_teacher_coll[1],-local.width,-local.length,school_desk_teacher_coll[1]-local.legwidth);
p3dc_end_mdl_scr();
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    {
        store_tex_var = background_get_texture(load_par_obj.bg_arr_var[8,0]);
        store_tex_02_var = background_get_texture(load_par_obj.bg_arr_var[10,0]);
        tex_02_var = store_tex_02_var;
    }
    snap_var = 1;
    event_inherited();
    solid_var = true;
    w_var = 10;
    h_var = 9.5;
    l_var = 16;
    leg_w_var = 2;
    type_var = 7; // I guess?
    direction = 180;
    // Collisions
    coll_var[0] = school_desk_teacher_coll[0];
    coll_var[1] = school_desk_teacher_coll[1];
    coll_var[2] = school_desk_teacher_coll[2];
    coll_var[3] = school_desk_teacher_coll[3];
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
    // Main
    local.width = w_var/2;
    local.length = l_var/2;
    /*d3d_draw_wall(local.width,-local.length,h_var,-local.width,-local.length,0,tex_02_var,1,1);
    d3d_draw_wall(local.width,local.length,h_var,-local.width,local.length,0,tex_02_var,1,1);
    d3d_draw_wall(local.width,local.length,h_var,local.width,-local.length,0,tex_02_var,1,1);
    d3d_draw_wall(-local.width,local.length,h_var,-local.width,-local.length,0,tex_02_var,1,1);*/
    // Inner
        d3d_draw_floor(local.width-leg_w_var,local.length-leg_w_var,h_var-leg_w_var,-local.width,-local.length+leg_w_var,h_var-leg_w_var,tex_02_var,1,1);
        d3d_draw_wall(local.width-leg_w_var,-local.length+leg_w_var,0,-local.width,-local.length+leg_w_var,h_var-leg_w_var,tex_02_var,1,-0.96875);
        d3d_draw_wall(local.width-leg_w_var,local.length-leg_w_var,0,-local.width,local.length-leg_w_var,h_var-leg_w_var,tex_02_var,1,-0.96875);
        d3d_draw_wall(local.width-leg_w_var,local.length-leg_w_var,0,local.width-leg_w_var,-local.length+leg_w_var,h_var-leg_w_var,tex_02_var,1,-0.96875);
    // Outer
        d3d_draw_floor(local.width,local.length,h_var,-local.width,-local.length,h_var,tex_var,1,1);
        d3d_draw_wall(local.width,-local.length,h_var,-local.width,-local.length,0,tex_02_var,1,1);
        d3d_draw_wall(local.width,local.length,h_var,-local.width,local.length,0,tex_02_var,1,1);
        d3d_draw_wall(local.width,local.length,h_var,local.width,-local.length,0,tex_02_var,1,1);
    // Front
        d3d_draw_wall(-local.width,local.length,0,-local.width,local.length-leg_w_var,h_var-leg_w_var,tex_02_var,1,-0.96875);
        d3d_draw_wall(-local.width,-local.length+leg_w_var,0,-local.width,-local.length,h_var-leg_w_var,tex_02_var,1,-0.96875);
        d3d_draw_wall(-local.width,local.length,h_var,-local.width,-local.length,h_var-leg_w_var,tex_02_var,1,0.984375);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');