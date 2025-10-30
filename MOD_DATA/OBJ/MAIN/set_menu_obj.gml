// Builtin Variables
object_set_depth(argument0,99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
    Type enum
        -2: Previous menu
        -1: Apply Settings
        0: Enum (also boolean)
        1: Number
        2: Clamped number
        3: Min clamped number
        4: Max clamped number
        5: String
*/
// Create Event
object_event_add
(argument0,ev_create,0,'
    set_var = false;

    scroll_var = 0;
    scroll_rate_var = 0.2;
    scroll_min_var = 0.5;

    str_bg_color_var = make_color_rgb(57,0,91);
    str_bg_select_color_var = make_color_rgb(138,0,0);
    str_scale_var = 0.8;

    button_len_var = 37;

    ini_open(global.lang_var);

    button_arr[0,0] = global.fov_var;
    button_arr[0,1] = ini_read_string("SETTINGS","fov","SETTINGS_fov"); // Label
    button_arr[0,2] = "Field of view. (vertical)" // Description
    button_arr[0,3] = 2; // Type: Clamped Number
    button_arr[0,4] = false; // Wrap value
    button_arr[0,5] = fov_const; // Default value
    button_arr[0,6] = 1; // Minimum Value
    button_arr[0,7] = 179; // Maximum Value
    button_arr[0,8] = "fov"; // Global variable to modify

    button_arr[1,0] = global.fps_var;
    button_arr[1,1] = ini_read_string("SETTINGS","fps","SETTINGS_fps");; // Label
    button_arr[1,2] = "How often the game draws to the screen." // Description
    button_arr[1,3] = 3; // Type: Min clamped Number
    button_arr[1,4] = false; // Wrap value
    button_arr[1,5] = fps_const; // Default value
    button_arr[1,6] = 1; // Minimum Value
    button_arr[1,8] = "fps"; // Global variable to modify

    button_arr[2,0] = global.tps_var;
    button_arr[2,1] = ini_read_string("SETTINGS","tps","SETTINGS_tps");; // Label
    button_arr[2,2] = "How often the game updates." // Description
    button_arr[2,3] = 3; // Type: Min clamped Number
    button_arr[2,4] = false; // Wrap value
    button_arr[2,5] = tps_const; // Default value
    button_arr[2,6] = 1; // Minimum Value
    button_arr[2,8] = "tps"; // Global variable to modify

    button_arr[3,0] = global.sens_var;
    button_arr[3,1] = ini_read_string("SETTINGS","sens","SETTINGS_sens"); // Label
    button_arr[3,2] = "Mouse sensitivity" // Description
    button_arr[3,3] = 3; // Type: Min clamped Number
    button_arr[3,4] = false; // Wrap value
    button_arr[3,5] = sens_const; // Default value
    button_arr[3,6] = 1; // Minimum Value
    button_arr[3,8] = "sens"; // Global variable to modify

    button_arr[4,0] = global.vol_var;
    button_arr[4,1] = ini_read_string("SETTINGS","vol","SETTINGS_vol"); // Label
    button_arr[4,2] = "Master volume." // Description
    button_arr[4,3] = 2; // Type: Clamped Number
    button_arr[4,4] = false; // Wrap value
    button_arr[4,5] = vol_const; // Default value
    button_arr[4,6] = 0; // Minimum Value
    button_arr[4,7] = 100; // Maximum Value
    button_arr[4,8] = "vol"; // Global variable to modify

    button_arr[5,0] = global.reduce_flash_var;
    button_arr[5,1] = ini_read_string("SETTINGS","reduce_flash","SETTINGS_reduce_flash"); // Label
    button_arr[5,2] = "Reduce flashing lights." // Description
    button_arr[5,3] = 0; // Type: Enum
    button_arr[5,4] = true; // Wrap value
    button_arr[5,5] = reduce_flash_const; // Default value
    button_arr[5,6] = false; // Minimum Value
    button_arr[5,7] = true; // Maximum Value
    button_arr[5,8] = "reduce_flash"; // Global variable to modify
    button_arr[5,9] = "OFF"; // Text for each option
    button_arr[5,10] = "ON";

    button_arr[6,0] = global.crouch_toggle_var;
    button_arr[6,1] = ini_read_string("SETTINGS","crouch_toggle","SETTINGS_crouch_toggle"); // Label
    button_arr[6,2] = "Whether crouch is toggled or held." // Description
    button_arr[6,3] = 0; // Type: Enum
    button_arr[6,4] = true; // Wrap value
    button_arr[6,5] = crouch_toggle_const; // Default value
    button_arr[6,6] = false; // Minimum Value
    button_arr[6,7] = true; // Maximum Value
    button_arr[6,8] = "crouch_toggle"; // Global variable to modify
    button_arr[6,9] = "OFF"; // Text for each option
    button_arr[6,10] = "ON";

    button_arr[7,0] = global.max_part_var;
    button_arr[7,1] = ini_read_string("SETTINGS","max_part","max_part"); // Label
    button_arr[7,2] = "Maximum number of particles to draw." // Description
    button_arr[7,3] = 3; // Type: Min clamped Number
    button_arr[7,4] = false; // Wrap value
    button_arr[7,5] = max_part_const; // Default value
    button_arr[7,6] = 0; // Minimum Value
    button_arr[7,8] = "max_part"; // Global variable to modify

    button_arr[8,0] = global.vsync_var;
    button_arr[8,1] = ini_read_string("SETTINGS","vsync","SETTINGS_vsync"); // Label
    button_arr[8,2] = "Vertical sync to reduce screen tearing." // Description
    button_arr[8,3] = 0; // Type: Enum
    button_arr[8,4] = true; // Wrap value
    button_arr[8,5] = vsync_const; // Default value
    button_arr[8,6] = false; // Minimum Value
    button_arr[8,7] = true; // Maximum Value
    button_arr[8,8] = "vsync"; // Global variable to modify
    button_arr[8,9] = "OFF"; // Text for each option
    button_arr[8,10] = "ON";

    button_arr[9,0] = global.anti_alias_var;
    button_arr[9,1] = ini_read_string("SETTINGS","anti_alias","SETTINGS_anti_alias"); // Label
    button_arr[9,2] = "Blur textures." // Description
    button_arr[9,3] = 0; // Type: Enum
    button_arr[9,4] = true; // Wrap value
    button_arr[9,5] = anti_alias_const; // Default value
    button_arr[9,6] = false; // Minimum Value
    button_arr[9,7] = true; // Maximum Value
    button_arr[9,8] = "anti_alias"; // Global variable to modify
    button_arr[9,9] = "OFF"; // Text for each option
    button_arr[9,10] = "ON";

    button_arr[10,0] = global.sub_var;
    button_arr[10,1] = ini_read_string("SETTINGS","sub","SETTINGS_sub"); // Label
    button_arr[10,2] = "Whether NPCs should have subtitles." // Description
    button_arr[10,3] = 0; // Type: Enum
    button_arr[10,4] = true; // Wrap value
    button_arr[10,5] = sub_const; // Default value
    button_arr[10,6] = false; // Minimum Value
    button_arr[10,7] = 2; // Maximum Value
    button_arr[10,8] = "sub"; // Global variable to modify
    button_arr[10,9] = "OFF"; // Text for each option
    button_arr[10,10] = "VOICE";
    button_arr[10,11] = "ALL";

    button_arr[11,0] = global.fullscreen_var;
    button_arr[11,1] = ini_read_string("SETTINGS","fullscreen","SETTINGS_fullscreen"); // Label
    button_arr[11,2] = "Play in full screen." // Description
    button_arr[11,3] = 0; // Type: Enum
    button_arr[11,4] = true; // Wrap value
    button_arr[11,5] = fullscreen_const; // Default value
    button_arr[11,6] = false; // Minimum Value
    button_arr[11,7] = true; // Maximum Value
    button_arr[11,8] = "fullscreen"; // Global variable to modify
    button_arr[11,9] = "OFF"; // Text for each option
    button_arr[11,10] = "ON";

    button_arr[12,0] = global.color_var;
    button_arr[12,1] = ini_read_string("SETTINGS","color","SETTINGS_color"); // Label
    button_arr[12,2] = "How to color special rooms." // Description
    button_arr[12,3] = 0; // Type: Enum
    button_arr[12,4] = true; // Wrap value
    button_arr[12,5] = color_const; // Default value
    button_arr[12,6] = false; // Minimum Value
    button_arr[12,7] = 2; // Maximum Value
    button_arr[12,8] = "color"; // Global variable to modify
    button_arr[12,9] = "OBJECTS"; // Text for each option
    button_arr[12,10] = "GEOMETRY";
    button_arr[12,11] = "SCREEN";

    button_arr[13,0] = global.coll_prec_var;
    button_arr[13,1] = ini_read_string("SETTINGS","coll_prec","SETTINGS_coll_prec"); // Label
    button_arr[13,2] = "Whether collisions are precise. May save processing time." // Description
    button_arr[13,3] = 0; // Type: Enum
    button_arr[13,4] = true; // Wrap value
    button_arr[13,5] = coll_prec_const; // Default value
    button_arr[13,6] = false; // Minimum Value
    button_arr[13,7] = true; // Maximum Value
    button_arr[13,8] = "coll_prec"; // Global variable to modify
    button_arr[13,9] = "OFF"; // Text for each option
    button_arr[13,10] = "ON";

    button_arr[14,0] = global.move_bob_var;
    button_arr[14,1] = ini_read_string("SETTINGS","move_bob","SETTINGS_move_bob"); // Label
    button_arr[14,2] = "How much the camera bobs while moving." // Description
    button_arr[14,3] = 3; // Type: Min clamped Number
    button_arr[14,4] = false; // Wrap value
    button_arr[14,5] = move_bob_const; // Default value
    button_arr[14,6] = 0; // Minimum Value
    button_arr[14,8] = "move_bob"; // Global variable to modify

    button_arr[15,0] = global.idle_bob_var;
    button_arr[15,1] = ini_read_string("SETTINGS","idle_bob","SETTINGS_idle_bob"); // Label
    button_arr[15,2] = "How much the camera bobs while idle." // Description
    button_arr[15,3] = 3; // Type: Min clamped Number
    button_arr[15,4] = false; // Wrap value
    button_arr[15,5] = idle_bob_const; // Default value
    button_arr[15,6] = 0; // Minimum Value
    button_arr[15,8] = "idle_bob"; // Global variable to modify

    button_arr[16,0] = global.shake_type_var;
    button_arr[16,1] = ini_read_string("SETTINGS","idle_bob","SETTINGS_idle_bob"); // Label
    button_arr[16,2] = "How to shake the screen." // Description
    button_arr[16,3] = 0; // Type: Enum
    button_arr[16,4] = true; // Wrap value
    button_arr[16,5] = shake_type_const; // Default value
    button_arr[16,6] = false; // Minimum Value
    button_arr[16,7] = 2; // Maximum Value
    button_arr[16,8] = "shake_type"; // Global variable to modify
    button_arr[16,9] = "NONE"; // Text for each option
    button_arr[16,10] = "CLASSIC";
    button_arr[16,11] = "MODERN";

    button_arr[17,0] = global.mem_save_var;
    button_arr[17,1] = ini_read_string("SETTINGS","mem_save","SETTINGS_mem_save"); // Label
    button_arr[17,2] = "Whether to save memory by loading less assets." // Description
    button_arr[17,3] = 0; // Type: Enum
    button_arr[17,4] = true; // Wrap value
    button_arr[17,5] = mem_save_const; // Default value
    button_arr[17,6] = false; // Minimum Value
    button_arr[17,7] = true; // Maximum Value
    button_arr[17,8] = "mem_save"; // Global variable to modify
    button_arr[17,9] = "OFF"; // Text for each option
    button_arr[17,10] = "ON";

    button_arr[18,0] = global.mon_hud_var;
    button_arr[18,1] = ini_read_string("SETTINGS","mon_hud","SETTINGS_mon_hud"); // Label
    button_arr[18,2] = "Show monsters on the lower left of the HUD." // Description
    button_arr[18,3] = 0; // Type: Enum
    button_arr[18,4] = true; // Wrap value
    button_arr[18,5] = mon_hud_const; // Default value
    button_arr[18,6] = false; // Minimum Value
    button_arr[18,7] = 2; // Maximum Value
    button_arr[18,8] = "mon_hud"; // Global variable to modify
    button_arr[18,9] = "OFF"; // Text for each option
    button_arr[18,10] = "ON";
    button_arr[18,11] = "DURATION";

    button_arr[19,0] = global.rm_hud_var;
    button_arr[19,1] = ini_read_string("SETTINGS","rm_hud","SETTINGS_rm_hud"); // Label
    button_arr[19,2] = "Show room name at the top right of the HUD." // Description
    button_arr[19,3] = 0; // Type: Enum
    button_arr[19,4] = true; // Wrap value
    button_arr[19,5] = rm_hud_const; // Default value
    button_arr[19,6] = false; // Minimum Value
    button_arr[19,7] = true; // Maximum Value
    button_arr[19,8] = "rm_hud"; // Global variable to modify
    button_arr[19,9] = "OFF"; // Text for each option
    button_arr[19,10] = "ON";

    button_arr[20,0] = global.bar_hud_var;
    button_arr[20,1] = ini_read_string("SETTINGS","bar_hud","SETTINGS_bar_hud"); // Label
    button_arr[20,2] = "Show health and stamina stas at the top left of the HUD." // Description
    button_arr[20,3] = 0; // Type: Enum
    button_arr[20,4] = true; // Wrap value
    button_arr[20,5] = bar_hud_const; // Default value
    button_arr[20,6] = false; // Minimum Value
    button_arr[20,7] = 2; // Maximum Value
    button_arr[20,8] = "bar_hud"; // Global variable to modify
    button_arr[20,9] = "OFF"; // Text for each option
    button_arr[20,10] = "ON";
    button_arr[20,11] = "CLASSIC";

    button_arr[21,0] = global.tps_hud_var;
    button_arr[21,1] = ini_read_string("SETTINGS","tps_hud","SETTINGS_tps_hud"); // Label
    button_arr[21,2] = "Show tps and fps at the top right of the HUD." // Description
    button_arr[21,3] = 0; // Type: Enum
    button_arr[21,4] = true; // Wrap value
    button_arr[21,5] = tps_hud_const; // Default value
    button_arr[21,6] = false; // Minimum Value
    button_arr[21,7] = true; // Maximum Value
    button_arr[21,8] = "tps_hud"; // Global variable to modify
    button_arr[21,9] = "OFF"; // Text for each option
    button_arr[21,10] = "ON";

    button_arr[22,0] = global.fps_update_var;
    button_arr[22,1] = ini_read_string("SETTINGS","fps_update","SETTINGS_fps_update"); // Label
    button_arr[22,2] = "How often the game checks the FPS." // Description
    button_arr[22,3] = 3; // Type: Min clamped Number
    button_arr[22,4] = false; // Wrap value
    button_arr[22,5] = fps_update_const; // Default value
    button_arr[22,6] = 1; // Minimum Value
    button_arr[22,8] = "fps_update"; // Global variable to modify

    button_arr[23,0] = global.name_var;
    button_arr[23,1] = ini_read_string("SETTINGS","name","SETTINGS_name"); // Label
    button_arr[23,2] = "What names to use for the monsters." // Description
    button_arr[23,3] = 0; // Type: Enum
    button_arr[23,4] = true; // Wrap value
    button_arr[23,5] = name_const; // Default value
    button_arr[23,6] = false; // Minimum Value
    button_arr[23,7] = 4; // Maximum Value
    button_arr[23,8] = "name"; // Global variable to modify
    button_arr[23,9] = "ORIGINAL"; // Text for each option
    button_arr[23,10] = "RENOVATION";
    button_arr[23,11] = "FANDOM";
    button_arr[23,12] = "ORIGINAL NUMBERS";
    button_arr[23,13] = "RENOVATION NUMBERS";

    button_arr[24,0] = global.res_w_var;
    button_arr[24,1] = ini_read_string("SETTINGS","res_w","SETTINGS_res_w"); // Label
    button_arr[24,2] = "The width of the window in pixels." // Description
    button_arr[24,3] = 3; // Type: Clamped Number
    button_arr[24,4] = false; // Wrap value
    button_arr[24,5] = res_w_const; // Default value
    button_arr[24,6] = 1; // Minimum Value
    button_arr[24,8] = "res_w"; // Global variable to modify

    button_arr[25,0] = global.res_h_var;
    button_arr[25,1] = ini_read_string("SETTINGS","res_h","SETTINGS_res_h"); // Label
    button_arr[25,2] = "The height of the window in pixels." // Description
    button_arr[25,3] = 3; // Type: Min clamped Number
    button_arr[25,4] = false; // Wrap value
    button_arr[25,5] = res_h_const; // Default value
    button_arr[25,6] = 1; // Minimum Value
    button_arr[25,8] = "res_h"; // Global variable to modify

    button_arr[26,0] = global.mus_vol_var;
    button_arr[26,1] = ini_read_string("SETTINGS","mus_vol","SETTINGS_mus_vol"); // Label
    button_arr[26,2] = "Volume for themes and ambient tracks." // Description
    button_arr[26,3] = 2; // Type: Clamped Number
    button_arr[26,4] = false; // Wrap value
    button_arr[26,5] = mus_vol_const; // Default value
    button_arr[26,6] = 0; // Minimum Value
    button_arr[26,7] = 100; // Maximum Value
    button_arr[26,8] = "mus_vol"; // Global variable to modify

    button_arr[27,0] = global.mon_vol_var;
    button_arr[27,1] = ini_read_string("SETTINGS","mon_vol","SETTINGS_mon_vol"); // Label
    button_arr[27,2] = "Volume for monsters. (Specimens, Monsters, Dolls, etc.)" // Description
    button_arr[27,3] = 2; // Type: Clamped Number
    button_arr[27,4] = false; // Wrap value
    button_arr[27,5] = mon_vol_const; // Default value
    button_arr[27,6] = 0; // Minimum Value
    button_arr[27,7] = 100; // Maximum Value
    button_arr[27,8] = "mon_vol"; // Global variable to modify

    button_arr[28,0] = global.voice_vol_var;
    button_arr[28,1] = ini_read_string("SETTINGS","voice_vol","SETTINGS_voice_vol"); // Label
    button_arr[28,2] = "Volume for voices, primarily in cutscenes." // Description
    button_arr[28,3] = 2; // Type: Clamped Number
    button_arr[28,4] = false; // Wrap value
    button_arr[28,5] = voice_vol_const; // Default value
    button_arr[28,6] = 0; // Minimum Value
    button_arr[28,7] = 100; // Maximum Value
    button_arr[28,8] = "voice_vol"; // Global variable to modify

    button_arr[29,0] = global.sfx_vol_var;
    button_arr[29,1] = ini_read_string("SETTINGS","sfx_vol","SETTINGS_sfx_vol"); // Label
    button_arr[29,2] = "Volume for various other sound effects." // Description
    button_arr[29,3] = 2; // Type: Clamped Number
    button_arr[29,4] = false; // Wrap value
    button_arr[29,5] = sfx_vol_const; // Default value
    button_arr[29,6] = 0; // Minimum Value
    button_arr[29,7] = 100; // Maximum Value
    button_arr[29,8] = "sfx_vol"; // Global variable to modify

    button_arr[30,0] = global.lang_var;
    button_arr[30,1] = ini_read_string("SETTINGS","lang","SETTINGS_lang"); // Label
    button_arr[30,2] = "Language file to use." // Description
    button_arr[30,3] = 5; // Type: String
    button_arr[30,5] = lang_const; // Default value
    button_arr[30,8] = "lang"; // Global variable to modify

    button_arr[31,0] = global.invert_yaw_var;
    button_arr[31,1] = ini_read_string("SETTINGS","invert_yaw","SETTINGS_invert_yaw"); // Label
    button_arr[31,2] = "Invert camera yaw control / mouse x." // Description
    button_arr[31,3] = 0; // Type: Enum
    button_arr[31,4] = true; // Wrap value
    button_arr[31,5] = invert_yaw_const; // Default value
    button_arr[31,6] = false; // Minimum Value
    button_arr[31,7] = true; // Maximum Value
    button_arr[31,8] = "invert_yaw"; // Global variable to modify
    button_arr[31,9] = "OFF"; // Text for each option
    button_arr[31,10] = "ON";

    button_arr[32,0] = global.invert_pitch_var;
    button_arr[32,1] = ini_read_string("SETTINGS","invert_pitch","SETTINGS_invert_pitch"); // Label
    button_arr[32,2] = "Invert camera pitch control / mouse y." // Description
    button_arr[32,3] = 0; // Type: Enum
    button_arr[32,4] = true; // Wrap value
    button_arr[32,5] = invert_pitch_const; // Default value
    button_arr[32,6] = false; // Minimum Value
    button_arr[32,7] = true; // Maximum Value
    button_arr[32,8] = "invert_pitch"; // Global variable to modify
    button_arr[32,9] = "OFF"; // Text for each option
    button_arr[32,10] = "ON";

    button_arr[33,0] = global.killer_voice_var;
    button_arr[33,1] = ini_read_string("SETTINGS","killer_voice","SETTINGS_killer_voice"); // Label
    button_arr[33,2] = "The voice used for @n." // Description
    button_arr[33,3] = 0; // Type: Enum
    button_arr[33,4] = true; // Wrap value
    button_arr[33,5] = invert_pitch_const; // Default value
    button_arr[33,6] = 0; // Minimum Value
    button_arr[33,7] = 2; // Maximum Value
    button_arr[33,8] = "killer_voice"; // Global variable to modify
    button_arr[33,9] = "VERNON"; // Text for each option
    button_arr[33,10] = "DIRECTORFLIK";
    button_arr[33,11] = "LASS";

    button_arr[button_len_var-3,0] = 0;
    button_arr[button_len_var-3,1] = ini_read_string("SETTINGS","apply","SETTINGS_apply"); // Label
    button_arr[button_len_var-3,2] = "Apply your settings. If you do not do this, your settings will not apply. Some settings may require a reload."
    button_arr[button_len_var-3,3] = -1;

    button_arr[button_len_var-2,0] = 0;
    button_arr[button_len_var-2,1] = ini_read_string("SETTINGS","reset","SETTINGS_reset"); // Label
    button_arr[button_len_var-2,2] = "Reset all settings. CANNOT BE UNDONE"
    button_arr[button_len_var-2,3] = -3;

    button_arr[button_len_var-1,0] = 0;
    button_arr[button_len_var-1,1] = ini_read_string("MENU","back","MENU_back"); // Label
    button_arr[button_len_var-1,2] = "Back to the previous menu."
    button_arr[button_len_var-1,3] = -2;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    // Text Stretch
    time_var = (time_var+global.true_delta_time_var) mod 80;
    str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
    // Lerp
    local.target_scroll = -96*button_state_var;
    local.scroll_diff = abs(local.target_scroll-scroll_var);
    local.scroll_rate = max(scroll_min_var,local.scroll_diff*scroll_rate_var)*global.true_delta_time_var;
    scroll_var += min(local.scroll_diff,local.scroll_rate)*sign(local.target_scroll-scroll_var);
    // Scroll
    if global.up_input_press_var { button_state_var -= 1; }
    if global.down_input_press_var { button_state_var += 1; }
    button_state_var = mod_scr(button_state_var,button_len_var);
    // Confirm
    if global.confirm_input_press_var
    {
        switch button_arr[button_state_var,3]
        {
            case -3: // Reset to default
            {
                if show_message_ext("Reset all settings? (CANNOT BE UNDONE)","YES","NO","") == 1 { event_user(1); }
                global.confirm_input_var = 0;
                break;
            }
            case -2: // Go Back
            {
                local.dont = false;
                if set_var
                {
                    local.message = show_message_ext("You have unsaved changes, would you like to apply them?","YES","NO","CANCEL");
                    if local.message == 0 || local.message == 3 { local.dont = true; }
                    if local.message == 1 { event_user(0); }
                    global.confirm_input_var = 0;
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
                    instance_destroy();
                }
                break;
            }
            case -1: // Apply settings
            {
                if set_var
                {
                    if show_message_ext("Apply settings?","YES","NO","") == 1 { event_user(0); }
                    global.confirm_input_var = 0;
                }
                break;
            }
            case 0:
            {
                button_arr[button_state_var,0] += 1;
                if button_arr[button_state_var,4]
                { 
                    button_arr[button_state_var,0] = mod_scr
                    (
                        button_arr[button_state_var,0]-button_arr[button_state_var,6],
                        button_arr[button_state_var,7]+1
                    )+button_arr[button_state_var,6];
                }
                else
                {
                    button_arr[button_state_var,0] = median
                    (
                        button_arr[button_state_var,0],
                        button_arr[button_state_var,6],
                        button_arr[button_state_var,7]
                    );
                }
                set_var = true;
                break;
            }
            case 1: 
            {
                local.new = get_integer(button_arr[button_state_var,2],button_arr[button_state_var,0]);
                if local.new != button_arr[button_state_var,0]
                {
                    button_arr[button_state_var,0] = local.new;
                    set_var = true;
                }
                global.confirm_input_var = 0;
                break;
            }
            case 2: 
            {
                local.new = median
                (
                    get_integer(button_arr[button_state_var,2],button_arr[button_state_var,0]),
                    button_arr[button_state_var,6],
                    button_arr[button_state_var,7]
                );
                if local.new != button_arr[button_state_var,0]
                {
                    button_arr[button_state_var,0] = local.new;
                    set_var = true;
                }
                global.confirm_input_var = 0;
                break;
            }
            case 3: 
            {
                local.new = max
                (
                    get_integer(button_arr[button_state_var,2],button_arr[button_state_var,0]),
                    button_arr[button_state_var,6]
                );
                if local.new != button_arr[button_state_var,0]
                {
                    button_arr[button_state_var,0] = local.new;
                    set_var = true;
                }
                global.confirm_input_var = 0;
                break;
            }
            case 4: 
            {
                local.new = min
                (
                    get_integer(button_arr[button_state_var,2],button_arr[button_state_var,0]),
                    button_arr[button_state_var,7]
                );
                if local.new != button_arr[button_state_var,0]
                {
                    button_arr[button_state_var,0] = local.new;
                    set_var = true;
                }
                global.confirm_input_var = 0;
                break;
            }
            case 5:
            {
                local.new = get_string(button_arr[button_state_var,2],button_arr[button_state_var,0]);
                if local.new != button_arr[button_state_var,0]
                {
                    button_arr[button_state_var,0] = local.new;
                    set_var = true;
                }
                global.confirm_input_var = 0;
                break;
            }
        }
    }
    if global.left_input_press_var || global.right_input_press_var
	{
        local.add = global.right_input_press_var-global.left_input_press_var;
        switch button_arr[button_state_var,3]
        {
            case 0:
            case 2:
            {
                button_arr[button_state_var,0] += local.add;
                if button_arr[button_state_var,4]
                { 
                    button_arr[button_state_var,0] = mod_scr
                    (
                        button_arr[button_state_var,0]-button_arr[button_state_var,6],
                        button_arr[button_state_var,7]+1
                    )+button_arr[button_state_var,6];
                }
                else
                {
                    button_arr[button_state_var,0] = median
                    (
                        button_arr[button_state_var,0],
                        button_arr[button_state_var,6],
                        button_arr[button_state_var,7]
                    );
                }
                set_var = true;
                break;
            }
            case 1: { button_arr[button_state_var,0] += local.add; break; }
            case 3: 
            {
                button_arr[button_state_var,0] += local.add;
                button_arr[button_state_var,0] = max(button_arr[button_state_var,0],button_arr[button_state_var,6]);
                set_var = true;
                break;
            }
            case 4: 
            {
                button_arr[button_state_var,0] += local.add;
                button_arr[button_state_var,0] = min(button_arr[button_state_var,0],button_arr[button_state_var,7]);
                set_var = true;
                break;
            }
        }
    }
');
// Reset Settings
object_event_add
(argument0,ev_other,ev_user1,'
    for (local.i=0; local.i<button_len_var; local.i+=1)
    { button_arr[local.i,0] = button_arr[local.i,5]; }
    event_user(0);
');
// Apply Settings
object_event_add
(argument0,ev_other,ev_user0,'
    set_var = false;
    ini_open("settings.ini");
    for (local.i=0; local.i<button_len_var; local.i+=1)
    {
        if button_arr[local.i,3] >= 0
        {
            if button_arr[local.i,3] == 5 
            {
                str_var = button_arr[local.i,0];
                execute_string("global."+button_arr[local.i,8]+"_var = str_var");
                ini_write_string("MAIN",button_arr[local.i,8],button_arr[local.i,0]);
            }
            else
            {
                execute_string("global."+button_arr[local.i,8]+"_var = "+string(button_arr[local.i,0]));
                ini_write_real("MAIN",button_arr[local.i,8],button_arr[local.i,0]);
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
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    local.scrolly_var = 0;
    
    draw_background_tiled_ext(settings_bg,0,0,1,1,c_white,1);
    
    draw_set_color(str_bg_color_var);
    draw_text_transformed(706,24,"SETTINGS",0.95,0.95,0);
    draw_text_transformed(708,22,"SETTINGS",0.95,0.95,0);
    draw_set_color(c_yellow);
    draw_text_transformed(710,20,"SETTINGS",0.95,0.95,0);
    draw_set_color(c_white);
    
    local.stat_display_var = "";
    
    for (local.i=0; local.i<button_len_var; local.i+=1)
    {
        if local.i != button_state_var
        {
            local.ytmp = 192+(96*local.i)+scroll_var
            draw_set_color(str_bg_color_var);
            draw_text_transformed(92,local.ytmp+4,button_arr[local.i,1],0.75,0.75,0);
            draw_text_transformed(94,local.ytmp+2,button_arr[local.i,1],0.75,0.75,0);
            draw_set_color(c_yellow);
            draw_text_transformed(96,local.ytmp,button_arr[local.i,1],0.75,0.75,0);
            
            switch button_arr[local.i,3]
            {
                case 0: { local.str = string(button_arr[local.i,button_arr[local.i,0]+9]); break; }
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                {
                    local.str = string(button_arr[local.i,0]);
                    break;
                }
                default: { local.str = "0"; break; }
            }
            if local.str != "0"
            {
                draw_set_color(str_bg_select_color_var);
                draw_text_transformed(496,local.ytmp+4,local.str,0.75,0.75,0);
                draw_text_transformed(498,local.ytmp+2,local.str,0.75,0.75,0);
                draw_set_color(c_white);
                draw_text_transformed(500,local.ytmp,local.str,0.75,0.75,0);
            }
        }
    }
    local.xtmp = 96+(string_width(button_arr[button_state_var,1])*0.375);
    local.ytmp = 192+(96*button_state_var)+scroll_var;
    draw_set_halign(fa_center); draw_set_color(str_bg_select_color_var);
    draw_text_transformed(local.xtmp-4,local.ytmp+4,button_arr[button_state_var,1],str_scale_var,0.75,0);
    draw_text_transformed(local.xtmp-2,local.ytmp+2,button_arr[button_state_var,1],str_scale_var,0.75,0);
    draw_set_color(c_white);
    draw_text_transformed(local.xtmp,local.ytmp,button_arr[button_state_var,1],str_scale_var,0.75,0);
    draw_set_halign(fa_left); 
    
    switch button_arr[button_state_var,3]
    {
        case 0: { local.str = string(button_arr[button_state_var,button_arr[button_state_var,0]+9]); break; }
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        {
            local.str = string(button_arr[button_state_var,0]);
            break;
        }
        default: { local.str = "0"; break; }
    }
    if local.str != "0"
    {
        draw_set_color(str_bg_select_color_var);
        draw_text_transformed(496,local.ytmp+4,local.str,0.75,0.75,0);
        draw_text_transformed(498,local.ytmp+2,local.str,0.75,0.75,0);
        draw_set_color(c_white);
        draw_text_transformed(500,local.ytmp,local.str,0.75,0.75,0);
    }
');