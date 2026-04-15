// Builtin Variables
object_set_depth(argument0,-1);
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
    { store_tex_var = sprite_get_texture(load_par_obj.spr_arr_var[0,0],irandom(sprite_get_number(load_par_obj.spr_arr_var[0,0]))); }
    event_inherited();
    solid_var = false;
    type_var = 5;
    // For grid (I dont really know how wide it is)
    w_var = 24.7;
    h_var = 25.3;
    l_var = 24.7;
    // Teleport
    tp_alarm_var = 24;
    tp_dist_var = 44;
    alarm_len_var = 1;
    alarm_ini_scr();
');
// Alarm Event
object_event_add
(argument0,ev_alarm,0,'
    if instance_exists(load_par_obj)
    { store_tex_var = sprite_get_texture(load_par_obj.spr_arr_var[0,0],irandom(sprite_get_number(load_par_obj.spr_arr_var[0,0]))); }
    local.dir = random_range(-90,90);
    x = cam_dead_obj.x+lengthdir_x(tp_dist_var,local.dir);
    y = cam_dead_obj.y+lengthdir_y(tp_dist_var,local.dir);
    set_alarm_scr(0,tp_alarm_var);
');