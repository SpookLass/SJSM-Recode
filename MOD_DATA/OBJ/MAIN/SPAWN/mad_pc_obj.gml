// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
globalvar mad_pc_coll;
mad_pc_coll[1] = 5;
mad_pc_coll[2] = 2;
mad_pc_coll[3] = 5.6;
mad_pc_coll[0] = prop_to_coll_scr(1,'',mad_pc_coll[3],0,mad_pc_coll[1],false,0,mad_pc_coll[2]*0.5);
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    {
        spr_var = load_par_obj.spr_arr_var[1,0];
        store_tex_var = sprite_get_texture(spr_var,0);
    }
    event_inherited();
    solid_var = false;
    type_var = 1;
    w_var = 5.6;
    h_var = 5;
    radius_var = 1;
    z = 9.5;
    direction = 180;
    // Collisions
    coll_var[0] = mad_pc_coll[0];
    coll_var[1] = mad_pc_coll[1];
    coll_var[2] = mad_pc_coll[2];
    coll_var[3] = mad_pc_coll[3]+mad_pc_coll[2];
    // Animate
    alarm_min_var = 10;
    alarm_max_var = 30;
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,irandom_range(alarm_min_var,alarm_max_var));
');
// Alarm 0 event
object_event_add
(argument0,ev_alarm,0,'
    tex_var = sprite_get_texture(spr_var,irandom(sprite_get_number(spr_var)-1));
    set_alarm_scr(0,irandom_range(alarm_min_var,alarm_max_var));
');