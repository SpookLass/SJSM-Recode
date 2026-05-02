/*
-----------------
Settings

Yet another array, this time for settings.
Type
    0 - Enum
    1 - Number
    2 - Clamped Number
    3 - Max Clamped Number
    4 - Min Clamped Number
    5 - String
    6 - Pointer
        Like an enum, but it points to another value
    7 - Input
    8 - Category
    9 - Monster Enum
Category
    0 - Main
    1 - Gameplay
    2 - Visuals
    3 - Audio
    4 - Performance
    5 - HUD
    6 - Accessibility
    7 - Controls (Sub)
    8 - Inputs
    9 - Controls
-----------------
*/
draw_load_scr("Loading settings...");
// Variables
    globalvar set_arr;
    globalvar set_label_arr;
    globalvar set_desc_arr;
    globalvar set_default_arr;
    globalvar set_pointer_arr;
    globalvar set_state_arr;
    global.set_len_var = 0;
    global.set_state_len_var = 0;
// States
    local.main = set_add_state_scr("settings",true,-1);
    local.gameplay = set_add_state_scr("gameplay",true,-1);
    local.visual = set_add_state_scr("visual",true,-1);
    local.audio = set_add_state_scr("audio",true,-1);
    local.hud = set_add_state_scr("hud",true,-1);
    local.performance = set_add_state_scr("performance",true,-1);
    local.access = set_add_state_scr("access",true,-1);
    local.control = set_add_state_scr("control",true,-1);
    local.input = set_add_state_scr("input",true,local.control);
    local.control_sub = set_add_state_scr("control",true,local.control);
    local.fun = set_add_state_scr("fun",true,-1);
    local.theme_toggle = set_add_state_scr("theme_toggle",true,local.audio);
// Main
    // Gameplay
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
        local.set = set_add_scr(local.gameplay,"gameplay","gameplay",true,set_state_const,0,0,false,local.main,false,false);
        set_add_default_scr(local.set,0);
    // Visual
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
        local.set = set_add_scr(local.visual,"visual","visual",true,set_state_const,0,0,false,local.main,false,false);
        set_add_default_scr(local.set,0);
    // Audio
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
        local.set = set_add_scr(local.audio,"audio","audio",true,set_state_const,0,0,false,local.main,false,false);
        set_add_default_scr(local.set,0);
    // Performance
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
        local.set = set_add_scr(local.performance,"performance","performance",true,set_state_const,0,0,false,local.main,false,false);
        set_add_default_scr(local.set,0);
    // HUD
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
        local.set = set_add_scr(local.hud,"hud","hud",true,set_state_const,0,0,false,local.main,false,false);
        set_add_default_scr(local.set,0);
    // Accessibility
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
        local.set = set_add_scr(local.access,"access","access",true,set_state_const,0,0,false,local.main,false,false);
        set_add_default_scr(local.set,0);
    // Control
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
        local.set = set_add_scr(local.control,"control","control",true,set_state_const,0,0,false,local.main,false,false);
        set_add_default_scr(local.set,0);
    // Fun
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
        local.set = set_add_scr(local.fun,"fun","fun",true,set_state_const,0,0,false,local.main,false,false);
        set_add_default_scr(local.set,0);
// Gameplay
    // Reset Speed
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("reset_spd","reset_spd","reset_spd",true,set_enum_const,0,2,true,local.gameplay,false,true);
        // Labels
            set_add_label_scr(local.set,0,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,1,"mon",true,"");
            set_add_label_scr(local.set,2,"locale",true,"");
        // Defaults
            set_add_default_scr(local.set,reset_spd_const);
