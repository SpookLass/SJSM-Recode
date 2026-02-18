// Builtin Variables
object_set_depth(argument0,99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    alarm_min_var = 400;
    alarm_max_var = 600;
    dist_min_var = 32/3; // 10.r6
    dist_max_var = 320/3; // 106.r6
    num_var = 1;
    den_var = 3;
    snd_len_var = 33;
    snd_arr[0] = amb_01_snd;
    snd_arr[1] = amb_02_snd;
    snd_arr[2] = amb_03_snd;
    snd_arr[3] = amb_04_snd;
    snd_arr[4] = amb_05_snd;
    snd_arr[5] = amb_06_snd;
    snd_arr[6] = amb_07_snd;
    snd_arr[7] = amb_08_snd;
    snd_arr[8] = amb_09_snd;
    snd_arr[9] = amb_10_snd;
    snd_arr[10] = amb_11_snd;
    snd_arr[11] = amb_12_snd;
    snd_arr[12] = amb_13_snd;
    snd_arr[13] = amb_14_snd;
    snd_arr[14] = amb_15_snd;
    snd_arr[15] = amb_16_snd;
    snd_arr[16] = amb_17_snd;
    snd_arr[17] = amb_18_snd;
    snd_arr[18] = amb_19_snd;
    snd_arr[19] = amb_20_snd;
    snd_arr[20] = amb_21_snd;
    snd_arr[21] = amb_22_snd;
    snd_arr[22] = amb_23_snd;
    snd_arr[23] = amb_24_snd;
    snd_arr[24] = amb_25_snd;
    snd_arr[25] = amb_26_snd;
    snd_arr[26] = amb_27_snd;
    snd_arr[27] = amb_28_snd;
    snd_arr[28] = amb_29_snd;
    snd_arr[29] = amb_30_snd;
    snd_arr[30] = amb_31_snd;
    snd_arr[31] = amb_32_snd;
    snd_arr[32] = amb_07_old_snd;
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,random_range(alarm_min_var,alarm_max_var));
');
//Alarm
object_event_add
(argument0,ev_alarm,0,'
    if frac_chance_scr(num_var,den_var)
    {
        // Find center of players
        local.xtmp = 0; local.ytmp = 0; local.ztmp = 0;
        for (local.i=0; local.i<global.player_len_var; local.i+=1;)
        {
            local.xtmp += global.player_arr[local.i].x;
            local.ytmp += global.player_arr[local.i].y;
            local.ztmp += global.player_arr[local.i].z;
        }
        local.xtmp /= global.player_len_var; 
        local.ytmp /= global.player_len_var; 
        local.ztmp /= global.player_len_var;
        // Add random
        local.yaw = random(360); local.pitch = random_range(-90,90); local.dist = random_range(dist_min_var,dist_max_var);
        local.xtmp += lengthdir_x(lengthdir_x(local.dist,local.yaw),local.pitch);
        local.ytmp += lengthdir_x(lengthdir_y(local.dist,local.yaw),local.pitch);
        local.ztmp -= lengthdir_y(local.dist,local.pitch);
        // Play Sound
        fmod_snd_3d_play_scr(snd_arr[irandom(snd_len_var-1)],local.xtmp,local.ytmp,local.ztmp);
    }
    set_alarm_scr(0,random_range(alarm_min_var,alarm_max_var));
');