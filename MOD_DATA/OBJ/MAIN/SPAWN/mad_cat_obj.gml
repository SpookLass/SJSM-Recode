// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
globalvar white_cat_coll;
white_cat_coll[1] = 7.36;
white_cat_coll[2] = 4.32;
white_cat_coll[3] = white_cat_coll[2];
white_cat_coll[0] = prop_to_coll_scr(5,"",white_cat_coll[2],0,white_cat_coll[1],true,8);
// Create event
object_event_add
(argument0,ev_create,0,'
    snap_var = 1; // Snap to floor
    // Assets
    ini_open("lang_"+global.lang_var+".ini");
    interact_str_var = ini_read_string("UI","talk","UI_talk");
    ini_close();
    if instance_exists(load_par_obj)
    {
        spr_01_var = load_par_obj.spr_arr_var[3,0];
        spr_02_var = load_par_obj.spr_arr_var[4,0];
        store_tex_var = sprite_get_texture(spr_01_var,0);
        pop_snd_var = load_par_obj.snd_arr_var[5,0];
    }
    snd_id_var = 6;
    translate_id_var = "cat_01";
    on_var = true;
    event_user(1);
    // Basic
    event_inherited();
    solid_var = true;
    type_var = 5; // Billboard
    w_var = 8.2;
    h_var = 8;
    snd_h_var = 4.8;
    step_var = 8;
    // Collisions
    coll_var[0] = white_cat_coll[0];
    coll_var[1] = white_cat_coll[1];
    coll_var[2] = white_cat_coll[2];
    coll_var[3] = white_cat_coll[3];
    // Animate
    spr_id_var = 0;
    spr_spd_var = 0.25;
    anim_alarm_var = 72;
    appear_alarm_var = 28;
    talk_alarm_var = 120;
    smooth_var = false;
    // Sound
    inst_01_var = noone;
    inst_02_var = noone;
    snd_dist_min_var = 0;
    snd_dist_max_var = 300;
    with instance_create(x,y,interact_trig_obj)
    {
        z = other.z;
        other.trig_var = id;
        par_var = other.id;
        str_var = other.interact_str_var;
    }
    alarm_len_var = 4;
    alarm_ini_scr();
    set_alarm_scr(1,anim_alarm_var);
');
// Room End event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_inherited();
    fmod_inst_stop_scr(inst_01_var);
    fmod_inst_stop_scr(inst_02_var);
');
// Alarm event
object_event_add
(argument0,ev_alarm,0,'
    trig_var.on_var = true;
');
// Anim Alarm event
object_event_add
(argument0,ev_alarm,1,'
    set_alarm_scr(1,anim_alarm_var);
');
// Appear
object_event_add
(argument0,ev_alarm,2,'
    on_var = true;
    set_alarm_scr(1,anim_alarm_var);
    set_alarm_scr(3,talk_alarm_var);
    tex_var = sprite_get_texture(spr_01_var,0);
');
// Are you lost?
object_event_add
(argument0,ev_alarm,3,'
    event_user(0);
    snd_id_var = 7;
    translate_id_var = "cat_02";
    event_user(1);
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if on_var
    {
        if smooth_var { local.per = 0.5*(1-cos(2*pi*alarm_arr[1,0]/alarm_arr[1,1])); }
        else
        {
            local.per = 2*alarm_arr[1,0]/alarm_arr[1,1];
            if local.per > 1 { local.per = 2-local.per; }
        }
        spr_id_var = lerp_scr(0.5,sprite_get_number(spr_01_var)-0.5,local.per);
        tex_var = sprite_get_texture(spr_01_var,floor(spr_id_var));
    }
    else
    {
        spr_id_var = sprite_get_number(spr_02_var)*(1-(alarm_arr[2,0]/alarm_arr[2,1]));
        tex_var = sprite_get_texture(spr_02_var,floor(spr_id_var));
    }
');
// Trigger Event
object_event_add
(argument0,ev_other,ev_user0,'
    fmod_inst_stop_scr(inst_01_var);
    inst_01_var = fmod_snd_3d_play_scr(snd_var,x,y,z+snd_h_var);
    local.len = fmod_snd_get_len_scr(snd_var)*milli_frame_rate_const;
    with instance_create(x,y,sub_par_obj)
    {
        z = other.z+other.snd_h_var;
        dist_min_var = other.snd_dist_min_var;
        dist_max_var = other.snd_dist_max_var;
        str_var = other.str_var;
        set_alarm_scr(0,local.len);
        offset_var = 800;
    }
    trig_var.on_var = false;
    set_alarm_scr(0,local.len);
');
// Asset event
object_event_add
(argument0,ev_other,ev_user1,'
    if instance_exists(load_par_obj)
    {
        snd_var = load_par_obj.snd_arr_var[snd_id_var,0];
        snd_dist_min_var = load_par_obj.snd_arr_var[snd_id_var,5];
        snd_dist_max_var = load_par_obj.snd_arr_var[snd_id_var,6];
    }
    ini_open("lang_"+global.lang_var+".ini");
    if global.diff_var == 0 { str_var = ini_read_string("SUB",translate_id_var+"_easiest","SUB_"+translate_id_var+"_easiest"); }
    else { str_var = ini_read_string("SUB",translate_id_var,"SUB_"+translate_id_var); }
    ini_close();
    // Appear
    if !on_var
    {
        inst_02_var = fmod_snd_3d_play_scr(pop_snd_var,x,y,z+snd_h_var);
        trig_var.on_var = false;
        tex_var = sprite_get_texture(spr_02_var,0);
        set_alarm_scr(2,appear_alarm_var);
        set_alarm_scr(1,-1);
    }
');