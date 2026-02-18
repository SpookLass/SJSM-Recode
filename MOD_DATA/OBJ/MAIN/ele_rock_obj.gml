// Builtin Variables
object_set_depth(argument0,5);
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
    dist_var = 4;
    tex_var = rock_bg_tex;
    // Going Down
    z_start_var = 0;
    z_end_var = -160;
    alarm_var = 587;
    alarm_len_var = 1;
    alarm_ini_scr();
    z = z_start_var;
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    event_user(0);
')
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if alarm_arr[0,0] > 0
    { z = lerp_scr(z_end_var,z_start_var,alarm_arr[0,0]/alarm_arr[0,1]) mod 32; }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    z = mod_scr(z_end_var,32);
');
// Calculate Size
object_event_add
(argument0,ev_other,ev_user0,'
    local.x1 = -1;
    local.y1 = -1;
    local.z1 = -1;
    local.x2 = -1;
    local.y2 = -1;
    local.z2 = -1;
    with floor_par_obj
    {
        if local.x1 == -1 || x-(w_var/2) < local.x1 { local.x1 = x-(w_var/2); }
        if local.y1 == -1 || y-(h_var/2) < local.y1 { local.y1 = y-(h_var/2); }
        if local.z1 == -1 || z < local.z1 { local.z1 = z; }
        if local.x2 == -1 || x+(w_var/2) > local.x2 { local.x2 = x+(w_var/2); }
        if local.y2 == -1 || y+(h_var/2) > local.y2 { local.y2 = y+(h_var/2); }
        if local.z2 == -1 || z > local.z2 { local.z2 = z; }
    }
    with ceil_par_obj
    {
        if local.x1 == -1 || x-(w_var/2) < local.x1 { local.x1 = x-(w_var/2); }
        if local.y1 == -1 || y-(h_var/2) < local.y1 { local.y1 = y-(h_var/2); }
        if local.z1 == -1 || z < local.z1 { local.z1 = z; }
        if local.x2 == -1 || x+(w_var/2) > local.x2 { local.x2 = x+(w_var/2); }
        if local.y2 == -1 || y+(h_var/2) > local.y2 { local.y2 = y+(h_var/2); }
        if local.z2 == -1 || z > local.z2 { local.z2 = z; }
    }
    /*with wall_par_obj
    {
        if local.x1 == -1 || x-lengthdir_x(w_var/2,direction) < local.x1 { local.x1 = x-lengthdir_x(w_var/2,direction); }
        if local.y1 == -1 || y-lengthdir_y(h_var/2,direction) < local.y1 { local.y1 = y-lengthdir_y(h_var/2,direction); }
        if local.z1 == -1 || z < local.z1 { local.z1 = z; }
        if local.x2 == -1 || x+lengthdir_x(w_var/2,direction) > local.x2 { local.x2 = x+lengthdir_x(w_var/2,direction); }
        if local.y2 == -1 || y+lengthdir_y(h_var/2,direction) > local.y2 { local.y2 = y+lengthdir_y(h_var/2,direction); }
        if local.z2 == -1 || z+h_var > local.z2 { local.z2 = z+h_var; }
    }*/
    x_01_var = local.x1-dist_var;
    y_01_var = local.y1-dist_var;
    z_01_var = local.z1-dist_var;
    x_02_var = local.x2+dist_var;
    y_02_var = local.y2+dist_var;
    z_02_var = local.z2+dist_var;
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    local.texw = abs(x_01_var-x_02_var)/32;
    local.texl = abs(y_01_var-y_02_var)/32;
    local.texh = (abs(z_01_var-z_02_var)+z)/32;
    d3d_draw_wall(x_01_var,y_01_var,z_02_var+z,x_02_var,y_01_var,z_01_var,tex_var,local.texw,local.texh);
    d3d_draw_wall(x_01_var,y_02_var,z_02_var+z,x_02_var,y_02_var,z_01_var,tex_var,local.texw,local.texh);
    d3d_draw_wall(x_01_var,y_01_var,z_02_var+z,x_01_var,y_02_var,z_01_var,tex_var,local.texl,local.texh);
    d3d_draw_wall(x_02_var,y_01_var,z_02_var+z,x_02_var,y_02_var,z_01_var,tex_var,local.texl,local.texh);
');