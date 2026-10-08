// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,spooky_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create 1 event (example)
object_event_add
(argument0,ev_create,1,'
    par_var = '+string(argument2)+'
    z = 68;
    snd_dist_min_var = -1;
    snd_dist_max_var = -1;
    snd_var = snd_add_scr(spooky_04_snd_path,false,snd_group_voice_const,1,snd_dist_min_var,snd_dist_max_var);
    // States
        state_len_var = 12;
        snd_state_var = 2;
        state_alarm_var[0] = 90;
        state_alarm_var[1] = 60; // Move
        state_alarm_var[2] = 154.8; // Sub 1 and move slow
        state_alarm_var[3] = 141.6;
        state_alarm_var[4] = 105; // Exactly
        state_alarm_var[5] = 194.4;
        state_alarm_var[6] = 182.4;
        state_alarm_var[7] = 77.4; // Shaa!
        state_alarm_var[8] = 147.6;
        state_alarm_var[9] = 138.6;
        state_alarm_var[10] = 111;
        state_alarm_var[11] = 160; // Up into ceiling
    // Move
        move_alarm_var[0] = -1; // Becomes state alarm if -1
        move_pos_var[0,0] = x; // X
        move_pos_var[0,1] = y; // Y
        move_pos_var[0,2] = 28; // Z
        move_alarm_var[1] = -1;
        move_pos_var[1,0] = x-60; // X
        move_pos_var[1,1] = y; // Y
        move_pos_var[1,2] = 28; // Z
        move_alarm_var[2] = 60;
        move_pos_var[2,0] = x-66; // X
        move_pos_var[2,1] = y; // Y
        move_pos_var[2,2] = 28; // Z
        move_alarm_var[3] = noone;
        move_alarm_var[4] = noone;
        move_alarm_var[5] = noone;
        move_alarm_var[6] = noone;
        move_alarm_var[7] = noone;
        move_alarm_var[8] = noone;
        move_alarm_var[9] = noone;
        move_alarm_var[10] = noone;
        move_alarm_var[11] = -1;
        move_pos_var[7,0] = x-66; // X
        move_pos_var[7,1] = y; // Y
        move_pos_var[7,2] = 68; // Z
    // Subtitles
        for (local.i=1; local.i<state_len_var; local.i+=1;)
        { sub_alarm_var[local.i] = -1; }
        sub_alarm_var[0] = noone; sub_3d_var[0] = false; sub_arr_var[0] = "";
        sub_alarm_var[1] = noone; sub_3d_var[1] = false; sub_arr_var[1] = "";
        sub_alarm_var[11] = noone; sub_3d_var[11] = false; sub_arr_var[11] = "";
        ini_open("lang_"+global.lang_var+".ini");
        sub_3d_var[2] = true; sub_arr_var[2] = ini_read_string("SUB", "spooky_d_01", "SUB_spooky_d_01");
        sub_3d_var[3] = true; sub_arr_var[3] = ini_read_string("SUB", "spooky_d_02", "SUB_spooky_d_02");
        sub_3d_var[4] = true; sub_arr_var[4] = ini_read_string("SUB", "spooky_d_03", "SUB_spooky_d_03");
        sub_3d_var[5] = true; sub_arr_var[5] = ini_read_string("SUB", "spooky_d_04", "SUB_spooky_d_04");
        sub_3d_var[6] = true; sub_arr_var[6] = ini_read_string("SUB", "spooky_d_05", "SUB_spooky_d_05");
        sub_3d_var[7] = true; sub_arr_var[7] = ini_read_string("SUB", "spooky_d_06", "SUB_spooky_d_06");
        sub_3d_var[8] = true; sub_arr_var[8] = ini_read_string("SUB", "spooky_d_07", "SUB_spooky_d_07");
        sub_3d_var[9] = true; sub_arr_var[9] = ini_read_string("SUB", "spooky_d_08", "SUB_spooky_d_08");
        sub_3d_var[10] = true; sub_arr_var[10] = ini_read_string("SUB", "spooky_d_09", "SUB_spooky_d_09");
        ini_close();
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    event_inherited();
    if state_var == 7
    {
        with instance_create(0,0,fake_stam_power_obj)
        {
            player_var = player_obj;
            event_user(0);
            event_perform(ev_other,ev_room_start);
        }
    }
');