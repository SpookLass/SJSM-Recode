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
        -7: Save Preset
        -6: Load Preset
        -5: Player ID
        -4: Category
        -3: Reset
        -2: Previous menu
        -1: Apply Settings
        0: Enum (also boolean)
        1: Number
        2: Clamped number
        3: Min clamped number
        4: Max clamped number
        5: String
        6: Control 
*/
// Create Event
object_event_add
(argument0,ev_create,0,'
    set_var = false;
    state_var = 0;

    bg_scroll_var = 0;
    do_scroll_focal_var = true;
    scroll_var = 0;
    scroll_rate_var = 0.2;
    scroll_min_var = 0.5;

    str_bg_color_var = make_color_rgb(57,0,91);
    str_bg_select_color_var = make_color_rgb(138,0,0);
    str_scale_var = 0.8;

    ini_open(global.lang_var);
    // Main
    state_start_var[0] = button_len_var;

    button_arr[button_len_var,0] = 1;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","gameplay","SETTINGS_gameplay"); // Label
    button_arr[button_len_var,2] = "Gameplay settings."
    button_arr[button_len_var,3] = -4;
    button_len_var += 1;

    button_arr[button_len_var,0] = 2;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","visual","SETTINGS_visual"); // Label
    button_arr[button_len_var,2] = "Graphics settings."
    button_arr[button_len_var,3] = -4;
    button_len_var += 1;

    button_arr[button_len_var,0] = 3;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","audio","SETTINGS_audio"); // Label
    button_arr[button_len_var,2] = "Audio settings."
    button_arr[button_len_var,3] = -4;
    button_len_var += 1;

    button_arr[button_len_var,0] = 4;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","hud","SETTINGS_hud"); // Label
    button_arr[button_len_var,2] = "Heads up display settings."
    button_arr[button_len_var,3] = -4;
    button_len_var += 1;

    button_arr[button_len_var,0] = 5;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","control","SETTINGS_control"); // Label
    button_arr[button_len_var,2] = "Control settings."
    button_arr[button_len_var,3] = -4;
    button_len_var += 1;

    button_arr[button_len_var,0] = 0;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","apply","SETTINGS_apply"); // Label
    button_arr[button_len_var,2] = "Apply your settings. If you do not do this, your settings will not apply. Some settings may require a reload."
    button_arr[button_len_var,3] = -1;
    button_len_var += 1;

    button_arr[button_len_var,0] = 0;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","reset","SETTINGS_reset"); // Label
    button_arr[button_len_var,2] = "Reset all settings. CANNOT BE UNDONE"
    button_arr[button_len_var,3] = -3;
    button_len_var += 1;

    button_arr[button_len_var,0] = 0;
    button_arr[button_len_var,1] = ini_read_string("MENU","back","MENU_back"); // Label
    button_arr[button_len_var,2] = "Back to the previous menu."
    button_arr[button_len_var,3] = -2;
    button_len_var += 1;

    state_len_var[0] = button_len_var-state_start_var[0];
    // Gameplay
    state_start_var[1] = button_len_var;

    button_arr[button_len_var,0] = global.tps_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","tps","SETTINGS_tps");; // Label
    button_arr[button_len_var,2] = "How often the game updates." // Description
    button_arr[button_len_var,3] = 3; // Type: Min clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = tps_const; // Default value
    button_arr[button_len_var,6] = 1; // Minimum Value
    button_arr[button_len_var,8] = "tps"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.reduce_flash_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","reduce_flash","SETTINGS_reduce_flash"); // Label
    button_arr[button_len_var,2] = "Reduce flashing lights." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = reduce_flash_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = true; // Maximum Value
    button_arr[button_len_var,8] = "reduce_flash"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.sub_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","sub","SETTINGS_sub"); // Label
    button_arr[button_len_var,2] = "Whether NPCs should have subtitles." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = sub_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = 2; // Maximum Value
    button_arr[button_len_var,8] = "sub"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "VOICE";
    button_arr[button_len_var,11] = "ALL";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.color_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","color","SETTINGS_color"); // Label
    button_arr[button_len_var,2] = "How to color special rooms." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = color_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = 2; // Maximum Value
    button_arr[button_len_var,8] = "color"; // Global variable to modify
    button_arr[button_len_var,9] = "OBJECTS"; // Text for each option
    button_arr[button_len_var,10] = "GEOMETRY";
    button_arr[button_len_var,11] = "SCREEN";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.coll_prec_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","coll_prec","SETTINGS_coll_prec"); // Label
    button_arr[button_len_var,2] = "Whether collisions are precise. May save processing time." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = coll_prec_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = true; // Maximum Value
    button_arr[button_len_var,8] = "coll_prec"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.move_bob_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","move_bob","SETTINGS_move_bob"); // Label
    button_arr[button_len_var,2] = "How much the camera bobs while moving." // Description
    button_arr[button_len_var,3] = 3; // Type: Min clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = move_bob_const; // Default value
    button_arr[button_len_var,6] = 0; // Minimum Value
    button_arr[button_len_var,8] = "move_bob"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.idle_bob_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","idle_bob","SETTINGS_idle_bob"); // Label
    button_arr[button_len_var,2] = "How much the camera bobs while idle." // Description
    button_arr[button_len_var,3] = 3; // Type: Min clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = idle_bob_const; // Default value
    button_arr[button_len_var,6] = 0; // Minimum Value
    button_arr[button_len_var,8] = "idle_bob"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.shake_type_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","shake_type","SETTINGS_shake_type"); // Label
    button_arr[button_len_var,2] = "How to shake the screen." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = shake_type_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = 2; // Maximum Value
    button_arr[button_len_var,8] = "shake_type"; // Global variable to modify
    button_arr[button_len_var,9] = "NONE"; // Text for each option
    button_arr[button_len_var,10] = "CLASSIC";
    button_arr[button_len_var,11] = "MODERN";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.mem_save_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","mem_save","SETTINGS_mem_save"); // Label
    button_arr[button_len_var,2] = "Whether to save memory by loading less assets." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = mem_save_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = true; // Maximum Value
    button_arr[button_len_var,8] = "mem_save"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.reset_spd_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","reset_spd","SETTINGS_reset_spd"); // Label
    button_arr[button_len_var,2] = "Reset speed multiplier when certain events occur." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = reset_spd_const; // Default value
    button_arr[button_len_var,6] = 0; // Minimum Value
    button_arr[button_len_var,7] = 2; // Maximum Value
    button_arr[button_len_var,8] = "reset_spd"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "CHASE";
    button_arr[button_len_var,11] = "LOCALE";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.rand_theme_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","rand_theme","SETTINGS_rand_theme"); // Label
    button_arr[button_len_var,2] = "Randomize when themes play." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = rand_theme_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = true; // Maximum Value
    button_arr[button_len_var,8] = "rand_theme"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.wake_3d_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","wake_3d","SETTINGS_wake_3d"); // Label
    button_arr[button_len_var,2] = "Wake sounds are attenuated." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = wake_3d_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = true; // Maximum Value
    button_arr[button_len_var,8] = "wake_3d"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_len_var += 1;

    button_arr[button_len_var,0] = 0;
    button_arr[button_len_var,1] = ini_read_string("MENU","back","MENU_back"); // Label
    button_arr[button_len_var,2] = "Back to the previous menu."
    button_arr[button_len_var,3] = -2;
    button_len_var += 1;

    state_len_var[1] = button_len_var-state_start_var[1];

    // Graphics
    state_start_var[2] = button_len_var;
    
    button_arr[button_len_var,0] = global.fov_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","fov","SETTINGS_fov"); // Label
    button_arr[button_len_var,2] = "Field of view. (vertical)" // Description
    button_arr[button_len_var,3] = 2; // Type: Clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = fov_const; // Default value
    button_arr[button_len_var,6] = 1; // Minimum Value
    button_arr[button_len_var,7] = 179; // Maximum Value
    button_arr[button_len_var,8] = "fov"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.fps_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","fps","SETTINGS_fps");; // Label
    button_arr[button_len_var,2] = "How often the game draws to the screen." // Description
    button_arr[button_len_var,3] = 3; // Type: Min clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = fps_const; // Default value
    button_arr[button_len_var,6] = 1; // Minimum Value
    button_arr[button_len_var,8] = "fps"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.fps_update_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","fps_update","SETTINGS_fps_update"); // Label
    button_arr[button_len_var,2] = "How often the game checks the FPS." // Description
    button_arr[button_len_var,3] = 3; // Type: Min clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = fps_update_const; // Default value
    button_arr[button_len_var,6] = 1; // Minimum Value
    button_arr[button_len_var,8] = "fps_update"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.vsync_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","vsync","SETTINGS_vsync"); // Label
    button_arr[button_len_var,2] = "Vertical sync to reduce screen tearing." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = vsync_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = true; // Maximum Value
    button_arr[button_len_var,8] = "vsync"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.anti_alias_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","anti_alias","SETTINGS_anti_alias"); // Label
    button_arr[button_len_var,2] = "Blur textures." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = anti_alias_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = true; // Maximum Value
    button_arr[button_len_var,8] = "anti_alias"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.fullscreen_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","fullscreen","SETTINGS_fullscreen"); // Label
    button_arr[button_len_var,2] = "Play in full screen." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = fullscreen_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = true; // Maximum Value
    button_arr[button_len_var,8] = "fullscreen"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.res_w_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","res_w","SETTINGS_res_w"); // Label
    button_arr[button_len_var,2] = "The width of the window in pixels." // Description
    button_arr[button_len_var,3] = 3; // Type: Clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = res_w_const; // Default value
    button_arr[button_len_var,6] = 1; // Minimum Value
    button_arr[button_len_var,8] = "res_w"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.res_h_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","res_h","SETTINGS_res_h"); // Label
    button_arr[button_len_var,2] = "The height of the window in pixels." // Description
    button_arr[button_len_var,3] = 3; // Type: Min clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = res_h_const; // Default value
    button_arr[button_len_var,6] = 1; // Minimum Value
    button_arr[button_len_var,8] = "res_h"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.max_part_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","max_part","max_part"); // Label
    button_arr[button_len_var,2] = "Maximum number of particles to draw." // Description
    button_arr[button_len_var,3] = 3; // Type: Min clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = max_part_const; // Default value
    button_arr[button_len_var,6] = 0; // Minimum Value
    button_arr[button_len_var,8] = "max_part"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = 0;
    button_arr[button_len_var,1] = ini_read_string("MENU","back","MENU_back"); // Label
    button_arr[button_len_var,2] = "Back to the previous menu."
    button_arr[button_len_var,3] = -2;
    button_len_var += 1;

    state_len_var[2] = button_len_var-state_start_var[2];

    // Audio
    state_start_var[3] = button_len_var;

    button_arr[button_len_var,0] = global.vol_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","vol","SETTINGS_vol"); // Label
    button_arr[button_len_var,2] = "Master volume." // Description
    button_arr[button_len_var,3] = 2; // Type: Clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = vol_const; // Default value
    button_arr[button_len_var,6] = 0; // Minimum Value
    button_arr[button_len_var,7] = 100; // Maximum Value
    button_arr[button_len_var,8] = "vol"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.mus_vol_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","mus_vol","SETTINGS_mus_vol"); // Label
    button_arr[button_len_var,2] = "Volume for themes and ambient tracks." // Description
    button_arr[button_len_var,3] = 2; // Type: Clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = mus_vol_const; // Default value
    button_arr[button_len_var,6] = 0; // Minimum Value
    button_arr[button_len_var,7] = 100; // Maximum Value
    button_arr[button_len_var,8] = "mus_vol"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.mon_vol_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","mon_vol","SETTINGS_mon_vol"); // Label
    button_arr[button_len_var,2] = "Volume for monsters. (Specimens, Monsters, Dolls, etc.)" // Description
    button_arr[button_len_var,3] = 2; // Type: Clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = mon_vol_const; // Default value
    button_arr[button_len_var,6] = 0; // Minimum Value
    button_arr[button_len_var,7] = 100; // Maximum Value
    button_arr[button_len_var,8] = "mon_vol"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.voice_vol_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","voice_vol","SETTINGS_voice_vol"); // Label
    button_arr[button_len_var,2] = "Volume for voices, primarily in cutscenes." // Description
    button_arr[button_len_var,3] = 2; // Type: Clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = voice_vol_const; // Default value
    button_arr[button_len_var,6] = 0; // Minimum Value
    button_arr[button_len_var,7] = 100; // Maximum Value
    button_arr[button_len_var,8] = "voice_vol"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.sfx_vol_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","sfx_vol","SETTINGS_sfx_vol"); // Label
    button_arr[button_len_var,2] = "Volume for various other sound effects." // Description
    button_arr[button_len_var,3] = 2; // Type: Clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = sfx_vol_const; // Default value
    button_arr[button_len_var,6] = 0; // Minimum Value
    button_arr[button_len_var,7] = 100; // Maximum Value
    button_arr[button_len_var,8] = "sfx_vol"; // Global variable to modify
    button_len_var += 1;

    switch global.name_var
    {
        case name_og_const:
        {
            local.name = ini_read_string("NAME","killer_og","NAME_killer_og");
            break;
        }
        case name_hd_const:
        case name_fanon_const:
        {
            local.name = ini_read_string("NAME","killer_hd","NAME_killer_hd");
            break;
        }
        case name_num_og_const:
        case name_num_hd_const:
        {
            local.name = ini_read_string("NAME","killer_num","NAME_killer_num");
            break;
        }
    }
    button_arr[button_len_var,0] = global.killer_voice_var;
    button_arr[button_len_var,1] = string_replace(ini_read_string("SETTINGS","killer_voice","SETTINGS_killer_voice"),"@n",string_upper(local.name)); // Label
    button_arr[button_len_var,2] = "The voice used for @n." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = killer_voice_const; // Default value
    button_arr[button_len_var,6] = 0; // Minimum Value
    button_arr[button_len_var,7] = 3; // Maximum Value
    button_arr[button_len_var,8] = "killer_voice"; // Global variable to modify
    button_arr[button_len_var,9] = "VERNON"; // Text for each option
    button_arr[button_len_var,10] = "DIRECTORFLIK";
    button_arr[button_len_var,11] = "LASS";
    button_arr[button_len_var,12] = "RYAN";
    button_len_var += 1;

    button_arr[button_len_var,0] = 0;
    button_arr[button_len_var,1] = ini_read_string("MENU","back","MENU_back"); // Label
    button_arr[button_len_var,2] = "Back to the previous menu."
    button_arr[button_len_var,3] = -2;
    button_len_var += 1;

    state_len_var[3] = button_len_var-state_start_var[3];
    
    // Hud
    state_start_var[4] = button_len_var;

    button_arr[button_len_var,0] = global.lang_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","lang","SETTINGS_lang"); // Label
    button_arr[button_len_var,2] = "Language file to use." // Description
    button_arr[button_len_var,3] = 5; // Type: String
    button_arr[button_len_var,5] = lang_const; // Default value
    button_arr[button_len_var,8] = "lang"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.name_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","name","SETTINGS_name"); // Label
    button_arr[button_len_var,2] = "What names to use for the monsters." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = name_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = 4; // Maximum Value
    button_arr[button_len_var,8] = "name"; // Global variable to modify
    button_arr[button_len_var,9] = "ORIGINAL"; // Text for each option
    button_arr[button_len_var,10] = "RENOVATION";
    button_arr[button_len_var,11] = "FANDOM";
    button_arr[button_len_var,12] = "ORIGINAL NUMBERS";
    button_arr[button_len_var,13] = "RENOVATION NUMBERS";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.mon_hud_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","mon_hud","SETTINGS_mon_hud"); // Label
    button_arr[button_len_var,2] = "Show monsters on the lower left of the HUD." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = mon_hud_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = 2; // Maximum Value
    button_arr[button_len_var,8] = "mon_hud"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_arr[button_len_var,11] = "DURATION";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.rm_hud_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","rm_hud","SETTINGS_rm_hud"); // Label
    button_arr[button_len_var,2] = "Show room name at the top right of the HUD." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = rm_hud_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = true; // Maximum Value
    button_arr[button_len_var,8] = "rm_hud"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.bar_hud_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","bar_hud","SETTINGS_bar_hud"); // Label
    button_arr[button_len_var,2] = "Show health and stamina stas at the top left of the HUD." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = bar_hud_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = 2; // Maximum Value
    button_arr[button_len_var,8] = "bar_hud"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_arr[button_len_var,11] = "CLASSIC";
    button_len_var += 1;

    button_arr[button_len_var,0] = global.tps_hud_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","tps_hud","SETTINGS_tps_hud"); // Label
    button_arr[button_len_var,2] = "Show tps and fps at the top right of the HUD." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = tps_hud_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = true; // Maximum Value
    button_arr[button_len_var,8] = "tps_hud"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
    button_len_var += 1;

    button_arr[button_len_var,0] = 0;
    button_arr[button_len_var,1] = ini_read_string("MENU","back","MENU_back"); // Label
    button_arr[button_len_var,2] = "Back to the previous menu."
    button_arr[button_len_var,3] = -2;
    button_len_var += 1;

    state_len_var[4] = button_len_var-state_start_var[4];

    // Control
    state_start_var[5] = 0;

    control_button_arr[control_button_len_var,0] = 1;
    control_button_arr[control_button_len_var,8] = ini_read_string("MENU","player_id","MENU_player_id"); // Label
    control_button_arr[control_button_len_var,9] = "Current player." // Description
    control_button_arr[control_button_len_var,10] = -5; // Player ID, works like a clamped number but doesnt save
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","preset_load","SETTINGS_preset_load"); // Label
    control_button_arr[control_button_len_var,9] = "Load a control setting preset." // Description
    control_button_arr[control_button_len_var,10] = -6; // Player ID, works like a clamped number but doesnt save
    control_button_arr[control_button_len_var,18] = "PC"; // Text for each option
    control_button_arr[control_button_len_var,19] = "XBOX";
    control_button_arr[control_button_len_var,20] = "PLAYSTATION";
    control_button_arr[control_button_len_var,21] = "SWITCH";
    control_button_arr[control_button_len_var,22] = "SNES";
    control_button_arr[control_button_len_var,23] = "CUSTOM";
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","joy_id","SETTINGS_joy_id"); // Label
    control_button_arr[control_button_len_var,9] = "Joystick index." // Description
    control_button_arr[control_button_len_var,10] = 2; // Type: Clamped Number
    control_button_arr[control_button_len_var,11] = true; // Wrap value
    control_button_arr[control_button_len_var,12] = 0; // Minimum Value
    control_button_arr[control_button_len_var,13] = 8; // Maximum Value
    control_button_arr[control_button_len_var,14] = 0; // Default
    control_button_arr[control_button_len_var,15] = 0; // Default (Controller)
    control_button_arr[control_button_len_var,16] = "joy_id"; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "joy_id"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","crouch_toggle","SETTINGS_crouch_toggle"); // Label
    control_button_arr[control_button_len_var,9] = "Whether crouch is toggled or held." // Description
    control_button_arr[control_button_len_var,10] = 0; // Type: Enum
    control_button_arr[control_button_len_var,11] = true; // Wrap value
    control_button_arr[control_button_len_var,12] = false; // Minimum Value
    control_button_arr[control_button_len_var,13] = true; // Maximum Value
    control_button_arr[control_button_len_var,14] = crouch_toggle_const; // Default value
    control_button_arr[control_button_len_var,15] = crouch_toggle_const; // Default value (Controller)
    control_button_arr[control_button_len_var,16] = "crouch_toggle"; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "crouch_toggle_"; // Save key
    control_button_arr[control_button_len_var,18] = "OFF"; // Text for each option
    control_button_arr[control_button_len_var,19] = "ON";
    crouch_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","sens","SETTINGS_sens"); // Label
    control_button_arr[control_button_len_var,9] = "Camera sensitivity." // Description
    control_button_arr[control_button_len_var,10] = 3; // Type: Min Clamped Number
    control_button_arr[control_button_len_var,11] = false; // Wrap value
    control_button_arr[control_button_len_var,12] = 0; // Minimum Value
    control_button_arr[control_button_len_var,14] = sens_const; // Default
    control_button_arr[control_button_len_var,15] = sens_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = "sens"; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "sens"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","joy_sens","SETTINGS_joy_sens"); // Label
    control_button_arr[control_button_len_var,9] = "Joystick sensitivity." // Description
    control_button_arr[control_button_len_var,10] = 2; // Type: Clamped Number
    control_button_arr[control_button_len_var,11] = false; // Wrap value
    control_button_arr[control_button_len_var,12] = 0; // Maximum Value
    control_button_arr[control_button_len_var,13] = 100; // Minimum Value
    control_button_arr[control_button_len_var,14] = joy_sens_const; // Default
    control_button_arr[control_button_len_var,15] = joy_sens_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = "joy_sens"; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "joy_sens"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","invert_yaw","SETTINGS_invert_yaw"); // Label
    control_button_arr[control_button_len_var,9] = "Invert camera yaw controls." // Description
    control_button_arr[control_button_len_var,10] = 0; // Type: Enum
    control_button_arr[control_button_len_var,11] = true; // Wrap value
    control_button_arr[control_button_len_var,12] = false; // Minimum Value
    control_button_arr[control_button_len_var,13] = true; // Maximum Value
    control_button_arr[control_button_len_var,14] = invert_yaw_const; // Default
    control_button_arr[control_button_len_var,15] = invert_yaw_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = "invert_yaw"; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "invert_yaw"; // Save key
    control_button_arr[control_button_len_var,18] = "OFF"; // Text for each option
    control_button_arr[control_button_len_var,19] = "ON";
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","invert_pitch","SETTINGS_invert_pitch"); // Label
    control_button_arr[control_button_len_var,9] = "Invert camera pitch controls." // Description
    control_button_arr[control_button_len_var,10] = 0; // Type: Enum
    control_button_arr[control_button_len_var,11] = true; // Wrap value
    control_button_arr[control_button_len_var,12] = false; // Minimum Value
    control_button_arr[control_button_len_var,13] = true; // Maximum Value
    control_button_arr[control_button_len_var,14] = invert_pitch_const; // Default
    control_button_arr[control_button_len_var,15] = invert_pitch_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = "invert_pitch"; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "invert_pitch"; // Save key
    control_button_arr[control_button_len_var,18] = "OFF"; // Text for each option
    control_button_arr[control_button_len_var,19] = "ON";
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","input_cam","SETTINGS_input_cam"); // Label
    control_button_arr[control_button_len_var,9] = "Camera control type." // Description
    control_button_arr[control_button_len_var,10] = 0; // Type: Enum
    control_button_arr[control_button_len_var,11] = true; // Wrap value
    control_button_arr[control_button_len_var,12] = false; // Minimum Value
    control_button_arr[control_button_len_var,13] = 5; // Maximum Value
    control_button_arr[control_button_len_var,14] = cam_const; // Default
    control_button_arr[control_button_len_var,15] = cam_joy_r_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = "input_cam"; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "cam"; // Save key
    control_button_arr[control_button_len_var,18+cam_mouse_const] = "MOUSE"; // Text for each option
    control_button_arr[control_button_len_var,18+cam_joy_r_const] = "R-JOY";
    control_button_arr[control_button_len_var,18+cam_joy_rs_const] = "R-JOY (SWITCH)";
    control_button_arr[control_button_len_var,18+cam_joy_l_const] = "L-JOY";
    control_button_arr[control_button_len_var,18+cam_button_const] = "BUTTON";
    control_button_arr[control_button_len_var,18+cam_dpad_const] = "D-PAD";
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","input_move","SETTINGS_input_move"); // Label
    control_button_arr[control_button_len_var,9] = "Move control type." // Description
    control_button_arr[control_button_len_var,10] = 0; // Type: Enum
    control_button_arr[control_button_len_var,11] = true; // Wrap value
    control_button_arr[control_button_len_var,12] = false; // Minimum Value
    control_button_arr[control_button_len_var,13] = 4; // Maximum Value
    control_button_arr[control_button_len_var,14] = move_const; // Default
    control_button_arr[control_button_len_var,15] = move_joy_l_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = "input_move"; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "move"; // Save key
    control_button_arr[control_button_len_var,18+move_button_const] = "BUTTON"; // Text for each option
    control_button_arr[control_button_len_var,18+move_joy_l_const] = "L-JOY";
    control_button_arr[control_button_len_var,18+move_dpad_const] = "D-PAD";
    control_button_arr[control_button_len_var,18+move_joy_r_const] = "R-JOY";
    control_button_arr[control_button_len_var,18+move_joy_rs_const] = "R-JOY (SWITCH)";
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","input_menu","SETTINGS_input_menu"); // Label
    control_button_arr[control_button_len_var,9] = "Menu control type." // Description
    control_button_arr[control_button_len_var,10] = 0; // Type: Enum
    control_button_arr[control_button_len_var,11] = true; // Wrap value
    control_button_arr[control_button_len_var,12] = false; // Minimum Value
    control_button_arr[control_button_len_var,13] = 4; // Maximum Value
    control_button_arr[control_button_len_var,14] = menu_const; // Default
    control_button_arr[control_button_len_var,15] = menu_dpad_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = "input_menu"; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "menu"; // Save key
    control_button_arr[control_button_len_var,18+menu_pc_const] = "BUTTON / MOUSE"; // Text for each option
    control_button_arr[control_button_len_var,18+menu_dpad_const] = "D-PAD";
    control_button_arr[control_button_len_var,18+menu_joy_l_const] = "L-JOY";
    control_button_arr[control_button_len_var,18+menu_joy_r_const] = "R-JOY";
    control_button_arr[control_button_len_var,18+menu_joy_rs_const] = "R-JOY (SWITCH)";
    control_button_len_var += 1;

    // The controls!
    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","up_input","SETTINGS_up_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Control
    control_button_arr[control_button_len_var,14] = up_key_const; // Default
    control_button_arr[control_button_len_var,15] = up_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = up_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "up_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","down_input","SETTINGS_down_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = down_key_const; // Default
    control_button_arr[control_button_len_var,15] = down_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = down_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "down_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","left_input","SETTINGS_left_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = left_key_const; // Default
    control_button_arr[control_button_len_var,15] = left_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = left_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "left_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","right_input","SETTINGS_right_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = right_key_const; // Default
    control_button_arr[control_button_len_var,15] = right_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = right_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "right_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","confirm_input","SETTINGS_confirm_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = confirm_key_const; // Default
    control_button_arr[control_button_len_var,15] = confirm_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = confirm_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "confirm_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","back_input","SETTINGS_back_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = back_key_const; // Default
    control_button_arr[control_button_len_var,15] = back_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = back_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "back_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","forward_input","SETTINGS_forward_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = forward_key_const; // Default
    control_button_arr[control_button_len_var,15] = forward_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = forward_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "forward_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","backward_input","SETTINGS_backward_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = backward_key_const; // Default
    control_button_arr[control_button_len_var,15] = backward_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = backward_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "backward_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","strafe_left_input","SETTINGS_strafe_left_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = strafe_left_key_const; // Default
    control_button_arr[control_button_len_var,15] = strafe_left_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = strafe_left_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "strafe_left_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","strafe_right_input","SETTINGS_strafe_right_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = strafe_right_key_const; // Default
    control_button_arr[control_button_len_var,15] = strafe_right_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = strafe_right_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "strafe_right_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","interact_input","SETTINGS_interact_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = interact_key_const; // Default
    control_button_arr[control_button_len_var,15] = interact_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = interact_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "interact_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","sprint_input","SETTINGS_sprint_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = sprint_key_const; // Default
    control_button_arr[control_button_len_var,15] = sprint_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = sprint_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "sprint_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","jump_input","SETTINGS_jump_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = jump_key_const; // Default
    control_button_arr[control_button_len_var,15] = jump_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = jump_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "jump_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","crouch_input","SETTINGS_crouch_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = crouch_key_const; // Default
    control_button_arr[control_button_len_var,15] = crouch_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = crouch_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "crouch_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","attack_input","SETTINGS_attack_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = attack_key_const; // Default
    control_button_arr[control_button_len_var,15] = attack_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = attack_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "attack_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","pause_input","SETTINGS_pause_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = pause_key_const; // Default
    control_button_arr[control_button_len_var,15] = pause_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = pause_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "pause_key"; // Save key 
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","debug_input","SETTINGS_debug_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = debug_key_const; // Default
    control_button_arr[control_button_len_var,15] = debug_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = debug_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "debug_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","turnaround_input","SETTINGS_turnaround_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = turnaround_key_const; // Default
    control_button_arr[control_button_len_var,15] = turnaround_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = turnaround_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "turnaround_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","ff_input","SETTINGS_ff_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = ff_key_const; // Default
    control_button_arr[control_button_len_var,15] = ff_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = ff_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "ff_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","slow_input","SETTINGS_slow_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = slow_key_const; // Default
    control_button_arr[control_button_len_var,15] = slow_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = slow_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "slow_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","cam_up_input","SETTINGS_cam_up_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Control
    control_button_arr[control_button_len_var,14] = cam_up_key_const; // Default
    control_button_arr[control_button_len_var,15] = cam_up_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = cam_up_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "cam_up_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","cam_down_input","SETTINGS_cam_down_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = cam_down_key_const; // Default
    control_button_arr[control_button_len_var,15] = cam_down_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = cam_down_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "cam_down_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","cam_left_input","SETTINGS_cam_left_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = cam_left_key_const; // Default
    control_button_arr[control_button_len_var,15] = cam_left_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = cam_left_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "cam_left_key"; // Save key
    control_button_len_var += 1;

    control_button_arr[control_button_len_var,8] = ini_read_string("SETTINGS","cam_right_input","SETTINGS_cam_right_input"); // Label
    control_button_arr[control_button_len_var,9] = "Temp" // Description
    control_button_arr[control_button_len_var,10] = 6; // Type: Button
    control_button_arr[control_button_len_var,14] = cam_right_key_const; // Default
    control_button_arr[control_button_len_var,15] = cam_right_button_const; // Default (Controller)
    control_button_arr[control_button_len_var,16] = cam_right_input_const; // Global variable to modify
    control_button_arr[control_button_len_var,17] = "cam_right_key"; // Save key
    control_button_len_var += 1;
    
    control_button_arr[control_button_len_var,8] = ini_read_string("MENU","back","MENU_back"); // Label
    control_button_arr[control_button_len_var,9] = "Back to the previous menu."
    control_button_arr[control_button_len_var,10] = -2;
    control_button_len_var += 1;

    state_len_var[5] = control_button_len_var;

    // Get current control values
    for (local.i=0; local.i<control_button_len_var; local.i+=1)
    {
        if control_button_arr[local.i,10] >= 0
        {
            for (local.j=0; local.j<8; local.j+=1;)
            {
                if control_button_arr[local.i,10] == 6 // Control
                {
                    // Clean and simple :3
                    control_button_arr[local.i,local.j] = global.input_key_arr[control_button_arr[local.i,16],local.j];
                }
                else
                {
                    // What a mess lol
                    execute_string("
                        control_button_arr["+string(local.i)+","+string(local.j)+"] = global."+control_button_arr[local.i,16]+"_var["+string(local.j)+"];
                    ");
                }
            }
        }
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    // Control Listen
    if control_listen_var
    {
        if control_button_arr[button_state_var,10] == 6 && state_var == 5
        {
            if keyboard_check_pressed(vk_anykey)
            {
                control_button_arr[button_state_var,player_id_var] = keyboard_lastkey;
                control_listen_var = false;
                set_var = true;
            }
            if mouse_check_button_pressed(mb_any)
            {
                control_button_arr[button_state_var,player_id_var] = -mouse_lastbutton;
                control_listen_var = false;
                set_var = true;
            }
            if joy_count_scr() >= global.joy_id_var[player_id_var]
            {
                for (local.i=0; local.i<=joy_buttons_scr(global.joy_id_var[player_id_var]); local.i+=1;)
                {
                    if joy_pressed_scr(global.joy_id_var[player_id_var],local.i)
                    {
                        control_button_arr[button_state_var,player_id_var] = local.i-6;
                        control_listen_var = false;
                        set_var = true;
                        break;
                    }
                }
            }
        }
        else { control_listen_var = false; }
    }
    else
    {
        bg_scroll_var += global.true_delta_time_var;
        // Text Stretch
        time_var = (time_var+global.true_delta_time_var) mod 80;
        str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
        // Scroll
        if global.input_press_arr[up_input_const,0] { button_state_var -= 1; fmod_snd_play_scr(select_snd); }
        if global.input_press_arr[down_input_const,0] { button_state_var += 1; fmod_snd_play_scr(select_snd); }
        button_state_var = mod_scr(button_state_var-state_start_var[state_var],state_len_var[state_var])+state_start_var[state_var];
        // Lerp
        if do_scroll_focal_var
        {
            scroll_focal_var = median(button_state_var-2,button_state_var+2,scroll_focal_var);
            local.state = scroll_focal_var
        }
        else { local.state = button_state_var; }
        local.target_scroll = -96*median(0,state_len_var[state_var]-5,local.state-state_start_var[state_var]-2);
        local.scroll_diff = abs(local.target_scroll-scroll_var);
        local.scroll_rate = max(scroll_min_var,local.scroll_diff*scroll_rate_var)*global.true_delta_time_var;
        scroll_var += min(local.scroll_diff,local.scroll_rate)*sign(local.target_scroll-scroll_var);
        // Normal states
        if state_var != 5 
        {
            // Confirm
            if global.input_press_arr[confirm_input_const,0]
            {
                local.snd = true;
                switch button_arr[button_state_var,3]
                {
                    case -4: // Change State
                    {
                        state_var = button_arr[button_state_var,0];
                        event_user(2);
                        break;
                    }
                    case -3: // Reset to default
                    {
                        if show_message_ext("Reset all settings? (CANNOT BE UNDONE)","YES","NO","") == 1 { event_user(1); }
                        global.input_arr[confirm_input_const,0] = 0;
                        break;
                    }
                    case -2: // Go Back
                    {
                        if state_var > 0
                        {
                            state_var = 0;
                            event_user(2);
                        }
                        else
                        {
                            local.dont = false;
                            if set_var
                            {
                                local.message = show_message_ext("You have unsaved changes, would you like to apply them?","YES","NO","CANCEL");
                                if local.message == 0 || local.message == 3 { local.dont = true; }
                                if local.message == 1 { event_user(0); }
                                global.input_arr[confirm_input_const,0] = 0;
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
                    case -1: // Apply settings
                    {
                        if set_var
                        {
                            if show_message_ext("Apply settings?","YES","NO","") == 1 { event_user(0); }
                            global.input_arr[confirm_input_const,0] = 0;
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
                                button_arr[button_state_var,7]-button_arr[button_state_var,6]+1
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
                        global.input_arr[confirm_input_const,0] = 0;
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
                        global.input_arr[confirm_input_const,0] = 0;
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
                        global.input_arr[confirm_input_const,0] = 0;
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
                        global.input_arr[confirm_input_const,0] = 0;
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
                        global.input_arr[confirm_input_const,0] = 0;
                        break;
                    }
                    default: { local.snd = false; break; }
                }
                if local.snd { fmod_snd_play_scr(confirm_snd); }
            }
            // Left or Right
            if global.input_press_arr[left_input_const,0] || global.input_press_arr[right_input_const,0]
            {
                local.snd = true;
                local.add = (global.input_press_arr[right_input_const,0] > 0)-(global.input_press_arr[left_input_const,0] > 0);
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
                                button_arr[button_state_var,7]-button_arr[button_state_var,6]+1
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
                    default: { local.snd = false; }
                }
                if local.snd { fmod_snd_play_scr(select_snd); }
            }
        }
        else // Control State
        {
            /*
            Key
                0 - player_id_var
                1 - 8
                2 - 9
                3 - 10
                4 - 11
                5 - 14
                6 - 12
                7 - 13
                8 - 16
                9+ - 17+
            */
            // Confirm
            if global.input_press_arr[confirm_input_const,0]
            {
                local.snd = true;
                switch control_button_arr[button_state_var,10]
                {
                    case -6: // Preset
                    {
                        if show_message_ext("Apply preset? (CANNOT BE UNDONE)","YES","NO","") == 1
                        {
                            switch control_button_arr[button_state_var,0]
                            {
                                case 0: { preset_var = "pc"; break; }
                                case 1: { preset_var = "xbox"; break; }
                                case 2: { preset_var = "ps"; break; }
                                case 3: { preset_var = "switch"; break; }
                                case 4: { preset_var = "snes"; break; }
                                case 5:
                                {
                                    preset_var = get_string("Custom preset","");
                                    break;
                                }
                            }
                            event_user(5);
                        }
                        global.input_arr[confirm_input_const,0] = 0;
                        break;
                    }
                    case -4: // Change State
                    {
                        state_var = control_button_arr[button_state_var,0];
                        event_user(2);
                        break;
                    }
                    case -2: // Go Back
                    {
                        state_var = 0;
                        event_user(2);
                        break;
                    }
                    case 0: // Enum
                    {
                        control_button_arr[button_state_var,player_id_var] += 1;
                        if control_button_arr[button_state_var,11] // Wrap
                        { 
                            control_button_arr[button_state_var,player_id_var] = mod_scr
                            (
                                control_button_arr[button_state_var,player_id_var]-control_button_arr[button_state_var,12],
                                control_button_arr[button_state_var,13]-control_button_arr[button_state_var,12]+1
                            )+control_button_arr[button_state_var,12];
                        }
                        else
                        {
                            control_button_arr[button_state_var,0] = median
                            (
                                control_button_arr[button_state_var,0],
                                control_button_arr[button_state_var,12],
                                control_button_arr[button_state_var,13]
                            );
                        }
                        set_var = true;
                        break;
                    }
                    case 1: // Unclamped
                    {
                        local.new = get_integer(control_button_arr[button_state_var,9],control_button_arr[button_state_var,player_id_var]);
                        if local.new != control_button_arr[button_state_var,player_id_var]
                        {
                            control_button_arr[button_state_var,player_id_var] = local.new;
                            set_var = true;
                        }
                        global.input_arr[confirm_input_const,0] = 0;
                        break;
                    }
                    case 2: // Clamped
                    {
                        local.new = median
                        (
                            get_integer(control_button_arr[button_state_var,9],control_button_arr[button_state_var,player_id_var]),
                            control_button_arr[button_state_var,12],
                            control_button_arr[button_state_var,13]
                        );
                        if local.new != control_button_arr[button_state_var,player_id_var]
                        {
                            control_button_arr[button_state_var,player_id_var] = local.new;
                            set_var = true;
                        }
                        global.input_arr[confirm_input_const,0] = 0;
                        break;
                    }
                    case 3: // Min Clamped
                    {
                        local.new = max
                        (
                            get_integer(control_button_arr[button_state_var,9],control_button_arr[button_state_var,player_id_var]),
                            control_button_arr[button_state_var,12]
                        );
                        if local.new != control_button_arr[button_state_var,player_id_var]
                        {
                            control_button_arr[button_state_var,player_id_var] = local.new;
                            set_var = true;
                        }
                        global.input_arr[confirm_input_const,0] = 0;
                        break;
                    }
                    case 4: // Max Clamped
                    {
                        local.new = min
                        (
                            get_integer(control_button_arr[button_state_var,9],control_button_arr[button_state_var,player_id_var]),
                            control_button_arr[button_state_var,13]
                        );
                        if local.new != control_button_arr[button_state_var,player_id_var]
                        {
                            control_button_arr[button_state_var,player_id_var] = local.new;
                            set_var = true;
                        }
                        global.input_arr[confirm_input_const,0] = 0;
                        break;
                    }
                    case 5: // String
                    {
                        local.new = get_string(control_button_arr[button_state_var,9],control_button_arr[button_state_var,player_id_var]);
                        if local.new != control_button_arr[button_state_var,player_id_var]
                        {
                            control_button_arr[button_state_var,player_id_var] = local.new;
                            set_var = true;
                        }
                        global.input_arr[confirm_input_const,0] = 0;
                        break;
                    }
                    case 6: // Control
                    {
                        control_listen_var = true;
                        break;
                    }
                    default: { local.snd = false; }
                }
                if local.snd { fmod_snd_play_scr(confirm_snd); }
            }
            // Left or Right
            if global.input_press_arr[left_input_const,0] || global.input_press_arr[right_input_const,0]
            {
                local.snd = true;
                local.add = (global.input_press_arr[right_input_const,0] > 0)-(global.input_press_arr[left_input_const,0] > 0);
                switch control_button_arr[button_state_var,10]
                {
                    case -6:
                    {
                        control_button_arr[button_state_var,0] = mod_scr(control_button_arr[button_state_var,0]+local.add,7);
                        break;
                    }
                    case -5: // Current Player
                    {
                        player_id_var = mod_scr(player_id_var+local.add,8);
                        break;
                    }
                    case 0:
                    case 2:
                    {
                        control_button_arr[button_state_var,player_id_var] += local.add;
                        if control_button_arr[button_state_var,11] // Wrap
                        { 
                            control_button_arr[button_state_var,player_id_var] = mod_scr
                            (
                                control_button_arr[button_state_var,player_id_var]-control_button_arr[button_state_var,12],
                                control_button_arr[button_state_var,13]-control_button_arr[button_state_var,12]+1
                            )+control_button_arr[button_state_var,12];
                        }
                        else
                        {
                            control_button_arr[button_state_var,player_id_var] = median
                            (
                                control_button_arr[button_state_var,player_id_var],
                                control_button_arr[button_state_var,12],
                                control_button_arr[button_state_var,13]
                            );
                        }
                        set_var = true;
                        break;
                    }
                    case 1: { control_button_arr[button_state_var,player_id_var] += local.add; break; }
                    case 3: 
                    {
                        control_button_arr[button_state_var,player_id_var] += local.add;
                        control_button_arr[button_state_var,player_id_var] = max(control_button_arr[button_state_var,player_id_var],control_button_arr[button_state_var,12]);
                        set_var = true;
                        break;
                    }
                    case 4: 
                    {
                        control_button_arr[button_state_var,player_id_var] += local.add;
                        control_button_arr[button_state_var,player_id_var] = min(control_button_arr[button_state_var,player_id_var],control_button_arr[button_state_var,13]);
                        set_var = true;
                        break;
                    }
                    default: { local.snd = false; }
                }
                if local.snd { fmod_snd_play_scr(select_snd); }
            }
        }
    }
');
// Apply Settings
object_event_add
(argument0,ev_other,ev_user0,'
    set_var = false;
    ini_open("settings.ini");
    for (local.i=0; local.i<button_len_var; local.i+=1;)
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
    for (local.i=0; local.i<control_button_len_var; local.i+=1;)
    {
        if control_button_arr[local.i,10] >= 0
        {
            for (local.j=0; local.j<8; local.j+=1;)
            {
                if control_button_arr[local.i,10] == 6
                {
                    // Clean and simple :3
                    global.input_key_arr[control_button_arr[local.i,16],local.j] = control_button_arr[local.i,local.j];
                }
                else 
                {
                    // What a mess lol
                    execute_string("
                        global."+control_button_arr[local.i,16]+"_var["+string(local.j)+"] = control_button_arr["+string(local.i)+","+string(local.j)+"]
                    ");
                }
                if is_string(control_button_arr[local.i,local.j])
                { ini_write_string("CONTROL",control_button_arr[local.i,17]+"_"+string(local.j),control_button_arr[local.i,local.j]); }
                else { ini_write_real("CONTROL",control_button_arr[local.i,17]+"_"+string(local.j),control_button_arr[local.i,local.j]); }
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
// Reset Settings
object_event_add
(argument0,ev_other,ev_user1,'
    for (local.i=0; local.i<button_len_var; local.i+=1)
    {
        if button_arr[local.i,3] >= 0
        { button_arr[local.i,0] = button_arr[local.i,5]; }
    }
    for (local.i=0; local.i<control_button_len_var; local.i+=1;)
    {
        if button_arr[local.i,11] >= 0
        {
            for (local.j=0; local.j<8; local.j+=1;)
            {
                // Controller
                if local.j > 0 { button_arr[local.i,local.j] = button_arr[local.i,15]; }
                // Keyboard
                else { button_arr[local.i,local.j] = button_arr[local.i,14]; }
            }
        }
    }
    event_user(0);
');
// Change State
object_event_add
(argument0,ev_other,ev_user2,'
    time_var = 0;
    button_state_var = state_start_var[state_var];
    scroll_var = 0;
    scroll_focal_var = button_state_var;
');
// Load Control Preset
object_event_add
(argument0,ev_other,ev_user5,'
    if file_exists(working_directory+"\control_preset_"+preset_var+".ini")
    {
        ini_open("control_preset_"+preset_var+".ini");
        for (local.i=0; local.i<control_button_len_var; local.i+=1)
        {
            if control_button_arr[local.i,10] >= 0
            {
                if player_id_var > 0 { local.def = control_button_arr[local.i,15]; }
                else { local.def = control_button_arr[local.i,14]; }
                if is_string(control_button_arr[local.i,player_id_var])
                { control_button_arr[local.i,player_id_var] = ini_read_string("CONTROL",control_button_arr[local.i,17],local.def); }
                else { control_button_arr[local.i,player_id_var] = ini_read_real("CONTROL",control_button_arr[local.i,17],local.def); }
            }
        }
        ini_close();
        set_var = true;
    }
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);

    draw_bg_tiled_stretch_scr(settings_bg,bg_scroll_var,0,512,0,2);
    
    draw_str_shadow_scr
    (
        "SETTINGS",
        -20,20,0.95,0.95,0.125,fa_right,fa_top,
        -4,4,str_bg_color_var,c_yellow,2,0
    );
    
    if state_var != 5 // Normal State
    {
        for (local.i=0; local.i<state_len_var[state_var]; local.i+=1)
        {
            local.button = local.i+state_start_var[state_var];
            if local.button != button_state_var
            {
                
                draw_str_shadow_scr
                (
                    button_arr[local.button,1],
                    96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                    -4,4,str_bg_color_var,c_yellow,2,0
                );
                
                local.str = 0;
                switch button_arr[local.button,3]
                {
                    case 0: { local.str = string(button_arr[local.button,button_arr[local.button,0]+9]); break; }
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    {
                        local.str = string(button_arr[local.button,0]);
                        break;
                    }
                }
                if is_string(local.str)
                {
                    draw_str_shadow_scr
                    (
                        local.str,
                        500,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                        -4,4,str_bg_color_var,c_yellow,2,0
                    );
                }
            }
        }
        local.ytmp = 144+(96*(button_state_var-state_start_var[state_var]))+scroll_var;
        draw_spr_stretch_scr(select_spr,0,96,local.ytmp,132,0,fa_left,fa_top);
        draw_str_select_scr
        (
            button_arr[button_state_var,1],
            96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
            -4,4,str_bg_select_color_var,c_white,2,0,0.75
        );
        
        local.str = 0;
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
        }
        if is_string(local.str)
        {
            draw_str_shadow_scr
            (
                local.str,
                500,144+(96*(button_state_var-state_start_var[state_var]))+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_select_color_var,c_white,2,0
            );
        }
    }
    else // Control State
    {
        for (local.i=0; local.i<control_button_len_var; local.i+=1)
        {
            if local.i != button_state_var
            {
                
                draw_str_shadow_scr
                (
                    control_button_arr[local.i,8],
                    96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                    -4,4,str_bg_color_var,c_yellow,2,0
                );
                
                local.str = 0;
                switch control_button_arr[local.i,10]
                {
                    case -6: { local.str = string(control_button_arr[local.i,control_button_arr[local.i,0]+18]); break; }
                    case -5: { local.str = string(player_id_var); break; }
                    case 0: { local.str = string(control_button_arr[local.i,control_button_arr[local.i,player_id_var]+18]); break; }
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    {
                        local.str = string(control_button_arr[local.i,player_id_var]);
                        break;
                    }
                    case 6:
                    {
                        local.str = key_to_str_scr(control_button_arr[local.i,player_id_var]);
                        break;
                    }
                }
                if is_string(local.str)
                {
                    draw_str_shadow_scr
                    (
                        local.str,
                        500,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                        -4,4,str_bg_color_var,c_yellow,2,0
                    );
                }
            }
        }
        local.ytmp = 144+(96*button_state_var)+scroll_var;
        draw_spr_stretch_scr(select_spr,0,96,local.ytmp,132,0,fa_left,fa_top);
        draw_str_select_scr
        (
            control_button_arr[button_state_var,8],
            96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
            -4,4,str_bg_select_color_var,c_white,2,0,0.75
        );
        
        local.str = 0;
        switch control_button_arr[button_state_var,10]
        {
            case -6: { local.str = string(control_button_arr[button_state_var,control_button_arr[button_state_var,0]+18]); break; }
            case -5: { local.str = string(player_id_var); break; }
            case 0: { local.str = string(control_button_arr[button_state_var,control_button_arr[button_state_var,player_id_var]+18]); break; }
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            {
                local.str = string(control_button_arr[button_state_var,player_id_var]);
                break;
            }
            case 6:
            {
                local.str = key_to_str_scr(control_button_arr[button_state_var,player_id_var]);
                break;
            }
        }
        if is_string(local.str)
        {
            draw_str_shadow_scr
            (
                local.str,
                500,144+(96*button_state_var)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_select_color_var,c_white,2,0
            );
        }
    }
');