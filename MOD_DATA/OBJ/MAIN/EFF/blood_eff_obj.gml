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
    spr_var = global.blood_spr;
    spr_id_var = irandom(sprite_get_number(spr_var)-1);
    image_xscale = random_range(512,1024);
    x = random_range(-610,610);
    y = random_range(50,500);
    image_angle = random_range(45,-45);
    state_var = 0;
    // Alarm
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,20);
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    state_var = 1;
    set_alarm_scr(1,100);
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    state_var = 2;
    instance_destroy();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if state_var == 1 
    {
        image_alpha = alarm_arr[1,0]/alarm_arr[1,1];
        y += 0.4*global.delta_time_var;
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var 
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_spr_stretch_ext_scr(spr_var,spr_id_var,x,y,image_xscale,0,fa_center,fa_top,image_angle,image_blend,image_alpha);
        d3d_set_hidden(true);
    }
');