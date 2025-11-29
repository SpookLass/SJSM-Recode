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
    name_var = ini_read_string("NAME","clown","NAME_clown");
    local.sub_01 = string_replace(ini_read_string("SUB","clown","SUB_clown"),"@n",name_var);
    local.sub_02 = string_replace(ini_read_string("SUB","clown_laugh","SUB_clown_laugh"),"@n",name_var);
    snd_arr[0,1] = local.sub_01;
    snd_arr[1,1] = local.sub_01;
    snd_arr[2,1] = local.sub_01;
    snd_arr[3,1] = local.sub_01;
    snd_arr[4,1] = local.sub_02;
    snd_arr[5,1] = local.sub_02;
    snd_arr[6,1] = local.sub_02;
    snd_arr[7,1] = local.sub_02;
    snd_arr[8,1] = local.sub_02;
    snd_arr[9,1] = local.sub_02;
    leave_snd_arr[0,1] = ini_read_string("SUB","clown_leave","SUB_clown_leave"); leave_snd_arr[0,2] = true;
    leave_snd_arr[1,1] = ini_read_string("SUB","clown_bye","SUB_clown_bye"); leave_snd_arr[1,2] = true;
    ini_close();
    type_var = 1;
    spd_base_var = 1; // Technically 1.r3 in DH due to a bug
    spr_spd_var = 1;
    dur_var = irandom_range(15,20);
    delay_var = 0;
    w_var = 24.7;
    h_var = 25.3;
    z_off_var = -0.3;
    // Special
    do_atk_var = -1;
    do_seen_var = true;
    seen_type_var = 1;
    seen_yaw_var = 30;
    min_dist_var = 16;
    // Sounds
    do_snd_var = true;
    snd_len_var = 10;
    snd_num_var = 1;
    snd_den_var = 1;
    snd_alarm_min_var = 300;
    snd_alarm_max_var = 360;
    snd_dist_max_var = 768; // Kinda, maybe 512
    leave_snd_len_var = 2;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            for (local.i=0; local.i<leave_snd_len_var; local.i+=1;)
            { other.leave_snd_arr[local.i,0] = leave_snd_arr[local.i,0]; }
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(dh_directory_const+"\TEX\sprites\CLWN_SPR1.png",6,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_04_snd.wav",true);
        snd_arr[4,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_05_snd.wav",true);
        snd_arr[5,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_06_snd.wav",true);
        snd_arr[6,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_07_snd.wav",true);
        snd_arr[7,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_08_snd.wav",true);
        snd_arr[8,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_09_snd.wav",true);
        snd_arr[9,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_10_snd.wav",true);
        leave_snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_leave_01_snd.wav");
        leave_snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\clown_leave_02_snd.wav");
        for (local.i=0; local.i<leave_snd_len_var; local.i+=1;)
        {
            fmod_snd_set_minmax_dist_scr(leave_snd_arr[local.i,0],0,leave_snd_dist_var);
            fmod_snd_set_group_scr(leave_snd_arr[local.i,0],snd_group_mon_const);
        }
    }
    // Behavior
    if global.clown_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.clown_type_var; }
    switch local.type
    {
        case 3: // Evil Clown
        {
            do_atk_var = true;
            dmg_var = 30;
            dmg_alarm_var = 120;
            min_dist_var = 0;
        }
        case 0:
        {
            seen_pitch_var = 30;
            break;
        }
        case 2: // HD
        {
            spd_base_var = 8/9; // 0.r8
            do_acc_var = true;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            break;
        }
        
    }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(spr_var);
        for (local.i=0; local.i<leave_snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(leave_snd_arr[local.i,0]); }
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
    }
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    if dur_var == 1
    {
        with door_trig_obj
        {
            local.door = id
            with instance_create(x,y,clown_door_trig_obj)
            {
                z = local.door.z;
                do_txt_var = local.door.do_txt_var;
                txt_var = local.door.txt_var;
                txt_lock_var = local.door.txt_lock_var;
                rm_count_var = local.door.rm_count_var;
                delay_var = local.door.delay_var;
                rm_var = local.door.rm_var;
            }
            instance_destroy();
        }
    }
    event_inherited();
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    event_inherited();
    // Seem stuff
    if is_seen_var == 1
    {
        if spd_var > 0 { set_motion_3d_scr(0,true); }
        move_var = false;
        anim_var = false;
        if alarm_arr[6,0] > 0 { set_alarm_scr(6,-1); }
    }
    else
    {
        if min_dist_var > 0 && target_dist_var <= min_dist_var && !enter_var
        {
            if spd_var > 0 { set_motion_3d_scr(0,true); }
            move_var = false;
            anim_var = false;
        }
        else
        {
            move_var = do_move_var
            anim_var = do_anim_var;
        }
        if alarm_arr[6,0] <= 0 { set_alarm_scr(6,irandom_range(snd_alarm_min_var,snd_alarm_max_var)); }
    }
");
// Leave
object_event_add
(argument0,ev_other,ev_user15,'
    local.index = irandom(leave_snd_len_var-1);
    snd_var = fmod_snd_play_scr(leave_snd_arr[local.index,0]);
    sub_var[0] = leave_snd_arr[local.index,1];
    sub_var[1] = leave_snd_arr[local.index,2];
')