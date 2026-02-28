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
    tex_var = sprite_get_texture(spr_var,0);
    w_var = 6;
    h_var = 12;
    x_off_var = 0;
    y_off_var = 0;
    z_off_var = 10;
    anim_var = true;
    // Alarms
    alarm_len_var = 3;
    alarm_ini_scr();
    set_alarm_scr(0,320); // 90
    dead_alarm_var = 75;
    // Collision
    coll_var[0] = global.mon_coll[0];
    coll_var[1] = global.mon_coll[1];
    coll_var[2] = global.mon_coll[2];
');
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    anim_var = false;
    spr_id_var = 0;
    tex_var = sprite_get_texture(spr_var,0);
    set_alarm_scr(1,120);
');
object_event_add
(argument0,ev_alarm,1,'
    anim_var = true;
    set_alarm_scr(2,dead_alarm_var); // ~59.19569 to ~107.9024
');
object_event_add
(argument0,ev_alarm,2,'
    rm_goto_menu_scr(taker_dead_rm,true);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if alarm_arr[0,0] > 0
    {
        local.per = alarm_arr[0,0]/alarm_arr[0,1];
        x = lerp_scr(x2_var,xstart,local.per);
        y = lerp_scr(y2_var,ystart,local.per);
        z = lerp_scr(z2_var,zstart,local.per);
    }
    else if alarm_arr[2,0] > 0
    {
        local.per = sqr(alarm_arr[2,0]/alarm_arr[2,1]);
        //local.per = local.per*(1+local.per)/2; // Its a quadratic!
        x = lerp_scr(player_obj.x,x2_var,local.per);
        y = lerp_scr(player_obj.y,y2_var,local.per);
        z = lerp_scr(player_obj.z,z2_var,local.per);
    }
    // Animate
    if anim_var
    {
        spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
        tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    }
    // Get stuck!
    with player_obj { spd_mult_var = 0; }
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