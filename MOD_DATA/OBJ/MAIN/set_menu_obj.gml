// Builtin Variables
object_set_depth(argument0,-102);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
    Type enum
        -6: Save Preset
        -5: Load Preset
        -4: Player ID
        -3: Reset
        -2: Previous menu
        -1: Apply Settings
*/
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    set_var = false;
    state_var = 0;
    player_id_var = 0;
    preset_id_var = 0;
    has_set_var = 0;
    time_var = 0;
    control_listen_var = false;

    bg_scroll_var = 0;
    do_scroll_focal_var = true;
    scroll_var = 0;
    scroll_focal_var = 0;
    scroll_rate_var = 0.2;
    scroll_min_var = 0.5;

    str_bg_color_var = make_color_rgb(57,0,91);
    str_bg_select_color_var = make_color_rgb(138,0,0);
    str_scale_var = 0.8;

    ini_open(global.lang_var);
    back_question_str_var = ini_read_string("SET","back_question","SET_back_question");
    apply_question_str_var = ini_read_string("SET","apply_question","SET_apply_question");
    reset_question_str_var = ini_read_string("SET","reset_question","SET_reset_question");
    preset_question_str_var = ini_read_string("SET","preset_question","SET_preset_question");
    yes_str_var = ini_read_string("SET_LABEL","yes","SET_LABEL_yes");
    no_str_var = ini_read_string("SET_LABEL","no","SET_LABEL_no");
    cancel_str_var = ini_read_string("SET_LABEL","cancel","SET_LABEL_cancel");

    for (local.i=0; local.i<global.set_state_len_var; local.i+=1;)
    {
        name_arr_var[local.i,0] = ini_read_string("SET","back","SET_back");
        desc_arr_var[local.i,0] = ini_read_string("SET_DESC","back","SET_DESC_back");
        id_arr_var[local.i,0] = -2;
        state_arr_var[local.i,0] = 1;
    }
    
    local.setid = state_arr_var[0,0];
    name_arr_var[0,local.setid] = ini_read_string("SET","apply","SET_apply");
    desc_arr_var[0,local.setid] = ini_read_string("SET_DESC","apply","SET_DESC_apply");
    id_arr_var[0,local.setid] = -1;
    state_arr_var[0,0] += 1; local.setid += 1;
    name_arr_var[0,local.setid] = ini_read_string("SET","reset","SET_reset");
    desc_arr_var[0,local.setid] = ini_read_string("SET_DESC","reset","SET_DESC_reset");
    id_arr_var[0,local.setid] = -3;
    state_arr_var[0,0] += 1; local.setid += 1;

    local.setid = state_arr_var[9,0];
    name_arr_var[9,local.setid] = ini_read_string("SET","player","SET_player");
    desc_arr_var[9,local.setid] = ini_read_string("SET_DESC","player","SET_DESC_player");
    id_arr_var[9,local.setid] = -4;
    state_arr_var[9,0] += 1; local.setid += 1;
    name_arr_var[9,local.setid] = ini_read_string("SET","load_preset","SET_load_preset");
    desc_arr_var[9,local.setid] = ini_read_string("SET_DESC","load_preset","SET_DESC_load_preset");
    id_arr_var[9,local.setid] = -5;
    state_arr_var[9,0] += 1; local.setid += 1;
    name_arr_var[9,local.setid] = ini_read_string("SET","save_preset","SET_save_preset");
    desc_arr_var[9,local.setid] = ini_read_string("SET_DESC","save_preset","SET_DESC_save_preset");
    id_arr_var[9,local.setid] = -5;
    state_arr_var[9,0] += 1; local.setid += 1;

    for (local.i=0; local.i<global.set_len_var; local.i+=1;)
    {
        local.stateid = set_arr[local.i,8];
        local.setid = state_arr_var[local.stateid,0];
        state_arr_var[local.stateid,0] += 1;
        
        // Strings
        if set_arr[local.i,3] // Translate
        {
            name_arr_var[local.stateid,local.setid] = ini_read_string("SET",set_arr[local.i,1],"SET_"+set_arr[local.i,1]); // Name
            desc_arr_var[local.stateid,local.setid] = ini_read_string("SET_DESC",set_arr[local.i,2],"SET_DESC_"+set_arr[local.i,2]); // Description
        }
        else
        {
            name_arr_var[local.stateid,local.setid] = set_arr[local.i,1];
            desc_arr_var[local.stateid,local.setid] = set_arr[local.i,2];
        }
        id_arr_var[local.stateid,local.setid] = local.i; // Button ID
        // Default
        if set_arr[local.i,4] != 8
        {
            if set_arr[local.i,9] // Player Specific
            {
                for (local.j=0; local.j<8; local.j+=1;)
                {
                    if set_arr[local.i,4] == 7 { value_arr_var[local.i,local.j] = global.input_key_arr[set_arr[local.i,10],local.j]; } // Input
                    else { execute_string("value_arr_var[argument0,argument1] = global."+set_arr[local.i,0]+"_var[argument1]",local.i,local.j); }
                }
            }
            else
            {
                if set_arr[local.i,4] == 7 { value_arr_var[local.i,local.j] = global.input_key_arr[set_arr[local.i,10],local.j]; } // Input
                else { execute_string("value_arr_var[argument0,0] = global."+set_arr[local.i,0]+"_var",local.i); }
            }
        }
        // Labels
        if set_arr[local.i,4] == 0 ||  set_arr[local.i,4] == 6 // Enum or Pointer
        {
            for (local.j=set_arr[local.i,5]; local.j<=set_arr[local.i,6]; local.j+=1;)
            {
                if set_label_arr[local.i,(local.j*2)+1] // Translate
                { label_arr_var[local.i,local.j] = ini_read_string("SET_LABEL",set_label_arr[local.i,local.j*2],"SET_LABEL_"+set_label_arr[local.i,local.j*2]); }
                else { label_arr_var[local.i,local.j] = set_label_arr[local.i,local.j*2]; }
            }
        }
    }
    
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    // Visual
    bg_scroll_var += global.true_delta_time_var;
    // Text Stretch
    time_var = (time_var+global.true_delta_time_var) mod 80;
    str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
    // Lerp
    if do_scroll_focal_var
    {
        scroll_focal_var = median(set_var-2,set_var+2,scroll_focal_var);
        local.state = scroll_focal_var;
    }
    else { local.state = set_var; }
    local.target_scroll = -96*median(0,state_arr_var[state_var,0]-5,local.state-2);
    local.scroll_diff = abs(local.target_scroll-scroll_var);
    local.scroll_rate = max(scroll_min_var,local.scroll_diff*scroll_rate_var)*global.true_delta_time_var;
    scroll_var += min(local.scroll_diff,local.scroll_rate)*sign(local.target_scroll-scroll_var);
    // Setting ID
    local.setid = id_arr_var[state_var,set_var];
    local.playerid = 0;
    if local.setid >= 0
    {
        if set_arr[local.setid,9] // Player Specific
        { local.playerid = player_id_var; }
    }
    else { control_listen_var = false; }
    // Control Listen
    if control_listen_var
    {
        if set_arr[local.setid,4] == 7 // Input
        {
            if keyboard_check_pressed(vk_anykey)
            {
                value_arr_var[local.setid,local.playerid] = keyboard_lastkey;
                control_listen_var = false;
                has_set_var = true;
            }
            if mouse_check_button_pressed(mb_any)
            {
                value_arr_var[local.setid,local.playerid] = -mouse_lastbutton;
                control_listen_var = false;
                has_set_var = true;
            }
            if joy_count_scr() >= global.joy_id_var[local.playerid]
            {
                for (local.i=0; local.i<=joy_buttons_scr(global.joy_id_var[local.playerid]); local.i+=1;)
                {
                    if joy_pressed_scr(global.joy_id_var[local.playerid],local.i)
                    {
                        value_arr_var[local.setid,local.playerid] = -local.i-6;
                        control_listen_var = false;
                        has_set_var = true;
                        break;
                    }
                }
            }
        }
        else { control_listen_var = false; }
    }
    else
    {
        // Scroll
        local.input = input_menu_hold_y_scr(0);
        if local.input != 0
        {
            set_var = mod_scr(set_var-local.input,state_arr_var[state_var,0]);
            fmod_snd_play_scr(select_snd);
        }
        // Confirm
        if global.input_press_arr[confirm_input_const,0]
        {
            local.snd = true;
            if local.setid >= 0
            {
                local.set = true;
                fmod_update_take_over_when_lock_scr();
                switch set_arr[local.setid,4] // Type
                {
                    case 0: case 6: // Enum / Pointer
                    {
                        value_arr_var[local.setid,local.playerid] += 1;
                        if set_arr[local.setid,7] // Wrap
                        {
                            value_arr_var[local.setid,local.playerid] = mod_scr
                            (
                                value_arr_var[local.setid,local.playerid]-set_arr[local.setid,5],
                                set_arr[local.setid,6]+1-set_arr[local.setid,5]
                            )+set_arr[local.setid,5];
                        }
                        else
                        {
                            value_arr_var[local.setid,local.playerid] = median
                            (
                                value_arr_var[local.setid,local.playerid],
                                set_arr[local.setid,5],
                                set_arr[local.setid,6]
                            );
                        }
                        break;
                    }
                    case 1: // Number
                    {
                        value_arr_var[local.setid,local.playerid] = get_integer(name_arr_var[state_var,set_var],value_arr_var[local.setid,local.playerid]);
                        break;
                    }
                    case 2: // Clamped number
                    {
                        value_arr_var[local.setid,local.playerid] = median
                        (
                            get_integer(name_arr_var[state_var,set_var],value_arr_var[local.setid,local.playerid]),
                            set_arr[local.setid,5],
                            set_arr[local.setid,6]
                        );
                        break;
                    }
                    case 3: // Max clamped number
                    {
                        value_arr_var[local.setid,local.playerid] = min
                        (
                            get_integer(name_arr_var[state_var,set_var],value_arr_var[local.setid,local.playerid]),
                            set_arr[local.setid,6]
                        );
                        break;
                    }
                    case 4: // Min clamped number
                    {
                        value_arr_var[local.setid,local.playerid] = max
                        (
                            get_integer(name_arr_var[state_var,set_var],value_arr_var[local.setid,local.playerid]),
                            set_arr[local.setid,5]
                        );
                        break;
                    }
                    case 5: // String
                    {
                        value_arr_var[local.setid,local.playerid] = get_string(name_arr_var[state_var,set_var],string(value_arr_var[local.setid,local.playerid]));
                        break;
                    }
                    case 7: // Input
                    {
                        local.set = false
                        control_listen_var = true;
                        break;
                    }
                    case 8: // Category
                    {
                        local.set = false
                        state_var = set_arr[local.setid,10];
                        event_user(2);
                        break;
                    }
                    default: { local.snd = false; local.set = false; break; }
                }
                global.last_time_var = current_time;
                fmod_update_take_over_done_scr();
                global.input_press_arr[confirm_input_const,0] = 0;
                if local.set { has_set_var = true; }
            }
            else
            {
                switch local.setid
                {
                    case -1: // Apply settings
                    {
                        if has_set_var
                        {
                            if show_message_ext(apply_question_str_var,yes_str_var,no_str_var,"") == 1 { event_user(0); }
                            global.input_press_arr[confirm_input_const,0] = 0;
                        }
                        break;
                    }
                    case -2: // Back
                    {
                        if set_state_arr[state_var,2] >= 0
                        {
                            state_var = set_state_arr[state_var,2];
                            event_user(2);
                        }
                        else
                        {
                            local.dont = false;
                            if has_set_var
                            {
                                fmod_update_take_over_when_lock_scr();
                                local.message = show_message_ext(back_question_str_var,yes_str_var,no_str_var,cancel_str_var);
                                if local.message == 0 || local.message == 3 { local.dont = true; }
                                if local.message == 1 { event_user(0); }
                                global.last_time_var = current_time;
                                fmod_update_take_over_done_scr();
                                global.input_press_arr[confirm_input_const,0] = 0;
                            }
                            if !local.dont
                            {
                                if instance_exists(menu_obj)
                                {
                                    with menu_obj
                                    {
                                        state_var = 2;
                                        event_user(0); 
                                    }
                                }
                                if instance_exists(pause_menu_obj)
                                {
                                    with pause_menu_obj
                                    {
                                        state_var = 0;
                                        delay_var = true;
                                    }
                                }
                                instance_destroy();
                            }
                        }
                        break;
                    }
                    case -3: // Reset
                    {
                        fmod_update_take_over_when_lock_scr();
                        if show_message_ext(reset_question_str_var,yes_str_var,no_str_var,"") == 1 { event_user(1); }
                        global.last_time_var = current_time;
                        fmod_update_take_over_done_scr();
                        global.input_press_arr[confirm_input_const,0] = 0;
                        break;
                    }
                    case -5: // Load Preset
                    {
                        fmod_update_take_over_when_lock_scr();
                        if show_message_ext(preset_question_str_var,yes_str_var,no_str_var,"") == 1
                        {
                            switch preset_id_var
                            {
                                case 0: { preset_var = "pc"; break; }
                                case 1: { preset_var = "xbox"; break; }
                                case 2: { preset_var = "ps"; break; }
                                case 3: { preset_var = "switch"; break; }
                                case 4: { preset_var = "snes"; break; }
                                default:
                                {
                                    preset_var = get_string("Custom preset","");
                                    break;
                                }
                            }
                            event_user(5);
                        }
                        global.last_time_var = current_time;
                        fmod_update_take_over_done_scr();
                        global.input_press_arr[confirm_input_const,0] = 0;
                        break;
                    }
                }
            }
            if local.snd { fmod_snd_play_scr(confirm_snd); }
        }
        // Back
        if input_press_arr[back_input_const,0]
        {
            local.back = true;
            if local.setid >= 0
            {
                if set_arr[local.setid,4] == 7
                {
                    value_arr_var[local.setid,local.playerid] = 0;
                    local.back = false;
                }
            }
            if local.back
            {
                if set_state_arr[state_var,2] >= 0
                {
                    state_var = set_state_arr[state_var,2];
                    event_user(2);
                    fmod_snd_play_scr(deny_snd);
                }
                else
                {
                    local.dont = false;
                    if has_set_var
                    {
                        local.message = show_message_ext(back_question_str_var,yes_str_var,no_str_var,cancel_str_var);
                        if local.message == 0 || local.message == 3 { local.dont = true; }
                        if local.message == 1 { event_user(0); }
                        global.input_press_arr[confirm_input_const,0] = 0;
                    }
                    if !local.dont
                    {
                        if instance_exists(menu_obj)
                        {
                            with menu_obj
                            {
                                state_var = 2;
                                event_user(0); 
                            }
                        }
                        if instance_exists(pause_menu_obj)
                        {
                            with pause_menu_obj
                            {
                                state_var = 0;
                                delay_var = true;
                            }
                        }
                        fmod_snd_play_scr(deny_snd);
                        instance_destroy();
                    }
                }
            }
        }
        local.input = input_menu_hold_x_scr(0);
        if local.input != 0
        {
            local.snd = true;
            if local.setid >= 0
            {
                local.set = true;
                switch set_arr[local.setid,4] // Type
                {
                    case 0: case 6: case 2: // Enums and clamped numbers
                    {
                        value_arr_var[local.setid,local.playerid] += local.input;
                        if set_arr[local.setid,7] // Wrap
                        {
                            value_arr_var[local.setid,local.playerid] = mod_scr
                            (
                                value_arr_var[local.setid,local.playerid]-set_arr[local.setid,5],
                                set_arr[local.setid,6]+1-set_arr[local.setid,5]
                            )+set_arr[local.setid,5];
                        }
                        else
                        {
                            value_arr_var[local.setid,local.playerid] = median
                            (
                                value_arr_var[local.setid,local.playerid],
                                set_arr[local.setid,5],
                                set_arr[local.setid,6]
                            );
                        }
                        break;
                    }
                    case 1: // Number
                    {
                        value_arr_var[local.setid,local.playerid] += local.input;
                        break;
                    }
                    case 3: // Max clamped number
                    {
                        value_arr_var[local.setid,local.playerid] = min(set_arr[local.setid,6],value_arr_var[local.setid,local.playerid]+local.input);
                        break;
                    }
                    case 4: // Min clamped number
                    {
                        value_arr_var[local.setid,local.playerid] = max(set_arr[local.setid,5],value_arr_var[local.setid,local.playerid]+local.input);
                        break;
                    }
                    default: { local.snd = false; local.set = false; break; }
                }
                if local.set { has_set_var = true; }
            }
            else
            {
                switch local.setid
                {
                    case -4: // Current Player
                    {
                        player_id_var = mod_scr(player_id_var+local.input,8);
                        break;
                    }
                    case -5: // Load Preset
                    {
                        preset_id_var = mod_scr(preset_id_var+local.input,6);
                        break;
                    }
                    default: { local.snd = false; break; }
                }
            }
            if local.snd { fmod_snd_play_scr(select_snd); }
        }
    }
