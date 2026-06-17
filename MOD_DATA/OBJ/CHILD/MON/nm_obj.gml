// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,kidna_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,'
    // Sounds
    snd_len_var = 3;
    snd_alarm_min_var = -1;
    snd_alarm_max_var = -1;
    snd_dist_min_var = 0;
    snd_dist_max_var = 512;
    hurt_snd_var = 4;
    // Language
    ini_open("lang_"+global.lang_var+".ini");
    name_var = translate_mon_str_scr("nm",global.name_var);
    
    wake_snd_var[2] = string_replace(ini_read_string("SUB","nm","SUB_nm"),"@n",name_var); wake_snd_var[3] = false;
    hurt_snd_var[2] = string_replace(ini_read_string("SUB","doll_hurt","SUB_doll_hurt"),"@n",name_var); hurt_snd_var[3] = false;
    ini_close();
    // Variables
    type_var = 2;
    spd_base_var = random_range(0.5,0.8);
    spr_spd_var = spd_base_var/1.4;
    delay_var = 0;
    dmg_var = 15;
    dmg_alarm_var = 30;
    blood_spr_var = blood_kh_spr;
    w_base_var = 10;
    h_base_var = 16.4;
    w_var = w_base_var*random_range(0.95,1.05);
    h_var = h_base_var*random_range(0.95,1.05);
    eye_h_var = 14;
    spawn_var = -1;
    // Attack
    atk_range_var = 10; // 6
    // Hurt
    hp_var = irandom_range(1,3);
    do_hurt_var = 2;
    hurt_alarm_var = 10;
    hurt_hp_var = 1;
    hurt_die_var = 2;
    hurt_weird_var = true;
    stun_var = true;
    // hurt_dist_var = 5;
    // Wake
    woke_var = false;
    sight_dist_var = -1;
    // Animate
    alarm_len_var = 9;
    alarm_ini_scr();
    set_alarm_scr(8,1);
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    event_inherited();
    move_var = false;
    anim_var = false;
    woke_var = false;
');
// Hurt Event
object_event_add
(argument0,ev_other,ev_user4,'
    event_inherited();
    if hurt_weird_var
    {
        x = xstart;
        y = ystart;
        z = zstart;
    }
    fmod_snd_play_scr(doll_hurt_snd_var);
');
// Animate Alarm
object_event_add
(argument0,ev_alarm,8,'
    w_var = w_base_var*random_range(0.95,1.05);
    h_var = h_base_var*random_range(0.95,1.05);
    set_alarm_scr(8,1);
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var && !woke_var
    {
        event_user(6);
        if instance_exists(target_var)
        {
            sight_type_var = 1;
            event_user(8);
            if target_visible_var && (target_dist_var <= sight_dist_var || sight_dist_var <= 0)
            {
                woke_var = true;
                anim_var = true;
                move_var = true;
                inst_var = fmod_snd_3d_play_scr(wake_snd_var[1]);
                sub_var[0] = wake_snd_var[2];
                sub_var[1] = wake_snd_var[3];
            }
        }
    }
    event_inherited();
');
// Die event
object_event_add
(argument0,ev_other,ev_user11,'
    if fmod_inst_is_play_scr(inst_var) && fmod_inst_is_3d_scr(inst_var)
    { fmod_inst_stop_scr(inst_var); }
    inst_var = fmod_snd_3d_play_scr(hurt_snd_var[1],x,y,z);
    if global.pitch_bend_var { fmod_inst_set_pitch_scr(inst_var,random_range(0.95,1.05)); }
    sub_var[0] = hurt_snd_var[2];
    sub_var[1] = hurt_snd_var[3];
    fmod_snd_play_scr(claw_snd);
    instance_destroy();
');