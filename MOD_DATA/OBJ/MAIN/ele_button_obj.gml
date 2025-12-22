// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
p3dc_set_trimask_scr(mask_metal_const);
global.ele_button_coll[1] = 8;
global.ele_button_coll[2] = 4;
global.ele_button_coll[0] = prop_to_coll_scr(10,'',global.ele_button_coll[2],0,global.ele_button_coll[1]);
p3dc_set_trimask_scr(mask_basic_const);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = button_bg_tex;
    event_inherited();
    type_var = 10; // Single Plane
    w_var = 4;
    h_var = 8;
    dist_var = 0.2;
    z = 12;
    direction = 180;
    // Alarms
    alarm_len_var = 3;
    delay_var = 120;
    delay_fast_var = 30
    snd_alarm_var = 1800/11;
    // Going Down
    z_start_var = 0;
    z_end_var = 160;
    alarm_var = 586.2;
    fast_alarm_var = 80;
    // Collisions
    coll_var[0] = global.ele_button_coll[0];
    coll_var[1] = global.ele_button_coll[1];
    coll_var[2] = global.ele_button_coll[2];
    // Trigger
    ini_open(global.lang_var);
    str_var = ini_read_string("UI","button_look","UI_button_look");
    ini_close();
    local.xtmp = x+lengthdir_x(global.trig_coll[2]/2,direction);
    local.ytmp = y+lengthdir_y(global.trig_coll[2]/2,direction);
    trig_var = instance_create(local.xtmp,local.ytmp,interact_trig_obj);
    trig_var.weapon_var = true;
    trig_var.par_var = id;
    trig_var.str_var = str_var;
');
// Trigger Event
object_event_add
(argument0,ev_other,ev_user0,'
    fmod_snd_3d_play_scr(button_snd,x,y,z+(h_var/2));
    set_alarm_scr(0,delay_var);
    trig_var.on_var = false;
');
// Axe Trigger Event
object_event_add
(argument0,ev_other,ev_user4,'
    fmod_snd_play_scr(choose(axe_hit_01_snd,axe_hit_02_snd));
    set_alarm_scr(0,delay_fast_var);
    trig_var.on_var = false;
    fast_var = true;
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    if fast_var { fmod_snd_play_scr(ele_fast_snd); }
    else { fmod_snd_play_scr(ele_snd); }
    set_alarm_scr(1,snd_alarm_var)
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    if fast_var { local.time = fast_alarm_var; }
    else { local.time = alarm_var; }
    set_alarm_scr(2,local.time);
    with ele_rock_obj
    {
        z_start_var = other.z_start_var;
        z_end_var = other.z_end_var;
        z = other.z;
        set_alarm_scr(0,local.time);
    }
    with flat_door_obj
    {
        z_start_var = other.z_start_var;
        z_end_var = other.z_end_var;
        z = other.z;
        set_alarm_scr(0,local.time);
    }
    with ele_door_obj
    {
        z_start_var = other.z_start_var-other.z_end_var;
        z_end_var = other.z_start_var;
        z = other.z;
        set_alarm_scr(0,local.time);
    }
');
// Alarm 2
object_event_add
(argument0,ev_alarm,2,'
    // Nothing yet
');