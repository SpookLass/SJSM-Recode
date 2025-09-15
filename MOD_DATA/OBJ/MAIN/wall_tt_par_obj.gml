// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,wall_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    event_inherited();
    tone_var = make_color_rgb(255,36,36);
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if tex_var == -1 { local.tex = wall_bg_tex; } 
    else { local.tex = tex_var; }
    local.tex_w = tex_w_var*w_var/32;
    local.tex_h = tex_h_var*(texture_get_width(local.tex)/texture_get_height(local.tex))*h_var/64;
    d3d_transform_set_identity();
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_draw_wall(0,-w_var/2,h_var,0,w_var/2,h_var/2,local.tex,local.tex_w,local.tex_h);
    draw_set_color(color_mult_scr(image_blend,tone_var));
    d3d_draw_wall(0,-w_var/2,0,0,w_var/2,h_var/2,local.tex,local.tex_w,local.tex_h*-1);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
");