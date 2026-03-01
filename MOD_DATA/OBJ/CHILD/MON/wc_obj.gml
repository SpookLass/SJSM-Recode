// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,'
    // Sounds
    snd_len_var = 8;
    snd_num_var = 5;
    snd_den_var = 9;
    snd_alarm_min_var = 60;
    snd_alarm_max_var = 130;
    snd_dist_min_var = 0;
    snd_dist_max_var = 512;
    // Translations
    ini_open(global.lang_var);
    name_var = ini_read_string("NAME","wc","NAME_wc");
    local.sub = string_replace(ini_read_string("SUB","wc","SUB_wc"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false }
    atk_start_snd_var[2] = local.sub; atk_start_snd_var[3] = false;
    hurt_snd_var[2] = local.sub; hurt_snd_var[3] = false;
    dead_snd_var[1] = local.sub; dead_snd_var[2] = false;
    ini_close();
    // Main
    type_var = 1;
    spd_base_var = 0.85; // Times 4/3 in vanilla due to a bug
    spr_spd_var = 0.425;
    dur_var = irandom_range(15,20);
    delay_var = 120; // Dunno
    dmg_var = 14;
    dmg_alarm_var = 36;
    w_var = 12.5;
    h_var = 30.3;
    z_off_var = -0.3;
    blood_spr_var = blood_kh_spr;
    dead_var = false;
    temp_var = false;
    // Attack
    atk_type_var = 3; // Stop moving while delay
    atk_anim_var = 2;
    atk_dist_var = 16;
    atk_range_var = 40;
    atk_delay_var = 25;
    atk_end_delay_var = 36;
    atk_start_snd_var = 2;
    // Hurt
    hp_var = 20;
    hurt_hp_var = 1;
    hurt_die_var = 2;
    do_hurt_var = false;
    dead_alarm_var = 6;
    hurt_alarm_var = 3;
    hurt_dist_var = 5;
    hurt_snd_var = 4;
        // Gotta set these manually since do_hurt_var is false
    violence_var = 0;
    hurt_dur_var = 0;
    stun_var = false;
    // Special
    do_wander_var = false;
    do_rise_var = true;
    rise_alarm_var = 112;
    wander_attempt_var = 30;
    sight_dist_var = 128/3;
    sight_yaw_var = 60;
    alarm_len_var = 9;
    alarm_ini_scr();
    // Shadow
    shadow_z_var = 0.3;
    shadow_w_var = 10;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.main_spr_var = main_spr_var;
            other.rise_spr_var = rise_spr_var;
            other.atk_spr_var = atk_spr_var;
            other.atk_end_spr_var = atk_end_spr_var;
            other.dead_spr_var = dead_spr_var;
            other.doll_blood_bg_var = doll_blood_bg_var;
            other.shadow_bg_var = shadow_bg_var;
            other.static_bg_var = static_bg_var;
            other.atk_start_snd_var[1] = atk_start_snd_var[1];
            other.hurt_snd_var[1] = hurt_snd_var[1];
            other.dead_snd_var[0] = dead_snd_var[0];
            other.mus_snd_var = mus_snd_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        main_spr_var = sprite_add(dh_directory_const+"\TEX\sprites\WD_SPR2.png",15,false,false,0,0);
        rise_spr_var = sprite_add(dh_directory_const+"\TEX\sprites\WD_SPR1.png",18,false,false,0,0);
        atk_spr_var = sprite_add(dh_directory_const+"\TEX\sprites\WD_SPR3.png",10,false,false,0,0);
        atk_end_spr_var = sprite_add(dh_directory_const+"\TEX\sprites\WD_SPR4.png",9,false,false,0,0);
        dead_spr_var = sprite_add(dh_directory_const+"\TEX\sprites\WD_SPR5.png",2,false,false,0,0);
        static_bg_var = background_add(main_directory_const+"\BG\DH\tile_static_bg.png",false,false);
        doll_blood_bg_var = background_add(main_directory_const+"\BG\DH\doll_blood_bg.png",false,false);
        shadow_bg_var = background_add(main_directory_const+"\BG\DH\shadow_bg.png",false,false);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_04_snd.wav",true);
        snd_arr[4,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_05_snd.wav",true);
        snd_arr[5,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_06_snd.wav",true);
        snd_arr[6,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_07_snd.wav",true);
        snd_arr[7,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_08_snd.wav",true);
        atk_start_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_atk_snd.wav",true);
        hurt_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\doll_hurt_snd.wav",true);
        dead_snd_var[0]  = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_dead_snd.wav",true);
        if global.classic_mus_var { mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DH\wc_static_snd.wav"); }
        else { mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_mus_snd.mp3"); }
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    }
    shadow_tex_var = background_get_texture(shadow_bg_var);
    spr_var = main_spr_var;
    mus_prio_var = theme_mus_prio_const;
    // Behavior
    if global.wc_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.wc_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            dmg_var = 30;
            dmg_alarm_var = 120;
            spd_base_var = 1.1;
            spr_spd_var = 0.55;
            hp_var = 10;
            break;
        }
        case 2: // HD
        {
            do_wander_var = true;
            dmg_var = 25;
            hp_var = 10;
            hurt_dist_var = 19.2;
            wander_mult_var = 0.125;
            spd_base_var = 16/9; // Aspect ratio speed lol, 1.r7
            do_acc_var = true;
            acc_var = 2/45; // 0.0r4
            frick_var = acc_var;
            do_rise_var = 2;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
        case 3: // Remodeled
        {
            do_rise_var = 2;
            hp_var = 10;
            dmg_var = 40;
            spd_base_var = 2;
            atk_delay_var = 30;
            atk_end_delay_var = 27;
            rise_alarm_var = 54;
            spr_spd_var = 1/3; // 0.r3
            break;
        }
    }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(main_spr_var);
        sprite_delete(rise_spr_var);
        sprite_delete(atk_spr_var);
        sprite_delete(atk_end_spr_var);
        background_delete(static_bg_var);
        background_delete(shadow_bg_var);
        background_delete(doll_blood_bg_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        fmod_snd_free_scr(atk_start_snd_var[1]);
        fmod_snd_free_scr(hurt_snd_var[1]);
        fmod_snd_free_scr(dead_snd_var[0]);
    }
    with wc_eff_obj { if par_var == other.id { instance_destroy(); }}
    with doll_blood_obj { if par_var == other.id { instance_destroy(); }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    do_hurt_var = false;
    anim_type_var = 0;
    spr_var = main_spr_var;
    spr_id_var = 0;
    rise_var = false;
    if do_wander_var { wander_var = true; }
    event_inherited();
    local.rise = do_rise_var && global.mark_len_var > 0;
    if local.rise
    {
        local.mark = irandom(global.mark_len_var-1);
        x = global.mark_arr[local.mark,0];
        y = global.mark_arr[local.mark,1];
        z = global.mark_arr[local.mark,2];
        spr_var = rise_spr_var;
        tex_var = sprite_get_texture(spr_var,spr_id_var);
        on_var = true;
        enter_var = false;
        do_coll_var = true;
        move_var = false;
        set_alarm_scr(0,-1);
        if do_rise_var == 2
        {
            anim_type_var = 1;
            set_alarm_scr(1,rise_alarm_var);
            set_alarm_scr(5,rise_alarm_var);
            set_alarm_scr(6,rise_alarm_var+irandom_range(snd_alarm_min_var,snd_alarm_max_var));
            if !wander_var { set_alarm_scr(8,rise_alarm_var); }
        }
        else
        {
            anim_var = false;
            rise_var = true;
        }
    }
    with instance_create(0,0,wc_eff_obj)
    {
        par_var = other.id;
        bg_var = other.static_bg_var;
        visible = !local.rise;
    }
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    if dead_var { instance_destroy(); }
    else { event_inherited(); }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var
    {
        if rise_var
        {
            event_user(6);
            sight_type_var = 1;
            event_user(8);
            if target_visible_var
            {
                anim_var = do_anim_var;
                rise_var = false;
                spr_id_var = 0;
                anim_type_var = 1;
                set_alarm_scr(1,rise_alarm_var);
                set_alarm_scr(5,rise_alarm_var);
                set_alarm_scr(6,rise_alarm_var+irandom_range(snd_alarm_min_var,snd_alarm_max_var));
                if !wander_var { set_alarm_scr(8,rise_alarm_var); }
            }
        }
        else if wander_var
        {
            spd_mult_var *= wander_mult_var;
            with player_obj
            {
                local.dist = point_distance_3d_scr(x,y,z,other.x,other.y,other.z);
                local.yaw = abs(deg_diff_scr(point_direction(other.x,other.y,x,y),other.yaw_var));
                local.radius = coll_var[2]/2; local.angle = radtodeg(arctan2(local.radius,local.dist));
                if local.yaw <= other.sight_yaw_var+local.angle || local.dist < other.sight_dist_var
                {
                    local.xvec = (x-other.x)/local.dist;
                    local.yvec = (y-other.y)/local.dist;
                    local.zvec = (z-other.z)/local.dist;
                    local.ztmp = other.z+(other.coll_var[1]/2);
                    if local.dist < check_ray_scr(other.x,other.y,local.ztmp,local.xvec,local.yvec,local.zvec)
                    { other.wander_var = false; break; }
                }
            }
            if !wander_var { with wc_eff_obj { visible = true; }}
        }
    }
    event_inherited();
');
// Attack Success
// Sets the variable read by the attack delay, should only make them vulnerable when they fail the attack
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    temp_var = true; 
');
// Attack Alarm
object_event_add
(argument0,ev_alarm,4,'
    event_inherited();
    do_hurt_var = false;
');
// Attack delay alarm
object_event_add
(argument0,ev_alarm,7,'
    event_inherited();
    if !temp_var { do_hurt_var = 2; }
    temp_var = false;
');
// Anim Alarm (Different from Plus!!!)
object_event_add
(argument0,ev_alarm,5,'
    event_inherited();
    if !dead_var
    {
        anim_type_var = 0;
        spr_var = main_spr_var;
        spr_id_var = 0;
    }
');
// Hurt Alarm
object_event_add
(argument0,ev_alarm,3,'
    event_inherited();
    tone_var = c_white;
');
// Rise alarm
object_event_add
(argument0,ev_alarm,8,'
    with wc_eff_obj { visible = true; }
');
// Hurt Event
object_event_add
(argument0,ev_other,ev_user4,'
    event_inherited();
    if dead_var
    {
        set_alarm_scr(5,dead_alarm_var);
        anim_type_var = 1; // End on last
        spr_id_var = 0;
        if dead_var == 2
        {
            with instance_create(x,y,doll_blood_obj)
            {
                par_var = other.id;
                store_tex_var = background_get_texture(other.doll_blood_bg_var);
                tex_var = store_tex_var;
            }
        }
        else { dead_var += 1; }
    }
    else { tone_var = c_red; }
');
// Die event
object_event_add
(argument0,ev_other,ev_user11,'
    // Disable behavior
    visible_var = true;
    dead_var = true;
    move_var = false;
    atk_var = false;
    reset_alarm_scr();
    dur_var = 1;
    // Hit em while hes down
    do_hurt_var = true;
    hurt_snd_var = 2;
    hurt_die_var = false;
    hurt_var = false;
    hurt_dist_var = 0;
    // Play sound
    if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
    { fmod_inst_stop_scr(snd_var); }
    snd_var = fmod_snd_3d_play_scr(dead_snd_var[0]);
    sub_var[0] = dead_snd_var[1];
    sub_var[1] = dead_snd_var[2];
    // Play animation
    spr_var = dead_spr_var;
    anim_type_var = 1; // End on last
    spr_id_var = 0;
    set_alarm_scr(5,dead_alarm_var);
    z_off_var = -0.6;
    h_var = 15.3;
    // Turn off static
    local.dead = true;
    with wc_obj { if !dead_var { local.dead = false; }}
    if local.dead { with wc_eff_obj { visible = false; }}
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if (on_var || visible_var) && (!possess_var || cam_id_var != view_current || global.reflect_var)
    {
        draw_set_alpha(image_alpha);
        // Transform
        d3d_transform_set_identity();
        d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+shadow_z_var);
        // Draw
        d3d_draw_floor(-shadow_w_var/2,-shadow_w_var/2,0,shadow_w_var/2,shadow_w_var/2,0,shadow_tex_var,1,1);
        // Reset
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
    event_inherited();
');