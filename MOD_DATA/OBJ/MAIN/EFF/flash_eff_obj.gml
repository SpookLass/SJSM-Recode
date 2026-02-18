// Builtin Variables
object_set_depth(argument0,-101);
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
    //Defaults
    image_blend = c_red;
    cam_id_var = 0;
    // Alarm
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,3);
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    instance_destroy();
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var || cam_id_var == -1
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,1,1,0);
        d3d_set_hidden(false); draw_set_color(image_blend); draw_set_alpha(image_alpha);
        draw_rectangle(0,0,1,1,false);
        draw_set_color(c_white); draw_set_alpha(1); d3d_set_hidden(true);
    }
');