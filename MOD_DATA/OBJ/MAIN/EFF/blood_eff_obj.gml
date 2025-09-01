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
(argument0,ev_create,0,"
    spr_var = global.blood_spr;
    spr_id_var = irandom(sprite_get_number(spr_var)-1);
    image_xscale = random_range(2,4);
    image_yscale = image_xscale;
    image_speed = 0;
    x = random_range(30,1250);
    y = random_range(50,500);
    image_angle = random_range(45,-45);
    // Alarm
    alarm_len_var = 2;
    alarm_arr[0,2] = '';
    alarm_arr[1,2] = '';
    set_alarm_scr(0,20);
");
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,"
    state_var = 1;
    set_alarm_scr(1,100);
");
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,"
    state_var = 2;
    instance_destroy();
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if state_var == 1 
    {
        image_alpha = alarm_arr[1,0]/alarm_arr[1,1];
        y += 0.4*global.delta_time_var;
    }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if view_current == cam_id_var 
    {
        d3d_set_projection_ortho
        (
            view_xview[view_current],
            view_yview[view_current],
            view_xview[view_current]+view_wview[view_current],
            view_yview[view_current]+view_hview[view_current],
            0
        );
        d3d_set_hidden(false);
        draw_sprite_ext(spr_var,spr_id_var,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
        draw_set_color(c_white); draw_set_alpha(1); d3d_set_hidden(true);
    }
");