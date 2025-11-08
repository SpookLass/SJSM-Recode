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
(argument0,ev_create,0,"
    event_inherited();
    //Defaults
    image_blend = c_black;
    invert_var = false;
    cam_id_var = 0;
    stay_var = false;
    // Alarm
    alarm_len_var = 1;
    set_alarm_scr(0,20);
");
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,"
    if !stay_var 
    { instance_destroy(); }
    else
    {
        if invert_var == 1 { image_alpha = 1; }
        else { image_alpha = 0; }
    }
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if alarm_arr[0,0] > 0
    {
        image_alpha = alarm_arr[0,0]/alarm_arr[0,1];
        switch invert_var
        {
            case 1: { image_alpha = 1-image_alpha; break; }
            case 2:
            {
                image_alpha = image_alpha*2;
                if image_alpha > 1 { image_alpha = 2-image_alpha; }
                break;
            }
        }
    }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if view_current == cam_id_var || cam_id_var == -1
    {
        d3d_set_projection_ortho(0,0,1,1,0);
        d3d_set_hidden(false); draw_set_color(image_blend); draw_set_alpha(image_alpha);
        draw_rectangle(0,0,1,1,false);
        draw_set_color(c_white); draw_set_alpha(1); d3d_set_hidden(true);
    }
");