// Visuals
    // FOV
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("fov","fov","fov",true,set_clamp_num_const,1,179,true,local.visual,false,false);
        // Defaults
            set_add_default_scr(local.set,fov_const);
    // Dynamic FOV
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("dynamic_fov","dynamic_fov","dynamic_fov",true,set_clamp_num_const,0,100,true,local.visual,false,false);
        // Defaults
            set_add_default_scr(local.set,dynamic_fov_const);
    // Anti Alias
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("anti_alias","anti_alias","anti_alias",true,set_enum_const,false,true,true,local.visual,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,anti_alias_const);
    // Vertical Sync
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("vsync","vsync","vsync",true,set_enum_const,false,true,true,local.visual,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,vsync_const);
    // Fullscreen
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("fullscreen","fullscreen","fullscreen",true,set_enum_const,false,true,true,local.visual,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,fullscreen_const);
    // Splitscreen
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("splitscreen","splitscreen","splitscreen",true,set_enum_const,false,true,true,local.visual,false,false);
        // Labels
            set_add_label_scr(local.set,false,"hor",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"vert",true,"");
        // Defaults
            set_add_default_scr(local.set,splitscreen_const);
    // Color
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("color","color","color",true,set_enum_const,0,2,true,local.visual,false,true);
        // Labels
            set_add_label_scr(local.set,0,"all",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,1,"rm",true,"");
            set_add_label_scr(local.set,2,"screen",true,"");
        // Defaults
            set_add_default_scr(local.set,color_const);
    // Move Bob
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("move_bob","move_bob","move_bob",true,set_min_clamp_num_const,0,0,false,local.visual,false,false);
        // Defaults
            set_add_default_scr(local.set,move_bob_const);
    // Idle Bob
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("idle_bob","idle_bob","idle_bob",true,set_min_clamp_num_const,0,0,false,local.visual,false,false);
        // Defaults
            set_add_default_scr(local.set,idle_bob_const);
    // Shake Type
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("shake_type","shake_type","shake_type",true,set_enum_const,0,2,true,local.visual,false,true);
        // Labels
            set_add_label_scr(local.set,0,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,1,"old",true,"");
            set_add_label_scr(local.set,2,"modern",true,"");
        // Defaults
            set_add_default_scr(local.set,shake_type_const);
    // Resolution Width
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("res_w","res_w","res_w",true,set_min_clamp_num_const,1,0,false,local.visual,false,false);
        // Defaults
            set_add_default_scr(local.set,res_w_const);
    // Resolution Height
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("res_h","res_h","res_h",true,set_min_clamp_num_const,1,0,false,local.visual,false,false);
        // Defaults
            set_add_default_scr(local.set,res_h_const);
// Audio
    // Master Volume
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("vol","vol","vol",true,set_clamp_num_const,0,100,true,local.audio,false,false);
        // Defaults
            set_add_default_scr(local.set,vol_const);
    // Music Volume
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("mus_vol","mus_vol","mus_vol",true,set_clamp_num_const,0,100,true,local.audio,false,false);
        // Defaults
            set_add_default_scr(local.set,mus_vol_const);
    // Enemy Volume
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("mon_vol","mon_vol","mon_vol",true,set_clamp_num_const,0,100,true,local.audio,false,false);
        // Defaults
            set_add_default_scr(local.set,mon_vol_const);
    // SFX Volume
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("sfx_vol","sfx_vol","sfx_vol",true,set_clamp_num_const,0,100,true,local.audio,false,false);
        // Defaults
            set_add_default_scr(local.set,sfx_vol_const);
    // Voice Volume
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("voice_vol","voice_vol","voice_vol",true,set_clamp_num_const,0,100,true,local.audio,false,false);
        // Defaults
            set_add_default_scr(local.set,voice_vol_const);
    // Killer Voice
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_sp_scr("killer_voice","killer_voice","killer_voice",true,set_mon_enum_const,0,3,true,local.audio,false,true,"killer");
        // Labels
            set_add_label_scr(local.set,0,"og",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,1,"hd",true,"");
            set_add_label_scr(local.set,2,"mod",true,"");
            set_add_label_scr(local.set,3,"ryan",true,"");
        // Defaults
            set_add_default_scr(local.set,killer_voice_const);
    // Random Theme
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("rand_theme","rand_theme","rand_theme",true,set_enum_const,false,true,true,local.audio,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,rand_theme_const);
    // Attenuate Wake Sounds
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("wake_3d","wake_3d","wake_3d",true,set_enum_const,false,true,true,local.audio,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,wake_3d_const);
    // Pitch bending
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("pitch_bend","pitch_bend","pitch_bend",true,set_enum_const,false,true,true,local.audio,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,pitch_bend_const);
    // Doppler
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("doppler","doppler","doppler",true,set_enum_const,false,true,true,local.audio,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,doppler_const);
    // Pause Theme
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("pause_theme","pause_theme","pause_theme",true,set_enum_const,false,true,true,local.audio,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,pause_theme_const);
    // Themes
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("theme","theme","theme",true,set_enum_const,-1,2,true,local.audio,false,true);
        // Labels
            set_add_label_scr(local.set,-1,"rand",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,0,"main",true,"");
            set_add_label_scr(local.set,1,"old",true,"");
            set_add_label_scr(local.set,2,"rom",true,"");
        // Defaults
            set_add_default_scr(local.set,theme_const);
    // Theme Toggle
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
        local.set = set_add_scr(local.theme_toggle,"theme_toggle","theme_toggle",true,set_state_const,0,0,false,local.audio,false,false);
        set_add_default_scr(local.set,0);
