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
    snd_len_var = 3;
    wake_snd_var[0] = true;
    do_snd_var = true;
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 240;
    snd_alarm_max_var = 240;
    snd_dist_min_var = 0;
    snd_dist_max_var = 600;
    // Charge sounds
    charge_snd_len_var = 1;
    // Breath sounds
    breath_snd_len_var = 2;
    breath_snd_num_var = 2;
    breath_snd_den_var = 3;
    // Drag Sounds
    drag_snd_var = noone;
    drag_snd_len_var = 3;
    drag_snd_num_var = 1;
    drag_snd_den_var = 2;
    drag_snd_alarm_var = 120;
    drag_snd_dist_var = 700;
    // Translations
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("killer",global.name_var);
    switch global.killer_voice_var
    {
        case 0: // Vernon Shaw
        {
            wake_snd_var[2] = string_replace(ini_read_string("SUB","killer_wake","SUB_killer_wake"),"@n",name_var); wake_snd_var[3] = false;
            charge_snd_arr[0,1] = wake_snd_var[2]; charge_snd_arr[0,2] = wake_snd_var[3];
            snd_arr[0,1] = ini_read_string("SUB","killer_01","SUB_killer_01"); snd_arr[0,2] = true;
            snd_arr[1,1] = ini_read_string("SUB","killer_02","SUB_killer_02"); snd_arr[1,2] = true;
            snd_arr[2,1] = ini_read_string("SUB","killer_03","SUB_killer_03"); snd_arr[2,2] = true;
            local.sub = string_replace(ini_read_string("SUB","killer_breath","SUB_killer_breath"),"@n",name_var);
            for (local.i=0; local.i<breath_snd_len_var; local.i+=1;)
            { breath_snd_arr[local.i,1] = local.sub; breath_snd_arr[local.i,2] = false; }
            break;
        }
        case 1: // DirectorFlik
        {
            snd_len_var = 9;
            wake_snd_var[2] = string_replace(ini_read_string("SUB","killer_wake","SUB_killer_wake"),"@n",name_var); wake_snd_var[3] = false;
            charge_snd_arr[0,1] = wake_snd_var[2]; charge_snd_arr[0,2] = wake_snd_var[3];
            snd_arr[0,1] = ini_read_string("SUB","killer_hd_01","SUB_killer_hd_01"); snd_arr[0,2] = true;
            snd_arr[1,1] = ini_read_string("SUB","killer_hd_02","SUB_killer_hd_02"); snd_arr[1,2] = true;
            snd_arr[2,1] = ini_read_string("SUB","killer_hd_03","SUB_killer_hd_03"); snd_arr[2,2] = true;
            snd_arr[3,1] = ini_read_string("SUB","killer_hd_04","SUB_killer_hd_04"); snd_arr[3,2] = true;
            snd_arr[4,1] = ini_read_string("SUB","killer_hd_05","SUB_killer_hd_05"); snd_arr[4,2] = true;
            snd_arr[5,1] = ini_read_string("SUB","killer_hd_06","SUB_killer_hd_06"); snd_arr[5,2] = true;
            snd_arr[6,1] = ini_read_string("SUB","killer_hd_07","SUB_killer_hd_07"); snd_arr[6,2] = true;
            snd_arr[7,1] = ini_read_string("SUB","killer_hd_08","SUB_killer_hd_08"); snd_arr[7,2] = true;
            snd_arr[8,1] = ini_read_string("SUB","killer_hd_09","SUB_killer_hd_09"); snd_arr[8,2] = true;
            local.sub = string_replace(ini_read_string("SUB","killer_breath","SUB_killer_breath"),"@n",name_var);
            for (local.i=0; local.i<breath_snd_len_var; local.i+=1;)
            { breath_snd_arr[local.i,1] = local.sub; breath_snd_arr[local.i,2] = false; }
            break;
        }
        case 2: // Spook Lass
        {
            snd_len_var = 4;
            breath_snd_len_var = 3;
            wake_snd_var[2] = string_replace(ini_read_string("SUB","killer_wake","SUB_killer_wake"),"@n",name_var); wake_snd_var[3] = false;
            charge_snd_arr[0,1] = wake_snd_var[2]; charge_snd_arr[0,2] = wake_snd_var[3];
            snd_arr[0,1] = ini_read_string("SUB","killer_hd_01","SUB_killer_hd_01"); snd_arr[0,2] = true;
            snd_arr[1,1] = ini_read_string("SUB","killer_hd_02","SUB_killer_hd_02"); snd_arr[1,2] = true;
            snd_arr[2,1] = ini_read_string("SUB","killer_hd_08","SUB_killer_hd_08"); snd_arr[2,2] = true;
            snd_arr[3,1] = ini_read_string("SUB","killer_hd_09","SUB_killer_hd_09"); snd_arr[3,2] = true;
            local.sub = string_replace(ini_read_string("SUB","killer_breath","SUB_killer_breath"),"@n",name_var);
            for (local.i=0; local.i<breath_snd_len_var; local.i+=1;)
            { breath_snd_arr[local.i,1] = local.sub; breath_snd_arr[local.i,2] = false; }
            break;
        }
        case 3: // Ryan J
        {
            snd_len_var = 8;
            breath_snd_len_var = 3;
            charge_snd_len_var = 3;
            wake_snd_var[2] = string_replace(ini_read_string("SUB","killer_ryan_05","SUB_killer_ryan_05"),"@n",name_var); wake_snd_var[3] = true;
            snd_arr[0,1] = ini_read_string("SUB","killer_ryan_01","SUB_killer_ryan_01"); snd_arr[0,2] = true;
            snd_arr[1,1] = ini_read_string("SUB","killer_ryan_02","SUB_killer_ryan_02"); snd_arr[1,2] = true;
            snd_arr[2,1] = ini_read_string("SUB","killer_ryan_03","SUB_killer_ryan_03"); snd_arr[2,2] = true;
            snd_arr[3,1] = ini_read_string("SUB","killer_ryan_04","SUB_killer_ryan_04"); snd_arr[3,2] = true;
            snd_arr[4,1] = ini_read_string("SUB","killer_ryan_05","SUB_killer_ryan_05"); snd_arr[4,2] = true;
            snd_arr[5,1] = ini_read_string("SUB","killer_ryan_06","SUB_killer_ryan_06"); snd_arr[5,2] = true;
            snd_arr[6,1] = ini_read_string("SUB","killer_ryan_07","SUB_killer_ryan_07"); snd_arr[6,2] = true;
            snd_arr[7,1] = ini_read_string("SUB","killer_ryan_08","SUB_killer_ryan_08"); snd_arr[7,2] = true;
            charge_snd_arr[0,1] = ini_read_string("SUB","killer_charge_ryan_01","SUB_killer_charge_ryan_01"); charge_snd_arr[0,2] = true;
            charge_snd_arr[1,1] = ini_read_string("SUB","killer_charge_ryan_02","SUB_killer_charge_ryan_02"); charge_snd_arr[1,2] = true;
            charge_snd_arr[2,1] = string_replace(ini_read_string("SUB","killer_charge_ryan_03","SUB_killer_charge_ryan_03"),"@n",name_var); charge_snd_arr[2,2] = false;
            local.sub = string_replace(ini_read_string("SUB","killer_mumble_ryan","SUB_killer_mumble_ryan"),"@n",name_var);
            for (local.i=0; local.i<breath_snd_len_var; local.i+=1;)
            { breath_snd_arr[local.i,1] = local.sub; breath_snd_arr[local.i,2] = false; }
            break;
        }
    }
    loop_snd_var[2] = string_replace(ini_read_string("SUB","killer_creep","SUB_killer_creep"),"@n",name_var); loop_snd_var[3] = false;
    drag_snd_arr[0,1] = ini_read_string("SUB","killer_drag","SUB_killer_drag"); drag_snd_arr[0,2] = false;
    drag_snd_arr[1,1] = drag_snd_arr[0,1]; drag_snd_arr[1,2] = false;
    drag_snd_arr[2,1] = drag_snd_arr[0,1]; drag_snd_arr[2,2] = false;
    ini_close();
    // Variables
    type_var = 1;
    spd_base_var = 1/3; // 0.r3
    dur_var = irandom_range(15,30);
    delay_var = 117;
    dmg_var = 45;
    dmg_alarm_var = 30;
    h_var = 22;
    eye_h_var = 18.4;
    atk_range_var = 48;
    dead_rm_var = killer_dead_rm;
    scary_var = false;
    dmg_stun_var = 0;
    // Stamina
    do_sprint_var = false;
    sprint_var = false;
    do_stam_var = false;
    stam_max_var = 100;
    stam_rate_var = 1/3;
    stam_drain_var = 1.25;
    stam_spawn_min_var = 0;
    stam_spawn_max_var = 75;
    stam_per_var = false;
    stam_var = 0;
    sprint_mult_var = 5;
    sprint_acc_var = 8/135;  // 0.0r592
    acc_base_var = 4/225; // 0.01r7
    hurt_stam_var = 0;
    // Sprint animation
    spr_spd_base_var = 1/6;
    sprint_spr_spd_var = 5/6; // Don"t look at me, stealing this from Gone Rogue
    h_base_var = 22;
    sprint_h_var = 25;
    z_off_base_var = 0;
    sprint_z_off_var = -1;
    // Theme
    mus_prio_var = mon_mus_prio_const;
    // Sprite stuff
    spr_arr_var[0,1] = 7.5;
    spr_arr_var[0,2] = 6.3;
    spr_arr_var[8,1] = 11;
    spr_arr_var[8,2] = 11;
    spr_arr_var[1,1] = 9;
    spr_arr_var[1,2] = 7.2;
    spr_arr_var[2,1] = 10.7;
    spr_arr_var[2,2] = 7.8;
    spr_arr_var[3,1] = 9;
    spr_arr_var[3,2] = 6;
    spr_arr_var[4,1] = 6.3;
    spr_arr_var[4,2] = 9;
    spr_arr_var[5,1] = 6.6;
    spr_arr_var[5,2] = 9.6;
    spr_arr_var[6,1] = 7.5;
    spr_arr_var[6,2] = 10.4;
    spr_arr_var[7,1] = 7.2;
    spr_arr_var[7,2] = 7.2;
    spr_arr_var[9,1] = 11;
    spr_arr_var[9,2] = 11;
    spr_arr_var[10,1] = 11;
    spr_arr_var[10,2] = 11;
    spr_arr_var[11,1] = 11;
    spr_arr_var[11,2] = 11;
    spr_arr_var[12,1] = 11;
    spr_arr_var[12,2] = 11;
    spr_arr_var[13,1] = 11;
    spr_arr_var[13,2] = 11;
    spr_arr_var[14,1] = 11;
    spr_arr_var[14,2] = 11;
    spr_arr_var[15,1] = 11;
    spr_arr_var[15,2] = 11;
    // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_arr_var[0,0] = spr_arr_var[0,0];
            other.spr_arr_var[8,0] = spr_arr_var[8,0];
            other.do_turn_var = do_turn_var;
            if other.do_turn_var
            {
                other.spr_arr_var[1,0] = spr_arr_var[1,0];
                other.spr_arr_var[2,0] = spr_arr_var[2,0];
                other.spr_arr_var[3,0] = spr_arr_var[3,0];
                other.spr_arr_var[4,0] = spr_arr_var[4,0];
                other.spr_arr_var[5,0] = spr_arr_var[5,0];
                other.spr_arr_var[6,0] = spr_arr_var[6,0];
                other.spr_arr_var[7,0] = spr_arr_var[7,0];
                other.spr_arr_var[9,0] = spr_arr_var[9,0];
                other.spr_arr_var[10,0] = spr_arr_var[10,0];
                other.spr_arr_var[11,0] = spr_arr_var[11,0];
                other.spr_arr_var[12,0] = spr_arr_var[12,0];
                other.spr_arr_var[13,0] = spr_arr_var[13,0];
                other.spr_arr_var[14,0] = spr_arr_var[14,0];
                other.spr_arr_var[15,0] = spr_arr_var[15,0];
            }
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            for (local.i=0; local.i<breath_snd_len_var; local.i+=1;)
            { other.breath_snd_arr[local.i,0] = breath_snd_arr[local.i,0]; }
            for (local.i=0; local.i<drag_snd_len_var; local.i+=1;)
            { other.drag_snd_arr[local.i,0] = drag_snd_arr[local.i,0]; }
            for (local.i=0; local.i<charge_snd_len_var; local.i+=1;)
            { other.charge_snd_arr[local.i,0] = charge_snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.loop_snd_var[1] = loop_snd_var[1];
            other.hide_mus_snd_var = hide_mus_snd_var;
            other.main_mus_snd_var = main_mus_snd_var;
            local.loaded = true;
            break;
        }
    }
    // If no existing assets were found, load them
    if !local.loaded
    {
        spr_arr_var[0,0] = sprite_add(vanilla_directory_const+"\TEX\sprites\MS10_05_spr.png",15,false,false,0,0);
        spr_arr_var[8,0] = sprite_add(main_directory_const+"\SPR\MON\killer_sprint_01_spr.png",15,false,false,0,0);
        do_turn_var = !global.mem_save_var;
        if do_turn_var
        {
            spr_arr_var[1,0] = sprite_add(vanilla_directory_const+"\TEX\sprites\MS10_06_spr.png",15,false,false,0,0);
            spr_arr_var[2,0] = sprite_add(vanilla_directory_const+"\TEX\sprites\MS10_07_spr.png",15,false,false,0,0);
            spr_arr_var[3,0] = sprite_add(vanilla_directory_const+"\TEX\sprites\MS10_08_spr.png",15,false,false,0,0);
            spr_arr_var[4,0] = sprite_add(vanilla_directory_const+"\TEX\sprites\MS10_01_spr.png",15,false,false,0,0);
            spr_arr_var[5,0] = sprite_add(vanilla_directory_const+"\TEX\sprites\MS10_02_spr.png",15,false,false,0,0);
            spr_arr_var[6,0] = sprite_add(vanilla_directory_const+"\TEX\sprites\MS10_03_spr.png",15,false,false,0,0);
            spr_arr_var[7,0] = sprite_add(vanilla_directory_const+"\TEX\sprites\MS10_04_spr.png",15,false,false,0,0);
            spr_arr_var[9,0] = sprite_add(main_directory_const+"\SPR\MON\killer_sprint_02_spr.png",15,false,false,0,0);
            spr_arr_var[10,0] = sprite_add(main_directory_const+"\SPR\MON\killer_sprint_03_spr.png",15,false,false,0,0);
            spr_arr_var[11,0] = sprite_add(main_directory_const+"\SPR\MON\killer_sprint_04_spr.png",15,false,false,0,0);
            spr_arr_var[12,0] = sprite_add(main_directory_const+"\SPR\MON\killer_sprint_05_spr.png",15,false,false,0,0);
            spr_arr_var[13,0] = sprite_add(main_directory_const+"\SPR\MON\killer_sprint_06_spr.png",15,false,false,0,0);
            spr_arr_var[14,0] = sprite_add(main_directory_const+"\SPR\MON\killer_sprint_07_spr.png",15,false,false,0,0);
            spr_arr_var[15,0] = sprite_add(main_directory_const+"\SPR\MON\killer_sprint_08_spr.png",15,false,false,0,0);
        }
        switch global.killer_voice_var
        {
            case 0: // Vernon Shaw
            {
                snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_01_snd.wav",true);
                snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_02_snd.wav",true);
                snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_03_snd.wav",true);
                breath_snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_breath_01_snd.wav",true);
                breath_snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_breath_02_snd.wav",true);
                wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\stab_11_snd.wav",global.wake_3d_var);
                charge_snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\stab_11_snd.wav",true);
                break;
            }
            case 1: // DirectorFlik
            {
                snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_hd_01_snd.wav",true);
                snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_hd_02_snd.wav",true);
                snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_hd_03_snd.wav",true);
                snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_hd_04_snd.wav",true);
                snd_arr[4,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_hd_05_snd.wav",true);
                snd_arr[5,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_hd_06_snd.wav",true);
                snd_arr[6,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_hd_07_snd.wav",true);
                snd_arr[7,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_hd_08_snd.wav",true);
                snd_arr[8,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_hd_09_snd.wav",true);
                breath_snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_breath_hd_01_snd.wav",true);
                breath_snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_breath_hd_02_snd.wav",true);
                wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\stab_11_snd.wav",global.wake_3d_var);
                charge_snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\stab_11_snd.wav",true);
                break;
            }
            case 2: // Spook Lass
            {
                snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_lass_01_snd.wav",true);
                snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_lass_02_snd.wav",true);
                snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_lass_08_snd.wav",true);
                snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_lass_09_snd.wav",true);
                breath_snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_breath_lass_01_snd.wav",true);
                breath_snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_breath_lass_02_snd.wav",true);
                breath_snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_breath_lass_03_snd.wav",true);
                wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\stab_11_snd.wav",global.wake_3d_var);
                charge_snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\stab_11_snd.wav",true);
                break;
            }
            case 3:
            {
                snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_ryan_01_snd.wav",true);
                snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_ryan_02_snd.wav",true);
                snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_ryan_03_snd.wav",true);
                snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_ryan_04_snd.wav",true);
                snd_arr[4,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_ryan_05_snd.wav",true);
                snd_arr[5,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_ryan_06_snd.wav",true);
                snd_arr[6,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_ryan_07_snd.wav",true);
                snd_arr[7,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_ryan_08_snd.wav",true);
                breath_snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_mumble_ryan_01_snd.wav",true);
                breath_snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_mumble_ryan_02_snd.wav",true);
                breath_snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_mumble_ryan_03_snd.wav",true);
                wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_ryan_05_snd.wav",global.wake_3d_var);
                charge_snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_charge_ryan_01_snd.wav",true);
                charge_snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_charge_ryan_02_snd.wav",true);
                charge_snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_charge_ryan_03_snd.wav",true);
                break;
            }
        }
        drag_snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_drag_01_snd.wav",true);
        drag_snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_drag_02_snd.wav",true);
        drag_snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_drag_03_snd.wav",true);
        loop_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_loop_snd.wav",true);
        for (local.i=0; local.i<breath_snd_len_var; local.i+=1;)
        {
            fmod_snd_set_minmax_dist_scr(breath_snd_arr[local.i,0],0,snd_dist_max_var);
            fmod_snd_set_group_scr(breath_snd_arr[local.i,0],snd_group_mon_const);
        }
        for (local.i=0; local.i<drag_snd_len_var; local.i+=1;)
        {
            fmod_snd_set_minmax_dist_scr(drag_snd_arr[local.i,0],0,drag_snd_dist_var);
            fmod_snd_set_group_scr(drag_snd_arr[local.i,0],snd_group_mon_const);
        }
        for (local.i=0; local.i<charge_snd_len_var; local.i+=1;)
        {
            fmod_snd_set_minmax_dist_scr(charge_snd_arr[local.i,0],0,snd_dist_max_var);
            fmod_snd_set_group_scr(charge_snd_arr[local.i,0],snd_group_mon_const);
        }
        hide_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_hide_mus_snd.mp3");
        fmod_snd_set_group_scr(hide_mus_snd_var,snd_group_mus_const);
        switch global.old_theme_var
        {
            case 2: { main_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\ROMM\killer_rom_mus_snd.ogg"); break; }
            default: { main_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\killer_mus_snd.mp3"); break; }
        }
        fmod_snd_set_group_scr(main_mus_snd_var,snd_group_mus_const);
    }
    spr_var = spr_arr_var[0,0];
    w_01_var = spr_arr_var[0,1];
    w_02_var = spr_arr_var[0,2];
    w_var = w_01_var+w_02_var;
    // Behavior
    if global.killer_type_var == -1 { local.type = irandom(7); }
    else { local.type = global.killer_type_var; }
    local.set = false;
    switch local.type
    {
        case 7: // Player 9
        {
            spd_base_var = 1;
            frick_var = 0.5;
            acc_var = 0.8;
            stam_rate_var = 0.5;
            stam_drain_var = 5/9; // Kinda simulates stam start?
            sprint_acc_var = 0.8;
            acc_base_var = 0.8;
            sprint_mult_var = 2.5;
            stam_per_var = global.stam_per_var;
            stam_spawn_min_var = 100;
            stam_spawn_max_var = 100;
            do_acc_var = true;
            atk_range_var = global.mon_coll[2];
        }
        case 0: // Recode
        {
            do_sprint_var = true;
            do_stam_var = true;
            dmg_var = 30;
            dmg_alarm_var = 60;
            atk_range_var = global.mon_coll[2];
            breath_snd_num_var = 0;
            hurt_stam_var = 20;
            // Parry
            do_hurt_var = true;
            hurt_snd_var = 3;
            break;
        }
        case 3: // Old HD
        {
            // Weird
            spd_base_var = 4/15; // 0.2r6
            sprint_mult_var = 8;
            stam_drain_var = stam_rate_var;
            sprint_acc_var = 16/225;  // 0.07r1
            acc_base_var = 11/675; // 0.01r629
            local.set = true;
        }
        case 2: // HD
        {
            do_sprint_var = true;
            do_stam_var = true;
            dur_var = irandom_range(10,15);
            dmg_alarm_var = 90;
            delay_min_var = 90;
            delay_max_var = 180;
            do_acc_var = true;
            if !local.set
            { spd_base_var = 16/45; } // 0.3r5
            atk_range_var = 128/3; // 42.r6
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            // Sound
            snd_alarm_min_var = 180;
            snd_alarm_max_var = 480;
            drag_snd_num_var = 1;
            drag_snd_den_var = 1;
            // Parry
            do_hurt_var = true;
            hurt_snd_var = 3;
            break;
        }
        case 4: // Remodeled
        {
            do_sprint_var = true;
            do_stam_var = true;
            sprint_mult_var = 9;
            stam_rate_var = 1/6;
            stam_drain_var = 0.5;
            stam_per_var = true;
            break;
        }
        case 5: // Gone Rogue
        {
            do_sprint_var = true;
            do_stam_var = true;
            stam_rate_var = 5/12;
            stam_drain_var = 0.5;
            spr_spd_base_var = 0.2;
            sprint_spr_spd_var = 1;
            spd_base_var = 0.5;
            sprint_acc_var = -1;
            stam_spawn_max_var = 0;
            // Acceleration
            do_acc_var = 2; // OG Style
            acc_var = 0.1;
            frick_var = 0.05;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
        case 6: // Scary!!!
        {
            /*Classic
            spd_base_var = 8;
            dmg_stun_var = 30;
            do_hurt_var = true;
            stun_var = true;
            hurt_alarm_var = 30;
            spr_spd_base_var = 1;
            */
            do_sprint_var = true;
            scary_var = true;
            sprint_mult_var = 24; // WOW!
            dmg_var = 30;
            atk_range_var = global.mon_coll[2];
            loop_snd_var[0] = true;
            break;
        }
    }
    if sprint_acc_var
    {
        acc_var = acc_base_var;
        frick_var = acc_base_var;
    }
    spr_spd_var = spr_spd_base_var;
    z_off_var = z_off_base_var;
    h_var = h_base_var;
    if !irandom(1) { mus_snd_var = hide_mus_snd_var; }
    else { mus_snd_var = main_mus_snd_var; }
    // Alarms
    alarm_len_var = 9;
    alarm_ini_scr();
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        fmod_snd_free_scr(main_mus_snd_var);
        fmod_snd_free_scr(hide_mus_snd_var);
        for (local.i=0; local.i<drag_snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(drag_snd_arr[local.i,0]); }
        for (local.i=0; local.i<breath_snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(breath_snd_arr[local.i,0]); }
        for (local.i=0; local.i<charge_snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(charge_snd_arr[local.i,0]); }
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        fmod_snd_free_scr(wake_snd_var[1]);
        fmod_snd_free_scr(loop_snd_var[1]);
        if do_turn_var
        {
            for (local.i=0; local.i<16; local.i+=1;)
            { sprite_delete(spr_arr_var[local.i,0]); }
        }
        else
        {
            sprite_delete(spr_arr_var[0,0]);
            sprite_delete(spr_arr_var[8,0]);
        }
    }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    if scary_var
    {
        if player_obj.clear_time_var == -1
        {
            delay_min_var = 3600+(delay_var*instance_number(mon_par_obj));
            delay_max_var = delay_min_var;
        }
        else
        {
            delay_min_var = player_obj.clear_time_var+(delay_var*instance_number(mon_par_obj));
            delay_max_var = delay_min_var;
        }
    }
    event_inherited();
    if do_stam_var
    {
        if !stam_per_var
        {
            stam_var = random_range(stam_spawn_min_var,stam_spawn_max_var);
            sprint_var = false;
            
            spr_spd_var = spr_spd_base_var;
            h_var = h_base_var;
            z_off_var = z_off_base_var;
            if sprint_acc_var > 0 
            {
                acc_var = acc_base_var;
                frick_var = acc_base_var;
            }
        }
    }
    else if do_sprint_var
    {
        stam_var = stam_max_var;
        sprint_var = true;
        spr_spd_var = sprint_spr_spd_var;
        h_var = sprint_h_var;
        z_off_var = sprint_z_off_var;
        if sprint_acc_var > 0 
        {
            acc_var = sprint_acc_var;
            frick_var = sprint_acc_var;
        }
    }      
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_inherited();
');
// Movement
object_event_add
(argument0,ev_other,ev_user0,'
    if do_sprint_var
    {
        if !scary_var
        {
            // Switch sprint
            if sprint_var
            {
                if do_stam_var { stam_var -= stam_drain_var*global.delta_time_var; }
                if stam_var <= 0
                || (global.input_press_arr[sprint_input_const,player_id_var] == -1 && possess_var)
                {
                    sprint_var = false;
                    spr_spd_var = spr_spd_base_var;
                    h_var = h_base_var;
                    z_off_var = z_off_base_var;
                    if sprint_acc_var > 0 
                    {
                        acc_var = acc_base_var;
                        frick_var = acc_base_var;
                    }
                }
            }
            else
            {
                if do_stam_var { stam_var += stam_rate_var*global.delta_time_var; }
                if (stam_var >= stam_max_var && !possess_var) || !do_stam_var
                || (global.input_press_arr[sprint_input_const,player_id_var] == 1 && possess_var)
                {
                    sprint_var = true;
                    spr_spd_var = sprint_spr_spd_var;
                    h_var = sprint_h_var;
                    z_off_var = sprint_z_off_var;
                    if sprint_acc_var > 0 
                    {
                        acc_var = sprint_acc_var;
                        frick_var = sprint_acc_var;
                    }
                    // Somebody scream!
                    if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
                    { fmod_inst_stop_scr(snd_var); }
                    local.index = irandom(charge_snd_len_var-1);
                    snd_var = fmod_snd_3d_play_scr(charge_snd_arr[local.index,0]);
                    sub_var[0] = charge_snd_arr[local.index,1];
                    sub_var[1] = charge_snd_arr[local.index,2];
                }
            }
        }
        if sprint_var { spd_mult_var *= sprint_mult_var; }
        stam_var = median(0,stam_max_var,stam_var);
    }
    event_inherited();
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    if scary_var && sprint_var
    {
        sprint_var = false;
        spr_spd_var = spr_spd_base_var;
        h_var = h_base_var;
        z_off_var = z_off_base_var;
        if sprint_acc_var > 0 
        {
            acc_var = acc_base_var;
            frick_var = acc_base_var;
        }
        fmod_inst_stop_scr(loop_inst_var);
    }
    if dmg_stun_var > 0
    {
        set_motion_3d_scr(0,true);
        move_var = false;
        anim_var = false;
        atk_var = false;
        set_alarm_scr(1,dmg_stun_var);
        set_alarm_scr(2,dmg_stun_var);
        set_alarm_scr(4,dmg_stun_var);
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    event_inherited();
    if do_snd_var && drag_snd_len_var > 0
    { set_alarm_scr(8,drag_snd_alarm_var); }
');
// Sound alarm
object_event_add
(argument0,ev_alarm,6,'
    if do_snd_var && frac_chance_scr(snd_num_var,snd_den_var)//&& (!scary_var || !sprint_var)
    {
        if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
        { fmod_inst_stop_scr(snd_var); }
        if breath_snd_len_var > 0 && (frac_chance_scr(breath_snd_num_var,breath_snd_den_var) || sprint_var)
        {
            local.index = irandom(breath_snd_len_var-1);
            local.snd = breath_snd_arr[local.index,0];
            sub_var[0] = breath_snd_arr[local.index,1];
            sub_var[1] = breath_snd_arr[local.index,2];
        }
        else
        {
            local.index = irandom(snd_len_var-1);
            local.snd = snd_arr[local.index,0];
            sub_var[0] = snd_arr[local.index,1];
            sub_var[1] = snd_arr[local.index,2];
        }
        snd_var = fmod_snd_3d_play_scr(local.snd);
    }
    set_alarm_scr(6,irandom_range(snd_alarm_min_var,snd_alarm_max_var));
');
// Drag Sound Alarm
object_event_add
(argument0,ev_alarm,8,'
    if do_snd_var && drag_snd_len_var > 0 && frac_chance_scr(drag_snd_num_var,drag_snd_den_var)
    {
        local.snd = irandom(drag_snd_len_var-1);
        drag_snd_var = fmod_snd_3d_play_scr(drag_snd_arr[local.snd,0]);
        drag_sub_var[0] = drag_snd_arr[local.snd,1];
        drag_sub_var[1] = drag_snd_arr[local.snd,2];
    }
    set_alarm_scr(8,drag_snd_alarm_var);
');
// Hurt Event
object_event_add
(argument0,ev_other,ev_user4,'
    if !enter_var
    {
        event_inherited();
        with instance_create(0,0,fade_eff_obj)
        {
            image_blend = c_white;
            cam_id_var = other.hurt_target_var.cam_id_var;
            set_alarm_scr(0,8);
        }
        if hurt_stam_var && do_stam_var
        { stam_var = max(stam_var-hurt_stam_var,0); }
    }
');
// Sound update
object_event_add
(argument0,ev_other,ev_user9,'
    event_inherited();
    fmod_inst_set_3d_pos_scr(drag_snd_var,x,y,z);
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if on_var || visible_var
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        if do_mdl_var
        {
            // d3d_transform_add_rotation_y(pitch_var);
            d3d_transform_add_rotation_z(yaw_var);
            d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
            d3d_model_draw(mdl_var,0,0,0,tex_var);
        }
        else
        {
            // Array
            local.dir = point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current])
            if do_turn_var { local.dir_id = mod_scr(round((yaw_var-local.dir)/45),8); }
            else { local.dir_id = 0; }
            if sprint_var { local.dir_id += 8; }
            spr_var = spr_arr_var[local.dir_id,0];
            w_01_var = spr_arr_var[local.dir_id,1];
            w_02_var = spr_arr_var[local.dir_id,2];
            tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
            // Draw
            d3d_transform_add_rotation_z(local.dir);
            d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
            d3d_draw_wall(0,w_01_var,h_var,0,-w_02_var,0,tex_var,1,1);
        }
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        if global.debug_var
        {
            d3d_set_hidden(false);
            if path_exists(path_var)
            { draw_path(path_var,x,y,false); }
            d3d_set_hidden(true);
            // mp_grid_draw(grid_var);
        }
    }
');