// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // Translate
    ini_open(global.lang_var);
    
    ini_close();
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
    // Text
    draw_set_color(str_color_var); draw_set_alpha(str_alpha_var); draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_str_ext_scr(str_var[state_var],0,0,str_scale_var[state_var],str_scale_var[state_var]*str_yscale_var,0.125,fa_center,fa_middle,-1,108,0);
    draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white); draw_set_alpha(1);
    d3d_set_hidden(true);
');