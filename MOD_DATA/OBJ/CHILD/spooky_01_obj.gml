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
    z = 68;
    snd_dist_min_var = -1;
    snd_dist_max_var = -1;
    snd_var = snd_add_scr(spooky_01_snd_path,false,snd_group_voice_const,1,snd_dist_min_var,snd_dist_max_var);
    // States
        state_len_var = 11;
        snd_state_var = 1;
        state_alarm_var[0] = 120;
        state_alarm_var[1] = 167;
        state_alarm_var[2] = 310;
        state_alarm_var[3] = 161;
        state_alarm_var[4] = 108;
        state_alarm_var[5] = 127;
        state_alarm_var[6] = 137;
        state_alarm_var[7] = 71;
        state_alarm_var[8] = 143;
        state_alarm_var[9] = 106;
        state_alarm_var[10] = 334;
    // Move
        move_alarm_var[0] = 160; // Becomes state alarm if -1
        move_pos_var[0,0] = x; // X
        move_pos_var[0,1] = y; // Y
        move_pos_var[0,2] = 36; // Z
        move_alarm_var[1] = noone;
        move_alarm_var[2] = 60;
        move_pos_var[2,0] = x-60; // X
        move_pos_var[2,1] = y; // Y
        move_pos_var[2,2] = 36; // Z
        move_alarm_var[3] = noone;
        move_alarm_var[4] = noone;
        move_alarm_var[5] = noone;
        move_alarm_var[6] = noone;
        move_alarm_var[7] = noone;
        move_alarm_var[8] = noone;
        move_alarm_var[9] = noone;
        move_alarm_var[10] = 160;
        move_pos_var[10,0] = x-60; // X
        move_pos_var[10,1] = y; // Y
        move_pos_var[10,2] = 68; // Z
    // Subtitles
        sub_alarm_var[0] = noone; sub_3d_var[0] = false; sub_arr_var[0] = "";
        for (local.i=1; local.i<state_len_var; local.i+=1;)
        { sub_alarm_var[local.i] = -1; }
        ini_open("lang_"+global.lang_var+".ini");
        sub_3d_var[1] = true; sub_arr_var[1] = ini_read_string("SUB", "spooky_a_01", "SUB_spooky_a_01");
        sub_3d_var[2] = false; sub_arr_var[2] = ini_read_string("SUB", "spooky_a_02", "SUB_spooky_a_01");
        sub_3d_var[3] = true; sub_arr_var[3] = ini_read_string("SUB", "spooky_a_03", "SUB_spooky_a_01");
        sub_3d_var[4] = true; sub_arr_var[4] = ini_read_string("SUB", "spooky_a_04", "SUB_spooky_a_01");
        sub_3d_var[5] = true; sub_arr_var[5] = ini_read_string("SUB", "spooky_a_05", "SUB_spooky_a_01");
        sub_3d_var[6] = true; sub_arr_var[6] = ini_read_string("SUB", "spooky_a_06", "SUB_spooky_a_01");
        sub_3d_var[7] = true; sub_arr_var[7] = ini_read_string("SUB", "spooky_a_07", "SUB_spooky_a_01");
        sub_3d_var[8] = true; sub_arr_var[8] = ini_read_string("SUB", "spooky_a_08", "SUB_spooky_a_01");
        sub_3d_var[9] = true; sub_arr_var[9] = ini_read_string("SUB", "spooky_a_09", "SUB_spooky_a_01");
        sub_3d_var[10] = false; sub_arr_var[10] = sub_arr_var[2];
        ini_close();
');