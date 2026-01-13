// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
/*
This is going to be a MESS to code
Menu and button States
    0: Story
    1: Press Confirm
    2: Main
        0: New Game
        1: Load Game
        2: Scores
        3: Settings
        4: Config
        5: Exit
    3: Save creation
        0: Play
        1: Mode (Story, Endless, Sandbox, Modded')
        2: Difficulty (Easiest', Easy, Normal, Hard, Hardest)
        3: Behavior (Recode, OG, HD, Modded')
        4: Custom
        5: Customize (Grayed out if not custom)
        6: Back
    4: Custom save creation
        0: Can crouch
        1: Can jump
        2: Persistent Stamina
        3: Fall of ledges
        4: Lock Doors (On, Off, alone, evil)
        5: Damage shake
        6: Multichase type (Constant, Taper)
        7-10: Multichase min, max, start, and end (Max, start and end grayed out if not taper)
        11: Count type (Constant, Taper)
        12-15: Count min, max, start, and end (Max, start, and end grayed out if not taper)
        16: Behavior
        17: Back
    5: Save creation behavior
        Behaviors (Recode, OG, HD, Modded')
        Back
    6: Load Save
        Saves
        Back
    7: Settings
    8: Post Confirm
	12: Save Name Entry
*/
// Create Event
object_event_add
(argument0,ev_create,0,'
	
	local.array_index = 0;
	local.wall_index = 1;
	local.finalwall_index = "01"
	
    while file_exists(working_directory+"\DATA\TEX\WALL_"+local.finalwall_index+".png")
	{
        sub_bg_arr[local.array_index] = background_add(working_directory+"\DATA\TEX\WALL_"+local.finalwall_index+".png",false,false);
        
        local.array_index += 1;
        local.wall_index += 1;
        
        if local.wall_index < 10 { local.finalwall_index = "0"+string(local.wall_index); }
        else { local.finalwall_index = string(local.wall_index); }
	}
	
	local.wall_index = 1;
	local.finalwall_index = "01";
	
	while file_exists(working_directory+"\DATA\EM\TEX\EM_WALL_"+local.finalwall_index+".png")
	{
        sub_bg_arr[local.array_index] = background_add(working_directory+"\DATA\EM\TEX\EM_WALL_"+local.finalwall_index+".png",false,false);
        
        local.array_index += 1;
        local.wall_index += 1;
        
        if local.wall_index < 10 { local.finalwall_index = "0"+string(local.wall_index); }
        else { local.finalwall_index = string(local.wall_index); }
	}
	
	sub_bg_len_var = local.array_index;
	
	sub_bg_var = 0;
	
	subbgscroll_var = 0;
	
	subbgalpha_var = 0;
	
    // Sprites
    set_spr_var = sprite_add(main_directory_const+"\SPR\UI\settings_spr.png",2,false,false,0,0);
    sprite_set_offset(set_spr_var,sprite_get_width(set_spr_var)/2,sprite_get_height(set_spr_var)/2);
    if !irandom(7)
    {
        switch irandom(5)
        {
            case 0:
            {
                title_spr_var = execute_file(main_directory_const+"\SPR\UI\menu_title_hd_spr.gml",main_directory_const+"\SPR\UI\menu_title_hd_spr.png");
                bg_var = background_add(main_directory_const+"\BG\UI\menu_hd_bg.png",false,false);
                light_01_bg_var = background_add(vanilla_directory_const+"\MAT\blank.png",false,false);
                light_02_bg_var = background_add(vanilla_directory_const+"\MAT\blank.png",false,false);
                path_bg_var = background_add(vanilla_directory_const+"\TEX\menu\path_tex.png",false,false);
                menu_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_mus_snd.mp3");
                rain_var = true;
                break;
            }
            case 1:
            {
                title_spr_var = execute_file(main_directory_const+"\SPR\UI\menu_title_old_01_spr.gml",main_directory_const+"\SPR\UI\menu_title_old_01_spr.png");
                title_02_spr_var = execute_file(main_directory_const+"\SPR\UI\menu_title_old_02_spr.gml",main_directory_const+"\SPR\UI\menu_title_old_02_spr.png");
                old_var = true;
                bg_var = background_add(main_directory_const+"\BG\UI\menu_old_bg.png",false,false);
                light_01_bg_var = background_add(main_directory_const+"\BG\UI\menu_light_01_old_bg.png",false,false);
                light_02_bg_var = background_add(main_directory_const+"\BG\UI\menu_light_02_old_bg.png",false,false);
                path_bg_var = background_add(vanilla_directory_const+"\TEX\menu\path_tex.png",false,false);
                menu_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_mus_old_snd.mp3");
                fmod_snd_set_max_vol_scr(menu_mus_snd_var,0.75);
                rain_var = true;
                break;
            }
            default:
            {
                local.path = vanilla_directory_const+"\TEX\menu\"+choose("name_uhh_spr","name_uhh_spr2","name_uhh_spr3","name_uhh_spr4")+".png";
                title_spr_var = sprite_add(local.path,1,false,false,0,0);
                sprite_set_offset(title_spr_var,sprite_get_width(title_spr_var)/2,sprite_get_height(title_spr_var)/2);
                bg_var = background_add(vanilla_directory_const+"\TEX\menu\menu_tex.png",false,false);
                light_01_bg_var = background_add(vanilla_directory_const+"\TEX\menu\menu2_tex.png",false,false);
                light_02_bg_var = background_add(vanilla_directory_const+"\TEX\menu\menu3_tex.png",false,false);
                path_bg_var = background_add(vanilla_directory_const+"\TEX\menu\path_tex.png",false,false);
                menu_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_mus_snd.mp3");
                rain_var = true;
                break;
            }
        }
    }
    else
    {
        title_spr_var = execute_file(main_directory_const+"\SPR\UI\menu_title_spr.gml",main_directory_const+"\SPR\UI\menu_title_spr.png");
        rain_var = (current_hour <= 6 || current_hour >= 18);
        if rain_var // Night
        {
            bg_var = background_add(vanilla_directory_const+"\TEX\menu\menu_tex.png",false,false);
            light_01_bg_var = background_add(vanilla_directory_const+"\TEX\menu\menu2_tex.png",false,false);
            light_02_bg_var = background_add(vanilla_directory_const+"\TEX\menu\menu3_tex.png",false,false);
            path_bg_var = background_add(vanilla_directory_const+"\TEX\menu\path_tex.png",false,false);
            
        }
        else // Day
        {
            bg_var = background_add(main_directory_const+"\BG\UI\menu_bg.png",false,false);
            path_bg_var = background_add(main_directory_const+"\BG\UI\menu_path_bg.png",false,false);
            menu_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_mus_snd.mp3");
            background_color = make_color_rgb(31,37,89);
        }
        menu_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_mus_snd.mp3");
    }
    title_y_var = 141; // 170
    title_02_y_var = 270;
    // Backgrounds
    cloud_bg_var = background_add(vanilla_directory_const+"\TEX\menu\menu_clouds2_tex.png",false,false);
    path_cloud_bg_var = background_add(vanilla_directory_const+"\TEX\menu\menu_clouds_tex.png",false,false);
    multi_bg_var = background_add(main_directory_const+"\BG\UI\multi_bg.png",false,false);
    light_bg_var = light_01_bg_var;
    // Sounds
    select_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_select_snd.wav");
    confirm_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_confirm_snd.wav");
    popup_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_popup_snd.wav");
    start_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_start_snd.wav");
    fmod_snd_set_group_scr(start_snd_var,snd_group_mus_const);
    story_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\story_mus_snd.mp3");
    fmod_snd_set_group_scr(story_mus_snd_var,snd_group_mus_const);
    fmod_snd_set_group_scr(menu_mus_snd_var,snd_group_mus_const);
    fmod_snd_set_loop_point_scr(menu_mus_snd,6/71,70/71);
    // Text
    ini_open(global.lang_var);
    skip_str_var = "Press Confirm to Skip."; // Maybe get a string of the key?
    confirm_str_var = "PRESS CONFIRM";
    story_str_var = "For as long as you can remember, legends have been told about the derelict mansion upon the hill that casts a blanket of darkness over the town. The history of the house itself is virtually unknown, and even the towns oldest residents cannot remember the mansions origin. Being an avid history enthusiast, you embark up the mountain to visit the manor. Hoping to shed some light on the backstory of this crumbling fortress of darkness.";
    back_str_var = ini_read_string("MENU","back","MENU_back");
    str_bg_color_var = make_color_rgb(57,0,91);
    str_bg_select_color_var = make_color_rgb(138,0,0);
    // Options
        // Basic
    on_str_var = ini_read_string("MENU","on","MENU_on"); // On
    off_str_var = ini_read_string("MENU","off","MENU_off"); // Off
    true_str_var = ini_read_string("MENU","true","MENU_true"); // True
    false_str_var = ini_read_string("MENU","false","MENU_false"); // False
    min_str_var = ini_read_string("MENU","min","MENU_min"); // Minimum
    max_str_var = ini_read_string("MENU","max","MENU_max"); // Maximum
    always_str_var = ini_read_string("MENU","always","MENU_always"); // Always
    never_str_var = ini_read_string("MENU","never","MENU_never"); // Never
    rand_str_var = ini_read_string("MENU","rand","MENU_rand"); // Random
    def_str_var = ini_read_string("MENU","def","MENU_def"); // Default
    inf_str_var = ini_read_string("MENU","inf","MENU_inf"); // Infinite
    taper_str_var = ini_read_string("MENU","taper","MENU_taper"); // Taper
        // Behaviors
    mod_str_var = ini_read_string("MENU","mod","MENU_mod"); // Recode
    og_str_var = ini_read_string("MENU","og","MENU_og"); // Original
    hd_str_var = ini_read_string("MENU","hd","MENU_hd"); // Renovation
    kh_str_var = ini_read_string("MENU","kh","MENU_kh"); // Karamari Hospital
    dh_str_var = ini_read_string("MENU","dh","MENU_dh"); // Dollhouse
    alt_str_var = ini_read_string("MENU","alt","MENU_alt"); // Alternate
    rouge_str_var = ini_read_string("MENU","rouge","MENU_rouge"); // Gone Rouge
    yoshi_str_var = ini_read_string("MENU","yoshi","MENU_yoshi"); // Remodeled
    old_str_var = ini_read_string("MENU","old","MENU_old"); // Classic
    imscared_str_var = ini_read_string("MENU","imscared","MENU_imscared"); // Im Scared
        // Modes
    sm_str_var = ini_read_string("MENU","sm","MENU_sm"); // Story Mode
    em_str_var = ini_read_string("MENU","em","MENU_em"); // Endless Mode
    sb_str_var = ini_read_string("MENU","sb","MENU_sb"); // Sandbox Mode
        // Difficulties
    easiest_str_var = ini_read_string("MENU","easiest","MENU_easiest"); // Easiest
    easy_str_var = ini_read_string("MENU","easy","MENU_easy"); // Easy
    normal_str_var = ini_read_string("MENU","normal","MENU_normal"); // Normal
    hard_str_var = ini_read_string("MENU","hard","MENU_hard"); // Hard
    hardest_str_var = ini_read_string("MENU","hardest","MENU_hardest"); // Hardest
        // Unique
    alone_str_var = ini_read_string("MENU","alone","MENU_alone"); // Alone (Locks)
    evil_str_var = ini_read_string("MENU","evil","MENU_evil"); // Not Golden (Locks)
    canon_str_var = ini_read_string("MENU","canon","MENU_canon"); // Canon (Dupes)
    // Button Text
        // Main
    button_str_arr[2,0] = ini_read_string("MENU","ng","MENU_ng");
    button_str_arr[2,1] = ini_read_string("MENU","lg","MENU_lg");
    button_str_arr[2,2] = ini_read_string("MENU","score","MENU_score");
    button_str_arr[2,3] = ini_read_string("MENU","exit","MENU_exit");
    button_str_arr[2,4] = ini_read_string("MENU","setting","MENU_setting");
    button_str_arr[2,5] = "CONFIG"; // Might scrap
        // Save Creation
    button_str_arr[3,0] = ini_read_string("MENU","play","MENU_play");
    button_str_arr[3,1] = ini_read_string("MENU","mode","MENU_mode");
    button_str_arr[3,2] = ini_read_string("MENU","diff","MENU_diff");
    button_str_arr[3,3] = ini_read_string("MENU","type","MENU_type");
    button_str_arr[3,4] = ini_read_string("MENU","custom","MENU_custom");
    button_str_arr[3,5] = ini_read_string("MENU","customize","MENU_customize");
    button_str_arr[3,6] = back_str_var;
    	//Load Saves
	button_str_arr[6,0] = back_str_var;
        // Multiplayer
    button_str_arr[9,0] = ini_read_string("MENU","player_len","MENU_player_len");
    button_str_arr[9,1] = ini_read_string("MENU","player_id","MENU_player_id");
    button_str_arr[9,2] = ini_read_string("MENU","name","MENU_name");
    button_str_arr[9,3] = ini_read_string("MENU","spr","MENU_spr");
    button_str_arr[9,4] = ini_read_string("MENU","spr_id","MENU_spr_id");
    button_str_arr[9,5] = ini_read_string("MENU","red","MENU_red");
    button_str_arr[9,6] = ini_read_string("MENU","green","MENU_green");
    button_str_arr[9,7] = ini_read_string("MENU","blue","MENU_blue");
    button_str_arr[9,8] = ini_read_string("MENU","hue","MENU_hue");
    button_str_arr[9,9] = ini_read_string("MENU","sat","MENU_sat");
    button_str_arr[9,10] = ini_read_string("MENU","val","MENU_val");
    button_str_arr[9,11] = back_str_var;
    // Custom
        // Ditto (Customize)
    custom_button_len_var = 0;
        /*
        Default Values start at 9 plus the max value to prevent array conflicts. Max value is assumed 0 if not clamped
        If no value is specified, the first value is assumed default
        */
        // Crouch
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","crouch","MENU_crouch"); // Label
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 0; // Type (Enum / Boolean)
    custom_button_arr[custom_button_len_var,4] = true; // Wrap Value
    custom_button_arr[custom_button_len_var,5] = true; // Max Value (min is always -1)
    custom_button_arr[custom_button_len_var,6] = "crouch"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = false; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = off_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = on_str_var;
    custom_button_arr[custom_button_len_var,10] = "true"; // Recode
    custom_button_arr[custom_button_len_var,11] = "false"; // OG
    custom_button_arr[custom_button_len_var,12] = "false"; // HD
    custom_button_len_var += 1;
        // Jump
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","jump","MENU_jump");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 0; // Type (Enum / Boolean)
    custom_button_arr[custom_button_len_var,4] = true; // Wrap Value
    custom_button_arr[custom_button_len_var,5] = true; // Max Value (min is always -1)
    custom_button_arr[custom_button_len_var,6] = "jump"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = false; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = off_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = on_str_var;
    custom_button_arr[custom_button_len_var,10] = "true"; // Recode
    custom_button_arr[custom_button_len_var,11] = "false"; // OG
    custom_button_arr[custom_button_len_var,12] = "false"; // HD
    custom_button_len_var += 1;
        // Stamina Persist
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","stam_per","MENU_stam_per");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 0; // Type (Enum / Boolean)
    custom_button_arr[custom_button_len_var,4] = true; // Wrap Value
    custom_button_arr[custom_button_len_var,5] = true; // Max Value (min is always -1)
    custom_button_arr[custom_button_len_var,6] = "stam_per"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = off_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = on_str_var;
    custom_button_arr[custom_button_len_var,10] = "false"; // Default
    custom_button_arr[custom_button_len_var,11] = "false"; // OG
    custom_button_arr[custom_button_len_var,12] = "false"; // HD
    custom_button_arr[custom_button_len_var,13] = "false"; // Easiest
    custom_button_arr[custom_button_len_var,14] = "false"; // Easy
    custom_button_arr[custom_button_len_var,15] = "false"; // Normal
    custom_button_arr[custom_button_len_var,16] = "true"; // Hard
    custom_button_arr[custom_button_len_var,17] = "true"; // Hardest
    custom_button_arr[custom_button_len_var,18] = "true"; // :)
    custom_button_len_var += 1;
        // Fall
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","fall","MENU_fall");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 0; // Type (Enum / Boolean)
    custom_button_arr[custom_button_len_var,4] = true; // Wrap Value
    custom_button_arr[custom_button_len_var,5] = true; // Max Value (min is always -1)
    custom_button_arr[custom_button_len_var,6] = "fall"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = off_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = on_str_var;
    custom_button_arr[custom_button_len_var,10] = "false"; // Default
    custom_button_arr[custom_button_len_var,11] = "false"; // OG
    custom_button_arr[custom_button_len_var,12] = "false"; // HD
    custom_button_arr[custom_button_len_var,13] = "false"; // Easiest
    custom_button_arr[custom_button_len_var,14] = "false"; // Easy
    custom_button_arr[custom_button_len_var,15] = "false"; // Normal
    custom_button_arr[custom_button_len_var,16] = "false"; // Hard
    custom_button_arr[custom_button_len_var,17] = "true"; // Hardest
    custom_button_arr[custom_button_len_var,18] = "true"; // :)
    custom_button_len_var += 1;
        // Lock
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","lock","MENU_lock");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 0; // Type (Enum / Boolean)
    custom_button_arr[custom_button_len_var,4] = true; // Wrap Value
    custom_button_arr[custom_button_len_var,5] = 3; // Max Value (min is always -1)
    custom_button_arr[custom_button_len_var,6] = "lock"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = off_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = alone_str_var;
    custom_button_arr[custom_button_len_var,10] = on_str_var;
    custom_button_arr[custom_button_len_var,11] = evil_str_var;
    custom_button_arr[custom_button_len_var,12] = "2"; // Default
    custom_button_arr[custom_button_len_var,13] = "3"; // OG (Not Gold)
    custom_button_arr[custom_button_len_var,14] = "3"; // HD (Not Gold)
    custom_button_arr[custom_button_len_var,15] = "false"; // Easiest (never)
    custom_button_arr[custom_button_len_var,16] = "1"; // Easy (only alone)
    custom_button_arr[custom_button_len_var,17] = "2"; // Normal
    custom_button_arr[custom_button_len_var,18] = "2"; // Hard
    custom_button_arr[custom_button_len_var,19] = "2"; // Hardest
    custom_button_arr[custom_button_len_var,20] = "3"; // :) (Not Gold)
    custom_button_len_var += 1;
        // Damage Shake
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","dmg_shake","MENU_dmg_shake");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 0; // Type (Enum / Boolean)
    custom_button_arr[custom_button_len_var,4] = true; // Wrap Value
    custom_button_arr[custom_button_len_var,5] = true; // Max Value (min is always -1)
    custom_button_arr[custom_button_len_var,6] = "dmg_shake"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = off_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = on_str_var;
    custom_button_arr[custom_button_len_var,10] = "false"; // Default
    custom_button_arr[custom_button_len_var,11] = "true"; // OG
    custom_button_arr[custom_button_len_var,12] = "false"; // HD
    custom_button_arr[custom_button_len_var,13] = "false"; // Easiest
    custom_button_arr[custom_button_len_var,14] = "false"; // Easy
    custom_button_arr[custom_button_len_var,15] = "false"; // Normal
    custom_button_arr[custom_button_len_var,16] = "false"; // Hard
    custom_button_arr[custom_button_len_var,17] = "true"; // Hardest
    custom_button_arr[custom_button_len_var,18] = "true"; // :)
    custom_button_len_var += 1;
        // Multi Type
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","mult_type","MENU_mult_type");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 0; // Type (Enum / Boolean)
    custom_button_arr[custom_button_len_var,4] = true; // Wrap Value
    custom_button_arr[custom_button_len_var,5] = 3; // Max Value (min is always -1)
    custom_button_arr[custom_button_len_var,6] = "mult_type"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = max_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = min_str_var;
    custom_button_arr[custom_button_len_var,10] = taper_str_var;
    custom_button_arr[custom_button_len_var,11] = always_str_var;
    custom_button_arr[custom_button_len_var,12] = "0"; // Default
    custom_button_arr[custom_button_len_var,13] = "1"; // OG
    custom_button_arr[custom_button_len_var,14] = "0"; // HD
    custom_button_arr[custom_button_len_var,15] = "1"; // Easiest
    custom_button_arr[custom_button_len_var,16] = "1"; // Easy
    custom_button_arr[custom_button_len_var,17] = "0"; // Normal
    custom_button_arr[custom_button_len_var,18] = "0"; // Hard
    custom_button_arr[custom_button_len_var,19] = "3"; // Hardest
    custom_button_arr[custom_button_len_var,20] = "3"; // :)
    custom_button_len_var += 1;
        // Multichase min
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","mult_min","MENU_mult_min");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "mult_min"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = off_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = "1"; // Default
    custom_button_arr[custom_button_len_var,12] = "0"; // Easiest
    custom_button_arr[custom_button_len_var,17] = "5"; // :)
    custom_button_len_var += 1;
        // Multichase max
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","mult_max","MENU_mult_max");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "mult_max"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = off_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = "5"; // Default
    custom_button_arr[custom_button_len_var,12] = "0"; // Easiest
    custom_button_arr[custom_button_len_var,17] = "5"; // :)
    custom_button_len_var += 1;
        // Multichase start
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","mult_start","MENU_mult_start");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "mult_start"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,9] = "0"; // Default
    custom_button_len_var += 1;
        // Multichase end
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","mult_end","MENU_mult_end");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "mult_end"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,9] = "1000"; // Default
    custom_button_len_var += 1;
        // Count type
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","count_type","MENU_count_type");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 0; // Type (Enum / Boolean)
    custom_button_arr[custom_button_len_var,4] = true; // Wrap Value
    custom_button_arr[custom_button_len_var,5] = 4; // Max Value (min is always -1)
    custom_button_arr[custom_button_len_var,6] = "count_type"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = rand_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = max_str_var;
    custom_button_arr[custom_button_len_var,10] = min_str_var;
    custom_button_arr[custom_button_len_var,11] = taper_str_var;
    custom_button_arr[custom_button_len_var,12] = taper_str_var+" "+rand_str_var;
    custom_button_arr[custom_button_len_var,13] = "0"; // Default
    custom_button_arr[custom_button_len_var,14] = "1"; // OG
    custom_button_arr[custom_button_len_var,15] = "2"; // HD
    custom_button_arr[custom_button_len_var,16] = "1"; // Easiest
    custom_button_arr[custom_button_len_var,17] = "1"; // Easy
    custom_button_arr[custom_button_len_var,18] = "0"; // Normal
    custom_button_arr[custom_button_len_var,19] = "2"; // Hard
    custom_button_arr[custom_button_len_var,20] = "2"; // Hardest
    custom_button_arr[custom_button_len_var,21] = "2"; // :)
    custom_button_len_var += 1;
        // Count min
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","count_min","MENU_count_min");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "count_min"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = off_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = "0"; // Default
    custom_button_arr[custom_button_len_var,12] = "20"; // Easiest
    custom_button_arr[custom_button_len_var,17] = "0"; // :)
    custom_button_len_var += 1;
        // Count max
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","count_max","MENU_count_max");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "count_max"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = off_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = "20"; // Default
    custom_button_arr[custom_button_len_var,12] = "20"; // Easiest
    custom_button_arr[custom_button_len_var,17] = "0"; // :)
    custom_button_len_var += 1;
        // Count start
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","count_start","MENU_count_start");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "count_start"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,9] = "0"; // Default
    custom_button_len_var += 1;
        // Count end
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","count_end","MENU_count_end");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "count_end"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,9] = "1000"; // Default
    custom_button_len_var += 1;
        // Dupe
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","dupe","MENU_dupe");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 0; // Type (Enum / Boolean)
    custom_button_arr[custom_button_len_var,4] = true; // Wrap Value
    custom_button_arr[custom_button_len_var,5] = 2; // Max Value (min is always -1)
    custom_button_arr[custom_button_len_var,6] = "dupe"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,8] = always_str_var; // Text for options (start at 0)
    custom_button_arr[custom_button_len_var,9] = canon_str_var;
    custom_button_arr[custom_button_len_var,10] = never_str_var;
    custom_button_arr[custom_button_len_var,11] = "dupe_canon_const"; // Default
    custom_button_arr[custom_button_len_var,12] = "dupe_always_const"; // OG
    custom_button_arr[custom_button_len_var,13] = "dupe_always_const"; // HD
    custom_button_arr[custom_button_len_var,14] = "dupe_never_const"; // Easiest
    custom_button_arr[custom_button_len_var,15] = "dupe_canon_const"; // Easy
    custom_button_arr[custom_button_len_var,16] = "dupe_canon_const"; // Normal
    custom_button_arr[custom_button_len_var,17] = "dupe_canon_const"; // Hard
    custom_button_arr[custom_button_len_var,18] = "dupe_always_const"; // Hardest
    custom_button_arr[custom_button_len_var,19] = "dupe_always_const"; // :)
    custom_button_len_var += 1;
        // Chance
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","chance","MENU_chance");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "mon_chance"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,9] = "mon_chance_const"; // Default
    custom_button_len_var += 1;
        // Chance Mult
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","chance_mult","MENU_chance_mult");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "mon_chance_mult"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = true; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,9] = "mon_chance_mult_const"; // Default
    custom_button_len_var += 1;
        // Jumpscare Chance
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","js_chance","MENU_js_chance");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "js_chance"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = false; // Behavior / Difficulty
    custom_button_arr[custom_button_len_var,9] = "js_chance_const"; // Default
    custom_button_len_var += 1;
        // Elevator Type
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","ele_type","MENU_ele_type");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 0; // Type (Enum / Boolean)
    custom_button_arr[custom_button_len_var,4] = true; // Wrap Value
    custom_button_arr[custom_button_len_var,5] = 2; // Max Value (min is always -1)
    custom_button_arr[custom_button_len_var,6] = "ele_type"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = 2; // Behavior / Difficulty / Mode
    custom_button_arr[custom_button_len_var,8] = "1"
    custom_button_arr[custom_button_len_var,9] = "2"
    custom_button_arr[custom_button_len_var,10] = "3"
    custom_button_arr[custom_button_len_var,11] = "ele_type_const"; // Default
    custom_button_arr[custom_button_len_var,12] = "1"; // Recode Story
    custom_button_arr[custom_button_len_var,13] = "2"; // OG Story
    custom_button_arr[custom_button_len_var,14] = "2"; // HD Story
    custom_button_arr[custom_button_len_var,15] = "1"; // Recode Endless
    custom_button_arr[custom_button_len_var,16] = "2"; // OG Endless
    custom_button_arr[custom_button_len_var,17] = "0"; // HD Endless
    custom_button_arr[custom_button_len_var,18] = "1"; // Sandbox
    custom_button_len_var += 1;
        // Elevator End 1
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","ele_end","MENU_ele_end")+" 2";
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "ele_end_01"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = 2; // Behavior / Difficulty / Mode
    custom_button_arr[custom_button_len_var,9] = "ele_end_01_const"; // Default
    custom_button_len_var += 1;
        // Elevator End 2
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","ele_end","MENU_ele_end")+" 2";
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "ele_end_02"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = 2; // Behavior / Difficulty / Mode
    custom_button_arr[custom_button_len_var,9] = "ele_end_02_const"; // Default
    custom_button_len_var += 1;
        // Elevator Rate 1
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","ele_rate","MENU_ele_rate")+" 1";
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "ele_rate_01"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = 2; // Behavior / Difficulty / Mode
    custom_button_arr[custom_button_len_var,9] = "ele_rate_01_const"; // Default
    custom_button_arr[custom_button_len_var,15] = "100"; // HD Endless
    custom_button_len_var += 1;
        // Elevator Rate 2
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","ele_rate","MENU_ele_rate")+" 2";
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "ele_rate_02"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = 2; // Behavior / Difficulty / Mode
    custom_button_arr[custom_button_len_var,9] = "ele_rate_02_const"; // Default
    custom_button_len_var += 1;
        // Elevator Rate 3
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","ele_rate","MENU_ele_rate")+" 3";
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "ele_rate_03"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = 2; // Behavior / Difficulty / Mode
    custom_button_arr[custom_button_len_var,9] = "ele_rate_03_const"; // Default
    custom_button_len_var += 1;
        // Rare Chance
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","rare_chance","MENU_rare_chance");
    custom_button_arr[custom_button_len_var,2] = "Temp"; // Description
    custom_button_arr[custom_button_len_var,3] = 1; // Type (Number)
    custom_button_arr[custom_button_len_var,4] = false; // Wrap Value
    custom_button_arr[custom_button_len_var,6] = "rare_chance"; // Global variable to modify
    custom_button_arr[custom_button_len_var,7] = 2; // Behavior / Difficulty / Mode
    custom_button_arr[custom_button_len_var,9] = "rare_chance_const"; // Default
    custom_button_arr[custom_button_len_var,10] = "8"; // Recode Story
    custom_button_arr[custom_button_len_var,11] = "8"; // OG Story
    custom_button_arr[custom_button_len_var,12] = "8"; // HD Story
    custom_button_arr[custom_button_len_var,13] = "16"; // Recode Endless
    custom_button_arr[custom_button_len_var,14] = "0"; // OG Endless
    custom_button_arr[custom_button_len_var,15] = "8"; // HD Endless
    custom_button_arr[custom_button_len_var,16] = "16"; // Sandbox
    custom_button_len_var += 1;
        // Behavior
    custom_button_arr[custom_button_len_var,1] = ini_read_string("MENU","type","MENU_type");
    custom_button_arr[custom_button_len_var,3] = -1; // Type (Behavior)
    custom_button_len_var += 1;
        // Back
    custom_button_arr[custom_button_len_var,1] = back_str_var;
    custom_button_arr[custom_button_len_var,3] = -2; // Type (Back)
    custom_button_len_var += 1;
        // Defaults
    for (local.i=0; local.i<custom_button_len_var; local.i+=1)
    { custom_button_arr[local.i,0] = -1; }
    // Behavior
        // Defaults
    type_button_len_var = 34;
    for (local.i=0; local.i<type_button_len_var-1; local.i+=1;)
    {
        type_button_arr[local.i,0] = -1; // Current Value
        type_button_arr[local.i,2] = 3; // Allowed values (Default is Recode, OG, and HD)
    }
        // Names
    type_button_arr[0,1] = "PLAYER"; // Label
    type_button_arr[1,1] = "AXE";
    switch global.name_var
    {
        case name_og_const:
        {
            type_button_arr[2,1] = string_upper(ini_read_string("NAME","js_og","NAME_js_og"));
            type_button_arr[3,1] = string_upper(ini_read_string("NAME","gel","NAME_gel"));
            type_button_arr[4,1] = string_upper(ini_read_string("NAME","bug_og","NAME_bug_og"));
            type_button_arr[5,1] = string_upper(ini_read_string("NAME","ringu","NAME_ringu"));
            type_button_arr[6,1] = string_upper(ini_read_string("NAME","bab","NAME_bab"));
            type_button_arr[7,1] = string_upper(ini_read_string("NAME","pup_og","NAME_pup_og"));
            type_button_arr[8,1] = string_upper(ini_read_string("NAME","flesh","NAME_flesh"));
            type_button_arr[9,1] = string_upper(ini_read_string("NAME","dl","NAME_dl"));
            type_button_arr[10,1] = string_upper(ini_read_string("NAME","taker","NAME_taker"));
            type_button_arr[11,1] = string_upper(ini_read_string("NAME","eel_num","NAME_eel_num"));
            type_button_arr[12,1] = string_upper(ini_read_string("NAME","para","NAME_para"));
            type_button_arr[13,1] = string_upper(ini_read_string("NAME","fd","NAME_fd"));
            type_button_arr[14,1] = string_upper(ini_read_string("NAME","killer_og","NAME_killer_og"));
            type_button_arr[15,1] = string_upper(ini_read_string("NAME","mur","NAME_mur"));
            type_button_arr[16,1] = string_upper(ini_read_string("NAME","sg","NAME_sg"));
            type_button_arr[17,1] = string_upper(ini_read_string("NAME","bodybag","NAME_bodybag"));
            type_button_arr[18,1] = string_upper(ini_read_string("NAME","stem_og","NAME_stem_og"));
            type_button_arr[19,1] = string_upper(ini_read_string("NAME","patient_og","NAME_patient_og"));
            type_button_arr[20,1] = string_upper(ini_read_string("NAME","gc","NAME_gc"));
            type_button_arr[21,1] = string_upper(ini_read_string("NAME","bekka","NAME_bekka"));
            type_button_arr[22,1] = string_upper(ini_read_string("NAME","husk_og","NAME_husk_og"));
            type_button_arr[27,1] = string_upper(ini_read_string("NAME","real_ringu_og","NAME_real_ringu_og"));
            type_button_arr[28,1] = string_upper(ini_read_string("NAME","tiri","NAME_tiri"));
            type_button_arr[29,1] = string_upper(ini_read_string("NAME","lisa","NAME_lisa"));
            type_button_arr[30,1] = string_upper(ini_read_string("NAME","otto_og","NAME_otto_og"));
            type_button_arr[31,1] = string_upper(ini_read_string("NAME","spooper","NAME_spooper"));
            type_button_arr[32,1] = string_upper(ini_read_string("NAME","wf","NAME_wf"));
            break;
        }
        case name_hd_const:
        {
            type_button_arr[2,1] = string_upper(ini_read_string("NAME","js_hd","NAME_js_hd"));
            type_button_arr[3,1] = string_upper(ini_read_string("NAME","gel","NAME_gel"));
            type_button_arr[4,1] = string_upper(ini_read_string("NAME","bug_hd","NAME_bug_hd"));
            type_button_arr[5,1] = string_upper(ini_read_string("NAME","ringu","NAME_ringu"));
            type_button_arr[6,1] = string_upper(ini_read_string("NAME","bab","NAME_bab"));
            type_button_arr[7,1] = string_upper(ini_read_string("NAME","pup_hd","NAME_pup_hd"));
            type_button_arr[8,1] = string_upper(ini_read_string("NAME","flesh","NAME_flesh"));
            type_button_arr[9,1] = string_upper(ini_read_string("NAME","dl","NAME_dl"));
            type_button_arr[10,1] = string_upper(ini_read_string("NAME","taker","NAME_taker"));
            type_button_arr[11,1] = string_upper(ini_read_string("NAME","eel","NAME_eel"));
            type_button_arr[12,1] = string_upper(ini_read_string("NAME","para","NAME_para"));
            type_button_arr[13,1] = string_upper(ini_read_string("NAME","fd","NAME_fd"));
            type_button_arr[14,1] = string_upper(ini_read_string("NAME","killer_hd","NAME_killer_hd"));
            type_button_arr[15,1] = string_upper(ini_read_string("NAME","mur","NAME_mur"));
            type_button_arr[16,1] = string_upper(ini_read_string("NAME","sg","NAME_sg"));
            type_button_arr[17,1] = string_upper(ini_read_string("NAME","bodybag","NAME_bodybag"));
            type_button_arr[18,1] = string_upper(ini_read_string("NAME","stem_hd","NAME_stem_hd"));
            type_button_arr[19,1] = string_upper(ini_read_string("NAME","patient_hd","NAME_patient_hd"));
            type_button_arr[20,1] = string_upper(ini_read_string("NAME","gc","NAME_gc"));
            type_button_arr[21,1] = string_upper(ini_read_string("NAME","bekka","NAME_bekka"));
            type_button_arr[22,1] = string_upper(ini_read_string("NAME","husk_hd","NAME_husk_hd"));
            type_button_arr[27,1] = string_upper(ini_read_string("NAME","real_ringu_hd","NAME_real_ringu_hd"));
            type_button_arr[28,1] = string_upper(ini_read_string("NAME","tiri","NAME_tiri"));
            type_button_arr[29,1] = string_upper(ini_read_string("NAME","lisa","NAME_lisa"));
            type_button_arr[30,1] = string_upper(ini_read_string("NAME","otto_hd","NAME_otto_hd"));
            type_button_arr[31,1] = string_upper(ini_read_string("NAME","spooper","NAME_spooper"));
            type_button_arr[32,1] = string_upper(ini_read_string("NAME","wf","NAME_wf"));
            break;
        }
        case name_fanon_const:
        {
            type_button_arr[2,1] = string_upper(ini_read_string("NAME","js_fanon","NAME_js_fanon"));
            type_button_arr[3,1] = string_upper(ini_read_string("NAME","gel","NAME_gel"));
            type_button_arr[4,1] = string_upper(ini_read_string("NAME","bug_fanon","NAME_bug_fanon"));
            type_button_arr[5,1] = string_upper(ini_read_string("NAME","ringu","NAME_ringu"));
            type_button_arr[6,1] = string_upper(ini_read_string("NAME","bab","NAME_bab"));
            type_button_arr[7,1] = string_upper(ini_read_string("NAME","pup_fanon","NAME_pup_fanon"));
            type_button_arr[8,1] = string_upper(ini_read_string("NAME","flesh","NAME_flesh"));
            type_button_arr[9,1] = string_upper(ini_read_string("NAME","dl","NAME_dl"));
            type_button_arr[10,1] = string_upper(ini_read_string("NAME","taker","NAME_taker"));
            type_button_arr[11,1] = string_upper(ini_read_string("NAME","eel_num","NAME_eel_num"));
            type_button_arr[12,1] = string_upper(ini_read_string("NAME","para","NAME_para"));
            type_button_arr[13,1] = string_upper(ini_read_string("NAME","fd","NAME_fd"));
            type_button_arr[14,1] = string_upper(ini_read_string("NAME","killer_hd","NAME_killer_hd"));
            type_button_arr[15,1] = string_upper(ini_read_string("NAME","mur","NAME_mur"));
            type_button_arr[16,1] = string_upper(ini_read_string("NAME","sg","NAME_sg"));
            type_button_arr[17,1] = string_upper(ini_read_string("NAME","bodybag_fanon","NAME_bodybag_fanon"));
            type_button_arr[18,1] = string_upper(ini_read_string("NAME","stem_fanon","NAME_stem_fanon"));
            type_button_arr[19,1] = string_upper(ini_read_string("NAME","patient_fanon","NAME_patient_fanon"));
            type_button_arr[20,1] = string_upper(ini_read_string("NAME","gc","NAME_gc"));
            type_button_arr[21,1] = string_upper(ini_read_string("NAME","bekka","NAME_bekka"));
            type_button_arr[22,1] = string_upper(ini_read_string("NAME","husk_hd","NAME_husk_hd"));
            type_button_arr[27,1] = string_upper(ini_read_string("NAME","real_ringu_hd","NAME_real_ringu_hd"));
            type_button_arr[28,1] = string_upper(ini_read_string("NAME","tiri","NAME_tiri"));
            type_button_arr[29,1] = string_upper(ini_read_string("NAME","lisa","NAME_lisa"));
            type_button_arr[30,1] = string_upper(ini_read_string("NAME","otto_fanon","NAME_otto_fanon"));
            type_button_arr[31,1] = string_upper(ini_read_string("NAME","spooper","NAME_spooper"));
            type_button_arr[32,1] = string_upper(ini_read_string("NAME","wf","NAME_wf"));
            break;
        }
        case name_num_og_const:
        {
            type_button_arr[2,1] = string_upper(ini_read_string("NAME","js_num","NAME_js_num"));
            type_button_arr[3,1] = string_upper(ini_read_string("NAME","gel_num","NAME_gel_num"));
            type_button_arr[4,1] = string_upper(ini_read_string("NAME","bug_num","NAME_bug_num"));
            type_button_arr[5,1] = string_upper(ini_read_string("NAME","ringu_num","NAME_ringu_num"));
            type_button_arr[6,1] = string_upper(ini_read_string("NAME","bab_num","NAME_bab_num"));
            type_button_arr[7,1] = string_upper(ini_read_string("NAME","pup_num","NAME_pup_num"));
            type_button_arr[8,1] = string_upper(ini_read_string("NAME","flesh_num","NAME_flesh_num"));
            type_button_arr[9,1] = string_upper(ini_read_string("NAME","dl_num","NAME_dl_num"));
            type_button_arr[10,1] = string_upper(ini_read_string("NAME","taker_num","NAME_taker_num"));
            type_button_arr[11,1] = string_upper(ini_read_string("NAME","eel_num","NAME_eel_num"));
            type_button_arr[12,1] = string_upper(ini_read_string("NAME","para_num","NAME_para_num"));
            type_button_arr[13,1] = string_upper(ini_read_string("NAME","fd_num","NAME_fd_num"));
            type_button_arr[14,1] = string_upper(ini_read_string("NAME","killer_num","NAME_killer_num"));
            type_button_arr[15,1] = string_upper(ini_read_string("NAME","mur_num","NAME_mur_num"));
            type_button_arr[16,1] = string_upper(ini_read_string("NAME","sg_num_og","NAME_sg_num_og"));
            type_button_arr[17,1] = string_upper(ini_read_string("NAME","bodybag_num_og","NAME_bodybag_num_og"));
            type_button_arr[18,1] = string_upper(ini_read_string("NAME","stem_num_og","NAME_stem_num_og"));
            type_button_arr[19,1] = string_upper(ini_read_string("NAME","patient_num_og","NAME_patient_num_og"));
            type_button_arr[20,1] = string_upper(ini_read_string("NAME","gc_num_og","NAME_gc_num_og"));
            type_button_arr[21,1] = string_upper(ini_read_string("NAME","bekka","NAME_bekka"));
            type_button_arr[22,1] = string_upper(ini_read_string("NAME","husk_num","NAME_husk_num"));
            type_button_arr[27,1] = string_upper(ini_read_string("NAME","real_ringu_og","NAME_real_ringu_og"));
            type_button_arr[28,1] = string_upper(ini_read_string("NAME","tiri","NAME_tiri"));
            type_button_arr[29,1] = string_upper(ini_read_string("NAME","lisa","NAME_lisa"));
            type_button_arr[30,1] = string_upper(ini_read_string("NAME","otto_og","NAME_otto_og"));
            type_button_arr[31,1] = string_upper(ini_read_string("NAME","spooper","NAME_spooper"));
            type_button_arr[32,1] = string_upper(ini_read_string("NAME","wf","NAME_wf"));
            break;
        }
        case name_num_hd_const:
        {
            type_button_arr[2,1] = string_upper(ini_read_string("NAME","js_num","NAME_js_num"));
            type_button_arr[3,1] = string_upper(ini_read_string("NAME","gel_num","NAME_gel_num"));
            type_button_arr[4,1] = string_upper(ini_read_string("NAME","bug_num","NAME_bug_num"));
            type_button_arr[5,1] = string_upper(ini_read_string("NAME","ringu_num","NAME_ringu_num"));
            type_button_arr[6,1] = string_upper(ini_read_string("NAME","bab_num","NAME_bab_num"));
            type_button_arr[7,1] = string_upper(ini_read_string("NAME","pup_num","NAME_pup_num"));
            type_button_arr[8,1] = string_upper(ini_read_string("NAME","flesh_num","NAME_flesh_num"));
            type_button_arr[9,1] = string_upper(ini_read_string("NAME","dl_num","NAME_dl_num"));
            type_button_arr[10,1] = string_upper(ini_read_string("NAME","taker_num","NAME_taker_num"));
            type_button_arr[11,1] = string_upper(ini_read_string("NAME","eel_num","NAME_eel_num"));
            type_button_arr[12,1] = string_upper(ini_read_string("NAME","para_num","NAME_para_num"));
            type_button_arr[13,1] = string_upper(ini_read_string("NAME","fd_num","NAME_fd_num"));
            type_button_arr[14,1] = string_upper(ini_read_string("NAME","killer_num","NAME_killer_num"));
            type_button_arr[15,1] = string_upper(ini_read_string("NAME","mur_num","NAME_mur_num"));
            type_button_arr[16,1] = string_upper(ini_read_string("NAME","sg_num_hd","NAME_sg_num_hd"));
            type_button_arr[17,1] = string_upper(ini_read_string("NAME","bodybag_num_hd","NAME_bodybag_num_hd"));
            type_button_arr[18,1] = string_upper(ini_read_string("NAME","stem_num_hd","NAME_stem_num_hd"));
            type_button_arr[19,1] = string_upper(ini_read_string("NAME","patient_num_hd","NAME_patient_num_hd"));
            type_button_arr[20,1] = string_upper(ini_read_string("NAME","gc_num_hd","NAME_gc_num_hd"));
            type_button_arr[21,1] = string_upper(ini_read_string("NAME","bekka_num","NAME_bekka_num"));
            type_button_arr[22,1] = string_upper(ini_read_string("NAME","husk_hd","NAME_husk_hd"));
            type_button_arr[27,1] = string_upper(ini_read_string("NAME","real_ringu_num","NAME_real_ringu_num"));
            type_button_arr[28,1] = string_upper(ini_read_string("NAME","tiri_num","NAME_tiri_num"));
            type_button_arr[29,1] = string_upper(ini_read_string("NAME","lisa_num","NAME_lisa_num"));
            type_button_arr[30,1] = string_upper(ini_read_string("NAME","otto_num","NAME_otto_num"));
            type_button_arr[31,1] = string_upper(ini_read_string("NAME","spooper_num","NAME_spooper_num"));
            type_button_arr[32,1] = string_upper(ini_read_string("NAME","wf_num","NAME_wf_num"));
            break;
        }
    }
    type_button_arr[23,1] = string_upper(ini_read_string("NAME","wc","NAME_wc"));
    type_button_arr[24,1] = string_upper(ini_read_string("NAME","clown","NAME_clown"));
    type_button_arr[25,1] = string_upper(ini_read_string("NAME","hk","NAME_hk"));
    type_button_arr[26,1] = string_upper(ini_read_string("NAME","frenzy","NAME_frenzy"));
    type_button_arr[33,1] = back_str_var;
        // Variable to write to
    type_button_arr[0,3] = "player";
    type_button_arr[1,3] = "axe";
    type_button_arr[2,3] = "js";
    type_button_arr[3,3] = "gel";
    type_button_arr[4,3] = "bug";
    type_button_arr[5,3] = "ringu";
    type_button_arr[6,3] = "bab";
    type_button_arr[7,3] = "pup";
    type_button_arr[8,3] = "flesh";
    type_button_arr[9,3] = "dl";
    type_button_arr[10,3] = "taker";
    type_button_arr[11,3] = "eel";
    type_button_arr[12,3] = "para";
    type_button_arr[13,3] = "fd";
    type_button_arr[14,3] = "killer";
    type_button_arr[15,3] = "mur";
    type_button_arr[16,3] = "sg";
    type_button_arr[17,3] = "body";
    type_button_arr[18,3] = "stem";
    type_button_arr[19,3] = "patient";
    type_button_arr[20,3] = "gc";
    type_button_arr[21,3] = "bekka";
    type_button_arr[22,3] = "husk";
    type_button_arr[23,3] = "wc";
    type_button_arr[24,3] = "clown";
    type_button_arr[25,3] = "hk";
    type_button_arr[26,3] = "frenzy";
    type_button_arr[27,3] = "real_ringu";
    type_button_arr[28,3] = "tiri";
    type_button_arr[29,3] = "lisa";
    type_button_arr[30,3] = "otto";
    type_button_arr[31,3] = "spooper";
    type_button_arr[32,3] = "wf";
        // Extra Settings
    type_button_arr[4,2] = 4; // Bug
    type_button_arr[4,4] = rouge_str_var;
    type_button_arr[5,2] = 4; // Ringu
    type_button_arr[5,4] = old_str_var;
    type_button_arr[6,2] = 4; // Bab
    type_button_arr[6,4] = old_str_var;
    type_button_arr[7,2] = 6; // Puppet
    type_button_arr[7,4] = old_str_var;
    type_button_arr[7,5] = dh_str_var;
    type_button_arr[7,6] = dh_str_var+" "+hd_str_var;
    type_button_arr[9,2] = 6; // Deer Lord
    type_button_arr[9,4] = old_str_var;
    type_button_arr[9,5] = rouge_str_var;
    type_button_arr[9,6] = yoshi_str_var;
    type_button_arr[11,2] = 4; // Eel
    type_button_arr[11,4] = yoshi_str_var;
    type_button_arr[13,2] = 5; // Food Demon
    type_button_arr[13,4] = dh_str_var;
    type_button_arr[13,5] = dh_str_var+" "+hd_str_var;
    type_button_arr[14,2] = 8; // Killer
    type_button_arr[14,4] = old_str_var;
    type_button_arr[14,5] = yoshi_str_var;
    type_button_arr[14,6] = rouge_str_var;
    type_button_arr[14,7] = alt_str_var+" 1";
    type_button_arr[14,8] = alt_str_var+" 2";
    type_button_arr[17,2] = 6; // Bodybag
    type_button_arr[17,4] = kh_str_var;
    type_button_arr[17,5] = old_str_var;
    type_button_arr[17,6] = alt_str_var;
    type_button_arr[18,2] = 7; // Stem
    type_button_arr[18,4] = kh_str_var;
    type_button_arr[18,5] = kh_str_var+" "+hd_str_var;
    type_button_arr[18,6] = old_str_var;
    type_button_arr[18,7] = alt_str_var;
    type_button_arr[19,2] = 4; // Patient
    type_button_arr[19,4] = alt_str_var;
    type_button_arr[20,2] = 7; // Ghost Cow
    type_button_arr[20,4] = kh_str_var;
    type_button_arr[20,5] = kh_str_var+" "+hd_str_var;
    type_button_arr[20,6] = alt_str_var;
    type_button_arr[20,7] = kh_str_var+" "+mod_str_var;
    type_button_arr[21,2] = 6; // Bekka
    type_button_arr[21,4] = yoshi_str_var;
    type_button_arr[21,5] = rouge_str_var;
    type_button_arr[21,6] = alt_str_var;
    type_button_arr[23,2] = 4; // Woormy Charles
    type_button_arr[23,4] = yoshi_str_var;
    type_button_arr[24,2] = 4; // Clown
    type_button_arr[24,4] = alt_str_var;
    type_button_arr[27,2] = 4; // Real Ringu
    type_button_arr[27,4] = old_str_var;
    type_button_arr[28,2] = 4; // Tirsiak
    type_button_arr[28,4] = old_str_var;
    type_button_arr[30,2] = 4; // Otto
    type_button_arr[30,4] = old_str_var;
    type_button_arr[32,2] = 7; // White Face
    type_button_arr[32,4] = old_str_var;
    type_button_arr[32,5] = imscared_str_var;
    type_button_arr[32,6] = alt_str_var;
    type_button_arr[32,7] = imscared_str_var+" "+mod_str_var;
    ini_close();
    for (local.i=0; local.i<type_button_len_var-1; local.i+=1;)
    { type_button_arr[local.i,0] = -1; }
    // States
    state_var = 0;
    // Draw Control
    image_alpha = 0;
    story_prog_var = 1;
    str_scale_var = 0.8;
    cloud_alarm_var = 1243;
    path_cloud_alarm_var = 720;
    // Lightning
    light_fade_min_var = 9;
    light_fade_max_var = 18;
    light_alarm_min_var = 60;
    light_alarm_max_var = 240;
    light_delay_min_var = 20;
    light_delay_max_var = 60;
    light_num_var = 1;
    light_den_var = 3;
    light_double_num_var = 1;
    light_double_den_var = 4;
    spook_num_var = 1;
    spook_den_var = 6;
    spook_alpha_max_var = 0.2;
    spook_alarm_var = 25;
    flash_alarm_var = 3;
    // Rain
    if rain_var
    {
        part_emitter_stream(rain_part_sys,rain_part_emit,rain_part_type[0],1);
        rain_inst_var = fmod_snd_loop_scr(rain_snd);
    }
    // Old
    title_alarm_min_var = 60;
    title_alarm_max_var = 240;
    title_01_anim_var = 14;
    title_02_anim_var = 48; // log base 1.05 (10)
    // Button Scroll
    do_scroll_focal_var = true;
    scroll_var = 0;
    scroll_rate_var = 0.2;
    scroll_min_var = 0.5;
	// Default Save Variables
	save_name_var = "";
	save_violence_var = 0;
	save_rm_count_var = 0;
	save_note_var = 0;
    save_mode_var=1;
	save_diff_var = 2;
	save_custom_var = false;
	save_rm_var = hall_01_rm;
	save_type_var=0;
    // Save List
	ds_list_clear(global.save_list);
	ini_open("saves.ini");		
	ds_list_read(global.save_list,ini_read_string("SAVES","SAVES","2F01000000000000"));
	ini_close();
    // Scale
    scale_min_var = 0.125;
    if view_wview[0] >= view_hview[0]
    { scale_var = view_hview[0]/720; }
    else { scale_var = view_wview[0]/1280; }
    scale_var = max(scale_var,scale_min_var);
    left_var = 54*scale_var;
    right_var = view_wview[0]-(54*scale_var);
    top_var = 54*scale_var;
    bottom_var = view_hview[0]-(54*scale_var);
    shadow_off_var = 2*scale_var;
    scale_big_var = max(0.75*scale_var,scale_min_var);
    scale_med_var = max(0.5*scale_var,scale_min_var);
    scale_small_var = max(0.25*scale_var,scale_min_var);
    center_var = view_wview[0]/2;
    scale_story_var = max(0.4*scale_var,scale_min_var);
    scale_skip_var = max(0.3*scale_var,scale_min_var);
    // Alarms
    alarm_len_var = 14;
    set_alarm_scr(0,3000);
    set_alarm_scr(9,cloud_alarm_var);
    set_alarm_scr(10,path_cloud_alarm_var);