// Performance
    // FPS
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("fps","fps","fps",true,set_min_clamp_num_const,1,0,false,local.performance,false,false);
        // Defaults
            set_add_default_scr(local.set,fps_const);
    // TPS
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("tps","tps","tps",true,set_min_clamp_num_const,1,0,false,local.performance,false,false);
        // Defaults
            set_add_default_scr(local.set,tps_const);
    // Maximum particle count
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("max_part","max_part","max_part",true,set_min_clamp_num_const,0,0,false,local.performance,false,false);
        // Defaults
            set_add_default_scr(local.set,max_part_const);
    // Collision Precision
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("coll_prec","coll_prec","coll_prec",true,set_enum_const,false,true,true,local.performance,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,coll_prec_const);
    // Memory Saving
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("mem_save","mem_save","mem_save",true,set_enum_const,false,true,true,local.performance,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,coll_prec_const);
// HUD
    // Language
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("lang","lang","lang",true,set_str_const,0,0,false,local.hud,false,false);
        // Defaults
            set_add_default_scr(local.set,"en_us.ini");
    // Names
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("name","name","name",true,set_enum_const,0,4,true,local.hud,false,true);
        // Labels
            set_add_label_scr(local.set,name_og_const,"og",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,name_hd_const,"hd",true,"");
            set_add_label_scr(local.set,name_fanon_const,"fanon",true,"");
            set_add_label_scr(local.set,name_num_og_const,"og_num",true,"");
            set_add_label_scr(local.set,name_num_hd_const,"hd_num",true,"");
        // Defaults
            set_add_default_scr(local.set,name_hd_const);
    // Monster HUD
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("mon_hud","mon_hud","mon_hud",true,set_enum_const,0,2,true,local.hud,false,true);
        // Labels
            set_add_label_scr(local.set,0,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,1,"on",true,"");
            set_add_label_scr(local.set,2,"dur",true,"");
        // Defaults
            set_add_default_scr(local.set,mon_hud_const);
    // Room HUD
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("rm_hud","rm_hud","rm_hud",true,set_enum_const,false,true,true,local.hud,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,rm_hud_const);
    // TPS & FPS HUD
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("tps_hud","tps_hud","tps_hud",true,set_enum_const,false,true,true,local.hud,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,tps_hud_const);
    // Time HUD
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("time_hud","time_hud","time_hud",true,set_enum_const,false,true,true,local.hud,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,time_hud_const);
    // Bar HUD
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("bar_hud","bar_hud","bar_hud",true,set_enum_const,0,2,true,local.hud,false,true);
        // Labels
            set_add_label_scr(local.set,0,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,1,"on",true,"");
            set_add_label_scr(local.set,2,"old",true,"");
        // Defaults
            set_add_default_scr(local.set,bar_hud_const);
    // FPS Update Rate
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("fps_update","fps_update","fps_update",true,set_min_clamp_num_const,1,0,false,local.hud,false,false);
        // Defaults
            set_add_default_scr(local.set,fps_update_const);
// Accessibility
    // Reduce Flashing
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("reduce_flash","reduce_flash","reduce_flash",true,set_enum_const,false,true,true,local.access,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,reduce_flash_const);
    // Subtitles
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("sub","sub","sub",true,set_enum_const,0,2,true,local.access,false,true);
        // Labels
            set_add_label_scr(local.set,0,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,1,"voice",true,"");
            set_add_label_scr(local.set,2,"all",true,"");
        // Defaults
            set_add_default_scr(local.set,bar_hud_const);
    // HUD Scale
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("hud_scale","hud_scale","hud_scale",true,set_min_clamp_num_const,0,0,false,local.access,false,false);
        // Defaults
            set_add_default_scr(local.set,hud_scale_const);
