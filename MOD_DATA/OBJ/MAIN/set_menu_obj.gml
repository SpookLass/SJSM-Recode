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

    ini_open(global.lang_var);

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

    button_arr[button_len_var,0] = global.tps_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","tps","SETTINGS_tps");; // Label
    button_arr[button_len_var,2] = "How often the game updates." // Description
    button_arr[button_len_var,3] = 3; // Type: Min clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = tps_const; // Default value
    button_arr[button_len_var,6] = 1; // Minimum Value
    button_arr[button_len_var,8] = "tps"; // Global variable to modify
    button_len_var += 1;

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

    button_arr[button_len_var,0] = global.crouch_toggle_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","crouch_toggle","SETTINGS_crouch_toggle"); // Label
    button_arr[button_len_var,2] = "Whether crouch is toggled or held." // Description
    button_arr[button_len_var,3] = 0; // Type: Enum
    button_arr[button_len_var,4] = true; // Wrap value
    button_arr[button_len_var,5] = crouch_toggle_const; // Default value
    button_arr[button_len_var,6] = false; // Minimum Value
    button_arr[button_len_var,7] = true; // Maximum Value
    button_arr[button_len_var,8] = "crouch_toggle"; // Global variable to modify
    button_arr[button_len_var,9] = "OFF"; // Text for each option
    button_arr[button_len_var,10] = "ON";
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
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","idle_bob","SETTINGS_idle_bob"); // Label
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

    button_arr[button_len_var,0] = global.fps_update_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","fps_update","SETTINGS_fps_update"); // Label
    button_arr[button_len_var,2] = "How often the game checks the FPS." // Description
    button_arr[button_len_var,3] = 3; // Type: Min clamped Number
    button_arr[button_len_var,4] = false; // Wrap value
    button_arr[button_len_var,5] = fps_update_const; // Default value
    button_arr[button_len_var,6] = 1; // Minimum Value
    button_arr[button_len_var,8] = "fps_update"; // Global variable to modify
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

    button_arr[button_len_var,0] = global.lang_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","lang","SETTINGS_lang"); // Label
    button_arr[button_len_var,2] = "Language file to use." // Description
    button_arr[button_len_var,3] = 5; // Type: String
    button_arr[button_len_var,5] = lang_const; // Default value
    button_arr[button_len_var,8] = "lang"; // Global variable to modify
    button_len_var += 1;

    button_arr[button_len_var,0] = global.killer_voice_var;
    button_arr[button_len_var,1] = ini_read_string("SETTINGS","killer_voice","SETTINGS_killer_voice"); // Label
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
    if global.input_press_arr[up_input_const,0] { button_state_var -= 1; }
    if global.input_press_arr[down_input_const,0] { button_state_var += 1; }
    button_state_var = mod_scr(button_state_var,button_len_var);
    // Confirm
    if global.input_press_arr[confirm_input_const,0]
    {
        switch button_arr[button_state_var,3]
        {
            case -3: // Reset to default
            {
                if show_message_ext("Reset all settings? (CANNOT BE UNDONE)","YES","NO","") == 1 { event_user(1); }
                global.input_arr[confirm_input_const,0] = 0;
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
                    instance_destroy();
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
        }
    }
    if global.input_press_arr[left_input_const,0] || global.input_press_arr[right_input_const,0]
	{
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