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
    snap_var = 1; // Snap to floor
    if instance_exists(load_par_obj)
    {
        spr_var = load_par_obj.spr_arr_var[0,0];
        store_tex_var = sprite_get_texture(spr_var,0);
    }
    event_inherited();
    solid_var = false;
    type_var = 4; // Floor
    w_var = 33.5; // 33
    l_var = 32; // 32.75
    dist_var = -4;
    flesh_var = false;
    // Animate
    spr_id_var = 0;
    spr_spd_var = 0.25;
    rand_num_var = 1;
    rand_den_var = 3;
    alarm_min_var = 3;
    alarm_max_var = 6;
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,irandom_range(alarm_min_var,alarm_max_var));
');
// Alarm 0 event
object_event_add
(argument0,ev_alarm,0,'
    if frac_chance_scr(rand_num_var,rand_den_var) { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
    set_alarm_scr(0,irandom_range(alarm_min_var,alarm_max_var));
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    spr_id_var = mod_scr(spr_id_var+(spr_spd_var*global.delta_time_var),sprite_get_number(spr_var));
    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
');