// Controls (Sub)
    // Reduce Flashing
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("crouch_toggle","crouch_toggle","crouch_toggle",true,set_enum_const,false,true,true,local.control_sub,true,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,crouch_toggle_const,true);
    // Joystick ID
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("joy_id","joy_id","joy_id",true,set_clamp_num_const,0,7,true,local.control_sub,true,false);
        // Defaults
            set_add_default_scr(local.set,0,false,0,1,2,3,4,5,6);
    // Sensitivity
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("sens","sens","sens",true,set_min_clamp_num_const,1,0,true,local.control_sub,true,false);
        // Defaults
            set_add_default_scr(local.set,sens_const,true);
    // Invert Yaw
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("invert_yaw","invert_yaw","invert_yaw",true,set_enum_const,false,true,true,local.control_sub,true,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,invert_yaw_const,true);
    // Invert Pitch
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("invert_pitch","invert_pitch","invert_pitch",true,set_enum_const,false,true,true,local.control_sub,true,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,invert_pitch_const,true);
    // Camera Controls
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("input_cam","input_cam","input_cam",true,set_enum_const,0,5,true,local.control_sub,true,true);
        // Labels
            set_add_label_scr(local.set,cam_mouse_const,"mouse",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,cam_joy_r_const,"rjoy",true,"");
            set_add_label_scr(local.set,cam_joy_rs_const,"rjoys",true,"");
            set_add_label_scr(local.set,cam_joy_l_const,"ljoy",true,"");
            set_add_label_scr(local.set,cam_button_const,"button",true,"");
            set_add_label_scr(local.set,cam_dpad_const,"dpad",true,"");
        // Defaults
            set_add_default_scr(local.set,cam_const,2,cam_joy_r_const);
    // Movement Controls
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("input_move","input_move","input_move",true,set_enum_const,0,4,true,local.control_sub,true,true);
        // Labels
            set_add_label_scr(local.set,move_button_const,"button",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,move_joy_l_const,"ljoy",true,"");
            set_add_label_scr(local.set,move_dpad_const,"dpad",true,"");
            set_add_label_scr(local.set,move_joy_r_const,"rjoy",true,"");
            set_add_label_scr(local.set,move_joy_rs_const,"rjoys",true,"");
        // Defaults
            set_add_default_scr(local.set,move_const,2,move_joy_l_const);
    // Menu Controls
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("input_menu","input_menu","input_menu",true,set_enum_const,0,4,true,local.control_sub,true,true);
        // Labels
            set_add_label_scr(local.set,menu_pc_const,"pc",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,menu_dpad_const,"dpad",true,"");
            set_add_label_scr(local.set,menu_joy_l_const,"ljoy",true,"");
            set_add_label_scr(local.set,menu_joy_r_const,"rjoy",true,"");
            set_add_label_scr(local.set,menu_joy_rs_const,"rjoys",true,"");
        // Defaults
            set_add_default_scr(local.set,menu_const,2,menu_dpad_const);
// Inputs
    set_add_input_scr("up",local.input);
    set_add_input_scr("down",local.input);
    set_add_input_scr("left",local.input);
    set_add_input_scr("right",local.input);
    set_add_input_scr("confirm",local.input);
    set_add_input_scr("back",local.input);
    set_add_input_scr("forward",local.input);
    set_add_input_scr("backward",local.input);
    set_add_input_scr("strafe_left",local.input);
    set_add_input_scr("strafe_right",local.input);
    set_add_input_scr("interact",local.input);
    set_add_input_scr("sprint",local.input);
    set_add_input_scr("jump",local.input);
    set_add_input_scr("crouch",local.input);
    set_add_input_scr("attack",local.input);
    set_add_input_scr("pause",local.input);
    set_add_input_scr("debug",local.input);
    set_add_input_scr("turnaround",local.input);
    set_add_input_scr("ff",local.input);
    set_add_input_scr("slow",local.input);
    set_add_input_scr("cam_up",local.input);
    set_add_input_scr("cam_down",local.input);
    set_add_input_scr("cam_left",local.input);
    set_add_input_scr("cam_right",local.input);
    set_add_input_scr("fullscreen",local.input);
    set_add_input_scr("screenshot",local.input);
// Control
    // Control
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
        local.set = set_add_scr(local.control_sub,"control","control",true,set_state_const,0,0,false,local.control,false,false);
        set_add_default_scr(local.set,0);
    // Input
        /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
        local.set = set_add_scr(local.input,"input","input",true,set_state_const,0,0,false,local.control,false,false);
        set_add_default_scr(local.set,0);
// Fun
    // Pride
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("pride","pride","pride",true,set_enum_const,0,2,true,local.fun,false,true);
        // Labels
            set_add_label_scr(local.set,0,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,1,"on",true,"");
            set_add_label_scr(local.set,2,"trans",true,"");
        // Defaults
            set_add_default_scr(local.set,false);
    // Halloween
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("halloween","halloween","halloween",true,set_enum_const,false,true,true,local.fun,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,false);
    // Christmas
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("christmas","christmas","christmas",true,set_enum_const,false,true,true,local.fun,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,false);
    // Easter
        // Main
            /*Variable Name, Name, Description, Translate, Type, Min Clamp, Max Clamp, Wrap, Category, Player Specific, Has Descriptions*/
            local.set = set_add_scr("easter","easter","easter",true,set_enum_const,false,true,true,local.fun,false,false);
        // Labels
            set_add_label_scr(local.set,false,"off",true,""); /*Setting ID, Label ID, Label, Translate, Description*/
            set_add_label_scr(local.set,true,"on",true,"");
        // Defaults
            set_add_default_scr(local.set,false);
