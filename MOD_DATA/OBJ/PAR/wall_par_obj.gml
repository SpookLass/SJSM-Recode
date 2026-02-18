// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    reflect_var = true;
    w_var = 32;
    h_var = 32;
    tex_w_var = 1;
    tex_h_var = 1;
    if !variable_local_exists("store_tex_var")
    { store_tex_var = -1; }
    mask_var = -1;
    tex_var = store_tex_var;
    solid_var = true;
    color_var = true;
    grid_var = true;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    // Textures
    if tex_var == -1 { local.tex = wall_bg_tex; } 
    else { local.tex = tex_var; }
    local.tex_w = tex_w_var*w_var/32;
    local.tex_h = tex_h_var*(texture_get_width(local.tex)/texture_get_height(local.tex))*h_var/32;
    // Position
    d3d_transform_set_identity();
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    // Reflection Handing
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0:
            {
                if x == global.reflect_pos_var && direction mod 180 == 90 { exit; }
                d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var,0,0);
                break;
            }
            case 1:
            {
                if y == global.reflect_pos_var && direction mod 180 == 0 { exit; }
                d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var,0);
                break;
            }
            case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var); break; }
        }
    }
    // Draw
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_draw_wall(0,-w_var/2,h_var,0,w_var/2,0,local.tex,local.tex_w,local.tex_h);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');