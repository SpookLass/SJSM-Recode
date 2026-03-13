// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
global.seat_coll[1] = 12;
global.seat_coll[2] = 24; // 20
global.seat_coll[3] = 11;
global.seat_coll[0] = p3dc_begin_mdl_scr();
local.radiusx = global.seat_coll[2]*0.5;
local.radiusy = global.seat_coll[3]*0.5;
local.radiusz = global.seat_coll[1]*0.5;
// Bottom
p3dc_add_block_scr(-local.radiusx+2,-local.radiusy,0,local.radiusx-2,local.radiusy,local.radiusz);
// Top
p3dc_add_block_scr(-local.radiusx+2,local.radiusy-3,local.radiusz,local.radiusx-2,local.radiusy,global.seat_coll[1]);
// Armrests
p3dc_add_block_scr(-local.radiusx,-local.radiusy,0,-local.radiusx+2,local.radiusy,global.seat_coll[1]-3);
p3dc_add_block_scr(local.radiusx-2,-local.radiusy,0,local.radiusx,local.radiusy,global.seat_coll[1]-3);
p3dc_end_mdl_scr();
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = seat_01_bg_tex;
    event_inherited();
    type_var = 0;
    solid_var = true;
    store_tex_02_var = seat_02_bg_tex;
    tex_02_var = store_tex_02_var;
    w_var = 24; // 20
    h_var = 12;
    l_var = 11;
    arm_w_var = 2;
    back_l_var = 3;
    arm_h_var = 9;
    // Collision
    coll_var[0] = global.seat_coll[0];
    coll_var[1] = global.seat_coll[1];
    coll_var[2] = global.seat_coll[2];
    coll_var[3] = global.seat_coll[3];
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if tex_var == -1 { local.tex = wall_bg_tex; } 
    else { local.tex = tex_var; }
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
    // Prop types
    local.width = w_var*0.5;
    local.length = l_var*0.5;
    local.height = h_var*0.5;
    local.armwidth = local.width-arm_w_var;
    local.backlength = local.length-back_l_var;
    // Top
    d3d_draw_floor(-local.armwidth,local.backlength,h_var,local.armwidth,local.length,h_var,local.tex,3,1);
    d3d_draw_wall(-local.armwidth,local.backlength,h_var,local.armwidth,local.backlength,local.height,tex_02_var,3,1);
    d3d_draw_wall(-local.armwidth,local.backlength,h_var,-local.armwidth,local.length,local.height,local.tex,1,1);
    d3d_draw_wall(local.armwidth,local.backlength,h_var,local.armwidth,local.length,local.height,local.tex,1,1);
    // Seat
    d3d_draw_floor(-local.armwidth,-local.length,local.height,local.armwidth,local.backlength,local.height,tex_02_var,3,1);
    d3d_draw_wall(-local.armwidth,-local.length,local.height,local.armwidth,-local.length,0,local.tex,3,1);
    // Back and bottom
    d3d_draw_floor(-local.armwidth,-local.length,0,local.armwidth,local.length,0,local.tex,3,1);
    d3d_draw_wall(-local.armwidth,local.length,h_var,local.armwidth,local.length,0,local.tex,3,1);
    // Left Armrest
    d3d_draw_floor(-local.width,-local.length,arm_h_var,-local.armwidth,local.length,arm_h_var,local.tex,1,1);
    d3d_draw_floor(-local.width,-local.length,0,-local.armwidth,local.length,0,local.tex,1,1);
    d3d_draw_wall(-local.width,-local.length,arm_h_var,-local.width,local.length,0,local.tex,1,1);
    d3d_draw_wall(-local.armwidth,-local.length,arm_h_var,-local.armwidth,local.backlength,local.height,local.tex,1,1);
    d3d_draw_wall(-local.width,-local.length,arm_h_var,-local.armwidth,-local.length,0,local.tex,1,1);
    d3d_draw_wall(-local.width,local.length,arm_h_var,-local.armwidth,local.length,0,local.tex,1,1);
    // Right Armrest
    d3d_draw_floor(local.armwidth,-local.length,arm_h_var,local.width,local.length,arm_h_var,local.tex,1,1);
    d3d_draw_floor(local.armwidth,-local.length,0,local.width,local.length,0,local.tex,1,1);
    d3d_draw_wall(local.width,-local.length,arm_h_var,local.width,local.length,0,local.tex,1,1);
    d3d_draw_wall(local.armwidth,-local.length,arm_h_var,local.armwidth,local.backlength,local.height,local.tex,1,1);
    d3d_draw_wall(local.armwidth,-local.length,arm_h_var,local.width,-local.length,0,local.tex,1,1);
    d3d_draw_wall(local.armwidth,local.length,arm_h_var,local.width,local.length,0,local.tex,1,1);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');
/*
Old

d3d_draw_floor(-local.width,local.backlength,h_var,local.width,local.length,h_var,local.tex,3,1);
d3d_draw_wall(-local.width,local.backlength,h_var,local.width,local.backlength,local.height,tex_02_var,3,1);
// Seat
d3d_draw_floor(-local.width,-local.length,local.height,local.width,local.backlength,local.height,tex_02_var,3,1);
d3d_draw_wall(-local.width,-local.length,local.height,local.width,-local.length,0,local.tex,3,1);
d3d_draw_wall(-local.width,-local.length,local.height,-local.width,local.backlength,0,local.tex,1,1);
d3d_draw_wall(local.width,-local.length,local.height,local.width,local.backlength,0,local.tex,1,1);
// Sides, back, and bottom
d3d_draw_floor(-local.width,-local.length,0,local.width,local.length,0,local.tex,3,1);
d3d_draw_wall(-local.width,local.length,h_var,local.width,local.length,0,local.tex,3,1);
d3d_draw_wall(-local.width,local.backlength,h_var,-local.width,local.length,0,local.tex,1,1);
d3d_draw_wall(local.width,local.backlength,h_var,local.width,local.length,0,local.tex,1,1);
*/