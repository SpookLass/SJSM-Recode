// Builtin Variables
object_set_depth(argument0,-102);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    ini_open(global.lang_var);
    str_var = ini_read_string("DEAD","gel","DEAD_gel");
    ini_close();
    x = 100;
    y = 200;
    image_xscale = 0.5;
    image_yscale = 0.5;
    halign_var = fa_left;
    valign_var = fa_top;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false); draw_set_alpha(image_alpha); draw_set_color(image_blend);
    draw_str_scr(str_var,x,y,image_xscale,image_yscale,scale_min_var,halign_var,valign_var,image_angle);
    d3d_set_hidden(true); draw_set_alpha(1); draw_set_color(c_white);
');