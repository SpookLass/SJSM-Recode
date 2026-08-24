// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    { store_tex_var = background_get_texture(load_par_obj.bg_arr_var[6,0]); }
    event_inherited();
    solid_var = (global.diff_var == 0);
    type_var = 1;
    w_var = 32;
    h_var = 32;
    radius_var = 0;
    color_var = true;
    yaw_var = 0;
    dist_var = 24;
    alarm_var = 240;
    alarm_len_var = 1;
    alarm_ini_scr();
    // Collisions
    coll_var[0] = fake_wall_coll[0];
    coll_var[1] = fake_wall_coll[1];
    coll_var[2] = fake_wall_coll[2];
    coll_var[3] = fake_wall_coll[3];
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if alarm_arr[0,0] > 0
    {
        local.per = alarm_arr[0,0]/alarm_arr[0,1];
        x = lerp_scr(xstart+lengthdir_x(dist_var,yaw_var),xstart,local.per);
        y = lerp_scr(ystart+lengthdir_y(dist_var,yaw_var),ystart,local.per);
    }
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    x = xstart+lengthdir_x(dist_var,yaw_var);
    y = ystart+lengthdir_y(dist_var,yaw_var)
');