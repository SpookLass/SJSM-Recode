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
    inst_var = noone;
    snap_var = 1; // Snap to floor
    if instance_exists(load_par_obj)
    {
        store_tex_var = background_get_texture(load_par_obj.bg_arr_var[20,0]);
        inst_var = fmod_snd_3d_loop_scr(load_par_obj.snd_arr_var[1,0],x,y,0);
    }
    event_inherited();
    solid_var = false;
    type_var = 4; // Floor
    w_var = 64;
    l_var = 64;
    dist_var = 0.4;
    flesh_var = false;
    // Animate
    scale_min_var = 63.8;
    scale_max_var = 64.2;
    rand_num_var = 1;
    rand_den_var = 2;
    alarm_min_var = 6;
    alarm_max_var = 15;
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,1);
    set_alarm_scr(1,irandom_range(alarm_min_var,alarm_max_var));
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// User Event
object_event_add
(argument0,ev_other,ev_user0,'
    fmod_inst_stop_scr(inst_var);
');
// Alarm 0 event
object_event_add
(argument0,ev_alarm,0,'
    w_var = random_range(scale_min_var,scale_max_var);
    h_var = random_range(scale_min_var,scale_max_var);
    set_alarm_scr(0,1);
');
// Alarm 1 event
object_event_add
(argument0,ev_alarm,1,'
    if frac_chance_scr(rand_num_var,rand_den_var) { direction = random_range(-3,3); }
    set_alarm_scr(1,irandom_range(alarm_min_var,alarm_max_var));
');