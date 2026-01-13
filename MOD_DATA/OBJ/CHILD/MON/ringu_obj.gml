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
    ini_open(global.lang_var);
    switch global.name_var
    {
        case name_og_const:
        case name_hd_const:
        case name_fanon_const:
        {
            name_var = ini_read_string("NAME","ringu","NAME_ringu");
            break;
        }
        case name_num_og_const:
        case name_num_hd_const:
        {
            name_var = ini_read_string("NAME","ringu_num","NAME_ringu_num");
            break;
        }
    }
    snd_arr[0,1] = ini_read_string("SUB","ringu_01","SUB_ringu_01"); snd_arr[0,2] = true;
    snd_arr[1,1] = ini_read_string("SUB","ringu_02","SUB_ringu_02"); snd_arr[1,2] = true;
    snd_arr[2,1] = ini_read_string("SUB","ringu_03","SUB_ringu_03"); snd_arr[2,2] = true;
    snd_arr[3,1] = string_replace(ini_read_string("SUB","ringu_04","SUB_ringu_04"),"@n",name_var);
    wake_snd_var[2] = string_replace(ini_read_string("SUB","ringu_wake","SUB_ringu_wake"),"@n",name_var);
    hurt_snd_var[2] = string_replace(ini_read_string("SUB","ringu_hurt","SUB_ringu_hurt"),"@n",name_var);
    ini_close();
    type_var = 0;
    spd_base_var = 0.8;
    spr_spd_var = 1/6;
    dur_var = irandom_range(10,20);
    delay_var = 120;
    dmg_var = 45;
    dmg_alarm_var = 120;
    w_var = 10;
    h_var = 20;
    z_off_var = 2;
    atk_range_var = 48;
    // Sounds
    snd_len_var = 4;
    wake_snd_var[0] = true;
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_max_var = 600;
    hurt_snd_var = 4;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            other.hurt_snd_var[1] = hurt_snd_var[1];
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS3_01_spr.png",6,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\ringu_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\ringu_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\ringu_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\ringu_04_snd.wav",true);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\ringu_wake_snd.wav",global.wake_3d_var);
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\ringu_mus_snd.mp3");
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        hurt_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\ringu_laugh_snd.wav",true);
        fmod_snd_set_minmax_dist_scr(hurt_snd_var[1],0,snd_dist_max_var);
        fmod_snd_set_group_scr(hurt_snd_var[1],snd_group_mon_const);
    }
    // Laugh
    do_hurt_var = true;
    violence_var = 3;
    // Behavior
    if global.ringu_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.ringu_type_var; }
    switch local.type
    {
        case 0:
        {
            dmg_var = 30;
            atk_range_var = coll_var[2];
            // Silhouette
            sil_var = true;
            sil_type_var = 1; // Pure color
            sil_color_var = c_black;
            sil_alpha_var = 0.2;
            sil_dist_var = 0.1;
            break;
        }
        case 3: // Old HD
        {
            spd_base_var = 44/45; // 0.9r7
        }
        case 2: // HD
        {
            dur_var = irandom_range(10,15);
            dmg_alarm_var = 180;
            delay_min_var = 90;
            delay_max_var = 180;
            do_enter_var = true;
            atk_range_var = 32;
            // Sound
            snd_alarm_min_var = 90;
            snd_alarm_max_var = 240;
            snd_den_var = 1;
            snd_dist_max_var = 500;
            break;
        }
    }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(spr_var);
        fmod_snd_free_scr(mus_snd_var);
        fmod_snd_free_scr(hurt_snd_var[1]);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        fmod_snd_free_scr(wake_snd_var[1]);
    }
');