');
// Apply Settings
object_event_add
(argument0,ev_other,ev_user0,'
    has_set_var = false;
    ini_open("settings.ini");
    for (local.i=0; local.i<global.set_len_var; local.i+=1;)
    {
        if set_arr[local.i,4] != 8 // Not category
        {
            if set_arr[local.i,9] // Player Specific
            {
                for (local.j=0; local.j<8; local.j+=1;) // Loop through players
                {
                    switch set_arr[local.i,4]
                    {
                        case 5: // String
                        {
                            execute_string("global."+set_arr[local.i,0]+"_var[argument0] = argument1;",local.j,value_arr_var[local.i,local.j]);
                            ini_write_string("PLAYER",set_arr[local.i,0]+"_"+string(local.j),value_arr_var[local.i,local.j]);
                            break;
                        }
                        case 6: // Pointer
                        {
                            execute_string("global."+set_arr[local.i,0]+"_var[argument0] = argument1;",local.j,set_pointer_arr[value_arr_var[local.i,local.j]]);
                            ini_write_real("PLAYER",set_arr[local.i,0]+"_"+string(local.j),value_arr_var[local.i,local.j]);
                            break;
                        }
                        case 7: // Input
                        {
                            global.input_key_arr[set_arr[local.i,10],local.j] = value_arr_var[local.i,local.j];
                            ini_write_real("PLAYER",set_arr[local.i,0]+"_"+string(local.j),value_arr_var[local.i,local.j]);
                            break;
                        }
                        default: // Other
                        {
                            execute_string("global."+set_arr[local.i,0]+"_var[argument0] = argument1;",local.j,value_arr_var[local.i,local.j]);
                            ini_write_real("PLAYER",set_arr[local.i,0]+"_"+string(local.j),value_arr_var[local.i,local.j]);
                            break;
                        }
                    }
                }
            }
            else // Main
            {
                switch set_arr[local.i,4]
                {
                    case 5: // String
                    {
                        execute_string("global."+set_arr[local.i,0]+"_var = argument0;",value_arr_var[local.i,0]);
                        ini_write_string("MAIN",set_arr[local.i,0],value_arr_var[local.i,0]);
                        break;
                    }
                    case 6: // Pointer
                    {
                        execute_string("global."+set_arr[local.i,0]+"_var = argument0;",set_pointer_arr[value_arr_var[local.i,0]]);
                        ini_write_real("MAIN",set_arr[local.i,0],value_arr_var[local.i,0]);
                        break;
                    }
                    case 7: // Input
                    {
                        global.input_key_arr[set_arr[local.i,10],0] = value_arr_var[local.i,0];
                        ini_write_real("MAIN",set_arr[local.i,0],value_arr_var[local.i,0]);
                        break;
                    }
                    default: // Other
                    {
                        execute_string("global."+set_arr[local.i,0]+"_var = argument0;",value_arr_var[local.i,0]);
                        ini_write_real("MAIN",set_arr[local.i,0],value_arr_var[local.i,0]);
                        break;
                    }
                }
            }
        }
    }
    ini_close();
    if window_get_fullscreen() != global.fullscreen_var
    { window_set_fullscreen(global.fullscreen_var); }
    set_synchronization(global.vsync_var);
    texture_set_interpolation(global.anti_alias_var);
    fmod_set_all_vol_scr(global.vol_var/100);
    fmod_set_group_vol_scr(snd_group_sfx_const,global.sfx_vol_var/100);
    fmod_set_group_vol_scr(snd_group_mon_const,global.mon_vol_var/100);
    fmod_set_group_vol_scr(snd_group_mus_const,global.mus_vol_var/100);
    fmod_set_group_vol_scr(snd_group_voice_const,global.voice_vol_var/100);
    if global.doppler_var { fmod_set_doppler_fps_scr(fps); }
    else { fmod_set_doppler_fps_scr(0); }
    if instance_exists(pause_menu_obj)
    {
        if !global.pause_theme_var
        { fmod_inst_stop_scr(pause_menu_obj.mus_snd_var); }
    }
    // Reset button inputs
    for (local.i=0; local.i<global.input_len_var; local.i+=1)
    {
        for (local.j=0; local.j<8; local.j+=1;)
        {
            global.input_arr[local.i,local.j] = false;
            global.input_prev_arr[local.i,local.j] = 0;
            global.input_press_arr[local.i,local.j] = 0;
        }
    }
');
// Reset Settings
object_event_add
(argument0,ev_other,ev_user1,'
    for (local.i=0; local.i<global.set_len_var; local.i+=1;)
    {
        if set_arr[local.i,4] != 8
        {
            if set_arr[local.i,9]
            {
                for (local.j=0; local.j<8; local.j+=1;)
                { value_arr_var[local.i,local.j] = set_default_arr[local.i,local.j]; }
            }
            else { value_arr_var[local.i,0] = set_default_arr[local.i,0]; }
        }
    }
    event_user(0);
');
// Change State
object_event_add
(argument0,ev_other,ev_user2,'
    time_var = 0;
    set_var = 0;
    scroll_var = 0;
    scroll_focal_var = set_var;
');
// Load Control Preset
object_event_add
(argument0,ev_other,ev_user5,'
    if file_exists(working_directory+"\control_preset_"+preset_var+".ini")
    {
        ini_open("control_preset_"+preset_var+".ini");
        for (local.i=0; local.i<global.set_len_var; local.i+=1;)
        {
            if !set_arr[local.i,9] || set_arr[local.i,4] == 8 { continue; } // If not player specific or category, skip.
            if !ini_key_exists("PLAYER",set_arr[local.i,0]) { continue; } // If key doesnt exist, skip.
            if set_arr[local.i,4] == 5 { value_arr_var[local.i,player_id_var] = ini_read_string("PLAYER",set_arr[local.i,0],""); }
            else { value_arr_var[local.i,player_id_var] = ini_read_real("PLAYER",set_arr[local.i,0],0); }
        }
        ini_close();
        has_set_var = true;
    }
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);

    draw_bg_tiled_stretch_scr(settings_bg,bg_scroll_var,0,512,0,2);
    
    draw_set_halign(fa_right);
    draw_str_shadow_scr
    (
        "SETTINGS",
        -20,20,0.95,0.95,0.125,fa_right,fa_top,
        -4,4,str_bg_color_var,c_yellow,2,0
    );
    draw_set_halign(fa_left);

    for (local.i=0; local.i<state_arr_var[state_var,0]; local.i+=1)
    {
        if set_var != local.i
        {
            draw_str_shadow_scr
            (
                name_arr_var[state_var,local.i],
                96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
            
            local.str = 0;
            local.setid = id_arr_var[state_var,local.i];
            if local.setid >= 0
            {
                if set_arr[local.setid,4] != 8
                {
                    
                    if set_arr[local.setid,9] { local.playerid = player_id_var; }
                    else { local.playerid = 0; }
                    switch set_arr[local.setid,4]
                    {
                        // Enum & Pointer
                        case 0: case 6: { local.str = label_arr_var[local.setid,value_arr_var[local.setid,local.playerid]]; break; }
                        // Input
                        case 7: { local.str = key_to_str_scr(value_arr_var[local.setid,local.playerid]); break; }
                        // Everything else
                        default: { local.str = string(value_arr_var[local.setid,local.playerid]); }
                    }
                }
            }
            else
            {
                switch local.setid
                {
                    // Player ID
                    case -4: { local.str = string(player_id_var+1); break; }
                    // Load Preset (temp)
                    case -5:
                    {
                        switch preset_id_var
                        {
                            case 0: { local.str = "PC"; break; }
                            case 1: { local.str = "XBOX"; break; }
                            case 2: { local.str = "PLAYSTATION"; break; }
                            case 3: { local.str = "SWITCH"; break; }
                            case 4: { local.str = "SNES"; break; }
                            default: { local.str = "CUSTOM"; break; }
                        }
                        break;
                    }
                }
                
            }
            if is_string(local.str)
            {
                draw_set_halign(fa_center);
                draw_str_shadow_scr
                (
                    local.str,
                    0,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_center,fa_top,
                    -4,4,str_bg_color_var,c_yellow,2,0
                );
                draw_set_halign(fa_left);
            }
        }
    }
    local.ytmp = 144+(96*set_var)+scroll_var;
    draw_spr_stretch_scr(select_spr,0,96,local.ytmp,132,0,fa_left,fa_top);
    draw_str_select_scr
    (
        name_arr_var[state_var,set_var],
        96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
        -4,4,str_bg_select_color_var,c_white,2,0,0.75
    );
    draw_set_halign(fa_right);
    local.margin = 832;
    draw_str_ext_shadow_scr
    (
        desc_arr_var[state_var,set_var],
        -20,144,0.4,0.4,0.125,fa_right,fa_top,-1,local.margin,
        -4,4,str_bg_color_var,c_yellow,2,0
    );
    draw_set_halign(fa_left);

    local.str = 0;
    local.setid = id_arr_var[state_var,set_var];
    if local.setid >= 0
    {
        if set_arr[local.setid,4] != 8
        {
            if set_arr[local.setid,9] { local.playerid = player_id_var; }
            else { local.playerid = 0; }
            switch set_arr[local.setid,4]
            {
                // Enum & Pointer
                case 0: case 6: { local.str = label_arr_var[local.setid,value_arr_var[local.setid,local.playerid]]; break; }
                // Input
                case 7: { local.str = key_to_str_scr(value_arr_var[local.setid,local.playerid]); break; }
                // Everything else
                default: { local.str = string(value_arr_var[local.setid,local.playerid]); }
            }
        }
    }
    else
    {
        switch local.setid
        {
            // Player ID
            case -4: { local.str = string(player_id_var+1); break; }
            // Load Preset (temp)
            case -5:
            {
                switch preset_id_var
                {
                    case 0: { local.str = "PC"; break; }
                    case 1: { local.str = "XBOX"; break; }
                    case 2: { local.str = "PLAYSTATION"; break; }
                    case 3: { local.str = "SWITCH"; break; }
                    case 4: { local.str = "SNES"; break; }
                    default: { local.str = "CUSTOM"; break; }
                }
                break;
            }
        }
        
    }
    if is_string(local.str)
    {
        draw_set_halign(fa_center);
        draw_str_shadow_scr
        (
            local.str,
            0,144+(96*set_var)+scroll_var,0.75,0.75,0.125,fa_center,fa_top,
            -4,4,str_bg_color_var,c_yellow,2,0
        );
        draw_set_halign(fa_left);
    }
');