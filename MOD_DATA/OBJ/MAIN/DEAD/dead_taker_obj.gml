// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // Render
    spr_var = taker_spr;
    spr_id_var = 0;
    spr_spd_var = 1/6;
    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    w_var = 6;
    h_var = 12;
    x_off_var = 0;
    y_off_var = 0;
    z_off_var = 10;
    z_off_var = 10;
    // Alarms
    alarm_len_var = 3;
    alarm_ini_scr();
    set_alarm_scr(0,221.4); // 90
    set_alarm_scr(1,191.4); // 60
    fade_alarm_var = 20; // 18
    // Collision
    coll_var[0] = global.mon_coll[0];
    coll_var[1] = global.mon_coll[1];
    coll_var[2] = global.mon_coll[2];
');
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    rm_goto_menu_scr(taker_dead_rm,true);
');
object_event_add
(argument0,ev_alarm,1,'
    with instance_create(0,0,fade_eff_obj)
    {
        cam_id_var = -1;
        image_blend = c_red;
        invert_var = true;
        stay_var = true;
        set_alarm_scr(0,other.fade_alarm_var);
    }
    set_alarm_scr(2,fade_alarm_var);
');
object_event_add
(argument0,ev_alarm,2,'
    fmod_snd_play_scr(claw_snd);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    x = lerp_scr(cam_dead_obj.x,xstart,alarm_arr[0,0]/alarm_arr[0,1]);
    y = lerp_scr(cam_dead_obj.y,ystart,alarm_arr[0,0]/alarm_arr[0,1]);
    z = lerp_scr(cam_dead_obj.z,zstart,alarm_arr[0,0]/alarm_arr[0,1]);
    // Animate
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_transform_set_identity();
    d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
    d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
    d3d_draw_wall(0,w_var/2,h_var,0,-w_var/2,0,tex_var,1,1);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');