// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    image_xscale = 256;
    image_alpha = 0.25;
    visible = false;
    // Dollhouse
    rand_rate_var = 1;
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,rand_rate_var);
');
// Rand alarm
object_event_add
(argument0,ev_alarm,0,'
    x = random(image_xscale);
    y = random(image_xscale);
    set_alarm_scr(0,rand_rate_var);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_bg_tiled_stretch_ext_scr(bg_var,x,y,image_xscale,0,2,0,image_blend,image_alpha);
        d3d_set_hidden(true);
    }
');