// Theme Toggle
    // Gel
        local.set = set_add_theme_scr("gel",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"gel_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"gel_theme_rom");
    // Bug
        local.set = set_add_theme_scr("bug",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"bug_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"bug_theme_rom");
    // Ringu
        local.set = set_add_theme_scr("ringu",true,3,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"ringu_theme_main");
        set_add_label_scr(local.set,1,"old",true,"ringu_theme_old");
        set_add_label_scr(local.set,2,"rom",true,"ringu_theme_rom");
        set_add_label_scr(local.set,3,"alt",true,"ringu_theme_alt");
    // Bab Theme
        local.set = set_add_theme_scr("bab",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"bab_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"bab_theme_rom");
    // Puppet Theme
        local.set = set_add_theme_scr("pup",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"pup_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"pup_theme_rom");
    // Flesh Theme
        local.set = set_add_theme_scr("flesh",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"flesh_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"flesh_theme_rom");
    // Deer Lord Theme
        local.set = set_add_theme_scr("dl",true,2,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"dl_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"dl_theme_rom");
        set_add_label_scr(local.set,2,"alt",true,"dl_theme_alt");
    // Eel Theme
        local.set = set_add_theme_scr("eel",true,2,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"eel_theme_main");
        set_add_label_scr(local.set,1,"old",true,"eel_theme_old");
        set_add_label_scr(local.set,2,"rom",true,"eel_theme_rom");
    // Parasite Theme
        local.set = set_add_theme_scr("para",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"para_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"para_theme_rom");
    // Food Demon Theme
        local.set = set_add_theme_scr("fd",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"fd_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"fd_theme_rom");
    // Killer Theme
        local.set = set_add_theme_scr("killer",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"killer_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"killer_theme_rom");
    // Mermaid Theme
        local.set = set_add_theme_scr("mur",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"mur_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"mur_theme_rom");
    // Bodybag Theme
        local.set = set_add_theme_scr("body",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"body_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"body_theme_rom");
    // Stem Theme
        local.set = set_add_theme_scr("stem",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"stem_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"stem_theme_rom");
    // Patient Theme
        local.set = set_add_theme_scr("patient",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"patient_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"patient_theme_rom");
    // Ghost Cow Theme
        local.set = set_add_theme_scr("gc",true,2,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"gc_theme_main");
        set_add_label_scr(local.set,1,"old",true,"gc_theme_old");
        set_add_label_scr(local.set,2,"rom",true,"gc_theme_rom");
    // Bekka Theme
        local.set = set_add_theme_scr("bekka",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"bekka_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"bekka_theme_rom");
    // Husk Theme
        local.set = set_add_theme_scr("husk",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"husk_theme_main");
        set_add_label_scr(local.set,1,"old",true,"husk_theme_old");
    // Woormy Charles Theme
        local.set = set_add_theme_scr("wc",true,2,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"wc_theme_main");
        set_add_label_scr(local.set,1,"old",true,"wc_theme_old");
        set_add_label_scr(local.set,2,"rom",true,"wc_theme_rom");
    // Hooked Doll Theme
        local.set = set_add_theme_scr("hk",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"hk_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"hk_theme_rom");
    // Frenzy Theme
        local.set = set_add_theme_scr("frenzy",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"frenzy_theme_main");
        set_add_label_scr(local.set,1,"old",true,"frenzy_theme_old");
    // Real Ringu Theme
        local.set = set_add_theme_scr("real_ringu",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"real_ringu_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"real_ringu_theme_rom");
    // Tirsiak Theme
        local.set = set_add_theme_scr("tiri",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"tiri_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"tiri_theme_rom");
    // Lisa Theme
        local.set = set_add_theme_scr("lisa",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"lisa_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"lisa_theme_rom");
    // Otto Theme
        local.set = set_add_theme_scr("otto",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"otto_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"otto_theme_rom");
    // Spooper Theme
        local.set = set_add_theme_scr("spooper",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"spooper_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"spooper_theme_rom");
    // White Face Theme
        local.set = set_add_theme_scr("wf",true,1,local.theme_toggle);
        set_add_label_scr(local.set,0,"main",true,"wf_theme_main");
        set_add_label_scr(local.set,1,"rom",true,"wf_theme_rom");
// Draw (hope this works)
draw_load_scr("Loaded settings!");