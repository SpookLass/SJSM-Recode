// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    image_alpha = 0.7;
    event_perform(ev_create,1);
    event_perform(ev_create,2);
    event_inherited();
    event_perform(ev_create,3);
');
// Create 1 event (example)
object_event_add
(argument0,ev_create,1,'
    // Array stuffs (mostly example)
        snd_state_var = -1; // -1 means on start
        state_alarm_var[0] = 60;
        move_alarm_var[0] = noone; // Becomes state alarm if -1
        move_pos_var[0,0] = 0; // X
        move_pos_var[0,1] = 0; // Y
        move_pos_var[0,2] = 0; // Z
        sub_alarm_var[0] = noone; // Becomes state alarm if -1
        sub_arr_var[0] = "";
');
// Create 2 event (defaults)
object_event_add
(argument0,ev_create,2,'
        if !variable_local_exists("halloween_var") { halloween_var = (current_month == 10 || global.halloween_var); }
    // Basic
        if !variable_local_exists("off_var") && halloween_var { off_var = -2.5; } // 20
        if !variable_local_exists("solid_var") { solid_var = false; }
        if !variable_local_exists("type_var") { type_var = 5; } // Billboard
        if !variable_local_exists("w_var")
        {
            if halloween_var { w_var = 13.5; } // 18
            else { w_var = 11.875; } // 16
        }
        if !variable_local_exists("h_var") { h_var = 15; } // 20
        if !variable_local_exists("flesh_var") { flesh_var = false; }
        if !variable_local_exists("color_var") { color_var = 2; }
        if !variable_local_exists("step_var") { step_var = 8; }
    // State
        if !variable_local_exists("state_len_var")
        {
            state_len_var = 1;
            state_alarm_var[0] = 60; // I guess
        }
    // Move
        if !variable_local_exists("move_alarm_var")
        {
            for (local.i=0; local.i<state_len_var; local.i+=1;)
            {
                move_alarm_var[local.i] = noone;
                move_pos_var[local.i,0] = 0;
                move_pos_var[local.i,1] = 0;
                move_pos_var[local.i,2] = 0;
            }
        }
        x_prev_var = x;
        y_prev_var = y;
        z_prev_var = z;
        x_next_var = x;
        y_next_var = y;
        z_next_var = z;
    // Sound
        load_var = variable_local_exists("snd_var");
        if !load_var { snd_var = noone; }
        if !variable_local_exists("snd_h_var") { snd_h_var = 14.375; }
        if !variable_local_exists("snd_state_var") { snd_state_var = -1; } // On start
        if !variable_local_exists("snd_dist_min_var") { snd_dist_min_var = -1; }
        if !variable_local_exists("snd_dist_max_var") { snd_dist_max_var = -1; }
        // Subtitles
            if !variable_local_exists("sub_arr_var")
            {
                for (local.i=0; local.i<state_len_var; local.i+=1;)
                {
                    sub_alarm_var[local.i] = noone;
                    sub_arr_var[local.i] = "";
                    sub_3d_var[local.i] = false;
                }
            }
            sub_var = noone;
    // Draw
        if !variable_local_exists("spr_var")
        {
            if halloween_var { spr_var = spooky_halloween_spr; }
            else { spr_var = spooky_spr; }
        }
        if !variable_local_exists("spr_spd_var") { spr_spd_var = 0.25; }
        spr_id_var = 0;
        store_tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
');
// Create 3 event (startup)
object_event_add
(argument0,ev_create,3,'
    // Alarm
    alarm_len_var = 2;
    alarm_ini_scr();
    state_var = 0;
    if snd_state_var < 0 && snd_var != noone
    {
        if fmod_snd_is_3d_scr(snd_var) { inst_var = fmod_snd_3d_play_scr(snd_var,x,y,z); }
        else { inst_var = fmod_snd_play_scr(snd_var); }
    }
    set_alarm_scr(1,state_alarm_var[state_var]);
    if move_alarm_var[state_var] != noone
    {
        x_next_var = move_pos_var[state_var,0]
        y_next_var = move_pos_var[state_var,1]
        z_next_var = move_pos_var[state_var,2]
        if move_alarm_var[state_var] <= 0 { set_alarm_scr(0,state_alarm_var[state_var]); }
        else { set_alarm_scr(0,move_alarm_var[state_var]); }
    }
    if sub_alarm_var[state_var] != noone
    {
        local.str = sub_arr_var[state_var];
        if sub_alarm_var[state_var] <= 0 { local.len = state_alarm_var[state_var]; }
        else { local.len = sub_alarm_var[state_var]; }
        sub_var = instance_create(x,y,sub_par_obj);
        with sub_var
        {
            z = other.z+other.snd_h_var;
            dist_min_var = other.snd_dist_min_var;
            dist_max_var = other.snd_dist_max_var;
            str_3d_var = other.sub_3d_var[other.state_var]
            str_var = local.str;
            set_alarm_scr(0,local.len);
            offset_var = 800;
        }
    }
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    x = x_next_var;
    y = y_next_var;
    z = z_next_var;
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    state_var += 1;
    if state_var >= state_len_var { instance_destroy(); exit; }
    if snd_state_var == state_var
    {
        if fmod_snd_is_3d_scr(snd_var) { inst_var = fmod_snd_3d_play_scr(snd_var,x,y,z); }
        else { inst_var = fmod_snd_play_scr(snd_var); }
    }
    set_alarm_scr(1,state_alarm_var[state_var]);
    if move_alarm_var[state_var] != noone
    {
        x_prev_var = x;
        y_prev_var = y;
        z_prev_var = z;
        x_next_var = move_pos_var[state_var,0];
        y_next_var = move_pos_var[state_var,1];
        z_next_var = move_pos_var[state_var,2];
        if move_alarm_var[state_var] <= 0 { set_alarm_scr(1,state_alarm_var[state_var]); }
        else { set_alarm_scr(0,move_alarm_var[state_var]); }
    }
    if sub_alarm_var[state_var] != noone
    {
        local.str = sub_arr_var[state_var];
        if sub_alarm_var[state_var] <= 0 { local.len = state_alarm_var[state_var]; }
        else { local.len = sub_alarm_var[state_var]; }
        sub_var = instance_create(x,y,sub_par_obj);
        with sub_var
        {
            z = other.z+other.snd_h_var;
            dist_min_var = other.snd_dist_min_var;
            dist_max_var = other.snd_dist_max_var;
            str_3d_var = other.sub_3d_var[other.state_var]
            str_var = local.str;
            set_alarm_scr(0,local.len);
            offset_var = 800;
        }
    }
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Room end event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// Delete background
object_event_add
(argument0,ev_other,ev_user0,'
    if load_var
    {
        if snd_var != noone { fmod_snd_free_scr(snd_var); }
        load_var = false;
    }
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if spr_spd_var != 0 && spr_var != noone
    {
        if true_time_var { local.dt = global.true_delta_time_var; }
        else { local.dt = global.delta_time_var; }
        spr_id_var = mod_scr(spr_id_var+(spr_spd_var*local.dt),sprite_get_number(spr_var));
        tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    }
    if alarm_arr[0,1] > 0
    {
        local.per = alarm_arr[0,0]/alarm_arr[0,1];
        x = lerp_scr(x_next_var,x_prev_var,local.per);
        y = lerp_scr(y_next_var,y_prev_var,local.per);
        z = lerp_scr(z_next_var,z_prev_var,local.per);
    }
');