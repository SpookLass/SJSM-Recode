// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Make collisions
global.pillow_wall_coll[1] = 5;
global.pillow_wall_coll[2] = 1;
global.pillow_wall_coll[3] = 16;
global.pillow_wall_coll[0] = prop_to_coll_scr(2,"",global.pillow_wall_coll[2],global.pillow_wall_coll[3],global.pillow_wall_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = basic_bg_tex;
    event_inherited();
    solid_var = false;
    type_var = 2; // Box
    w_var = 1;
    l_var = 16;
    h_var = 5;
    roll_var = 0;
    // Collisions
    coll_var[0] = global.pillow_wall_coll[0];
    coll_var[1] = global.pillow_wall_coll[1];
    coll_var[2] = global.pillow_wall_coll[2];
    coll_var[3] = global.pillow_wall_coll[3];
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if tex_var == -1 { local.tex = wall_bg_tex; } 
    else { local.tex = tex_var; }
    d3d_transform_set_identity();
    d3d_transform_add_rotation_x(roll_var);
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
    d3d_draw_block(w_var/2,l_var/2,h_var,-w_var/2,-l_var/2,0,local.tex,tex_w_var,tex_h_var*sign(h_var));
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');