');
// Room End
object_event_add
(argument0,ev_other,ev_room_end,'
    background_delete(bg_var);
    background_delete(cloud_bg_var);
    if rain_var
    {
        background_delete(light_01_bg_var);
        background_delete(light_02_bg_var);
    }
    background_delete(path_bg_var);
    background_delete(path_cloud_bg_var);
    background_delete(multi_bg_var);
    sprite_delete(set_spr_var);
    sprite_delete(title_spr_var);
    if old_var { sprite_delete(title_02_spr_var); }
	fmod_snd_free_scr(menu_mus_snd_var);
	fmod_snd_free_scr(story_mus_snd_var);
	fmod_snd_free_scr(popup_snd_var);
	fmod_snd_free_scr(confirm_snd_var);
    fmod_snd_free_scr(select_snd_var);
	fmod_snd_free_scr(start_snd_var);
    fmod_inst_stop_scr(rain_inst_var);
    for (local.i=0; local.i<sub_bg_len_var; local.i+=1;)
    { background_delete(sub_bg_arr[local.i]); }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
	
    x = (x-global.true_delta_time_var) mod background_get_width(cloud_bg_var);
    if alarm_arr[4,0] > 0 { light_alpha_01_var = alarm_arr[4,0]/alarm_arr[4,1]; }
    if alarm_arr[6,0] > 0 { light_alpha_02_var = alarm_arr[6,0]/alarm_arr[6,1]; }
    if alarm_arr[7,0] > 0 { spook_alpha_var = spook_alpha_max_var*alarm_arr[7,0]/alarm_arr[7,1]; }
    if alarm_arr[9,0] > 0 { cloud_prog_var = alarm_arr[9,0]/alarm_arr[9,1]; }
    if rain_var { part_system_update(rain_part_sys); }
    switch state_var
    {
        case 0: // Story
        {
            if alarm_arr[0,0] > 0 { story_prog_var = alarm_arr[0,0]/alarm_arr[0,1]; }
            if alarm_arr[10,0] > 0 { path_cloud_prog_var = alarm_arr[10,0]/alarm_arr[10,1]; }
            if global.input_press_arr[confirm_input_const,0]
            {
                event_perform(ev_alarm,0);
                set_alarm_scr(0,-1);
            }
            break;
        }
        case 1: // Press Confirm
        {
            time_var = (time_var+global.true_delta_time_var) mod 120;
            str_alpha_var = (cos(2*time_var*pi/120)+1)/2;
            if global.input_press_arr[confirm_input_const,0]
            {
                state_var = 8;
                event_user(0);
                inst_var = fmod_snd_play_scr(menu_mus_snd_var); // start_snd_var
                set_alarm_scr(1,80);
            }
            break;
        }
        case 8: // Post Confirm
        {
            if global.input_press_arr[confirm_input_const,0]
            {
                event_perform(ev_alarm,1);
                set_alarm_scr(1,-1);
            }
            break;
        }
        case 2: // Main
        {
            local.swap = global.input_press_arr[left_input_const,0] || global.input_press_arr[right_input_const,0];
            if button_state_var < 4
            {
                if local.swap { button_state_var = max(4,button_state_var+2); fmod_snd_play_scr(select_snd_var); }
                else
                {
                    if global.input_press_arr[up_input_const,0] { button_state_var -= 1; fmod_snd_play_scr(select_snd_var); }
                    if global.input_press_arr[down_input_const,0] { button_state_var += 1; fmod_snd_play_scr(select_snd_var); }
                    button_state_var = mod_scr(button_state_var,4);
                }
            }
            else
            {
                if local.swap { button_state_var -= 2; fmod_snd_play_scr(select_snd_var); }
                else
                {
                    if global.input_press_arr[up_input_const,0] { button_state_var -= 1; fmod_snd_play_scr(select_snd_var); }
                    if global.input_press_arr[down_input_const,0] { button_state_var += 1; fmod_snd_play_scr(select_snd_var); }
                    button_state_var = mod_scr(button_state_var-4,2)+4;
                }
            }
            time_var = (time_var+global.true_delta_time_var) mod 160;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            title_y_var = 141+(sin(2*time_var*pi/160)*10);
            if old_var
            {
                title_02_y_var = 270+(sin(2*(time_var+15)*pi/160)*10);
                if alarm_arr[13,0] > 0
                { title_02_scale_var = 78*sqr(1-(alarm_arr[13,0]/alarm_arr[13,1])); }
                if alarm_arr[12,0] > 0
                { title_spr_id_var = floor(sprite_get_number(title_spr_var)*(1-(alarm_arr[12,0]/alarm_arr[12,1]))); }
            }
            if global.input_press_arr[confirm_input_const,0]
            {
                local.snd = true;
                switch button_state_var
                {
                    case 0:
					{
						state_var = 3;
						event_user(0);
						
						sub_bg_var = irandom_range(0,sub_bg_len_var-1);
						
						save_name_var = "";
						save_violence_var = 0;
						save_rm_count_var = 0;
						save_note_var = 0;
						save_diff_var = 2;
                        save_mode_var=1;
						save_custom_var = false;
						save_room = hall_01_rm;
						
                        for (local.i=0; local.i<custom_button_len_var; local.i+=1)
                        { custom_button_arr[local.i,0] = -1; }
						
						save_type_var=0;
						for (local.i=0; local.i<type_button_len_var-1; local.i+=1;)
                        { type_button_arr[local.i,0] = -1; }
						
						break;
					}
					case 1:
					{
						if ds_list_size(global.save_list) > 0
						{
							button_str_arr[6] = -1;
							button_str_arr[6,0] = "BACK";
						
							local.save_index = 0;
							local.name = "";
							
							repeat(ds_list_size(global.save_list))
							{
                                local.name = string(ds_list_find_value(global.save_list,local.save_index));
                                button_str_arr[6,local.save_index+1] = local.name;
                                
                                local.save_index += 1;
							}
							
							state_var = 6;
							event_user(0);
							
							sub_bg_var = irandom_range(0,sub_bg_len_var-1);
						}
						break;
					}
                    case 2:
                    {
                        highscore_show_ext(-1,menu_score_bg,true,c_yellow,c_purple,"Lunchtime Doubly So",16);
                        global.last_time_var = current_time;
                        break;
                    }
                    case 3: { game_end(); break; }
                    case 4:
                    {
                        state_var = 7;
                        global.input_press_arr[confirm_input_const,0] = 0;
                        global.input_arr[confirm_input_const,0] = 0;
                        instance_create(0,0,set_menu_obj);
                        event_user(0);
                        break;
                    }
                    case 5:
                    {
                        state_var = 9;
                        event_user(0);

                        sub_bg_var = irandom_range(0,sub_bg_len_var-1);
                        break;
                    }
                    default: { local.snd = false; }
                }
            }
            if local.snd { fmod_snd_play_scr(confirm_snd_var); }
            break;
        }
        case 3: //Save Creation
        {
			subbgscroll_var += global.true_delta_time_var;
			
			if subbgalpha_var < 1
			subbgalpha_var += (0.04*global.true_delta_time_var);
            // Text Stretch
            time_var = (time_var+global.true_delta_time_var) mod 80;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            // Scroll
            if global.input_press_arr[up_input_const,0] { button_state_var -= 1; fmod_snd_play_scr(select_snd_var); }
            if global.input_press_arr[down_input_const,0] { button_state_var += 1; fmod_snd_play_scr(select_snd_var); }
            button_state_var = mod_scr(button_state_var,7);
            // Lerp
            if do_scroll_focal_var
            {
                scroll_focal_var = median(button_state_var-2,button_state_var+2,scroll_focal_var);
                local.state = scroll_focal_var
            }
            else { local.state = button_state_var; }
            local.target_scroll = -96*median(0,2,local.state-2);
            local.scroll_diff = abs(local.target_scroll-scroll_var);
            local.scroll_rate = max(scroll_min_var,local.scroll_diff*scroll_rate_var)*global.true_delta_time_var;
            scroll_var += min(local.scroll_diff,local.scroll_rate)*sign(local.target_scroll-scroll_var);
            // Confirm
            if global.input_press_arr[confirm_input_const,0]
            {
                local.snd = true;
                switch button_state_var
                {
                    // Play
                    case 0:
                    {
						state_var = 12;
						keyboard_string = "";
						event_user(0);
						break;
                    }
                    // Customize
                    case 5:
                    {
                        if save_custom_var
                        {
                            state_var = 4;
                            event_user(0);
                        }
                        else
                        {
                            local.snd = false;
                            fmod_snd_play_scr(deny_snd);
                        }
                        break;
                    }
                    // Back
                    case 6:
					{
						state_var = 2;
						event_user(0);
						subbgalpha_var = 0;
						break;
					}
                    default: { local.snd = false; break; }
                }
                if local.snd { fmod_snd_play_scr(confirm_snd_var); }
            }
			if global.input_press_arr[left_input_const,0] || global.input_press_arr[right_input_const,0]
            {
                local.snd = true;
                local.add = (global.input_press_arr[right_input_const,0] > 0)-(global.input_press_arr[left_input_const,0] > 0);
                switch button_state_var
				{
                    case 1:
                    {
                        save_mode_var = mod_scr(save_mode_var+local.add,3);
                        break;
                    }
                    case 2:
                    {
                        if save_custom_var { local.md = 6; }
                        else { local.md = 5; }
                        save_diff_var = mod_scr(save_diff_var+local.add,local.md);
                        break;
                    }
                    case 3:
                    {
                        save_type_var = mod_scr(save_type_var+local.add,3);
                        break;
                    }
                    case 4:
                    {
                        save_custom_var = mod_scr(save_custom_var+local.add,2);
                        if !save_custom_var && save_diff_var == 5
                        { save_diff_var = mod_scr(save_diff_var,5); }
                        break;
                    }
                    default: { local.snd = false; break; }
                }
            }
            if local.snd { fmod_snd_play_scr(select_snd_var); }
			break;
        }
        case 4: // Customize
        {
            // Effects! (I don"t know how this works, but I trust Bird"s judgement)
            subbgscroll_var += (1*global.true_delta_time_var);
			
			if subbgalpha_var < 1
			subbgalpha_var += (0.04*global.true_delta_time_var);
            // Text Stretch
            time_var = (time_var+global.true_delta_time_var) mod 80;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            // Scroll
            if global.input_press_arr[up_input_const,0] { button_state_var -= 1; fmod_snd_play_scr(select_snd_var); }
            if global.input_press_arr[down_input_const,0] { button_state_var += 1; fmod_snd_play_scr(select_snd_var); }
            button_state_var = mod_scr(button_state_var,custom_button_len_var);
            // Lerp
            if do_scroll_focal_var
            {
                scroll_focal_var = median(button_state_var-2,button_state_var+2,scroll_focal_var);
                local.state = scroll_focal_var
            }
            else { local.state = button_state_var; }
            local.target_scroll = -96*median(0,custom_button_len_var-5,local.state-2);
            local.scroll_diff = abs(local.target_scroll-scroll_var);
            local.scroll_rate = max(scroll_min_var,local.scroll_diff*scroll_rate_var)*global.true_delta_time_var;
            scroll_var += min(local.scroll_diff,local.scroll_rate)*sign(local.target_scroll-scroll_var);
            // Confirm
            if global.input_press_arr[confirm_input_const,0]
            {
                local.snd = true;
                switch custom_button_arr[button_state_var,3]
                {
                    case -2: // Back
                    {
                        state_var = 3;
                        event_user(0);
                        break;
                    }
                    case -1: // Behavior
                    {
                        state_var = 5;
                        event_user(0);
                        break;
                    }
                    case 0: // Enum
                    {
                        custom_button_arr[button_state_var,0] += 1;
                        if custom_button_arr[button_state_var,4]
                        { 
                            custom_button_arr[button_state_var,0] = mod_scr
                            (
                                custom_button_arr[button_state_var,0]+1,
                                custom_button_arr[button_state_var,5]+2
                            )-1;
                        }
                        else { custom_button_arr[button_state_var,0] = median(custom_button_arr[button_state_var,0],-1,custom_button_arr[button_state_var,5]); }
                        break;
                    }
                    case 1: // Number
                    {
                        custom_button_arr[button_state_var,0] = max(get_integer(custom_button_arr[button_state_var,2],custom_button_arr[button_state_var,0]),-1);
                        global.input_arr[confirm_input_const,0] = 0;
                        break;
                    }
                    default: { local.snd = false; break; }
                }
                if local.snd { fmod_snd_play_scr(confirm_snd_var); }
            }
            if global.input_press_arr[left_input_const,0] || global.input_press_arr[right_input_const,0]
            {
                local.snd = true;
                local.add = (global.input_press_arr[right_input_const,0] > 0)-(global.input_press_arr[left_input_const,0] > 0);
                switch custom_button_arr[button_state_var,3]
                {
                    case 0:
                    {
                        custom_button_arr[button_state_var,0] += local.add;
                        if custom_button_arr[button_state_var,4]
                        { 
                            custom_button_arr[button_state_var,0] = mod_scr
                            (
                                custom_button_arr[button_state_var,0]+1,
                                custom_button_arr[button_state_var,5]+2
                            )-1;
                        }
                        else { custom_button_arr[button_state_var,0] = median(custom_button_arr[button_state_var,0],-1,custom_button_arr[button_state_var,5]); }
                        break;
                    }
                    case 1: 
                    {
                        custom_button_arr[button_state_var,0] += local.add;
                        custom_button_arr[button_state_var,0] = max(custom_button_arr[button_state_var,0],-1);
                        break;
                    }
                    default: { local.snd = false; break; }
                }
                if local.snd { fmod_snd_play_scr(select_snd_var); }
            }
            break;
        }
        case 5: // Behavior
        {
            // Effects! (I dont know how this works, but I trust Birds judgement)
            subbgscroll_var += (1*global.true_delta_time_var);
			
			if subbgalpha_var < 1
			subbgalpha_var += (0.04*global.true_delta_time_var);
            // Text Stretch
            time_var = (time_var+global.true_delta_time_var) mod 80;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            // Scroll
            if global.input_press_arr[up_input_const,0] { button_state_var -= 1; fmod_snd_play_scr(select_snd_var); }
            if global.input_press_arr[down_input_const,0] { button_state_var += 1; fmod_snd_play_scr(select_snd_var); }
            button_state_var = mod_scr(button_state_var,type_button_len_var);
            // Lerp
            if do_scroll_focal_var
            {
                scroll_focal_var = median(button_state_var-2,button_state_var+2,scroll_focal_var);
                local.state = scroll_focal_var
            }
            else { local.state = button_state_var; }
            local.target_scroll = -96*median(0,type_button_len_var-5,local.state-2);
            local.scroll_diff = abs(local.target_scroll-scroll_var);
            local.scroll_rate = max(scroll_min_var,local.scroll_diff*scroll_rate_var)*global.true_delta_time_var;
            scroll_var += min(local.scroll_diff,local.scroll_rate)*sign(local.target_scroll-scroll_var);
            // Confirm
            if global.input_press_arr[confirm_input_const,0] && button_state_var == type_button_len_var-1
            {
                state_var = 3;
                event_user(0);
                fmod_snd_play_scr(confirm_snd_var);
            }
            if button_state_var != type_button_len_var-1 && (global.input_press_arr[left_input_const,0] || global.input_press_arr[right_input_const,0])
            {
                local.add = (global.input_press_arr[right_input_const,0] > 0)-(global.input_press_arr[left_input_const,0] > 0);
                type_button_arr[button_state_var,0] = mod_scr(type_button_arr[button_state_var,0]+2+local.add,type_button_arr[button_state_var,2]+2)-2;
                fmod_snd_play_scr(select_snd_var);
            }
            break;
        }
		case 6: //Save Loads
        {
			subbgscroll_var += (1*global.true_delta_time_var);
			
			if subbgalpha_var < 1
			subbgalpha_var += (0.04*global.true_delta_time_var);
			
            // Text Stretch
            time_var = (time_var+global.true_delta_time_var) mod 80;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            // Scroll
            if global.input_press_arr[up_input_const,0]
			{
				button_state_var -= 1;
				fmod_snd_play_scr(select_snd_var);
				if button_state_var != 0
				{
					local.name = string(ds_list_find_value(global.save_list,button_state_var-1));
					
					ini_open("save_"+local.name+".ini");
					
					save_rm_count_var = ini_read_real("MAIN","rm_count",0);
					save_mode_var = ini_read_real("SETTING","mode",1);
					save_diff_var = ini_read_real("MAIN","diff",0);
					save_type_var = ini_read_real("BEHAVIOR","type",0);
					save_custom_var = ini_read_real("MAIN","custom",0);
					
					ini_close();
				}
			}
            if global.input_press_arr[down_input_const,0]
			{
				button_state_var += 1;
				fmod_snd_play_scr(select_snd_var);
				if button_state_var != 0
				{
					local.name = string(ds_list_find_value(global.save_list,button_state_var-1));
					
					ini_open("save_"+local.name+".ini");
					
					save_rm_count_var = ini_read_real("MAIN","rm_count",0);
					save_mode_var = ini_read_real("SETTING","mode",1);
					save_diff_var = ini_read_real("MAIN","diff",0);
					save_type_var = ini_read_real("BEHAVIOR","type",0);
					save_custom_var = ini_read_real("MAIN","custom",0);
					
					ini_close();
				}
			}
            button_state_var = mod_scr(button_state_var,1+ds_list_size(global.save_list));
            // Lerp
            if do_scroll_focal_var
            {
                scroll_focal_var = median(button_state_var-2,button_state_var+2,scroll_focal_var);
                local.state = scroll_focal_var
            }
            else { local.state = button_state_var; }
            local.target_scroll = -96*median(0,ds_list_size(global.save_list)-4,local.state-2);
            local.scroll_diff = abs(local.target_scroll-scroll_var);
            local.scroll_rate = max(scroll_min_var,local.scroll_diff*scroll_rate_var)*global.true_delta_time_var;
            scroll_var += min(local.scroll_diff,local.scroll_rate)*sign(local.target_scroll-scroll_var);
            // Confirm
            if global.input_press_arr[confirm_input_const,0]
            {
                switch button_state_var
                {
					case 0:
					{
						state_var = 2;
						event_user(0);
						subbgalpha_var = 0;
						break;
					}
					default:
					{
						local.name = string(ds_list_find_value(global.save_list,button_state_var-1));
						load_game_scr(local.name);
                        break;
					}
                    fmod_snd_play_scr(confirm_snd_var);
				}
			}
			
			if keyboard_check_pressed(vk_backspace)
			{
				if button_state_var != 0
				{
					if show_message_ext("Are you sure you want to delete this file?","YES","NO","") = 1
					{
						local.name = string(ds_list_find_value(global.save_list,button_state_var-1));
						
						ds_list_delete(global.save_list,ds_list_find_index(global.save_list,string(local.name)));
					
						ini_open("saves.ini");
					
						ini_write_string("SAVES","SAVES",ds_list_write(global.save_list));
					
						ini_close();
						
						//file_delete(working_directory+"save_"+local.name+".ini");
						
						file_delete("save_"+string(local.name)+".ini");
						
						button_state_var = 0;
						
						button_str_arr[6] = -1;
						button_str_arr[6,0] = "BACK";
					
						local.save_index = 0;
						local.name = "";
						
						repeat(ds_list_size(global.save_list))
						{
						local.name = string(ds_list_find_value(global.save_list,local.save_index));
						button_str_arr[6,local.save_index+1] = local.name;
						
						local.save_index += 1;
						}
					}
				}
			}
			break;
		}
        case 9: // Multiplayer
        {
            // Effects! (I dont know how this works, but I trust Birds judgement)
            subbgscroll_var += (1*global.true_delta_time_var);
			
			if subbgalpha_var < 1
			subbgalpha_var += (0.04*global.true_delta_time_var);
            // Text Stretch
            time_var = (time_var+global.true_delta_time_var) mod 80;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            // Scroll
            if global.input_press_arr[up_input_const,0] { button_state_var -= 1; fmod_snd_play_scr(select_snd_var); }
            if global.input_press_arr[down_input_const,0] { button_state_var += 1; fmod_snd_play_scr(select_snd_var); }
            button_state_var = mod_scr(button_state_var,12);
            // Lerp
            if do_scroll_focal_var
            {
                scroll_focal_var = median(button_state_var-2,button_state_var+2,scroll_focal_var);
                local.state = scroll_focal_var
            }
            else { local.state = button_state_var; }
            local.target_scroll = -96*median(0,7,local.state-2);
            local.scroll_diff = abs(local.target_scroll-scroll_var);
            local.scroll_rate = max(scroll_min_var,local.scroll_diff*scroll_rate_var)*global.true_delta_time_var;
            scroll_var += min(local.scroll_diff,local.scroll_rate)*sign(local.target_scroll-scroll_var);
            // Confirm
            if global.input_press_arr[confirm_input_const,0]
            {
                fmod_update_take_over_when_lock_scr();
                local.snd = true;
                switch button_state_var
                {
                    case 2:
                    {
                        global.player_name_var[player_id_var] = get_string("Player Name",global.player_name_var[player_id_var]);
                        break;
                    }
                    case 5:
                    {
                        local.red = median(get_integer("Player Red",color_get_red(global.player_color_var[player_id_var])),0,255);
                        local.green = color_get_green(global.player_color_var[player_id_var]);
                        local.blue = color_get_blue(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_rgb(local.red,local.green,local.blue);
                        break;
                    }
                    case 6:
                    {
                        local.red = color_get_red(global.player_color_var[player_id_var]);
                        local.green = median(get_integer("Player Green",color_get_green(global.player_color_var[player_id_var])),0,255);
                        local.blue = color_get_blue(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_rgb(local.red,local.green,local.blue);
                        break;
                    }
                    case 7:
                    {
                        local.red = color_get_red(global.player_color_var[player_id_var]);
                        local.green = color_get_green(global.player_color_var[player_id_var]);
                        local.blue = median(get_integer("Player Blue",color_get_blue(global.player_color_var[player_id_var])),0,255);
                        global.player_color_var[player_id_var] = make_color_rgb(local.red,local.green,local.blue);
                        break;
                    }
                    case 8:
                    {
                        local.hue = median(get_integer("Player Hue",color_get_hue(global.player_color_var[player_id_var])),0,255);
                        local.saturation = color_get_saturation(global.player_color_var[player_id_var]);
                        local.value = color_get_value(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_hsv(local.hue,local.saturation,local.value);
                        break;
                    }
                    case 9:
                    {
                        local.hue = color_get_hue(global.player_color_var[player_id_var]);
                        local.saturation = median(get_integer("Player Saturation",color_get_saturation(global.player_color_var[player_id_var])),0,255);
                        local.value = color_get_value(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_hsv(local.hue,local.saturation,local.value);
                        break;
                    }
                    case 10:
                    {
                        local.hue = color_get_hue(global.player_color_var[player_id_var]);
                        local.saturation = color_get_saturation(global.player_color_var[player_id_var]);
                        local.value = median(get_integer("Player Value",color_get_value(global.player_color_var[player_id_var])),0,255);
                        global.player_color_var[player_id_var] = make_color_hsv(local.hue,local.saturation,local.value);
                        break;
                    }
                    case 11:
                    {
                        state_var = 2;
						event_user(0);
						subbgalpha_var = 0;
                        break;
                    }
                    default: { local.snd = false; }
                }
                if local.snd { fmod_snd_play_scr(confirm_snd_var); }
                global.input_arr[confirm_input_const,0] = 0;
                global.last_time_var = current_time;
                fmod_update_take_over_done_scr();
            }
            if global.input_press_arr[left_input_const,0] || global.input_press_arr[right_input_const,0]
            {
                local.snd = true;
                local.add = (global.input_press_arr[right_input_const,0] > 0)-(global.input_press_arr[left_input_const,0] > 0);
                switch button_state_var
                {
                    case 0:
                    {
                        global.player_len_var = mod_scr(global.player_len_var+local.add-1,8)+1;
                        break;
                    }
                    case 1:
                    {
                        player_id_var = mod_scr(player_id_var+local.add,global.player_len_var);
                        break;
                    }
                    case 3:
                    {
                        global.player_spr_var[player_id_var] = mod_scr(global.player_spr_var[player_id_var]+local.add,2);
                        break;
                    }
                    case 4:
                    {
                        global.player_spr_id_var[player_id_var] = mod_scr(global.player_spr_id_var[player_id_var]+local.add,3);
                        break;
                    }
                    case 5:
                    {
                        local.red = median(color_get_red(global.player_color_var[player_id_var])+(local.add*8),0,255);
                        local.green = color_get_green(global.player_color_var[player_id_var]);
                        local.blue = color_get_blue(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_rgb(local.red,local.green,local.blue);
                        break;
                    }
                    case 6:
                    {
                        local.red = color_get_red(global.player_color_var[player_id_var]);
                        local.green = median(color_get_green(global.player_color_var[player_id_var])+(local.add*8),0,255);
                        local.blue = color_get_blue(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_rgb(local.red,local.green,local.blue);
                        break;
                    }
                    case 7:
                    {
                        local.red = color_get_red(global.player_color_var[player_id_var]);
                        local.green = color_get_green(global.player_color_var[player_id_var]);
                        local.blue = median(color_get_blue(global.player_color_var[player_id_var])+(local.add*8),0,255);
                        global.player_color_var[player_id_var] = make_color_rgb(local.red,local.green,local.blue);
                        break;
                    }
                    case 8:
                    {
                        local.hue = median(color_get_hue(global.player_color_var[player_id_var])+(local.add*8),0,255);
                        local.saturation = color_get_saturation(global.player_color_var[player_id_var]);
                        local.value = color_get_value(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_hsv(local.hue,local.saturation,local.value);
                        break;
                    }
                    case 9:
                    {
                        local.hue = color_get_hue(global.player_color_var[player_id_var]);
                        local.saturation = median(color_get_saturation(global.player_color_var[player_id_var])+(local.add*8),0,255);
                        local.value = color_get_value(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_hsv(local.hue,local.saturation,local.value);
                        break;
                    }
                    case 10:
                    {
                        local.hue = color_get_hue(global.player_color_var[player_id_var]);
                        local.saturation = color_get_saturation(global.player_color_var[player_id_var]);
                        local.value = median(color_get_value(global.player_color_var[player_id_var])+(local.add*8),0,255);
                        global.player_color_var[player_id_var] = make_color_hsv(local.hue,local.saturation,local.value);
                        break;
                    }
                    default: { local.snd = false; break; }
                }
                if local.snd { fmod_snd_play_scr(select_snd_var); }
            }
            break;
        }
		case 12: //Name Entry
        {
			subbgscroll_var += (1*global.true_delta_time_var);
			
			if subbgalpha_var < 1
			subbgalpha_var += (0.04*global.true_delta_time_var);
			
			if keyboard_string = " "
			{
				keyboard_string = "";
			}
			
			if string_length(keyboard_string) > 20
			{
				keyboard_string = string_copy(keyboard_string,1,20);
			}
			
			if keyboard_check_pressed(vk_escape)
			{
                fmod_snd_play_scr(confirm_snd_var);
				state_var = 3;
				event_user(0);
			}
			
			if keyboard_check_pressed(vk_enter) and keyboard_string != ""
			{
				save_name_var = keyboard_string;
				global.save_name_var = save_name_var;
                // Save Info
				global.rm_count_var = save_rm_count_var;
				global.violence_var = save_violence_var;
				global.note_var = save_note_var;
                save_rm_var = hall_01_rm;
				// Main settings
                global.mode_var = save_mode_var;
                global.main_type_var = save_type_var;
                global.custom_var = save_custom_var;
				
				// Difficulty
                if global.main_type_var == 1 { global.diff_var = -2; } // OG
                else if global.main_type_var == 2 { global.diff_var = -1; } // HD
                else if save_diff_var == 5 && !global.custom_var { global.diff_var = 4; }
                else { global.diff_var = save_diff_var; }

                // Custom stuff
                for (local.i=0; local.i<custom_button_len_var-1; local.i+=1;)
                {
                    if custom_button_arr[local.i,3] >= 0
                    {
                        // Default
                        if custom_button_arr[local.i,0] == -1 || !global.custom_var
                        {
                            switch custom_button_arr[local.i,7]
                            {
                                case 0: // Type based
                                {
                                    // Starts at 9 plus the max value to avoid array conflicts
                                    local.index = 9+global.main_type_var+custom_button_arr[local.i,5];
                                    if !is_string(custom_button_arr[local.i,local.index]) { local.index = 9+custom_button_arr[local.i,5]; }
                                    break;
                                }
                                case 1: // Difficulty based
                                {
                                    // Starts at 12 because -3 is default, -2 is OG, and -1 is HD
                                    local.index = 12+global.diff_var+custom_button_arr[local.i,5];
                                    if !is_string(custom_button_arr[local.i,local.index]) { local.index = 9+custom_button_arr[local.i,5]; }
                                    break;
                                }
                                case 2:
                                {
                                    if global.mode_var < 2
                                    { local.index = 10+global.main_type_var+(global.mode_var*3)+custom_button_arr[local.i,5]; }
                                    else { local.index = 14+global.mode_var+custom_button_arr[local.i,5]; }
                                    if !is_string(custom_button_arr[local.i,local.index]) { local.index = 9+custom_button_arr[local.i,5]; }
                                    break;
                                }
                            }
                            local.value = custom_button_arr[local.i,local.index]
                            execute_string("global."+custom_button_arr[local.i,6]+"_var = "+local.value);
                        }
                        else { execute_string("global."+custom_button_arr[local.i,6]+"_var = "+string(custom_button_arr[local.i,0])); }
                    }
                }

				// Behavior stuff
                for (local.i=0; local.i<type_button_len_var-1; local.i+=1;)
                {
                    if type_button_arr[local.i,0] == -1 || !global.custom_var
                    {
                        if global.diff_var == 5 { local.type = -1; }
                        else { local.type = save_type_var; }
                        execute_string("global."+type_button_arr[local.i,3]+"_type_var = "+string(local.type));
                    }
                    else if type_button_arr[local.i,0] < 0
                    { execute_string("global."+type_button_arr[local.i,3]+"_type_var = -1;"); }
                    else { execute_string("global."+type_button_arr[local.i,3]+"_type_var = "+string(type_button_arr[local.i,0])); }
                }
				
                // Boot it up!
                for (local.i=0; local.i<global.player_len_var; local.i+=1;)
                {
                    local.player = instance_create(0,0,player_obj);
                    global.player_arr[local.i] = local.player;
                    local.player.player_id_var = local.i;
                    local.player.cam_id_var = local.i;
                    local.hud = instance_create(0,0,hud_obj);
                    local.hud.par_var = local.player;
                    local.axe = instance_create(0,0,axe_obj);
                    local.axe.par_var = local.player;
                    if global.player_len_var > 1
                    {
                        with instance_create(0,0,player_render_obj)
                        {
                            player_id_var = local.i;
                            par_var = local.player;
                            event_user(0);
                        }
                    }
                }
                event_user(1);
				instance_create(0,0,mus_control_obj);
                global.count_var = get_count_scr();
                if save_name_var == "1987" { instance_create(0,0,otter8_js_obj); }

                tex_scr(-1);
                zone_scr(-1);
			}
			break;
		}
    }
');
// Story to confirm
object_event_add
(argument0,ev_alarm,0,'
    state_var += 1;
    story_prog_var = 0;
    event_user(0);
');
// Post Confirm to menu
object_event_add
(argument0,ev_alarm,1,'
    /*fmod_inst_stop_scr(inst_var);
    inst_var = fmod_snd_play_scr(menu_mus_snd_var);
    fmod_inst_set_pos_scr(inst_var,6/71);*/
    state_var = 2;
    event_user(0);
    event_perform(ev_alarm,3);
    set_alarm_scr(5,irandom_range(light_delay_min_var,light_delay_max_var));
    if rain_var { set_alarm_scr(2,light_alarm_max_var); }
    if old_var
    {
        set_alarm_scr(12,title_01_anim_var);
        set_alarm_scr(13,title_02_anim_var);
    }
');
// Lightning Alarm
object_event_add
(argument0,ev_alarm,2,'
    if frac_chance_scr(light_num_var,light_den_var)
    { set_alarm_scr(3,irandom_range(light_delay_min_var,light_delay_max_var)); }
    if frac_chance_scr(light_double_num_var,light_double_den_var)
    { set_alarm_scr(5,irandom_range(light_delay_min_var,light_delay_max_var)); }
    set_alarm_scr(2,irandom_range(light_alarm_min_var,light_alarm_max_var))
');
// Lightning 01 Alarm
object_event_add
(argument0,ev_alarm,3,'
    light_alpha_01_var = 1;
    if frac_chance_scr(spook_num_var,spook_den_var)
    {
        spook_alpha_var = 0.2;
        set_alarm_scr(7,spook_alarm_var);
    }
    if !global.reduce_flash_var
    {
        flash_var = true;
        set_alarm_scr(8,flash_alarm_var);
    }
    fmod_snd_play_scr(choose(lightning_01_snd,lightning_02_snd,lightning_03_snd,lightning_04_snd));
    set_alarm_scr(4,irandom_range(light_fade_min_var,light_fade_max_var));
');
// Lightning 01 Fade Alarm
object_event_add
(argument0,ev_alarm,4,'
    light_alpha_01_var = 0;
');
// Lightning 02 Alarm
object_event_add
(argument0,ev_alarm,5,'
    light_alpha_02_var = 1;
    if !global.reduce_flash_var
    {
        flash_var = true;
        set_alarm_scr(8,flash_alarm_var);
    }
    fmod_snd_play_scr(choose(lightning_01_snd,lightning_02_snd,lightning_03_snd,lightning_04_snd));
    set_alarm_scr(6,irandom_range(light_fade_min_var,light_fade_max_var));
');
// Lightning 02 Fade Alarm
object_event_add
(argument0,ev_alarm,6,'
    light_alpha_02_var = 0;
    set_alarm_scr(3,light_delay_min_var);
');
// Spooky Fade Alarm
object_event_add
(argument0,ev_alarm,7,'
    spook_alpha_var = 0;
');
// Flash
object_event_add
(argument0,ev_alarm,8,'
    flash_var = false;
');
// Cloud Alarm
object_event_add
(argument0,ev_alarm,9,'
    cloud_prog_var = 0;
    set_alarm_scr(9,cloud_alarm_var);
');
// Path Cloud Alarm
object_event_add
(argument0,ev_alarm,10,'
    path_cloud_prog_var = 0;
    set_alarm_scr(10,path_cloud_alarm_var);
');
// Title Alarm
object_event_add
(argument0,ev_alarm,11,'
    if !irandom(2) { title_spr_id_var = 0; set_alarm_scr(12,title_01_anim_var); }
    else { set_alarm_scr(11,irandom_range(title_alarm_min_var,title_alarm_max_var)); }
');
// Title Animation Alarm
object_event_add
(argument0,ev_alarm,12,'
    title_spr_id_var = 0;
    set_alarm_scr(11,irandom_range(title_alarm_min_var,title_alarm_max_var));
');
// Title 2 Animation Alarm
object_event_add
(argument0,ev_alarm,13,'
    title_02_scale_var = 78;
');
// Reset state
object_event_add
(argument0,ev_other,ev_user0,'
    time_var = 0;
    button_state_var = 0;
    scroll_var = 0;
    scroll_focal_var = button_state_var;
');
// Save Multiplayer
object_event_add
(argument0,ev_other,ev_user1,'
    for (local.i=0; local.i<global.player_len_var; local.i+=1;)
    {
        ini_open("settings.ini");
        ini_write_string("MULTIPLAYER","name_"+string(local.i),global.player_name_var[local.i]);
        ini_write_real("MULTIPLAYER","spr_"+string(local.i),global.player_spr_var[local.i]);
        ini_write_real("MULTIPLAYER","spr_id_"+string(local.i),global.player_spr_id_var[local.i]);
        ini_write_real("MULTIPLAYER","color_"+string(local.i),global.player_color_var[local.i]);
        ini_close();
    }
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);

    if story_prog_var > 0
    { local.ytmp = -story_prog_var*1440; }
    else { local.ytmp = 0; }
    local.width = view_hview[view_current]*16/9;
    draw_bg_fit_scr(bg_var,0,local.ytmp);

    if rain_var
    {
        // Lightning
        draw_bg_fit_ext_scr(light_01_bg_var,0,local.ytmp,0,c_white,light_alpha_01_var);
        draw_bg_fit_ext_scr(light_02_bg_var,0,local.ytmp,0,c_white,light_alpha_02_var);
        draw_bg_tiled_stretch_scr(cloud_bg_var,cloud_prog_var*1243,18+local.ytmp,1243,0,0); // Stretch X, Tile X

        // Rain Particles
        d3d_set_projection_ortho(0,0,1280,720,0);
        part_system_drawit(rain_part_sys);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    }

    // Effects
    draw_spr_stretch_ext_scr(spooky_spr,0,0,0,1520,0,fa_center,fa_middle,0,c_white,spook_alpha_var);
    if flash_var { draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false); }

    switch state_var
    {
        case 0: // Story
        {
            draw_bg_fit_scr(path_bg_var,0,local.ytmp+720);
            draw_bg_tiled_stretch_scr(path_cloud_bg_var,path_cloud_prog_var*720,lerp_scr(720,0,story_prog_var),720,0,0);
            // Text
            draw_str_scr(skip_str_var,64,64,0.3,0.3,0.125,fa_left,fa_top,0);
            draw_set_color(c_red);
            local.ytmp = lerp_scr(-750,750,story_prog_var);
            draw_str_ext_scr(story_str_var,0,local.ytmp,0.4,0.4,0.125,fa_center,fa_top,86,420,0);
            draw_set_color(c_white);
            break;
        }
        case 1: // Press Confirm
        {
            draw_set_alpha(str_alpha_var);
            draw_str_shadow_scr(confirm_str_var,0,-96,0.75,0.75,0.125,fa_center,fa_bottom,-4,4,str_bg_color_var,c_yellow,2,0);
            draw_set_alpha(1);
            break;
        }
        case 2: // Main
        {
            draw_spr_stretch_scr(title_spr_var,title_spr_id_var,393,title_y_var,666,0,fa_left,fa_top);
            if old_var { draw_spr_scale_scr(title_02_spr_var,0,394.5,title_02_y_var,339,title_02_scale_var,fa_left,fa_top); }
            for (local.i=0; local.i<4; local.i+=1)
            {
                if local.i != button_state_var
                {
                    draw_str_shadow_scr
                    (
                        button_str_arr[state_var,local.i],
                        96,336+(96*local.i),0.75,0.75,0.125,fa_left,fa_top,
                        -4,4,str_bg_color_var,c_yellow,2,0
                    );
                }
            }
            if button_state_var < 4
            {
                local.ytmp = 336+(96*button_state_var);
                draw_spr_stretch_scr(select_spr,0,96,local.ytmp,132,0,fa_left,fa_top);
                draw_str_select_scr
                (
                    button_str_arr[state_var,button_state_var],
                    96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
                    -4,4,str_bg_select_color_var,c_white,2,0,0.75
                );
            }
            draw_spr_stretch_scr(set_spr_var,button_state_var == 4,-105,-183,81,0,fa_right,fa_bottom);
            draw_spr_stretch_scr(set_spr_var,button_state_var == 5,-105,-90,81,0,fa_right,fa_bottom);
            break;
        }
        case 3: // Save Creation
        {
            draw_bg_tiled_stretch_ext_scr(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,512,0,2,0,make_color_rgb(70,0,90),subbgalpha_var);
			
            draw_str_shadow_scr
            (
                "NEW SAVE",
                -20,20,0.95,0.95,0.125,fa_right,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
			
			local.stat_display_var = "";
			
            for (local.i=0; local.i<7; local.i+=1)
            {
                if local.i != button_state_var
                {
                    if local.i == 5 && !save_custom_var
                    { local.color = c_olive; }
                    else { local.color = c_yellow; }

                    draw_str_shadow_scr
                    (
                        button_str_arr[state_var,local.i],
                        96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                        -4,4,str_bg_color_var,local.color,2,0
                    );

                    switch local.i
					{
						case 1:
						{	
							switch save_mode_var
							{
								case 0: { local.stat_display_var = sm_str_var; break; }
								case 1: { local.stat_display_var = em_str_var; break; }
								case 2: { local.stat_display_var = sb_str_var; break; }
							}
							break;
						}
						case 2:
						{
                            if save_type_var == 1 { local.stat_display_var = og_str_var; }
                            else if save_type_var == 2 { local.stat_display_var = hd_str_var; }
                            else
                            {
                                switch save_diff_var
                                {
                                    case 0: { local.stat_display_var = easiest_str_var; break; }
                                    case 1: { local.stat_display_var = easy_str_var; break; }
                                    case 2: { local.stat_display_var = normal_str_var; break; }
                                    case 3: { local.stat_display_var = hard_str_var; break; }
                                    case 4: { local.stat_display_var = hardest_str_var; break; }
                                    case 5: { local.stat_display_var = evil_str_var; break; }
                                }
                            }
							
							break;
						}
						case 3:
						{
							switch save_type_var
							{
								case 0: { local.stat_display_var = mod_str_var; break; }
								case 1: { local.stat_display_var = og_str_var; break; }
								case 2: { local.stat_display_var = hd_str_var; break; }
							}
							break;
						}
						case 4:
						{
							if save_custom_var { local.stat_display_var = on_str_var; }
                            else { local.stat_display_var = off_str_var; }
							break;
						}
						default: { local.stat_display_var = ""; }
					}
					
					if local.stat_display_var != ""
					{
                        draw_str_shadow_scr
                        (
                            string(local.stat_display_var),
                            500,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                            -4,4,str_bg_color_var,c_yellow,2,0
                        );
					}
                }
            }

            if button_state_var == 5 && !save_custom_var
            { local.color = c_gray; }
            else { local.color = c_white; }

            local.ytmp = 144+(96*button_state_var)+scroll_var;
            draw_spr_stretch_scr(select_spr,0,96,local.ytmp,132,0,fa_left,fa_top);
            draw_str_select_scr
            (
                button_str_arr[state_var,button_state_var],
                96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_select_color_var,local.color,2,0,0.75
            );

            switch button_state_var
            {
                case 1:
                {	
                    switch save_mode_var
                    {
                        case 0: { local.stat_display_var = sm_str_var; break; }
                        case 1: { local.stat_display_var = em_str_var; break; }
                        case 2: { local.stat_display_var = sb_str_var; break; }
                    }
                    break;
                }
                case 2:
                {
                    if save_type_var == 1 { local.stat_display_var = og_str_var; }
                    else if save_type_var == 2 { local.stat_display_var = hd_str_var; }
                    else
                    {
                        switch save_diff_var
                        {
                            case 0: { local.stat_display_var = easiest_str_var; break; }
                            case 1: { local.stat_display_var = easy_str_var; break; }
                            case 2: { local.stat_display_var = normal_str_var; break; }
                            case 3: { local.stat_display_var = hard_str_var; break; }
                            case 4: { local.stat_display_var = hardest_str_var; break; }
                            case 5: { local.stat_display_var = evil_str_var; break; }
                        }
                    }
                    
                    break;
                }
                case 3:
                {
                    switch save_type_var
                    {
                        case 0: { local.stat_display_var = mod_str_var; break; }
                        case 1: { local.stat_display_var = og_str_var; break; }
                        case 2: { local.stat_display_var = hd_str_var; break; }
                    }
                    break;
                }
                case 4:
                {
                    if save_custom_var { local.stat_display_var = on_str_var; }
                    else { local.stat_display_var = off_str_var; }
                    break;
                }
                default: { local.stat_display_var = ""; }
            }
            
            if local.stat_display_var != ""
            {
                draw_str_shadow_scr
                (
                    string(local.stat_display_var),
                    500,144+(96*button_state_var)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                    -4,4,str_bg_select_color_var,c_white,2,0
                );
            }
			break;
        }
        case 4: // Customize
        {
			draw_bg_tiled_stretch_ext_scr(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,512,0,2,0,make_color_rgb(70,0,90),subbgalpha_var);
			
            draw_str_shadow_scr
            (
                "CUSTOMIZE",
                -20,20,0.95,0.95,0.125,fa_right,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
			
            for (local.i=0; local.i<custom_button_len_var; local.i+=1)
            {
                if local.i != button_state_var
                {
                    draw_str_shadow_scr
                    (
                        custom_button_arr[local.i,1],
                        96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                        -4,4,str_bg_color_var,c_yellow,2,0
                    );
                    
                    local.str = 0;
                    switch custom_button_arr[local.i,3]
                    {
                        case 0:
                        {
                            if custom_button_arr[local.i,0] == -1 { local.str = def_str_var; }
                            else { local.str = custom_button_arr[local.i,custom_button_arr[local.i,0]+8]; }
                            break;
                        }
                        case 1:
                        {
                            if custom_button_arr[local.i,0] == -1 { local.str = def_str_var; }
                            /*else if is_string(custom_button_arr[local.i,custom_button_arr[local.i,0]+8])
                            { local.str = custom_button_arr[local.i,custom_button_arr[local.i,0]+8]; }*/
                            else { local.str = string(custom_button_arr[local.i,0]); }
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
                custom_button_arr[button_state_var,1],
                96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_select_color_var,c_white,2,0,0.75
            );

            local.str = 0;
            switch custom_button_arr[button_state_var,3]
            {
                case 0:
                {
                    if custom_button_arr[button_state_var,0] == -1 { local.str = def_str_var; }
                    else { local.str = custom_button_arr[button_state_var,custom_button_arr[button_state_var,0]+8]; }
                    break;
                }
                case 1:
                {
                    if custom_button_arr[button_state_var,0] == -1 { local.str = def_str_var; }
                    /*else if is_string(custom_button_arr[button_state_var,custom_button_arr[button_state_var,0]+8])
                    { local.str = custom_button_arr[button_state_var,custom_button_arr[button_state_var,0]+8]; }*/
                    else { local.str = string(custom_button_arr[button_state_var,0]); }
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
            break;
        }
        case 5: // Behavior
        {
            draw_bg_tiled_stretch_ext_scr(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,512,0,2,0,make_color_rgb(70,0,90),subbgalpha_var);
			
			draw_str_shadow_scr
            (
                "BEHAVIOR",
                -20,20,0.95,0.95,0.125,fa_right,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
    
            for (local.i=0; local.i<type_button_len_var; local.i+=1)
            {
                if local.i != button_state_var
                {
                    draw_str_shadow_scr
                    (
                        type_button_arr[local.i,1],
                        96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                        -4,4,str_bg_color_var,c_yellow,2,0
                    );
                    
                    if local.i != type_button_len_var-1
                    {
                        if type_button_arr[local.i,0] < 3
                        {
                            switch type_button_arr[local.i,0]
                            {
                                case -2: { local.str = rand_str_var; break; }
                                case -1: { local.str = def_str_var; break; }
                                case 0: { local.str = mod_str_var; break; }
                                case 1: { local.str = og_str_var; break; }
                                case 2: { local.str = hd_str_var; break; }
                            }
                        }
                        else { local.str = string(type_button_arr[local.i,type_button_arr[local.i,0]+1]); }
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
                type_button_arr[button_state_var,1],
                96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_select_color_var,c_white,2,0,0.75
            );

            if button_state_var != type_button_len_var-1
            {
                if type_button_arr[button_state_var,0] < 3
                {
                    switch type_button_arr[button_state_var,0]
                    {
                        case -2: { local.str = rand_str_var; break; }
                        case -1: { local.str = def_str_var; break; }
                        case 0: { local.str = mod_str_var; break; }
                        case 1: { local.str = og_str_var; break; }
                        case 2: { local.str = hd_str_var; break; }
                    }
                }
                else { local.str = string(type_button_arr[button_state_var,type_button_arr[button_state_var,0]+1]); }
                draw_str_shadow_scr
                (
                    local.str,
                    500,144+(96*button_state_var)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                    -4,4,str_bg_select_color_var,c_white,2,0
                );
            }
            break;
        }
		case 6: // Save Loads
        {			
			draw_bg_tiled_stretch_ext_scr(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,512,0,2,0,make_color_rgb(70,0,90),subbgalpha_var);
			
			draw_set_halign(fa_right); draw_set_color(str_bg_color_var);
			draw_text_transformed(1280-24,24,"LOAD SAVE",0.95,0.95,0);
			draw_text_transformed(1280-22,22,"LOAD SAVE",0.95,0.95,0);
			draw_set_color(c_yellow);
			draw_text_transformed(1280-20,20,"LOAD SAVE",0.95,0.95,0);
			draw_set_halign(fa_left); 
			
			local.stat_display_var = "";
			
			if button_state_var != 0
			{
				draw_set_halign(fa_right);
				draw_text_transformed(1232,125,"ROOM:"+string(save_rm_count_var),0.6,0.6,0);
				
				switch save_mode_var
				{
					case 0:
					{
						local.stat_display_var = "STORY";
						break;
					}
					case 1:
					{
						local.stat_display_var = "ENDLESS";
						break;
					}
					case 2:
					{
						local.stat_display_var = "SANBOX";
						break;
					}
				}
				
				draw_text_transformed(1232,200,"MODE:"+string(local.stat_display_var),0.6,0.6,0);
				
                switch save_type_var
                {
                    case 1: { local.stat_display_var = "OG"; }
                    case 2: { local.stat_display_var = "HD"; }
                    default:
                    {
                        switch save_diff_var
                        {
                            case 0:
                            {
                                local.stat_display_var = "EASIEST";
                                break;
                            }
                            case 1:
                            {
                                local.stat_display_var = "EASY";
                                break;
                            }
                            case 2:
                            {
                                local.stat_display_var = "NORMAL";
                                break;
                            }
                            case 3:
                            {
                                local.stat_display_var = "HARD";
                                break;
                            }
                            case 4:
                            {
                                local.stat_display_var = "HARDEST";
                                break;
                            }
                        }
                        break;
                    }
                }
				draw_text_transformed(1232,275,"DIFFICULTY:"+string(local.stat_display_var),0.6,0.6,0);
				
				switch save_type_var
				{
					case 0:
					{
						local.stat_display_var = "RECODE";
						break;
					}
					case 1:
					{
						local.stat_display_var = "OG";
						break;
					}
					case 2:
					{
						local.stat_display_var = "HD";
						break;
					}
				}
				
				draw_text_transformed(1232,350,"BEHAVIOR:"+string(local.stat_display_var),0.6,0.6,0);
				
				switch save_custom_var
				{
					case 0:
					{
						local.stat_display_var = "NO";
						break;
					}
					case 1:
					{
						local.stat_display_var = "YES";
						break;
					}
				}
				
				draw_text_transformed(1232,425,"CUSTOM:"+string(local.stat_display_var),0.6,0.6,0);
				
				draw_set_halign(fa_left);
			}
			
			draw_set_color(c_white);
			draw_set_alpha(0.5);
			
			draw_text_transformed(855,690,"PRESS BACKSPACE TO DELETE A SAVE FILE",0.3,0.3,0);
			
			draw_set_alpha(1);
			
			for (local.i=0; local.i<(1+ds_list_size(global.save_list)); local.i+=1)
            {
                if local.i != button_state_var
                {
                    local.ytmp = 144+(96*local.i)+scroll_var
                    draw_set_color(str_bg_color_var);
                    draw_text_transformed(92,local.ytmp+4,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_text_transformed(94,local.ytmp+2,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_set_color(c_yellow);
                    draw_text_transformed(96,local.ytmp,button_str_arr[state_var,local.i],0.75,0.75,0);
				}
			}
			
			local.xtmp = 96+(string_width(button_str_arr[state_var,button_state_var])*0.375);
            local.ytmp = 144+(96*button_state_var)+scroll_var;
            draw_set_halign(fa_center); draw_set_color(str_bg_select_color_var);
            draw_text_transformed(local.xtmp-4,local.ytmp+4,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_text_transformed(local.xtmp-2,local.ytmp+2,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_set_color(c_white);
            draw_text_transformed(local.xtmp,local.ytmp,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_set_halign(fa_left); 
			
			break;
		}
        case 9:
        {
            draw_bg_tiled_stretch_ext_scr(multi_bg_var,subbgscroll_var,subbgscroll_var*-1,512,0,2,0,global.player_color_var[player_id_var],subbgalpha_var);
			
            // Draw Preview
            draw_set_color(c_black);
            local.margin = 64*(min(view_wview[view_current]/1280,view_hview[view_current]/720));
            draw_rectangle(local.margin+(view_wview[view_current]/2),local.margin,view_wview[view_current]-local.margin,view_hview[view_current]-local.margin,false);
            draw_set_color(c_white);
            switch global.player_spr_var[player_id_var]
            {
                case 0:
                {
                    d3d_set_fog(true,global.player_color_var[player_id_var],0,0);
                    draw_spr_stretch_scr(ghost_spr,global.player_spr_id_var[player_id_var],-320,0,512,1,fa_right,fa_middle);
                    d3d_set_fog(false,c_black,0,0);
                    break;
                }
                case 1:
                {
                    switch global.player_spr_id_var[player_id_var]
                    {
                        case 0: { local.spr = player_01_spr; break; }
                        case 1: { local.spr = player_02_spr; break; }
                        case 2: { local.spr = player_03_spr; break; }
                    }
                    draw_spr_stretch_ext_scr(local.spr,0,-320,0,512,1,fa_right,fa_center,0,global.player_color_var[player_id_var],1);
                    break;
                }
            }
			
            draw_str_shadow_scr
            (
                "MULTIPLAYER",
                -20,20,0.95,0.95,0.125,fa_right,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );

            for (local.i=0; local.i<12; local.i+=1)
            {
                if local.i != button_state_var
                {
                    draw_str_shadow_scr
                    (
                        button_str_arr[state_var,local.i],
                        96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                        -4,4,str_bg_color_var,c_yellow,2,0
                    );

                    local.str = 0;
                    switch local.i
					{
						case 0: { local.str = string(global.player_len_var); break; }
						case 1: { local.str = string(player_id_var+1); break; }
                        case 2: { local.str = global.player_name_var[player_id_var]; break; }
                        case 3:
                        {
                            switch global.player_spr_var[player_id_var]
                            {
                                case 0: { local.str = "SHADOW"; break; }
                                case 1: { local.str = "SPOOKY BOI"; break; }
                            }
                            break;
                        }
                        case 4: { local.str = string(global.player_spr_id_var[player_id_var]+1) break; }
                        case 5: { local.str = string(color_get_red(global.player_color_var[player_id_var])); break; }
                        case 6: { local.str = string(color_get_green(global.player_color_var[player_id_var])); break; }
                        case 7: { local.str = string(color_get_blue(global.player_color_var[player_id_var])); break; }
                        case 8: { local.str = string(color_get_hue(global.player_color_var[player_id_var])); break; }
                        case 9: { local.str = string(color_get_saturation(global.player_color_var[player_id_var])); break; }
                        case 10: { local.str = string(color_get_value(global.player_color_var[player_id_var])); break; }
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
                button_str_arr[state_var,button_state_var],
                96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_select_color_var,c_white,2,0,0.75
            );

            local.str = 0;
            switch button_state_var
            {
                case 0: { local.str = string(global.player_len_var); break; }
                case 1: { local.str = string(player_id_var+1); break; }
                case 2: { local.str = global.player_name_var[player_id_var]; break; }
                case 3:
                {
                    switch global.player_spr_var[player_id_var]
                    {
                        case 0: { local.str = "SHADOW"; break; }
                        case 1: { local.str = "SPOOKY BOI"; break; }
                    }
                    break;
                }
                case 4: { local.str = string(global.player_spr_id_var[player_id_var]+1) break; }
                case 5: { local.str = string(color_get_red(global.player_color_var[player_id_var])); break; }
                case 6: { local.str = string(color_get_green(global.player_color_var[player_id_var])); break; }
                case 7: { local.str = string(color_get_blue(global.player_color_var[player_id_var])); break; }
                case 8: { local.str = string(color_get_hue(global.player_color_var[player_id_var])); break; }
                case 9: { local.str = string(color_get_saturation(global.player_color_var[player_id_var])); break; }
                case 10: { local.str = string(color_get_value(global.player_color_var[player_id_var])); break; }
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
			break;
        }
		case 12: // Name Entry
        {
			draw_bg_tiled_stretch_ext_scr(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,512,0,2,0,make_color_rgb(70,0,90),subbgalpha_var);
			
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(340,330,940,420,0);
			draw_set_color(c_white);
			draw_set_alpha(1);
			
			draw_set_halign(fa_center);
			draw_set_color(str_bg_color_var);
			draw_text_transformed(636,24,"ENTER NAME",1,1,0);
			draw_text_transformed(638,22,"ENTER NAME",1,1,0);
			draw_set_color(c_yellow);
			draw_text_transformed(640,20,"ENTER NAME",1,1,0);
			draw_set_color(c_white);
			draw_text_transformed(640,120,"PRESS ESC TO CANCEL",0.5,0.5,0);
			
			draw_text_transformed(640,350,keyboard_string,0.75,0.75,0);
			
			draw_set_alpha(0.5);
			
			draw_text_transformed(640,600,"WARNING: CHOOSING AN EXISTING SAVE NAME
			WILL OVERWRITE THAT FILE.",0.3,0.3,0);
			
			draw_set_alpha(1);
			
			draw_set_halign(fa_left);
			
			break;
		}
    }
');