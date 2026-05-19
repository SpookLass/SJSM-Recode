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
    snd_len_var = 4;
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_min_var = 0;
    snd_dist_max_var = 800;
    wake_snd_var[0] = 2;
    // Translations
    ini_open("lang_"+global.lang_var+".ini");
    name_var = translate_mon_str_scr("deer",global.name_var);
    local.sub = string_replace(ini_read_string("SUB","deer","SUB_deer"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    wake_snd_var[2] = local.sub; wake_snd_var[3] = false;
    dead_snd_var[1] = string_replace(ini_read_string("SUB","deer_dead","SUB_deer_dead"),"@n",name_var); dead_snd_var[2] = false;
    ini_close();
    // Variables
    spd_base_var = 1;
    spr_spd_var = 1/3;
    w_base_var = 8;
    h_base_var = 16;
    woke_var = false;
    atk_range_var = 48;
    wake_dist_var = 36;
    wake_sight_var = false;
    delay_var = 0;
    spr_base_var = noone;
    dead_spr_var = noone;
    idle_spr_var = noone;
    dmg_var = 20;
    dmg_alarm_var = 120;
    type_var = 1;
    spawn_var = -1;
    acc_var = 16/675; // 0.02r370
    autobrake_dist_var = 0.8/pixel_meter_rate_const;
    // Effect
    eff_snd_len_var = 4;
    eff_min_var = 30;
    eff_max_var = 60;
    // Idle
    w_idle_var = 16;
    h_idle_var = 16;
    anim_alarm_min_var = 30;
    anim_alarm_max_var = 90;
    anim_num_var = 1;
    anim_den_var = 3;
    // Hurt
    w_dead_var = 16;
    h_dead_var = 16;
    do_hurt_var = 2;
    hurt_die_var = 2;
    hurt_hp_var = 1;
    hp_var = 1;
    violence_var = 2;
    dead_var = false;
    dead_alarm_var = 15;
    // Effect
    eff_num_var = 1;
    eff_den_var = 3;
    // Behavior
    if global.dl_type_var == -1 { local.type = irandom(8); }
    else { local.type = global.dl_type_var; }
    switch local.type
    {
        case 4: // Hellgate
        case 0: // Recode
        {
            atk_range_var = global.mon_coll[2];
            snd_dist_max_var = 300;
            break;
        }
        case 6: // Hellgate HD
        case 2: // HD
        {
            do_acc_var = true;
            atk_range_var = 32;
            wake_dist_var = 2.5/pixel_meter_rate_const;
            spd_base_var = 4/pf_ms_rate_const;
            autobrake_var = true;
            snd_alarm_min_var = 78;
            break;
        }
    }
    // Alarm
    alarm_len_var = 9;
    alarm_ini_scr();
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    woke_var = false;
    w_var = w_idle_var;
    h_var = h_idle_var;
    spr_var = idle_spr_var;
    if sprite_exists(spr_var)
    {
        spr_id_var = irandom(sprite_get_number(spr_var)-1);
        tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    event_inherited();
    move_var = false;
    atk_var = false;
    anim_var = false;
    set_alarm_scr(8,irandom_range(anim_alarm_min_var,anim_alarm_max_var));
    set_alarm_scr(6,-1);
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if on_var && !woke_var && !dead_var
    {
        local.wake = false;
        event_user(6);
        if instance_exists(target_var)
        {
            if target_dist_var <= wake_dist_var
            {
                if wake_sight_var
                {
                    sight_type_var = 1;
                    event_user(8);
                    if target_visible_var { local.wake = true; }
                }
                else { local.wake = true; }
            }
        }
        if !local.wake
        {
            with deer_obj
            {
                if woke_var
                {
                    if point_distance_3d_scr(x,y,z,other.x,other.y,other.z) < other.wake_dist_var
                    { local.wake = true; break; }
                }
            }
        }
        if local.wake
        {
            woke_var = true;
            move_var = true;
            atk_var = true;
            // Sound
            if fmod_snd_is_3d_scr(wake_snd_var[1])
            {
                inst_var = fmod_snd_3d_play_scr(wake_snd_var[1]);
                if global.pitch_bend_var { fmod_inst_set_pitch_scr(inst_var,random_range(0.95,1.05)); }
            }
            else { inst_var = fmod_snd_play_scr(wake_snd_var[1]); }
            sub_var[0] = wake_snd_var[2];
            sub_var[1] = wake_snd_var[3];
            set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_max_var));
            // Draw
            spr_var = spr_base_var;
            if sprite_exists(spr_var)
            { tex_var = sprite_get_texture(spr_var,floor(spr_id_var)); }
            anim_var = true;
            w_var = w_base_var;
            h_var = h_base_var;
            set_alarm_scr(8,-1);
        }
    }
');
// Animation Alarm
object_event_add
(argument0,ev_alarm,8,'
    if frac_chance_scr(anim_num_var,anim_den_var)
    { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
    else { spr_id_var = mod_scr(spr_id_var+1,sprite_get_number(spr_var)); }
    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    set_alarm_scr(8,irandom_range(anim_alarm_min_var,anim_alarm_max_var));
');
// Die event
object_event_add
(argument0,ev_other,ev_user11,'
    // Variables
    w_var = w_dead_var;
    h_var = h_dead_var;
    dead_var = true;
    move_var = false;
    atk_var = false;
    set_motion_scr(0,true);
    reset_alarm_scr();
    // Play sound
    if fmod_inst_is_play_scr(inst_var) && fmod_inst_is_3d_scr(inst_var)
    { fmod_inst_stop_scr(inst_var); }
    inst_var = fmod_snd_3d_play_scr(dead_snd_var[0]);
    sub_var[0] = dead_snd_var[1];
    sub_var[1] = dead_snd_var[2];
    // Play animation
    spr_var = dead_spr_var;
    spr_id_var = 0;
    if sprite_exists(spr_var)
    { tex_var = sprite_get_texture(spr_var,floor(spr_id_var)); }
    anim_type_var = 1; // End on last
    set_alarm_scr(5,dead_alarm_var);
    // Effects
    if !global.reduce_flash_var
    {
        with instance_create(0,0,flash_eff_obj)
        {
            image_blend = c_red; 
            set_alarm_scr(0,6);
            cam_id_var = other.hurt_target_var.cam_id_var;
        }
    }
    switch (global.shake_type_var)
    {
        case shake_classic_const:
        {
            with instance_create(0,0,shake_eff_obj)
            {
                player_var = other.hurt_target_var;
                mult_var = player_var.shake_pos_base_var;
                type_var = 0; // Constant
            }
            break;
        }
        case shake_modern_const:
        {
            with instance_create(0,0,shake_eff_obj)
            {
                player_var = other.hurt_target_var;
                mult_var = player_var.shake_angle_base_var;
                type_var = 1; // Fade out
            }
            break;
        }
    }
    if frac_chance_scr(eff_num_var,eff_den_var)
    {
        with instance_create(0,0,spr_flash_eff_obj)
        {
            par_var = other.par_var;
            if !irandom(1) { spr_var = other.eff_spr_01_var; }
            else { spr_var = other.eff_spr_02_var; }
            spr_id_var = irandom(sprite_get_number(spr_var)-1);
            spr_spd_var = 1;
            do_snd_var = true;
            inst_var = fmod_snd_play_scr(other.eff_snd_arr[irandom(other.eff_snd_len_var-1)]);
            rand_rate_var = 15;
            set_alarm_scr(0,irandom_range(other.eff_min_var,other.eff_max_var));
            // Set camera to player
            cam_id_var = other.hurt_target_var.cam_id_var;
        }
    }
');