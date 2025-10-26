// Builtin Variables
object_set_depth(argument0,1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    z = 32;
    w_var = 32;
    h_var = 32;
    tex_w_var = 1;
    tex_h_var = 1;
    if store_tex_var == 0
    { store_tex_var = -1; }
    tex_var = store_tex_var;
    solid_var = true;
    color_var = true;
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if tex_var == -1 { local.tex = ceil_bg_tex; } 
    else { local.tex = tex_var; }
    local.tex_w = tex_w_var*(w_var/32);
    local.tex_h = tex_h_var*(h_var/32);
    d3d_transform_set_identity();
    d3d_transform_add_translation(x,y,z);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_draw_floor(-w_var/2,-h_var/2,0,w_var/2,h_var/2,0,local.tex,local.tex_w,local.tex_h);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
");