// Builtin Variables
object_set_depth(argument0,101);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    alarm_len_var = 1;
    alarm_ini_scr();
    window_x_var = window_get_x();
    window_y_var = window_get_y();
    window_w_var = window_get_width();
    window_h_var = window_get_height();
    event_perform(ev_other,ev_room_start);
');
// Step Begin Event
object_event_add(argument0,ev_step,ev_step_begin,'
    joy_update_scr();
    // Get inputs
    // I know this looks bad, but keyboard_check_pressed doesnt persist between rooms
    for (local.j=0; local.j<global.player_len_var; local.j+=1;)
    {
        for (local.i=0; local.i<global.input_len_var; local.i+=1;)
        {
            if global.input_key_arr[local.i,local.j] != 0
            {
                // Previous
                global.input_prev_arr[local.i,local.j] = global.input_arr[local.i,local.j];
                // Keyboard
                if global.input_key_arr[local.i,local.j] >= 1 
                {
                    if keyboard_check_pressed(global.input_key_arr[local.i,local.j]) { global.input_arr[local.i,local.j] = true; }
                    if keyboard_check_released(global.input_key_arr[local.i,local.j]) { global.input_arr[local.i,local.j] = false; }
                }
                // Mouse
                else if global.input_key_arr[local.i,local.j] >= -5
                {
                    local.button = abs(global.input_key_arr[local.i,local.j]);
                    if mouse_check_button_pressed(local.button) { global.input_arr[local.i,local.j] = true; }
                    if mouse_check_button_released(local.button) { global.input_arr[local.i,local.j] = false; }
                }
                // Controller
                else
                {
                    local.button = abs(global.input_key_arr[local.i,local.j])-6;
                    global.input_arr[local.i,local.j] = joy_button_scr(global.joy_id_var[local.j],local.button);
                }
                // Press
                global.input_press_arr[local.i,local.j] = global.input_arr[local.i,local.j]-global.input_prev_arr[local.i,local.j];
            }
        }
        if global.input_press_arr[pause_input_const,local.j] == 1 && !instance_exists(pause_menu_obj) && global.draw_3d_var && global.can_pause_var
        {
            with instance_create(0,0,pause_menu_obj)
            {
                cam_id_var = local.j;
                player_id_var = local.j;
                event_user(1);
            }
        }
    }
');
// Step event
object_event_add
(argument0,ev_step,ev_step_begin,'
    // Speed!
    if global.draw_3d_var
    {
        if global.input_press_arr[ff_input_const,0] == 1 { global.game_spd_var = min(3,global.game_spd_var+0.25); fmod_group_set_pitch_scr(0,global.game_spd_var); }
        if global.input_press_arr[slow_input_const,0] == 1 { global.game_spd_var = max(1,global.game_spd_var-0.25); fmod_group_set_pitch_scr(0,global.game_spd_var); }
    }
    else if global.game_spd_var != 1 { global.game_spd_var = 1; fmod_group_set_pitch_scr(0,global.game_spd_var); }
    // Delta Time
    // Goes by frames rather than seconds (at 60 fps)
    global.true_delta_time_var = (current_time-global.last_time_var)*milli_frame_rate_const;
    global.delta_time_var = global.true_delta_time_var*global.game_spd_var;
    global.last_time_var = current_time;
    // Framerate
    global.draw_time_var += global.true_delta_time_var;
    if !global.autodraw_var
    {
        local.rate = fps/global.fps_var;
        frame_var += 1;
        if frame_var >= local.rate
        {
            screen_redraw();
            if local.rate { frame_var = frame_var mod local.rate; }
            else {frame_var = 0; }
        }
    }
    // Check for debug
    if global.input_press_arr[debug_input_const,0] == 1
    {
        if !global.debug_unlock_var
        {
            local.pass = string_lower(string_letters(get_string("Password Please","")));
            if local.pass == "birdbonanza" || local.pass == "yoshicraft" || local.pass == "spooklass" || local.pass == "everlastingmaya"
            || local.pass == "bird" || local.pass == "yoshi" || local.pass == "lass" || local.pass == "maya"
            || local.pass == "kira" || local.pass == "lag" || local.pass == "poi" || local.pass == "open"
            { global.debug_unlock_var = true; }
            else { show_error(string_repeat("3",3333),true); exit; }
            global.last_time_var = current_time;
            display_mouse_set(display_get_width()/2,display_get_height()/2);
            global.input_press_arr[debug_input_const,0] = 0;
        }
        global.debug_var = !global.debug_var;
    }
    // Debug commands
    if global.debug_var && (keyboard_check_pressed(192) || (keyboard_lastkey >= 48 && keyboard_lastkey <= 57)) // Grave
    {
        fmod_update_take_over_when_lock_scr();
        if keyboard_lastkey >= 48 && keyboard_lastkey <= 57
        {
            local.question = mod_scr(keyboard_lastkey-49,10)+1;
            if keyboard_check(vk_lshift) { local.question += 10; }
        }
        else {local.question = show_menu("Back|Restart Room|Next Room|Previous Room|Go To Room|Go To Menu Room|Create Instance|Destroy Instance|Set Tex Set|Set Zone|Set Count|Set LV|Set Room|Toggle Invincibility|Toggle Noclip|Toggle Flight|Toggle Monster Spawn|Revive|Hide Debug|Hide Hud|Toggle X-ray|Save|Execute Code",0);}
        switch(local.question)
        {
            case 1: { room_restart(); break; }
            case 2:
            {
                if room_exists(room+1)
                { rm_goto_scr(room+1); }
                break;
            }
            case 3:
            {
                if room != 1 && room_exists(room-1)
                { rm_goto_scr(room-1); }
                break;
            }
            case 4:
            {
                local.rm = get_string("Go To Room","");
                if local.rm != ""
                {
                    execute_string
                    ("
                        if room_exists("+local.rm+") && "+local.rm+" != 0
                        { rm_goto_scr("+local.rm+"); }
                    ");
                }
                break;
            }
            case 5:
            {
                local.rm = get_string("Go To Menu Room","");
                if local.rm != ""
                {
                    global.menu_player_var = 0;
                    execute_string
                    ("
                        if room_exists("+local.rm+") && "+local.rm+" != 0
                        { rm_goto_menu_scr("+local.rm+",true); }
                    ");
                }
                break;
            }
            case 6:
            {
                local.instance = get_string("Create Instance","");
                if local.instance != ""
                {
                    execute_string
                    ("
                        if object_exists("+local.instance+") && "+local.instance+" != 0 
                        { instance_create(0,0,"+local.instance+"); }
                    ");
                }
                break;
            }
            case 7:
            {
                local.instance = get_string("Destroy Instance","");
                if local.instance != ""
                {
                    execute_string
                    ("
                        if object_exists("+local.instance+") && "+local.instance+" != 0 
                        {
                            with "+local.instance+"
                            { instance_destroy(); }
                        }
                    ");
                }
                break;
            }
            case 8:
            {
                local.tex = get_integer("Tex set",global.tex_var);
                tex_scr(local.tex);
                break;
            }
            case 9:
            {
                local.zone = get_integer("Zone",global.zone_num_var);
                zone_scr(local.zone,true);
                break;
            }
            case 10: { global.count_var = get_integer("Set Count", global.count_var); break; }
            case 12: { global.rm_count_var = get_integer("Set Room Count", global.rm_count_var); break; }
            case 13: { with player_obj { invuln_var = !invuln_var; } break; }
            case 14: { with player_obj { do_coll_var = !do_coll_var; } break; }
            case 15:
            {
                with player_obj
                {
                    if grav_var > 0 { grav_var = 0; }
                    else { grav_var = grav_const; }
                } 
                break; 
            }
            case 16: { global.no_mon_var = !global.no_mon_var; break; }
            case 17:
            {
                with (player_obj)
                {
                    if dead_var
                    {
                        dead_var = false;
                        do_coll_var = true;
                        grav_var = grav_const;
                        hp_var = hp_max_var;
                        possess_var = false;
                    }
                }
                with mon_par_obj { possess_var = false; }
                break;
            }
            case 18: { global.hide_debug_var = !global.hide_debug_var; break; }
            case 19: { global.hide_hud_var = !global.hide_hud_var; break; }
            case 20: { global.xray_var = !global.xray_var; break; }
            case 21:
			{
				save_game_scr();
				break;
			}
            case 22:
            {
                local.code = get_string("Execute Code","");
                if local.code != ""
                { execute_string(local.code); }
                break;
            }
        }
        global.last_time_var = current_time;
        fmod_update_take_over_done_scr();
        display_mouse_set(display_get_width()/2,display_get_height()/2);
    }
');
// Step End Event
object_event_add(argument0,ev_step,ev_step_end,'
    update_alarm_scr(global.true_delta_time_var);
    // Update FMOD!
    //fmod_set_doppler_fps_scr(fps);
    fmod_update_scr();
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    // Reset Drawing
    draw_set_color(c_white);
    draw_set_alpha(1);
    d3d_set_lighting(false);
    d3d_set_culling(false);
    if global.draw_3d_var
    { d3d_set_hidden(true); }
    else { d3d_set_hidden(false); }
    // Caption
    if update_fps_var
    {
        if global.autodraw_var { global.fps_curr_var = fps; }
        else
        {
            if global.draw_time_var != 0 { global.fps_curr_var = floor(global.fps_var/global.draw_time_var); }
            // else { global.fps_curr_var = 0; } // I still dont know what causes this
        }
        if global.fps_update_var > 0 { update_fps_var = false; }
    }
    local.fps_str = " | FPS: "+string(global.fps_curr_var);
    room_caption = "Spookys Jump Scare Mansion - Project Recode | Room: "+string(global.rm_count_var)+" ("+global.rm_name_var+") | TPS: "+string(fps)+local.fps_str;
    global.draw_time_var = 0;
')
// Room End Eventt
object_event_add
(argument0,ev_other,ev_room_end,'
    event_inherited();
    rm_reset_scr();
    window_x_var = window_get_x();
    window_y_var = window_get_y();
    window_w_var = window_get_width();
    window_h_var = window_get_height();
    io_handle();
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    // Fix Delta
    global.true_delta_time_var = 0;
    global.delta_time_var = 0;
    global.last_time_var = current_time;
    // FPS
    room_speed = global.tps_var;
    global.autodraw_var = global.fps_var >= global.tps_var || global.vsync_var
    set_automatic_draw(global.autodraw_var);
    // Update
    if global.fps_update_var > 0 { set_alarm_scr(0,global.fps_update_var); }
    update_fps_var = true;
    // Create Collisions
    rm_to_coll_scr();
    // Resolution
    if window_x_var != window_get_x() || window_y_var != window_get_y()
    || window_w_var != window_get_width() || window_h_var != window_get_height()
    { window_set_rectangle(window_x_var,window_y_var,window_w_var,window_h_var); }
    // Window Color
    if !instance_exists(fog_par_obj) { window_set_color(make_color_rgb(30,0,50)); }
');
// Update FPS
object_event_add
(argument0,ev_alarm,0,'
    update_fps_var = true;
    set_alarm_scr(0,global.fps_update_var);
');
// Game end
object_event_add
(argument0,ev_other,ev_game_end,'
    joy_free_scr();
    p3dc_free_scr();
    fmod_free_scr();
    fmod_unload_scr();
    sf_free_scr();
');