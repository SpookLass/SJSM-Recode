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
Author: Birdbonanza
This is going to be a MESS to code
Menu and button States
    0: Story
    1: Press Confirm
    2: Main
        0: New Game
        1: Load Game
        2: Scores
        3: Settings
        4: Multiplayer
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
        Config
        Behavior
        Back
    5: Save creation behavior
        Behaviors
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
	player_id_var = 0;
    // Sprites
    set_spr_var = sprite_add(main_directory_const+"\SPR\UI\settings_spr.png",2,false,false,46,48);
    multi_spr_var = sprite_add(main_directory_const+"\SPR\UI\multi_spr.png",2,false,false,45,45);
    old_var = false;
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
    // Sounds
    select_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_select_snd.wav");
    confirm_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_confirm_snd.wav");
    popup_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_popup_snd.wav");
    start_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\menu_start_snd.wav");
    fmod_snd_set_group_scr(start_snd_var,snd_group_mus_const);
    story_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\story_mus_snd.mp3");
    fmod_snd_set_group_scr(story_mus_snd_var,snd_group_mus_const);
    fmod_snd_set_group_scr(menu_mus_snd_var,snd_group_mus_const);
    fmod_snd_set_loop_point_scr(menu_mus_snd_var,6/71,70/71);
    // Text
    ini_open(global.lang_var);
    skip_str_var = string_replace(ini_read_string("MENU","skip","MENU_skip"),"@k",key_to_str_scr(global.input_key_arr[confirm_input_const,0]));
    confirm_str_var = string_replace(ini_read_string("MENU","confirm","MENU_confirm"),"@k",key_to_str_scr(global.input_key_arr[confirm_input_const,0]));
    del_str_var = string_replace(ini_read_string("MENU","del","MENU_del"),"@k",key_to_str_scr(global.input_key_arr[back_input_const,0]));
    cancel_str_var = string_replace(ini_read_string("MENU","cancel","MENU_cancel"),"@k",key_to_str_scr(global.input_key_arr[back_input_const,0]));
    story_str_var = ini_read_string("MENU","story","MENU_story");
    back_str_var = ini_read_string("MENU","back","MENU_back");
    rm_str_var = ini_read_string("MENU","rm","MENU_rm");
    mode_str_var = ini_read_string("MENU","mode","MENU_mode");
    type_str_var = ini_read_string("MENU","type","MENU_type");
    diff_str_var = ini_read_string("MENU","diff","MENU_diff");
    custom_str_var = ini_read_string("MENU","custom","MENU_custom");
    mod_str_var = ini_read_string("MENU","mod","MENU_mod");
    warn_str_var = ini_read_string("MENU","warn","MENU_warn");
    mod_question_str_var = ini_read_string("MENU","mod_question","MENU_mod_question");
    del_question_str_var = ini_read_string("MENU","del_question","MENU_del_question");
    str_bg_color_var = make_color_rgb(57,0,91);
    str_bg_select_color_var = make_color_rgb(138,0,0);
    // Options
    on_str_var = ini_read_string("LABEL","on","LABEL_on");
    off_str_var = ini_read_string("LABEL","off","LABEL_off");
    def_str_var = ini_read_string("LABEL","def","LABEL_def");
    rand_str_var = ini_read_string("LABEL","rand","LABEL_rand");
    yes_str_var = ini_read_string("LABEL","yes","LABEL_yes");
    no_str_var = ini_read_string("LABEL","no","LABEL_no");
    for (local.i=0; local.i<global.diff_len_var; local.i+=1;)
    {
        if diff_arr[local.i,2] // Translate
        {
            diff_arr_var[local.i,0] =  ini_read_string("LABEL",diff_arr[local.i,0],"LABEL_"+diff_arr[local.i,0]);
            diff_arr_var[local.i,1] =  ini_read_string("DESC",diff_arr[local.i,1],"DESC_"+diff_arr[local.i,1]);
        }
        else
        {
            diff_arr_var[local.i,0] = diff_arr[local.i,0];
            diff_arr_var[local.i,1] = diff_arr[local.i,1];
        }
    }
    for (local.i=0; local.i<global.mode_len_var; local.i+=1;)
    {
        if mode_arr[local.i,2] // Translate
        {
            mode_arr_var[local.i,0] =  ini_read_string("LABEL",mode_arr[local.i,0],"LABEL_"+mode_arr[local.i,0]);
            mode_arr_var[local.i,1] =  ini_read_string("DESC",mode_arr[local.i,1],"DESC_"+mode_arr[local.i,1]);
        }
        else
        {
            mode_arr_var[local.i,0] = mode_arr[local.i,0];
            mode_arr_var[local.i,1] = mode_arr[local.i,1];
        }
    }
    for (local.i=0; local.i<global.type_len_var; local.i+=1;)
    {
        if type_arr[local.i,2] // Translate
        {
            type_arr_var[local.i,0] =  ini_read_string("LABEL",type_arr[local.i,0],"LABEL_"+type_arr[local.i,0]);
            type_arr_var[local.i,1] =  ini_read_string("DESC",type_arr[local.i,1],"DESC_"+type_arr[local.i,1]);
        }
        else
        {
            type_arr_var[local.i,0] = type_arr[local.i,0];
            type_arr_var[local.i,1] = type_arr[local.i,1];
        }
    }
    // Buttons
    button_str_arr_var[0] = -1;
    button_str_arr_var[1] = -1;
        // Main
    button_str_arr_var[2] = 6;
    button_str_arr_var[2,0] = ini_read_string("MENU","ng","MENU_ng");
    button_str_arr_var[2,1] = ini_read_string("MENU","lg","MENU_lg");
    button_str_arr_var[2,2] = ini_read_string("MENU","score","MENU_score");
    button_str_arr_var[2,3] = ini_read_string("MENU","exit","MENU_exit");
    button_str_arr_var[2,4] = ini_read_string("MENU","setting","MENU_setting");
    button_str_arr_var[2,5] = ini_read_string("MENU","multi","MENU_multi");
        // Save Creation
    state_str_arr_var[3] = ini_read_string("MENU","ng","MENU_ng");
    button_str_arr_var[3] = 7;
    button_str_arr_var[3,0] = ini_read_string("MENU","play","MENU_play");
    button_str_arr_var[3,1] = mode_str_var;
    button_str_arr_var[3,2] = diff_str_var;
    button_str_arr_var[3,3] = type_str_var;
    button_str_arr_var[3,4] = custom_str_var;
    button_str_arr_var[3,5] = ini_read_string("MENU","customize","MENU_customize");
    button_str_arr_var[3,6] = back_str_var;
    	//Load Saves
    state_str_arr_var[6] = ini_read_string("MENU","lg","MENU_lg");
    button_str_arr_var[6] = 1;
	button_str_arr_var[6,0] = back_str_var;
        // Multiplayer
    state_str_arr_var[9] = ini_read_string("MENU","multi","MENU_multi");
    button_str_arr_var[9] = 12;
    button_str_arr_var[9,0] = ini_read_string("MENU","player_len","MENU_player_len");
    button_str_arr_var[9,1] = ini_read_string("MENU","player_id","MENU_player_id");
    button_str_arr_var[9,2] = ini_read_string("MENU","name","MENU_name");
    button_str_arr_var[9,3] = ini_read_string("MENU","spr","MENU_spr");
    button_str_arr_var[9,4] = ini_read_string("MENU","spr_id","MENU_spr_id");
    button_str_arr_var[9,5] = ini_read_string("MENU","red","MENU_red");
    button_str_arr_var[9,6] = ini_read_string("MENU","green","MENU_green");
    button_str_arr_var[9,7] = ini_read_string("MENU","blue","MENU_blue");
    button_str_arr_var[9,8] = ini_read_string("MENU","hue","MENU_hue");
    button_str_arr_var[9,9] = ini_read_string("MENU","sat","MENU_sat");
    button_str_arr_var[9,10] = ini_read_string("MENU","val","MENU_val");
    button_str_arr_var[9,11] = back_str_var;
    // Custom
        // Ditto (Customize)
    state_str_arr_var[4] = ini_read_string("MENU","customize","MENU_customize");
    for (local.i=0; local.i<global.custom_len_var; local.i+=1;)
    {
        // Strings
        if custom_arr[local.i,3] // Translate
        {
            custom_button_arr_var[local.i,1] = ini_read_string("MENU",custom_arr[local.i,1],"MENU_"+custom_arr[local.i,1]); // Name
            custom_button_arr_var[local.i,2] = ini_read_string("DESC",custom_arr[local.i,2],"DESC_"+custom_arr[local.i,2]); // Description
        }
        else
        {
            custom_button_arr_var[local.i,1] = custom_arr[local.i,1];
            custom_button_arr_var[local.i,2] = custom_arr[local.i,2];
        }
        // Default
        if custom_arr[local.i,4] == 3 // Max clamped
        { custom_button_arr_var[local.i,0] = custom_clamp_arr[local.i,1]+1; } // Above Max
        else { custom_button_arr_var[local.i,0] = custom_clamp_arr[local.i,0]-1; } // Below Min
        // Labels
        if custom_arr[local.i,4] == 0 ||  custom_arr[local.i,4] == 6 // Enum or Monster List
        {
            for (local.j=custom_clamp_arr[local.i,0]; local.j<=custom_clamp_arr[local.i,1]; local.j+=1;)
            {
                if custom_label_arr[local.i,(local.j*2)+1] // Translate
                { custom_button_label_arr_var[local.i,local.j] = ini_read_string("LABEL",custom_label_arr[local.i,local.j*2],"LABEL_"+custom_label_arr[local.i,local.j*2]); }
                else { custom_button_label_arr_var[local.i,local.j] = custom_label_arr[local.i,local.j*2]; }
            }
        }
        custom_button_arr_var[local.i,3] = local.i; // Button ID
    }
    custom_button_len_var = global.custom_len_var;
    custom_button_arr_var[custom_button_len_var,0] = noone;
    custom_button_arr_var[custom_button_len_var,1] = ini_read_string("MENU","type","MENU_type");
    custom_button_arr_var[custom_button_len_var,2] = ini_read_string("DESC","type","DESC_type");
    custom_button_arr_var[custom_button_len_var,3] = -2; // Not custom
    custom_button_len_var += 1;
    custom_button_arr_var[custom_button_len_var,0] = noone;
    custom_button_arr_var[custom_button_len_var,1] = back_str_var;
    custom_button_arr_var[custom_button_len_var,2] = ini_read_string("DESC","back","DESC_back");
    custom_button_arr_var[custom_button_len_var,3] = -1; // Not custom
    custom_button_len_var += 1;
    // Behavior
        // Defaults
    state_str_arr_var[5] = ini_read_string("MENU","type","MENU_type");
    for (local.i=0; local.i<global.mon_len_var; local.i+=1)
    {
        type_button_arr_var[local.i,0] = -1;
        type_button_arr_var[local.i,1] = global.type_len_var+mon_arr[local.i,8]; // Max value
        if mon_arr[local.i,4] // Translate
        {
            type_button_arr_var[local.i,2] = string_upper(translate_mon_str_scr(mon_arr[local.i,1],global.name_var));
            type_button_arr_var[local.i,3] = ini_read_string("DESC",mon_arr[local.i,2],"DESC_"+mon_arr[local.i,2]);
        }
        else
        {
            type_button_arr_var[local.i,2] = mon_arr[local.i,1];
            type_button_arr_var[local.i,3] = mon_arr[local.i,2];
        }
        // Custom types
        if mon_arr[local.i,8] > 0
        {
            for (local.j=0; local.j<mon_arr[local.i,8]; local.j+=1;)
            {
                if mon_type_arr[local.i,(local.j*2)+1] // Translate
                { type_button_label_arr_var[local.i,local.j] = ini_read_string("LABEL",mon_type_arr[local.i,local.j*2],"LABEL_"+mon_type_arr[local.i,local.j*2]); }
                else { type_button_label_arr_var[local.i,local.j] = mon_type_arr[local.i,local.j*2]; }
            }
        }
        // Descriptions
        for (local.j=0; local.j<global.type_len_var+mon_arr[local.i,8]; local.j+=1;)
        {
            if mon_desc_arr[local.i,(local.j*2)+1] // Translate
            { type_button_desc_arr_var[local.i,local.j] = ini_read_string("DESC",mon_desc_arr[local.i,local.j*2],"DESC_"+mon_desc_arr[local.i,local.j*2]); }
            else { type_button_desc_arr_var[local.i,local.j] = mon_desc_arr[local.i,local.j*2]; }
        }
        type_button_arr_var[local.i,4] = local.i; // Monster ID
    }
    type_button_len_var = global.mon_len_var;
    type_button_arr_var[type_button_len_var,0] = noone;
    type_button_arr_var[type_button_len_var,1] = noone;
    type_button_arr_var[type_button_len_var,2] = ini_read_string("MENU","back","MENU_back");
    type_button_arr_var[type_button_len_var,3] = ini_read_string("DESC","back","DESC_back");
    type_button_arr_var[type_button_len_var,4] = -1; // Not monster
    type_button_len_var += 1;
    // Name Entry
    state_str_arr_var[12] = ini_read_string("MENU","name_entry","MENU_name_entry");
    // States
    state_var = 0;
    // Draw Control
    image_alpha = 0;
    story_prog_var = 1;
    str_scale_var = 0.8;
    cloud_alarm_var = 1243;
    cloud_prog_var = 0;
    path_cloud_alarm_var = 720;
    path_cloud_prog_var = 0;
    str_alpha_var = 0;
    title_spr_id_var = 0;
    // Lightning
    light_alpha_01_var = 0;
    light_alpha_02_var = 0;
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
    spook_alpha_var = 0;
    flash_alarm_var = 3;
    flash_var = false;
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
    title_02_scale_var = 0;
    title_02_y_var = 0;
    // Button Scroll
    do_scroll_focal_var = true;
    scroll_var = 0;
    scroll_rate_var = 0.2;
    scroll_min_var = 0.5;
	// Default Save Variables
	save_name_var = "";
	save_rm_count_var = 0;
    save_mode_var=1;
	save_diff_var = 2;
	save_custom_var = false;
	save_rm_var = hall_01_rm;
    save_mod_var = false;
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
    alarm_ini_scr();
    inst_var = fmod_snd_play_scr(story_mus_snd_var);
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
    sprite_delete(multi_spr_var);
    sprite_delete(title_spr_var);
    if old_var { sprite_delete(title_02_spr_var); }
	fmod_snd_free_scr(menu_mus_snd_var);
	fmod_snd_free_scr(story_mus_snd_var);
	fmod_snd_free_scr(popup_snd_var);
	fmod_snd_free_scr(confirm_snd_var);
    fmod_snd_free_scr(select_snd_var);
	fmod_snd_free_scr(start_snd_var);
    if rain_var { fmod_inst_stop_scr(rain_inst_var); }
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
            if global.input_press_arr[confirm_input_const,0] || input_press_arr[back_input_const,0]
            {
                state_var = 8;
                event_user(0);
                inst_var = fmod_snd_loop_scr(menu_mus_snd_var); // start_snd_var
                set_alarm_scr(1,80);
            }
            break;
        }
        case 8: // Post Confirm
        {
            if global.input_press_arr[confirm_input_const,0] || input_press_arr[back_input_const,0]
            {
                event_perform(ev_alarm,1);
                set_alarm_scr(1,-1);
            }
            break;
        }
        case 2: // Main
        {
            local.swap = abs(input_menu_hold_x_scr(0));
            local.input = input_menu_hold_y_scr(0);
            if button_state_var < 4
            {
                if local.swap { button_state_var = max(4,button_state_var+2); fmod_snd_play_scr(select_snd_var); }
                else if local.input != 0 { button_state_var = mod_scr(button_state_var-local.input,4); fmod_snd_play_scr(select_snd_var); }
            }
            else
            {
                if local.swap { button_state_var -= 2; fmod_snd_play_scr(select_snd_var); }
                else if local.input != 0 { button_state_var = mod_scr(button_state_var-local.input-4,2)+4; fmod_snd_play_scr(select_snd_var); }
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
                    // New Game
                    case 0:
					{
						state_var = 3;
						event_user(0);
						
						sub_bg_var = irandom_range(0,sub_bg_len_var-1);
						
						save_name_var = "";
						save_diff_var = 2;
                        save_mode_var=1;
						save_custom_var = false;
						save_room = hall_01_rm;
						
                        for (local.i=0; local.i<custom_button_len_var; local.i+=1)
                        {
                            local.customid = custom_button_arr_var[local.i,3];
                            if local.customid >= 0
                            {
                                if custom_arr[local.customid,4] == 3 // Max clamped
                                { custom_button_arr_var[local.customid,0] = custom_clamp_arr[local.customid,1]+1; } // Above Max
                                else { custom_button_arr_var[local.customid,0] = custom_clamp_arr[local.customid,0]-1; } // Below Min
                            }
                        }
						
						save_type_var=0;
						for (local.i=0; local.i<type_button_len_var-1; local.i+=1;)
                        { type_button_arr_var[local.i,0] = -1; }
						
						break;
					}
                    // Load Game
					case 1:
					{
						if ds_list_size(global.save_list) > 0
						{
							button_str_arr_var[6] = ds_list_size(global.save_list)+1;

                            for (local.i=0; local.i<ds_list_size(global.save_list); local.i+=1;)
                            {
                                local.name = string(ds_list_find_value(global.save_list,local.i));
                                button_str_arr_var[6,local.i+1] = local.name;
                            }
							
							state_var = 6;
							event_user(0);
							
							sub_bg_var = irandom_range(0,sub_bg_len_var-1);
						}
                        else
                        {
                            local.snd = false;
                            fmod_snd_play_scr(deny_snd);
                        }
						break;
					}
                    // Scores
                    case 2:
                    {
                        fmod_update_take_over_when_lock_scr();
                        highscore_show_ext(-1,menu_score_bg,true,c_yellow,c_purple,"Lunchtime Doubly So",16);
                        global.last_time_var = current_time;
                        fmod_update_take_over_done_scr();
                        global.input_press_arr[confirm_input_const,0] = false;
                        break;
                    }
                    // Exit
                    case 3: { game_end(); break; }
                    // Settings
                    case 4: 
                    {
                        state_var = 7;
                        global.input_press_arr[confirm_input_const,0] = 0;
                        global.input_arr[confirm_input_const,0] = 0;
                        instance_create(0,0,set_menu_obj);
                        event_user(0);
                        break;
                    }
                    // Multiplayer
                    case 5: 
                    {
                        state_var = 9;
                        event_user(0);

                        sub_bg_var = irandom_range(0,sub_bg_len_var-1);
                        break;
                    }
                    default: { local.snd = false; }
                }
                if local.snd { fmod_snd_play_scr(confirm_snd_var); }
            }
            break;
        }
        case 3: //Save Creation
        {
			subbgscroll_var += global.true_delta_time_var;
			
			if subbgalpha_var < 1 { subbgalpha_var = min(subbgalpha_var+(0.04*global.true_delta_time_var),1); }
            // Text Stretch
            time_var = (time_var+global.true_delta_time_var) mod 80;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            // Scroll
            local.input = input_menu_hold_y_scr(0);
            if local.input != 0
            {
                button_state_var = mod_scr(button_state_var-local.input,button_str_arr_var[state_var]);
                fmod_snd_play_scr(select_snd_var);
            }
            // Lerp
            if do_scroll_focal_var
            {
                scroll_focal_var = median(button_state_var-2,button_state_var+2,scroll_focal_var);
                local.state = scroll_focal_var
            }
            else { local.state = button_state_var; }
            local.target_scroll = -96*median(0,button_str_arr_var[state_var]-5,local.state-2);
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
            // Back
            if input_press_arr[back_input_const,0]
            {
                state_var = 2;
                event_user(0);
                subbgalpha_var = 0;
                fmod_snd_play_scr(deny_snd);
            }
            // Left and right
            local.input = input_menu_hold_x_scr(0);
			if local.input != 0
            {
                local.snd = true;
                switch button_state_var
				{
                    case 1:
                    {
                        save_mode_var = mod_scr(save_mode_var+local.input,global.mode_len_var);
                        local.attempts = 0;
                        while mode_arr[save_mode_var,3] && !save_custom_var && local.attempts < global.mode_len_var
                        { save_mode_var = mod_scr(save_mode_var+1,global.mode_len_var); local.attempts += 1; }
                        break;
                    }
                    case 2:
                    {
                        save_diff_var = mod_scr(save_diff_var+local.input,global.diff_len_var);
                        local.attempts = 0;
                        while diff_arr[save_diff_var,3] && !save_custom_var && local.attempts < global.diff_len_var
                        { save_diff_var = mod_scr(save_diff_var+1,global.diff_len_var); local.attempts += 1; }
                        break;
                    }
                    case 3:
                    {
                        save_type_var = mod_scr(save_type_var+local.input,global.type_len_var);
                        local.attempts = 0;
                        while type_arr[save_type_var,3] && !save_custom_var && local.attempts < global.type_len_var
                        { save_type_var = mod_scr(save_type_var+1,global.type_len_var); local.attempts += 1; }
                        break;
                    }
                    case 4:
                    {
                        save_custom_var = mod_scr(save_custom_var+local.input,2);
                        break;
                    }
                    default: { local.snd = false; break; }
                }
                if local.snd { fmod_snd_play_scr(select_snd_var); }
            }
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
            local.input = input_menu_hold_y_scr(0);
            if local.input != 0
            {
                button_state_var = mod_scr(button_state_var-local.input,custom_button_len_var);
                fmod_snd_play_scr(select_snd_var);
            }
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
            // Custom ID
            local.customid = custom_button_arr_var[button_state_var,3];
            // Confirm
            if global.input_press_arr[confirm_input_const,0]
            {
                local.snd = true;
                if local.customid >= 0
                {
                    fmod_update_take_over_when_lock_scr();
                    switch custom_arr[local.customid,4] // Type
                    {
                        case 0: case 6: // Enums
                        {
                            custom_button_arr_var[button_state_var,0] += 1;
                            if custom_clamp_arr[local.customid,2] // Wrap
                            {
                                custom_button_arr_var[button_state_var,0] = mod_scr
                                (
                                    custom_button_arr_var[button_state_var,0]+1-custom_clamp_arr[local.customid,0],
                                    custom_clamp_arr[local.customid,1]+2-custom_clamp_arr[local.customid,0]
                                )-1+custom_clamp_arr[local.customid,0];
                            }
                            else
                            {
                                custom_button_arr_var[button_state_var,0] = median
                                (
                                    custom_button_arr_var[button_state_var,0],
                                    custom_clamp_arr[local.customid,0]-1,
                                    custom_clamp_arr[local.customid,1]
                                );
                            }
                            break;
                        }
                        case 1: // Number
                        {
                            custom_button_arr_var[button_state_var,0] = get_integer(custom_button_arr_var[button_state_var,1],custom_button_arr_var[button_state_var,0]);
                            break;
                        }
                        case 2: // Clamped number
                        {
                            custom_button_arr_var[button_state_var,0] = median
                            (
                                get_integer(custom_button_arr_var[button_state_var,1],custom_button_arr_var[button_state_var,0]),
                                custom_clamp_arr[local.customid,0]-1,
                                custom_clamp_arr[local.customid,1]
                            );
                        }
                        case 3: // Max clamped number
                        {
                            custom_button_arr_var[button_state_var,0] = min
                            (
                                get_integer(custom_button_arr_var[button_state_var,1],custom_button_arr_var[button_state_var,0]),
                                custom_clamp_arr[local.customid,1]+1
                            );
                            break;
                        }
                        case 4: // Min clamped number
                        {
                            custom_button_arr_var[button_state_var,0] = max
                            (
                                get_integer(custom_button_arr_var[button_state_var,1],custom_button_arr_var[button_state_var,0]),
                                custom_clamp_arr[local.customid,0]-1
                            );
                            break;
                        }
                        case 5: // String
                        {
                            custom_button_arr_var[button_state_var,0] = get_string(custom_button_arr_var[button_state_var,1],string(custom_button_arr_var[button_state_var,0]));
                            break;
                        }
                        default: { local.snd = false; break; }
                    }
                    global.last_time_var = current_time;
                    fmod_update_take_over_done_scr();
                    global.input_press_arr[confirm_input_const,0] = false;
                }
                else
                {
                    switch local.customid
                    {
                        case -2: // Behavior
                        {
                            state_var = 5;
                            event_user(0);
                            break;
                        }
                        case -1: // Back
                        {
                            state_var = 3;
                            event_user(0);
                            break;
                        }
                    }
                }
                if local.snd { fmod_snd_play_scr(confirm_snd_var); }
            }
            // Back
            if input_press_arr[back_input_const,0]
            {
                state_var = 3;
                event_user(0);
                fmod_snd_play_scr(deny_snd);
            }
            // Left and Right
            local.input = input_menu_hold_x_scr(0);
            if local.input != 0 && local.customid >= 0
            {
                local.snd = true;
                local.customid = custom_button_arr_var[button_state_var,3];
                switch custom_arr[local.customid,4] // Type
                {
                    case 0: case 6: case 2: // Enums and clamped numbers
                    {
                        custom_button_arr_var[button_state_var,0] += local.input;
                        if custom_clamp_arr[local.customid,2] // Wrap
                        {
                            custom_button_arr_var[button_state_var,0] = mod_scr
                            (
                                custom_button_arr_var[button_state_var,0]+1-custom_clamp_arr[local.customid,0],
                                custom_clamp_arr[local.customid,1]+2-custom_clamp_arr[local.customid,0]
                            )-1+custom_clamp_arr[local.customid,0];
                        }
                        else
                        {
                            custom_button_arr_var[button_state_var,0] = median
                            (
                                custom_button_arr_var[button_state_var,0],
                                custom_clamp_arr[local.customid,0]-1,
                                custom_clamp_arr[local.customid,1]
                            );
                        }
                        break;
                    }
                    case 1: // Number
                    {
                        custom_button_arr_var[button_state_var,0] += local.input;
                        break;
                    }
                    case 3: // Max clamped number
                    {
                        custom_button_arr_var[button_state_var,0] = min(custom_clamp_arr[local.customid,1]+1,custom_button_arr_var[button_state_var,0]+local.input);
                        break;
                    }
                    case 4: // Min clamped number
                    {
                        custom_button_arr_var[button_state_var,0] = max(custom_clamp_arr[local.customid,0]-1,custom_button_arr_var[button_state_var,0]+local.input);
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
            local.input = input_menu_hold_y_scr(0);
            if local.input != 0
            {
                button_state_var = mod_scr(button_state_var-local.input,type_button_len_var);
                fmod_snd_play_scr(select_snd_var);
            }
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
            // Type ID
            local.typeid = type_button_arr_var[button_state_var,4];
            // Confirm
            if global.input_press_arr[confirm_input_const,0] && local.typeid < 0
            {
                state_var = 3;
                event_user(0);
                fmod_snd_play_scr(confirm_snd_var);
            }
            // Back
            if global.input_press_arr[back_input_const,0]
            {
                state_var = 3;
                event_user(0);
                fmod_snd_play_scr(deny_snd);
            }
            local.input = input_menu_hold_x_scr(0);
            // Left and right
            if local.input != 0 && local.typeid >= 0
            {
                type_button_arr_var[button_state_var,0] = mod_scr(type_button_arr_var[button_state_var,0]+2+local.input,type_button_arr_var[button_state_var,1]+2)-2;
                fmod_snd_play_scr(select_snd_var);
            }
            break;
        }
		case 6: //Save Loads
        {
            subbgscroll_var += global.true_delta_time_var;
			
			if subbgalpha_var < 1 { subbgalpha_var = min(subbgalpha_var+(0.04*global.true_delta_time_var),1); }
            // Text Stretch
            time_var = (time_var+global.true_delta_time_var) mod 80;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            // Scroll
            local.input = input_menu_hold_y_scr(0);
            if local.input != 0
            {
                button_state_var = mod_scr(button_state_var-local.input,button_str_arr_var[state_var]);
                fmod_snd_play_scr(select_snd_var);
                if button_state_var != 0
				{
					local.name = string(ds_list_find_value(global.save_list,button_state_var-1));
					
					ini_open("save_"+local.name+".ini");
					
					save_rm_count_var = ini_read_real("MAIN","rm_count",0);
					save_mode_var = ini_read_real("MAIN","mode",1);
					save_diff_var = ini_read_real("MAIN","diff",2);
					save_custom_var = ini_read_real("MAIN","custom",false);
                    save_type_var = ini_read_real("MAIN","type",0);
                    save_mod_var = ini_read_real("MAIN","mod",false);
					
					ini_close();
				}
            }
            // Lerp
            if do_scroll_focal_var
            {
                scroll_focal_var = median(button_state_var-2,button_state_var+2,scroll_focal_var);
                local.state = scroll_focal_var;
            }
            else { local.state = button_state_var; }
            local.target_scroll = -96*median(0,button_str_arr_var[state_var]-5,local.state-2);
            local.scroll_diff = abs(local.target_scroll-scroll_var);
            local.scroll_rate = max(scroll_min_var,local.scroll_diff*scroll_rate_var)*global.true_delta_time_var;
            scroll_var += min(local.scroll_diff,local.scroll_rate)*sign(local.target_scroll-scroll_var);
            // Confirm
            if global.input_press_arr[confirm_input_const,0]
            {
                switch button_state_var
                {
					case 0: // Back
					{
						state_var = 2;
						event_user(0);
						subbgalpha_var = 0;
                        fmod_snd_play_scr(confirm_snd_var);
						break;
					}
					default: // Save
					{
                        local.bool = true;
                        if save_mod_var != (ds_list_size(global.mod_list)>0)
                        {
                            fmod_update_take_over_when_lock_scr();
                            local.bool = show_message_ext(mod_question_str_var,yes_str_var,no_str_var,"")
                            global.last_time_var = current_time;
                            fmod_update_take_over_done_scr();
                            global.input_press_arr[confirm_input_const,0] = false;
                        }
                        if local.bool
                        {
                            local.name = string(ds_list_find_value(global.save_list,button_state_var-1));
						    load_game_scr(local.name);
                        }
                        break;
					}
				}
			}
			// Back
			if global.input_press_arr[back_input_const,0]
			{
                switch button_state_var
                {
					case 0: // Back
					{
						state_var = 2;
						event_user(0);
						subbgalpha_var = 0;
                        fmod_snd_play_scr(deny_snd);
						break;
					}
					default: // Delete save
					{
                        fmod_update_take_over_when_lock_scr();
						if show_message_ext(del_question_str_var,yes_str_var,no_str_var,"")
                        {
                            local.name = string(ds_list_find_value(global.save_list,button_state_var-1));
                            delete_save_scr(local.name);
                            
                            if ds_list_size(global.save_list) > 0
                            {
                                button_str_arr_var[6] = ds_list_size(global.save_list)+1;

                                for (local.i=0; local.i<ds_list_size(global.save_list); local.i+=1;)
                                {
                                    local.name = string(ds_list_find_value(global.save_list,local.i));
                                    button_str_arr_var[6,local.i+1] = local.name;
                                }
                                button_state_var = min(ds_list_size(global.save_list),button_state_var);
                            }
                            else // Main
                            {
                                state_var = 2;
                                event_user(0);
                                subbgalpha_var = 0;
                            }
                        }
                        global.last_time_var = current_time;
                        fmod_update_take_over_done_scr();
                        global.input_press_arr[back_input_const,0] = false;
                        break;
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
            local.input = input_menu_hold_y_scr(0);
            if local.input != 0
            {
                button_state_var = mod_scr(button_state_var-local.input,12);
                fmod_snd_play_scr(select_snd_var);
            }
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
            // Back
            if input_press_arr[back_input_const,0]
            {
                state_var = 2;
                event_user(0);
                fmod_snd_play_scr(deny_snd);
                subbgalpha_var = 0;
            }
            // Left or right
            local.input = input_menu_hold_x_scr(0);
            if local.input != 0
            {
                local.snd = true;
                local.add = (global.input_press_arr[right_input_const,0] > 0)-(global.input_press_arr[left_input_const,0] > 0);
                switch button_state_var
                {
                    case 0:
                    {
                        global.player_len_var = mod_scr(global.player_len_var+local.input-1,8)+1;
                        break;
                    }
                    case 1:
                    {
                        player_id_var = mod_scr(player_id_var+local.input,global.player_len_var);
                        break;
                    }
                    case 3:
                    {
                        global.player_spr_var[player_id_var] = mod_scr(global.player_spr_var[player_id_var]+local.input,2);
                        break;
                    }
                    case 4:
                    {
                        global.player_spr_id_var[player_id_var] = mod_scr(global.player_spr_id_var[player_id_var]+local.input,3);
                        break;
                    }
                    case 5:
                    {
                        local.red = median(color_get_red(global.player_color_var[player_id_var])+(local.input*8),0,255);
                        local.green = color_get_green(global.player_color_var[player_id_var]);
                        local.blue = color_get_blue(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_rgb(local.red,local.green,local.blue);
                        break;
                    }
                    case 6:
                    {
                        local.red = color_get_red(global.player_color_var[player_id_var]);
                        local.green = median(color_get_green(global.player_color_var[player_id_var])+(local.input*8),0,255);
                        local.blue = color_get_blue(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_rgb(local.red,local.green,local.blue);
                        break;
                    }
                    case 7:
                    {
                        local.red = color_get_red(global.player_color_var[player_id_var]);
                        local.green = color_get_green(global.player_color_var[player_id_var]);
                        local.blue = median(color_get_blue(global.player_color_var[player_id_var])+(local.input*8),0,255);
                        global.player_color_var[player_id_var] = make_color_rgb(local.red,local.green,local.blue);
                        break;
                    }
                    case 8:
                    {
                        local.hue = median(color_get_hue(global.player_color_var[player_id_var])+(local.input*8),0,255);
                        local.saturation = color_get_saturation(global.player_color_var[player_id_var]);
                        local.value = color_get_value(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_hsv(local.hue,local.saturation,local.value);
                        break;
                    }
                    case 9:
                    {
                        local.hue = color_get_hue(global.player_color_var[player_id_var]);
                        local.saturation = median(color_get_saturation(global.player_color_var[player_id_var])+(local.input*8),0,255);
                        local.value = color_get_value(global.player_color_var[player_id_var]);
                        global.player_color_var[player_id_var] = make_color_hsv(local.hue,local.saturation,local.value);
                        break;
                    }
                    case 10:
                    {
                        local.hue = color_get_hue(global.player_color_var[player_id_var]);
                        local.saturation = color_get_saturation(global.player_color_var[player_id_var]);
                        local.value = median(color_get_value(global.player_color_var[player_id_var])+(local.input*8),0,255);
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
			
			if keyboard_string = " " { keyboard_string = ""; }
			
			if string_length(keyboard_string) > 20
			{ keyboard_string = string_copy(keyboard_string,1,20); }
			
			if global.input_press_arr[back_input_const,0]
			{
				state_var = 3;
				event_user(0);
                fmod_snd_play_scr(deny_snd);
			}
			
			if keyboard_check_pressed(vk_enter) and keyboard_string != ""
			{
				save_name_var = keyboard_string;
				global.save_name_var = save_name_var;
				// Main settings
                global.mode_var = save_mode_var;
                global.main_type_var = save_type_var;
                global.custom_var = save_custom_var;
                ds_list_clear(global.mon_list);
				
				// Difficulty
                if global.main_type_var == 1 || global.main_type_var == 2 { global.diff_var = -1; } // OG and HD
                else if !global.custom_var && diff_arr[save_diff_var,3] { global.diff_var = diff_arr[save_diff_var,4]; }
                else { global.diff_var = save_diff_var; }

                // Custom stuff
                for (local.i=0; local.i<custom_button_len_var; local.i+=1;)
                {
                    local.customid = custom_button_arr_var[local.i,3];
                    if local.customid >= 0
                    {
                        local.custom = false;
                        if global.custom_var
                        {
                            switch custom_arr[local.customid,4]
                            {
                                case 3: // Max clamped
                                { local.custom = (custom_button_arr_var[local.i,0] <= custom_clamp_arr[local.customid,1]); break; }
                                case 5: // String
                                {
                                    if !is_string(custom_button_arr_var[local.i,0]) { local.custom = false; break; }
                                    local.custom = (custom_button_arr_var[local.i,0] != "-1"); break;
                                }
                                default: // Normal
                                { local.custom = (custom_button_arr_var[local.i,0] >= custom_clamp_arr[local.customid,0]); break; }
                            }
                        }
                        // Monster List
                        if custom_arr[local.customid,4] == 6
                        {
                            // I hope this works, what a complex mess
                            if local.custom { local.list = mon_list_arr[custom_arr[local.customid,5],custom_button_arr_var[local.i,0]]; }
                            else { local.list = mon_list_arr[custom_arr[local.customid,5],custom_arr_get_scr(local.customid,global.diff_var,global.mode_var,global.main_type_var)]; }
                            if local.list != noone
                            {
                                for (local.j=0; local.j<ds_list_size(local.list); local.j+=1;)
                                {
                                    local.monid = ds_list_find_value(local.list,local.j);
                                    // If monster exists and chases
                                    if object_exists(mon_arr[local.monid,9]) && mon_arr[local.monid,5]
                                    { ds_list_add(global.mon_list,mon_arr[local.monid,9]); }
                                }
                            }
                        }
                        // Use value from button
                        else if local.custom { execute_string("global."+custom_arr[local.customid,0]+"_var = "+string(custom_button_arr_var[local.i,0])); }
                        // Get default value from 4D array
                        else { execute_string("global."+custom_arr[local.customid,0]+"_var = "+string(custom_arr_get_scr(local.customid,global.diff_var,global.mode_var,global.main_type_var))); }
                    }
                }

				// Behavior stuff
                for (local.i=0; local.i<type_button_len_var-1; local.i+=1;)
                {
                    local.monid = type_button_arr_var[local.i,4]
                    if local.monid >= 0
                    {
                        if type_button_arr_var[local.i,0] == -1 || !global.custom_var
                        {
                            if global.diff_var == 5 { local.type = -1; } // Still hardcoded, sorry
                            else { local.type = global.main_type_var; }
                            execute_string("global."+mon_arr[local.monid,0]+"_type_var = "+string(local.type));
                        }
                        else if type_button_arr_var[local.i,0] < 0 { execute_string("global."+mon_arr[local.monid,0]+"_type_var = -1;"); }
                        else { execute_string("global."+mon_arr[local.monid,0]+"_type_var = "+string(type_button_arr_var[local.i,0])); }
                    }
                    
                }
				// Save Info
				global.rm_count_var = 0;
				global.note_var = 0;
                global.mon_fail_var = 0;
                global.count_var = get_count_scr();
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
                fmod_listen_set_num_scr(global.player_len_var);
                event_user(1);
                global.game_var = true;
                global.game_time_var = 0;
				instance_create(0,0,mus_control_obj);
                if save_name_var == "1987" { instance_create(0,0,otter8_js_obj); }
                // Random Zone and Tex
                tex_scr(-1);
                zone_scr(-1,true);
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
    fmod_inst_stop_scr(inst_var);
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
            draw_set_halign(fa_center);
            draw_str_ext_scr(story_str_var,0,local.ytmp,0.4,0.4,0.125,fa_center,fa_top,86,420,0);
            draw_set_halign(fa_left);
            draw_set_color(c_white);
            break;
        }
        case 1: // Press Confirm
        {
            draw_set_alpha(str_alpha_var);
            draw_set_halign(fa_center); draw_set_valign(fa_bottom);
            draw_str_shadow_scr(confirm_str_var,0,-96,0.75,0.75,0.125,fa_center,fa_bottom,-4,4,str_bg_color_var,c_yellow,2,0);
            draw_set_halign(fa_left); draw_set_valign(fa_top);
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
                        button_str_arr_var[state_var,local.i],
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
                    button_str_arr_var[state_var,button_state_var],
                    96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
                    -4,4,str_bg_select_color_var,c_white,2,0,0.75
                );
            }
            draw_spr_stretch_scr(set_spr_var,button_state_var == 4,-105,-183,81,0,fa_right,fa_bottom);
            draw_spr_stretch_scr(multi_spr_var,button_state_var == 5,-105,-90,80,0,fa_right,fa_bottom);
            break;
        }
        case 3: // Save Creation
        {
            draw_bg_tiled_stretch_ext_scr(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,512,0,2,0,make_color_rgb(70,0,90),subbgalpha_var);
			
            draw_set_halign(fa_right);
            draw_str_shadow_scr
            (
                state_str_arr_var[state_var],
                -20,20,0.95,0.95,0.125,fa_right,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
            draw_set_halign(fa_left);
			
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
                        button_str_arr_var[state_var,local.i],
                        96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                        -4,4,str_bg_color_var,local.color,2,0
                    );

                    local.str = 0;
                    switch local.i
					{
						case 1: { local.str = mode_arr_var[save_mode_var,0]; break; }
						case 2:
						{
                            if save_type_var == 1 || save_type_var == 2
                            { local.str = type_arr_var[save_type_var,0]; }
                            else { local.str = diff_arr_var[save_diff_var,0]; }
							break;
						}
						case 3: { local.str = type_arr_var[save_type_var,0]; break; }
						case 4:
						{
							if save_custom_var { local.str = on_str_var; }
                            else { local.str = off_str_var; }
							break;
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

            if button_state_var == 5 && !save_custom_var
            { local.color = c_gray; }
            else { local.color = c_white; }

            local.ytmp = 144+(96*button_state_var)+scroll_var;
            draw_spr_stretch_scr(select_spr,0,96,local.ytmp,132,0,fa_left,fa_top);
            draw_str_select_scr
            (
                button_str_arr_var[state_var,button_state_var],
                96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_select_color_var,local.color,2,0,0.75
            );

            local.str = 0;
            local.desc = 0;
            switch button_state_var
            {
                case 1: // Mode
                {
                    local.str = mode_arr_var[save_mode_var,0];
                    local.desc = mode_arr_var[save_mode_var,1];
                    break;
                }
                case 2: // Difficulty
                {
                    if save_type_var == 1 || save_type_var == 2
                    {
                        local.str = type_arr_var[save_type_var,0];
                        local.desc = type_arr_var[save_type_var,1];
                    }
                    else
                    {
                        local.str = diff_arr_var[save_diff_var,0];
                        local.desc = diff_arr_var[save_diff_var,1];
                    }
                    break;
                }
                case 3: // Behavior
                {
                    local.str = type_arr_var[save_type_var,0];
                    local.desc = type_arr_var[save_type_var,1];
                    break;
                }
                case 4:
                {
                    if save_custom_var { local.str = on_str_var; }
                    else { local.str = off_str_var; }
                    break;
                }
            }
            
            if is_string(local.desc)
            {
                draw_set_halign(fa_right);
                local.margin = (view_wview[view_current]/2)+192;
                draw_str_ext_shadow_scr
                (
                    local.desc,
                    -20,144,0.4,0.4,0.125,fa_right,fa_top,-1,local.margin,
                    -4,4,str_bg_color_var,c_yellow,2,0
                );
                draw_set_halign(fa_left);
            }
            if is_string(local.str)
            {
                draw_set_halign(fa_center)
                draw_str_shadow_scr
                (
                    local.str,
                    0,144+(96*button_state_var)+scroll_var,0.75,0.75,0.125,fa_center,fa_top,
                    -4,4,str_bg_select_color_var,c_white,2,0
                );
                draw_set_halign(fa_left);
            }
			break;
        }
        case 4: // Customize
        {
			draw_bg_tiled_stretch_ext_scr(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,512,0,2,0,make_color_rgb(70,0,90),subbgalpha_var);
			
            draw_set_halign(fa_right);
            draw_str_shadow_scr
            (
                state_str_arr_var[state_var],
                -20,20,0.95,0.95,0.125,fa_right,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
            draw_set_halign(fa_left);
			
            for (local.i=0; local.i<custom_button_len_var; local.i+=1)
            {
                if local.i != button_state_var
                {
                    draw_str_shadow_scr
                    (
                        custom_button_arr_var[local.i,1],
                        96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                        -4,4,str_bg_color_var,c_yellow,2,0
                    );
                    
                    if custom_button_arr_var[local.i,3] >= 0
                    {
                        local.str = 0;
                        switch custom_arr[custom_button_arr_var[local.i,3],4] // Custom type
                        {
                            // Enum & Monster List: Get current value label
                            case 0: case 6:
                            {
                                if custom_button_arr_var[local.i,0] < custom_clamp_arr[custom_button_arr_var[local.i,3],0]
                                { local.str = def_str_var; break; }
                                local.str = custom_button_label_arr_var[local.i,custom_button_arr_var[local.i,0]]; break;
                            }
                            // If max capped, display default if above max
                            case 3:
                            {
                                if custom_button_arr_var[local.i,0] > custom_clamp_arr[custom_button_arr_var[local.i,3],0]
                                { local.str = def_str_var; break; }
                                local.str = string(custom_button_arr_var[local.i,0]); break;
                            }
                            // If string, check for -1 as a string or number
                            case 5:
                            {
                                if !is_string(custom_button_arr_var[local.i,0]) { local.str = def_str_var; break; }
                                if custom_button_arr_var[local.i,0] == "-1" { local.str = def_str_var; break; }
                                local.str = custom_button_arr_var[local.i,0];  break;
                            }
                            // Otherwise, act as normal
                            default:
                            {
                                if custom_button_arr_var[local.i,0] < custom_clamp_arr[custom_button_arr_var[local.i,3],0]
                                { local.str = def_str_var; break; }
                                local.str = string(custom_button_arr_var[local.i,0]); break;
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
            }

            local.ytmp = 144+(96*button_state_var)+scroll_var;
            draw_spr_stretch_scr(select_spr,0,96,local.ytmp,132,0,fa_left,fa_top);
            draw_str_select_scr
            (
                custom_button_arr_var[button_state_var,1],
                96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_select_color_var,c_white,2,0,0.75
            );
            draw_set_halign(fa_right);
            local.margin = (view_wview[view_current]/2)+192;
            draw_str_ext_shadow_scr
            (
                custom_button_arr_var[button_state_var,2],
                -20,144,0.4,0.4,0.125,fa_right,fa_top,-1,local.margin,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
            draw_set_halign(fa_left);

            if custom_button_arr_var[button_state_var,3] >= 0
            {
                local.str = 0;
                switch custom_arr[custom_button_arr_var[button_state_var,3],4] // Custom type
                {
                    // Enum & Monster List: Get current value label
                    case 0: case 6:
                    {
                        if custom_button_arr_var[button_state_var,0] < custom_clamp_arr[custom_button_arr_var[button_state_var,3],0]
                        { local.str = def_str_var; break; }
                        local.str = custom_button_label_arr_var[button_state_var,custom_button_arr_var[button_state_var,0]]; break;
                    }
                    // If max capped, display default if above max
                    case 3:
                    {
                        if custom_button_arr_var[button_state_var,0] > custom_clamp_arr[custom_button_arr_var[button_state_var,3],0]
                        { local.str = def_str_var; break; }
                        local.str = string(custom_button_arr_var[button_state_var,0]); break;
                    }
                    // If string, check for -1 as a string or number
                    case 5:
                    {
                        if !is_string(custom_button_arr_var[button_state_var,0]) { local.str = def_str_var; break; }
                        if custom_button_arr_var[button_state_var,0] == "-1" { local.str = def_str_var; break; }
                        local.str = custom_button_arr_var[button_state_var,0];  break;
                    }
                    // Otherwise, act as normal
                    default:
                    {
                        if custom_button_arr_var[button_state_var,0] < custom_clamp_arr[custom_button_arr_var[button_state_var,3],0]
                        { local.str = def_str_var; break; }
                        local.str = string(custom_button_arr_var[button_state_var,0]); break;
                    }
                }
                if is_string(local.str)
                {
                    draw_set_halign(fa_center);
                    draw_str_shadow_scr
                    (
                        local.str,
                        0,144+(96*button_state_var)+scroll_var,0.75,0.75,0.125,fa_center,fa_top,
                        -4,4,str_bg_select_color_var,c_white,2,0
                    );
                    draw_set_halign(fa_left);
                }
            }
            break;
        }
        case 5: // Behavior
        {
            draw_bg_tiled_stretch_ext_scr(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,512,0,2,0,make_color_rgb(70,0,90),subbgalpha_var);
			
            draw_set_halign(fa_right);
			draw_str_shadow_scr
            (
                state_str_arr_var[state_var],
                -20,20,0.95,0.95,0.125,fa_right,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
            draw_set_halign(fa_left);
    
            for (local.i=0; local.i<type_button_len_var; local.i+=1)
            {
                if local.i != button_state_var
                {
                    draw_str_shadow_scr
                    (
                        type_button_arr_var[local.i,2],
                        96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                        -4,4,str_bg_color_var,c_yellow,2,0
                    );
                    
                    if type_button_arr_var[local.i,4] >= 0
                    {
                        switch type_button_arr_var[local.i,0]
                        {
                            case -2: { local.str = rand_str_var; break; }
                            case -1: { local.str = def_str_var; break; }
                            default:
                            {
                                if type_button_arr_var[local.i,0] < global.type_len_var
                                { local.str = type_arr_var[type_button_arr_var[local.i,0],0]; }
                                else { local.str = type_button_label_arr_var[local.i,type_button_arr_var[local.i,0]-global.type_len_var]; }
                            }
                        }
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
            local.ytmp = 144+(96*button_state_var)+scroll_var;
            draw_spr_stretch_scr(select_spr,0,96,local.ytmp,132,0,fa_left,fa_top);
            draw_str_select_scr
            (
                type_button_arr_var[button_state_var,2],
                96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_select_color_var,c_white,2,0,0.75
            );

            if type_button_arr_var[button_state_var,4] >= 0
            {
                local.desc = type_button_arr_var[button_state_var,3];
                switch type_button_arr_var[button_state_var,0]
                {
                    case -2: { local.str = rand_str_var; break; }
                    case -1: { local.str = def_str_var; break; }
                    default:
                    {
                        local.desc += "##"+type_button_desc_arr_var[button_state_var,type_button_arr_var[button_state_var,0]];
                        if type_button_arr_var[button_state_var,0] < global.type_len_var
                        { local.str = type_arr_var[type_button_arr_var[button_state_var,0],0]; }
                        else { local.str = type_button_label_arr_var[button_state_var,type_button_arr_var[button_state_var,0]-global.type_len_var]; }
                    }
                }
                draw_set_halign(fa_right);
                local.margin = (view_wview[view_current]/2)+192;
                draw_str_ext_shadow_scr
                (
                    local.desc,
                    -20,144,0.4,0.4,0.125,fa_right,fa_top,-1,local.margin,
                    -4,4,str_bg_color_var,c_yellow,2,0
                );
                draw_set_halign(fa_center);
                draw_str_shadow_scr
                (
                    local.str,
                    0,144+(96*button_state_var)+scroll_var,0.75,0.75,0.125,fa_center,fa_top,
                    -4,4,str_bg_select_color_var,c_white,2,0
                );
                draw_set_halign(fa_left);
            }
            break;
        }
		case 6: // Save Loads
        {			
			draw_bg_tiled_stretch_ext_scr(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,512,0,2,0,make_color_rgb(70,0,90),subbgalpha_var);
			
            draw_set_halign(fa_right);
			draw_str_shadow_scr
            (
                state_str_arr_var[state_var],
                -20,20,0.95,0.95,0.125,fa_right,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
            draw_set_halign(fa_left);
			
			if button_state_var != 0
			{
                if save_mode_var == 1 || save_mode_var == 2
                { local.diffstr = mode_arr_var[save_mode_var,0]; }
                else { local.diffstr = diff_arr_var[save_diff_var,0]; }

                if save_custom_var { local.customstr = on_str_var; }
                else { local.customstr = off_str_var; }

                if save_mod_var { local.modstr = on_str_var; }
                else { local.modstr = off_str_var; }

                draw_set_halign(fa_right);
                local.str = rm_str_var+": "+string(save_rm_count_var)+"
"+mode_str_var+": "+string(mode_arr_var[save_mode_var,0])+"
"+diff_str_var+": "+local.diffstr+"
"+type_str_var+": "+string(type_arr_var[save_type_var,0])+"
"+custom_str_var+": "+local.customstr+"
"+mod_str_var+": "+local.modstr
                draw_str_shadow_scr
                (
                    local.str,
                    -48,125,0.6,0.6,0.125,fa_right,fa_top,
                    -4,-4,str_bg_color_var,c_yellow,2,0
                );
                draw_set_halign(fa_left);
			}
			
            draw_set_halign(fa_right); draw_set_valign(fa_bottom); draw_set_alpha(0.5);
            draw_str_scr(del_str_var,-20,-20,0.3,0.3,0.125,fa_right,fa_bottom,0);
            draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_alpha(1);
			
			for (local.i=0; local.i<button_str_arr_var[state_var]; local.i+=1;)
            {
                if local.i != button_state_var
                {
                    draw_str_shadow_scr
                    (
                        button_str_arr_var[state_var,local.i],
                        96,144+(96*local.i)+scroll_var,0.75,0.75,0.125,fa_left,fa_top,
                        -4,4,str_bg_color_var,c_yellow,2,0
                    );
				}
			}

            local.ytmp = 144+(96*button_state_var)+scroll_var;
            draw_spr_stretch_scr(select_spr,0,96,local.ytmp,132,0,fa_left,fa_top);
            draw_str_select_scr
            (
                button_str_arr_var[state_var,button_state_var],
                96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_select_color_var,c_white,2,0,0.75
            );
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
			
            draw_set_halign(fa_right);
            draw_str_shadow_scr
            (
                state_str_arr_var[state_var],
                -20,20,0.95,0.95,0.125,fa_right,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
            draw_set_halign(fa_left);

            for (local.i=0; local.i<12; local.i+=1)
            {
                if local.i != button_state_var
                {
                    draw_str_shadow_scr
                    (
                        button_str_arr_var[state_var,local.i],
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
                button_str_arr_var[state_var,button_state_var],
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
			
            draw_set_halign(fa_center);
            draw_str_shadow_scr
            (
                state_str_arr_var[state_var],
                0,20,0.95,0.95,0.125,fa_center,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
            
            draw_str_scr("PRESS "+key_to_str_scr(global.input_key_arr[back_input_const,0])+" TO CANCEL",0,120,0.5,0.5,0.125,fa_center,fa_top,0);

            local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
            local.scale = max(0.125,0.75*local.viewscale);
            local.width = (string_width(keyboard_string)+20)*local.scale;
            local.height = (string_height(keyboard_string)+20)*local.scale;
            draw_set_color(c_black); draw_set_alpha(0.5);
			draw_rectangle((view_wview[view_current]-local.width)/2,(view_hview[view_current]-local.height)/2,(view_wview[view_current]+local.width)/2,(view_hview[view_current]+local.height)/2,0);
			draw_set_color(c_white); draw_set_alpha(1);

            draw_set_valign(fa_middle);
            draw_str_scr(keyboard_string,0,0,0.75,0.75,0.125,fa_center,fa_middle);
            draw_set_valign(fa_top);
			
			draw_set_alpha(0.5);
			
            draw_str_ext_scr(warn_str_var,0,600,0.3,0.3,0.125,fa_center,fa_top,-1,640,0)
			
			draw_set_alpha(1);
			
			draw_set_halign(fa_left);
			
			break;
		}
    }
');