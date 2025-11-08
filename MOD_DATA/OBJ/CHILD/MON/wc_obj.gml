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
    snd_dist_var = 512;
    // Translations
    ini_open(global.lang_var);
    name_var = ini_read_string("NAME","wc","NAME_wc");
    local.sub = string_replace(ini_read_string("SUB","wc","SUB_wc"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; }
    atk_start_snd_var[2] = local.sub;
    hurt_snd_var[2] = local.sub;
    dead_snd_var[1] = local.sub;
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
    // Special
    do_rise_var = true;
    rise_alarm_var = 112;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.main_spr_var = main_spr_var;
            other.rise_spr_var = rise_spr_var;
            other.atk_spr_var = atk_spr_var;
            other.atk_end_spr_var = atk_end_spr_var;
            other.dead_spr_var = dead_spr_var;
            local.loaded = true;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
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
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\wc_mus_snd.mp3");
    }
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
            dmg_var = 15;
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
    if instance_number(object_index) <= 1
    {
        sprite_delete(main_spr_var);
        sprite_delete(rise_spr_var);
        sprite_delete(atk_spr_var);
        sprite_delete(atk_end_spr_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        fmod_snd_free_scr(atk_start_snd_var[1]);
        fmod_snd_free_scr(hurt_snd_var[1]);
        fmod_snd_free_scr(dead_snd_var[0]);
    }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    do_hurt_var = false;
    anim_type_var = 0;
    spr_var = main_spr_var;
    spr_id_var = 0;
    rise_var = false;
    event_inherited();
    if do_rise_var
    {
        if global.mark_len_var > 0
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
            }
            else
            {
                anim_var = false;
                rise_var = true;
            }
        }
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
    event_inherited();
    if on_var && rise_var
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
        }
    }
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
// Hurt Event
object_event_add
(argument0,ev_other,ev_user4,'
    event_inherited();
    if dead_var
    {
        set_alarm_scr(5,dead_alarm_var);
        anim_type_var = 1; // End on last
        spr_id_var = 0;
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
');