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
        1: Mode (Story, Endless, Sandbox, Modded?)
        2: Difficulty (Easiest?, Easy, Normal, Hard, Hardest)
        3: Behavior (Recode, OG, HD, Modded?)
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
        Behaviors (Recode, OG, HD, Modded?)
        Back
    6: Load Save
        Saves
        Back
    7: Settings
        Gameplay
        1: TPS
        2: Game Speed
        3: Crouch Toggle
        4: Mouse Sensitivity
        5: Collision Precision
        6: Invert Mouse
        7: Controller
        8: Controls
        Visual
        9: FPS
        10: Vsync
        11: Anti-Alias
        12: Fullscreen
        13: Resolution Width
        14: Resolution height
        15: Color Type (OG, HD)
        16: Max particles
        Audio
        17: Volume
        18: Sound Volume
        19: Music Volume
        20: Subtitles (Dialogue, Off, Always)
        Misc
        21: Erase Scores
        22: Fix Resolution?
        23: Back
    8: Controls
        Menu
        0: Up
        1: Down
        2: Left
        3: Right
        4: Confirm
        5: Back
        6: Pause
        Gameplay
        7: Forward
        8: Backward
        9: Strafe Left
        10: Strafe Right
        11: Interact
        12: Sprint
        13: Jump
        14: Crouch
        15: Attack
        16: Quick turnaround
    9: Config
        0: Mode (Story, Endless, Modded?)
        1: Difficulty (Easy?, Normal, Hard, Harder, Hardest)
        2: Behavior (Recode, OG, HD, Modded?)
        3: Custom
        4: Customize (Grayed out if not custom)
        5: Back
    10: Custom Config
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
    11: Config Behavior
        Behaviors (Recode, OG, HD, Modded?)
        Back
	12: Save Name Entry
*/
// Create Event
object_event_add
(argument0,ev_create,0,"
    // Backgrounds
    bg_var = background_add(vanilla_directory_const+'\TEX\menu\menu_tex.png',false,false);
    cloud_bg_var = background_add(vanilla_directory_const+'\TEX\menu\menu_clouds2_tex.png',false,false);
    light_01_bg_var = background_add(vanilla_directory_const+'\TEX\menu\menu2_tex.png',false,false);
    light_02_bg_var = background_add(vanilla_directory_const+'\TEX\menu\menu3_tex.png',false,false);
    path_bg_var = background_add(vanilla_directory_const+'\TEX\menu\path_tex.png',false,false);
    path_cloud_bg_var = background_add(vanilla_directory_const+'\TEX\menu\menu_clouds_tex.png',false,false);
    light_bg_var = light_01_bg_var;
	
	local.array_index = 0;
	local.wall_index = 1;
	local.finalwall_index = '01'
	
    while file_exists(working_directory+'\DATA\TEX\WALL_'+local.finalwall_index+'.png')
	{
        sub_bg_arr[local.array_index] = background_add(working_directory+'\DATA\TEX\WALL_'+local.finalwall_index+'.png',false,false);
        
        local.array_index += 1;
        local.wall_index += 1;
        
        if local.wall_index < 10 { local.finalwall_index = '0'+string(local.wall_index); }
        else { local.finalwall_index = string(local.wall_index); }
	}
	
	local.wall_index = 1;
	local.finalwall_index = '01';
	
	while file_exists(working_directory+'\DATA\EM\TEX\EM_WALL_'+local.finalwall_index+'.png')
	{
        sub_bg_arr[local.array_index] = background_add(working_directory+'\DATA\EM\TEX\EM_WALL_'+local.finalwall_index+'.png',false,false);
        
        local.array_index += 1;
        local.wall_index += 1;
        
        if local.wall_index < 10 { local.finalwall_index = '0'+string(local.wall_index); }
        else { local.finalwall_index = string(local.wall_index); }
	}
	
	sub_bg_len_var = local.array_index;
	
	sub_bg_var = 0;
	
	subbgscroll_var = 0;
	
	subbgalpha_var = 0;
	
    // Sprites
    set_spr_var = sprite_add(main_directory_const+'\SPR\UI\settings_spr.png',2,false,false,0,0);
    sprite_set_offset(set_spr_var,sprite_get_width(set_spr_var)/2,sprite_get_height(set_spr_var)/2);
    if !irandom(7)
    { local.path = vanilla_directory_const+'\TEX\menu\'+choose('name_uhh_spr2','name_uhh_spr3','name_uhh_spr4')+'.png' }
    else { local.path = vanilla_directory_const+'\TEX\menu\name_uhh_spr.png' }
    name_spr_var = sprite_add(local.path,1,false,false,0,0);
    sprite_set_offset(name_spr_var,sprite_get_width(name_spr_var)/2,sprite_get_height(name_spr_var)/2);
    name_y_var = 170;
    // Text
    ini_open(global.lang_var);
    skip_str_var = 'Press Confirm to Skip.'; // Maybe get a string of the key?
    confirm_str_var = 'PRESS CONFIRM';
    story_str_var = 'For as long as you can remember, legends have been told about the derelict mansion upon the hill that casts a blanket of darkness over the town. The history of the house itself is virtually unknown, and even the towns oldest residents cannot remember the mansions origin. Being an avid history enthusiast, you embark up the mountain to visit the manor. Hoping to shed some light on the backstory of this crumbling fortress of darkness.';
    back_str_var = ini_read_string('MENU','back','MENU_back');
    str_bg_color_var = make_color_rgb(57,0,91);
    str_bg_select_color_var = make_color_rgb(138,0,0);
    // Button Text
        // Main
    button_str_arr[2,0] = ini_read_string('MENU','ng','MENU_ng');
    button_str_arr[2,1] = ini_read_string('MENU','lg','MENU_lg');
    button_str_arr[2,2] = ini_read_string('MENU','score','MENU_score');
    button_str_arr[2,3] = ini_read_string('MENU','exit','MENU_exit');
    button_str_arr[2,4] = ini_read_string('MENU','setting','MENU_setting');
    button_str_arr[2,5] = 'CONFIG'; // Might scrap
        // Save Creation
    button_str_arr[3,0] = ini_read_string('MENU','play','MENU_play');
    button_str_arr[3,1] = ini_read_string('MENU','mode','MENU_mode');
    button_str_arr[3,2] = ini_read_string('MENU','diff','MENU_diff');
    button_str_arr[3,3] = ini_read_string('MENU','type','MENU_type');
    button_str_arr[3,4] = ini_read_string('MENU','custom','MENU_custom');
    button_str_arr[3,5] = ini_read_string('MENU','customize','MENU_customize');
    button_str_arr[3,6] = back_str_var;
        // Ditto (Customize)
    button_str_arr[4,0] = ini_read_string('MENU','crouch','MENU_crouch');
    button_str_arr[4,1] = ini_read_string('MENU','jump','MENU_jump');
    button_str_arr[4,2] = ini_read_string('MENU','stam_per','MENU_stam_per');
    button_str_arr[4,3] = ini_read_string('MENU','fall','MENU_fall');
    button_str_arr[4,4] = ini_read_string('MENU','lock','MENU_lock');
    button_str_arr[4,5] = ini_read_string('MENU','dmg_shake','MENU_dmg_shake');
    button_str_arr[4,6] = ini_read_string('MENU','mult_type','MENU_mult_type');
    button_str_arr[4,7] = ini_read_string('MENU','mult_min','MENU_mult_min');
    button_str_arr[4,8] = ini_read_string('MENU','mult_max','MENU_mult_max');
    button_str_arr[4,9] = ini_read_string('MENU','mult_start','MENU_mult_start');
    button_str_arr[4,10] = ini_read_string('MENU','mult_end','MENU_mult_end');
    button_str_arr[4,11] = ini_read_string('MENU','mult_type','MENU_mult_type');
    button_str_arr[4,12] = ini_read_string('MENU','count_min','MENU_count_min');
    button_str_arr[4,13] = ini_read_string('MENU','count_max','MENU_count_max');
    button_str_arr[4,14] = ini_read_string('MENU','count_start','MENU_count_start');
    button_str_arr[4,15] = ini_read_string('MENU','count_end','MENU_count_end');
    button_str_arr[4,16] = ini_read_string('MENU','dupe','MENU_dupe');
    button_str_arr[4,17] = ini_read_string('MENU','chance','MENU_chance');
    button_str_arr[4,18] = ini_read_string('MENU','chance_mult','MENU_chance_mult');
    button_str_arr[4,19] = ini_read_string('MENU','type','MENU_type');
    button_str_arr[4,20] = back_str_var;
        // Behavior
    button_str_arr[5,0] = 'PLAYER';
    button_str_arr[5,1] = 'AXE';
    switch global.name_var
    {
        case name_og_const:
        {
            button_str_arr[5,2] = string_upper(ini_read_string('NAME','gel','NAME_gel'));
            button_str_arr[5,3] = string_upper(ini_read_string('NAME','bug_og','NAME_bug_og'));
            button_str_arr[5,4] = string_upper(ini_read_string('NAME','ringu','NAME_ringu'));
            button_str_arr[5,5] = string_upper(ini_read_string('NAME','bab','NAME_bab'));
            button_str_arr[5,6] = string_upper(ini_read_string('NAME','pup_og','NAME_pup_og'));
            button_str_arr[5,7] = string_upper(ini_read_string('NAME','flesh','NAME_flesh'));
            button_str_arr[5,8] = string_upper(ini_read_string('NAME','dl','NAME_dl'));
            button_str_arr[5,9] = string_upper(ini_read_string('NAME','taker','NAME_taker'));
            button_str_arr[5,10] = string_upper(ini_read_string('NAME','para','NAME_para'));
            button_str_arr[5,11] = string_upper(ini_read_string('NAME','fd','NAME_fd'));
            button_str_arr[5,12] = string_upper(ini_read_string('NAME','killer_og','NAME_killer_og'));
            button_str_arr[5,13] = string_upper(ini_read_string('NAME','mur','NAME_mur'));
            button_str_arr[5,14] = string_upper(ini_read_string('NAME','sg','NAME_sg'));
            button_str_arr[5,15] = string_upper(ini_read_string('NAME','bodybag','NAME_bodybag'));
            button_str_arr[5,16] = string_upper(ini_read_string('NAME','stem_og','NAME_stem_og'));
            button_str_arr[5,17] = string_upper(ini_read_string('NAME','patient_og','NAME_patient_og'));
            button_str_arr[5,18] = string_upper(ini_read_string('NAME','gc','NAME_gc'));
            button_str_arr[5,19] = string_upper(ini_read_string('NAME','bekka','NAME_bekka'));
            button_str_arr[5,20] = string_upper(ini_read_string('NAME','husk_og','NAME_husk_og'));
            button_str_arr[5,25] = string_upper(ini_read_string('NAME','real_ringu_og','NAME_real_ringu_og'));
            button_str_arr[5,26] = string_upper(ini_read_string('NAME','tiri','NAME_tiri'));
            button_str_arr[5,27] = string_upper(ini_read_string('NAME','lisa','NAME_lisa'));
            button_str_arr[5,28] = string_upper(ini_read_string('NAME','otto_og','NAME_otto_og'));
            button_str_arr[5,29] = string_upper(ini_read_string('NAME','spooper','NAME_spooper'));
            button_str_arr[5,30] = string_upper(ini_read_string('NAME','wf','NAME_wf'));
        }
        case name_hd_const:
        {
            button_str_arr[5,2] = string_upper(ini_read_string('NAME','gel','NAME_gel'));
            button_str_arr[5,3] = string_upper(ini_read_string('NAME','bug_hd','NAME_bug_hd'));
            button_str_arr[5,4] = string_upper(ini_read_string('NAME','ringu','NAME_ringu'));
            button_str_arr[5,5] = string_upper(ini_read_string('NAME','bab','NAME_bab'));
            button_str_arr[5,6] = string_upper(ini_read_string('NAME','pup_hd','NAME_pup_hd'));
            button_str_arr[5,7] = string_upper(ini_read_string('NAME','flesh','NAME_flesh'));
            button_str_arr[5,8] = string_upper(ini_read_string('NAME','dl','NAME_dl'));
            button_str_arr[5,9] = string_upper(ini_read_string('NAME','taker','NAME_taker'));
            button_str_arr[5,10] = string_upper(ini_read_string('NAME','para','NAME_para'));
            button_str_arr[5,11] = string_upper(ini_read_string('NAME','fd','NAME_fd'));
            button_str_arr[5,12] = string_upper(ini_read_string('NAME','killer_hd','NAME_killer_hd'));
            button_str_arr[5,13] = string_upper(ini_read_string('NAME','mur','NAME_mur'));
            button_str_arr[5,14] = string_upper(ini_read_string('NAME','sg','NAME_sg'));
            button_str_arr[5,15] = string_upper(ini_read_string('NAME','bodybag','NAME_bodybag'));
            button_str_arr[5,16] = string_upper(ini_read_string('NAME','stem_hd','NAME_stem_hd'));
            button_str_arr[5,17] = string_upper(ini_read_string('NAME','patient_hd','NAME_patient_hd'));
            button_str_arr[5,18] = string_upper(ini_read_string('NAME','gc','NAME_gc'));
            button_str_arr[5,19] = string_upper(ini_read_string('NAME','bekka','NAME_bekka'));
            button_str_arr[5,20] = string_upper(ini_read_string('NAME','husk_hd','NAME_husk_hd'));
            button_str_arr[5,25] = string_upper(ini_read_string('NAME','real_ringu_hd','NAME_real_ringu_hd'));
            button_str_arr[5,26] = string_upper(ini_read_string('NAME','tiri','NAME_tiri'));
            button_str_arr[5,27] = string_upper(ini_read_string('NAME','lisa','NAME_lisa'));
            button_str_arr[5,28] = string_upper(ini_read_string('NAME','otto_hd','NAME_otto_hd'));
            button_str_arr[5,29] = string_upper(ini_read_string('NAME','spooper','NAME_spooper'));
            button_str_arr[5,30] = string_upper(ini_read_string('NAME','wf','NAME_wf'));
        }
        case name_fanon_const:
        {
            button_str_arr[5,2] = string_upper(ini_read_string('NAME','gel','NAME_gel'));
            button_str_arr[5,3] = string_upper(ini_read_string('NAME','bug_fanon','NAME_bug_fanon'));
            button_str_arr[5,4] = string_upper(ini_read_string('NAME','ringu','NAME_ringu'));
            button_str_arr[5,5] = string_upper(ini_read_string('NAME','bab','NAME_bab'));
            button_str_arr[5,6] = string_upper(ini_read_string('NAME','pup_fanon','NAME_pup_fanon'));
            button_str_arr[5,7] = string_upper(ini_read_string('NAME','flesh','NAME_flesh'));
            button_str_arr[5,8] = string_upper(ini_read_string('NAME','dl','NAME_dl'));
            button_str_arr[5,9] = string_upper(ini_read_string('NAME','taker','NAME_taker'));
            button_str_arr[5,10] = string_upper(ini_read_string('NAME','para','NAME_para'));
            button_str_arr[5,11] = string_upper(ini_read_string('NAME','fd','NAME_fd'));
            button_str_arr[5,12] = string_upper(ini_read_string('NAME','killer_hd','NAME_killer_hd'));
            button_str_arr[5,13] = string_upper(ini_read_string('NAME','mur','NAME_mur'));
            button_str_arr[5,14] = string_upper(ini_read_string('NAME','sg','NAME_sg'));
            button_str_arr[5,15] = string_upper(ini_read_string('NAME','bodybag_fanon','NAME_bodybag_fanon'));
            button_str_arr[5,16] = string_upper(ini_read_string('NAME','stem_fanon','NAME_stem_fanon'));
            button_str_arr[5,17] = string_upper(ini_read_string('NAME','patient_fanon','NAME_patient_fanon'));
            button_str_arr[5,18] = string_upper(ini_read_string('NAME','gc','NAME_gc'));
            button_str_arr[5,19] = string_upper(ini_read_string('NAME','bekka','NAME_bekka'));
            button_str_arr[5,20] = string_upper(ini_read_string('NAME','husk_hd','NAME_husk_hd'));
            button_str_arr[5,25] = string_upper(ini_read_string('NAME','real_ringu_hd','NAME_real_ringu_hd'));
            button_str_arr[5,26] = string_upper(ini_read_string('NAME','tiri','NAME_tiri'));
            button_str_arr[5,27] = string_upper(ini_read_string('NAME','lisa','NAME_lisa'));
            button_str_arr[5,28] = string_upper(ini_read_string('NAME','otto_fanon','NAME_otto_fanon'));
            button_str_arr[5,29] = string_upper(ini_read_string('NAME','spooper','NAME_spooper'));
            button_str_arr[5,30] = string_upper(ini_read_string('NAME','wf','NAME_wf'));
        }
        case name_num_og_const:
        {
            button_str_arr[5,2] = string_upper(ini_read_string('NAME','gel_num','NAME_gel_num'));
            button_str_arr[5,3] = string_upper(ini_read_string('NAME','bug_num','NAME_bug_num'));
            button_str_arr[5,4] = string_upper(ini_read_string('NAME','ringu_num','NAME_ringu_num'));
            button_str_arr[5,5] = string_upper(ini_read_string('NAME','bab_num','NAME_bab_num'));
            button_str_arr[5,6] = string_upper(ini_read_string('NAME','pup_num','NAME_pup_num'));
            button_str_arr[5,7] = string_upper(ini_read_string('NAME','flesh_num','NAME_flesh_num'));
            button_str_arr[5,8] = string_upper(ini_read_string('NAME','dl_num','NAME_dl_num'));
            button_str_arr[5,9] = string_upper(ini_read_string('NAME','taker_num','NAME_taker_num'));
            button_str_arr[5,10] = string_upper(ini_read_string('NAME','para_num','NAME_para_num'));
            button_str_arr[5,11] = string_upper(ini_read_string('NAME','fd_num','NAME_fd_num'));
            button_str_arr[5,12] = string_upper(ini_read_string('NAME','killer_num','NAME_killer_num'));
            button_str_arr[5,13] = string_upper(ini_read_string('NAME','mur_num','NAME_mur_num'));
            button_str_arr[5,14] = string_upper(ini_read_string('NAME','sg_num_og','NAME_sg_num_og'));
            button_str_arr[5,15] = string_upper(ini_read_string('NAME','bodybag_num_og','NAME_bodybag_num_og'));
            button_str_arr[5,16] = string_upper(ini_read_string('NAME','stem_num_og','NAME_stem_num_og'));
            button_str_arr[5,17] = string_upper(ini_read_string('NAME','patient_num_og','NAME_patient_num_og'));
            button_str_arr[5,18] = string_upper(ini_read_string('NAME','gc_num_og','NAME_gc_num_og'));
            button_str_arr[5,19] = string_upper(ini_read_string('NAME','bekka','NAME_bekka'));
            button_str_arr[5,20] = string_upper(ini_read_string('NAME','husk_num','NAME_husk_num'));
            button_str_arr[5,25] = string_upper(ini_read_string('NAME','real_ringu_og','NAME_real_ringu_og'));
            button_str_arr[5,26] = string_upper(ini_read_string('NAME','tiri','NAME_tiri'));
            button_str_arr[5,27] = string_upper(ini_read_string('NAME','lisa','NAME_lisa'));
            button_str_arr[5,28] = string_upper(ini_read_string('NAME','otto_og','NAME_otto_og'));
            button_str_arr[5,29] = string_upper(ini_read_string('NAME','spooper','NAME_spooper'));
            button_str_arr[5,30] = string_upper(ini_read_string('NAME','wf','NAME_wf'));
        }
        case name_num_hd_const:
        {
            button_str_arr[5,2] = string_upper(ini_read_string('NAME','gel_num','NAME_gel_num'));
            button_str_arr[5,3] = string_upper(ini_read_string('NAME','bug_num','NAME_bug_num'));
            button_str_arr[5,4] = string_upper(ini_read_string('NAME','ringu_num','NAME_ringu_num'));
            button_str_arr[5,5] = string_upper(ini_read_string('NAME','bab_num','NAME_bab_num'));
            button_str_arr[5,6] = string_upper(ini_read_string('NAME','pup_num','NAME_pup_num'));
            button_str_arr[5,7] = string_upper(ini_read_string('NAME','flesh_num','NAME_flesh_num'));
            button_str_arr[5,8] = string_upper(ini_read_string('NAME','dl_num','NAME_dl_num'));
            button_str_arr[5,9] = string_upper(ini_read_string('NAME','taker_num','NAME_taker_num'));
            button_str_arr[5,10] = string_upper(ini_read_string('NAME','para_num','NAME_para_num'));
            button_str_arr[5,11] = string_upper(ini_read_string('NAME','fd_num','NAME_fd_num'));
            button_str_arr[5,12] = string_upper(ini_read_string('NAME','killer_num','NAME_killer_num'));
            button_str_arr[5,13] = string_upper(ini_read_string('NAME','mur_num','NAME_mur_num'));
            button_str_arr[5,14] = string_upper(ini_read_string('NAME','sg_num_hd','NAME_sg_num_hd'));
            button_str_arr[5,15] = string_upper(ini_read_string('NAME','bodybag_num_hd','NAME_bodybag_num_hd'));
            button_str_arr[5,16] = string_upper(ini_read_string('NAME','stem_num_hd','NAME_stem_num_hd'));
            button_str_arr[5,17] = string_upper(ini_read_string('NAME','patient_num_hd','NAME_patient_num_hd'));
            button_str_arr[5,18] = string_upper(ini_read_string('NAME','gc_num_hd','NAME_gc_num_hd'));
            button_str_arr[5,19] = string_upper(ini_read_string('NAME','bekka_num','NAME_bekka_num'));
            button_str_arr[5,20] = string_upper(ini_read_string('NAME','husk_hd','NAME_husk_hd'));
            button_str_arr[5,25] = string_upper(ini_read_string('NAME','real_ringu_num','NAME_real_ringu_num'));
            button_str_arr[5,26] = string_upper(ini_read_string('NAME','tiri_num','NAME_tiri_num'));
            button_str_arr[5,27] = string_upper(ini_read_string('NAME','lisa_num','NAME_lisa_num'));
            button_str_arr[5,28] = string_upper(ini_read_string('NAME','otto_num','NAME_otto_num'));
            button_str_arr[5,29] = string_upper(ini_read_string('NAME','spooper_num','NAME_spooper_num'));
            button_str_arr[5,30] = string_upper(ini_read_string('NAME','wf_num','NAME_wf_num'));
        }
    }
    button_str_arr[5,21] = string_upper(ini_read_string('NAME','wc','NAME_wc'));
    button_str_arr[5,22] = string_upper(ini_read_string('NAME','clown','NAME_clown'));
    button_str_arr[5,23] = string_upper(ini_read_string('NAME','hd','NAME_hd'));
    button_str_arr[5,24] = string_upper(ini_read_string('NAME','frenzy','NAME_frenzy'));
    button_str_arr[5,31] = back_str_var;
		//Load Saves
	button_str_arr[6,0] = back_str_var;
        // Other
    on_str_var = ini_read_string('MENU','on','MENU_on');
    off_str_var = ini_read_string('MENU','off','MENU_off');
    true_str_var = ini_read_string('MENU','true','MENU_true');
    false_str_var = ini_read_string('MENU','false','MENU_false');
    min_str_var = ini_read_string('MENU','min','MENU_min');
    max_str_var = ini_read_string('MENU','max','MENU_max');
    always_str_var = ini_read_string('MENU','always','MENU_always');
    never_str_var = ini_read_string('MENU','never','MENU_never');
    rand_str_var = ini_read_string('MENU','rand','MENU_rand');
    def_str_var = ini_read_string('MENU','def','MENU_def');
    inf_str_var = ini_read_string('MENU','inf','MENU_inf');
    taper_str_var = ini_read_string('MENU','taper','MENU_taper');
    mod_str_var = ini_read_string('MENU','mod','MENU_mod');
    og_str_var = ini_read_string('MENU','og','MENU_og');
    hd_str_var = ini_read_string('MENU','hd','MENU_hd');
    kh_str_var = ini_read_string('MENU','kh','MENU_kh');
    dh_str_var = ini_read_string('MENU','dh','MENU_dh');
    alt_str_var = ini_read_string('MENU','alt','MENU_alt');
    sm_str_var = ini_read_string('MENU','sm','MENU_sm');
    em_str_var = ini_read_string('MENU','em','MENU_em');
    sb_str_var = ini_read_string('MENU','sb','MENU_sb');
    easiest_str_var = ini_read_string('MENU','easiest','MENU_easiest');
    easy_str_var = ini_read_string('MENU','easy','MENU_easy');
    normal_str_var = ini_read_string('MENU','normal','MENU_normal');
    hard_str_var = ini_read_string('MENU','hard','MENU_hard');
    hardest_str_var = ini_read_string('MENU','hardest','MENU_hardest');
    alone_str_var = ini_read_string('MENU','alone','MENU_alone');
    evil_str_var = ini_read_string('MENU','evil','MENU_evil'); // Not golden
    canon_str_var = ini_read_string('MENU','canon','MENU_canon');
    ini_close();
    // Alarms
    alarm_len_var = 1;
    alarm_arr[0,2] = '';
    set_alarm_scr(0,3000);
    // States
    state_var = 0;
    // Other
    image_alpha = 0;
    y = -1440;
    path_y_var = -720;
    path_cloud_y_var = 0;
    story_y_var = 750;
    str_scale_var = 0.8;
	
	menuscroll_var = 0;
	menuscroll_lerp_var = 0;
	menuscroll_focal_var = 0;
	
	// Save Variables
	save_name_var = '';
	save_violence_var = 0;
	save_rm_count_var = 0;
	save_note_var = 0;
    save_mode_var=1;
	save_diff_var = 2;
	save_custom_var = false;
	save_rm_var = hall_01_rm;
	
    save_crouch_var = -1;
    save_jump_var = -1;
	save_stam_per_var=-1;
	save_fall_var=-1;
	save_lock_var=-1;
	save_dmg_shake_var=-1;
	save_mult_type_var=-1;
	save_mult_min_var=-1;
	save_mult_max_var=-1;
	save_mult_start_var=-1;
	save_mult_end_var=-1;
	save_count_type_var=-1;
	save_count_min_var=-1;
	save_count_max_var=-1;
	save_count_start_var=-1;
	save_count_end_var=-1;
    save_dupe_var = -1;
    save_chance_var = -1;
    save_chance_mult_var = -1;
	
	save_type_var=0;
	save_player_type_var=-1;
	save_axe_type_var=-1;
	save_gel_type_var=-1;
	save_bug_type_var=-1;
	save_ringu_type_var=-1;
	save_bab_type_var=-1;
	save_pup_type_var=-1;
	save_flesh_type_var=-1;
	save_dl_type_var=-1;
	save_taker_type_var=-1;
	save_para_type_var=-1;
	save_fd_type_var=-1;
	save_killer_type_var=-1;
	save_mur_type_var=-1;
	save_sg_type_var=-1;
	save_body_type_var=-1;
	save_stem_type_var=-1;
	save_patient_type_var=-1;
	save_cow_type_var=-1;
	save_bekka_type_var=-1;
	save_husk_type_var=-1;
	save_wc_type_var=-1;
	save_clown_type_var=-1;
	save_hd_type_var=-1;
	save_frenzy_type_var=-1;
	save_nm_type_var=-1;
	save_tiri_type_var=-1;
	save_lisa_type_var=-1;
	save_otto_type_var=-1;
	save_spooper_type_var=-1;
	save_wf_type_var=-1;
	save_real_ringu_type_var=-1;
	
	ds_list_clear(global.save_list);
	
	ini_open('saves.ini');
					
	ds_list_read(global.save_list,ini_read_string('SAVES','SAVES','2F01000000000000'));

	ini_close();
	
");
// Room End
object_event_add
(argument0,ev_other,ev_room_end,"
    global.make_sure_this_is_gone_please = bg_var;
    background_delete(bg_var);
    background_delete(cloud_bg_var);
    background_delete(light_01_bg_var);
    background_delete(light_02_bg_var);
    background_delete(path_bg_var);
    background_delete(path_cloud_bg_var);
    sprite_delete(set_spr_var);
    sprite_delete(name_spr_var);
	
    for (local.i=0; local.i<sub_bg_len_var; local.i+=1;)
    { background_delete(sub_bg_arr[local.i]); }
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    event_inherited();
	
    x = (x-global.delta_time_var) mod background_get_width(cloud_bg_var);
    switch state_var
    {
        case 0: // Story
        {
            y = lerp_scr(0,-1440,alarm_arr[0,0]/alarm_arr[0,1]);
            path_y_var = lerp_scr(720,-720,alarm_arr[0,0]/alarm_arr[0,1]);
            path_cloud_y_var = lerp_scr(720,0,alarm_arr[0,0]/alarm_arr[0,1]);
            path_cloud_x_var = (path_cloud_x_var+global.delta_time_var) mod 720;
            story_y_var = lerp_scr(-750,750,alarm_arr[0,0]/alarm_arr[0,1]); // -748, 752
            if global.confirm_input_press_var
            {
                event_perform(ev_alarm,0);
                set_alarm_scr(0,-1);
            }
            break;
        }
        case 1: // Press Confirm
        {
            time_var = (time_var+global.delta_time_var) mod 120;
            str_alpha_var = (cos(2*time_var*pi/120)+1)/2;
            if global.confirm_input_press_var
            { state_var += 1; event_user(0); }
            break;
        }
        case 2: // Main
        {
            local.swap = global.left_input_press_var || global.right_input_press_var;
            if button_state_var < 4
            {
                if local.swap { button_state_var = max(4,button_state_var+2); }
                else
                {
                    if global.up_input_press_var { button_state_var -= 1; }
                    if global.down_input_press_var { button_state_var += 1; }
                    button_state_var = mod_scr(button_state_var,4);
                }
            }
            else
            {
                if local.swap { button_state_var -= 2; }
                else
                {
                    if global.up_input_press_var { button_state_var -= 1; }
                    if global.down_input_press_var { button_state_var += 1; }
                    button_state_var = mod_scr(button_state_var-4,2)+4;
                }
            }
            time_var = (time_var+global.delta_time_var) mod 160;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            name_y_var = 170+(sin(2*time_var*pi/160)*10)
            if global.confirm_input_press_var
            {
                switch button_state_var
                {
                    case 0:
					{
						state_var = 3;
						event_user(0);
						
						menuscroll_focal_var = 2;
						menuscroll_var = 0;
						menuscroll_lerp_var = 0;
						
						sub_bg_var = irandom_range(0,sub_bg_len_var-1);
						
						save_name_var = '';
						save_violence_var = 0;
						save_rm_count_var = 0;
						save_note_var = 0;
						save_diff_var = 2;
                        save_mode_var=1;
						save_custom_var = false;
						save_room = hall_01_rm;
						
                        save_crouch_var = -1;
                        save_jump_var = -1;
						save_stam_per_var=-1;
						save_fall_var=-1;
						save_lock_var=-1;
						save_dmg_shake_var=-1;
						save_mult_type_var=-1;
						save_mult_min_var=-1;
						save_mult_max_var=-1;
						save_mult_start_var=-1;
						save_mult_end_var=-1;
						save_count_type_var=-1;
						save_count_min_var=-1;
						save_count_max_var=-1;
						save_count_start_var=-1;
						save_count_end_var=-1;
						save_dupe_var = -1;
                        save_chance_var = -1;
                        save_mon_chance_var = -1;
						
						save_type_var=0;
						save_player_type_var=-1;
						save_axe_type_var=-1;
						save_gel_type_var=-1;
						save_bug_type_var=-1;
						save_ringu_type_var=-1;
						save_bab_type_var=-1;
						save_pup_type_var=-1;
						save_flesh_type_var=-1;
						save_dl_type_var=-1;
						save_taker_type_var=-1;
						save_para_type_var=-1;
						save_fd_type_var=-1;
						save_killer_type_var=-1;
						save_mur_type_var=-1;
						save_sg_type_var=-1;
						save_body_type_var=-1;
						save_stem_type_var=-1;
						save_patient_type_var=-1;
						save_cow_type_var=-1;
						save_bekka_type_var=-1;
						save_husk_type_var=-1;
						save_wc_type_var=-1;
						save_clown_type_var=-1;
						save_hd_type_var=-1;
						save_frenzy_type_var=-1;
						save_nm_type_var=-1;
						save_tiri_type_var=-1;
						save_lisa_type_var=-1;
						save_otto_type_var=-1;
						save_spooper_type_var=-1;
						save_wf_type_var=-1;
						save_real_ringu_type_var=-1;
						
						break;
					}
					case 1:
					{
						if ds_list_size(global.save_list) > 0
						{
							button_str_arr[6] = -1;
							button_str_arr[6,0] = 'BACK';
						
							local.save_index = 0;
							local.name = '';
							
							repeat(ds_list_size(global.save_list))
							{
							local.name = string(ds_list_find_value(global.save_list,local.save_index));
							button_str_arr[6,local.save_index+1] = local.name;
							
							local.save_index += 1;
							}
							
							state_var = 6;
							event_user(0);
							
							menuscroll_focal_var = 2;
							menuscroll_var = 0;
							menuscroll_lerp_var = 0;
							
							sub_bg_var = irandom_range(0,sub_bg_len_var-1);
						}
						break;
					}
                    case 2:
                    {
                        highscore_show_ext(-1,menu_score_bg,true,c_yellow,c_purple,'Lunchtime Doubly So',16);
                        global.last_time_var = current_time;
                        break;
                    }
                    case 3: { game_end(); break; }
                    case 4:
                    {
                        state_var = 7;
                        instance_create(0,0,set_menu_obj);
                        event_user(0);
                        break;
                    }
                    case 5: { state_var = 9; event_user(0); break; }
                }
            }
            break;
        }
        case 3: //Save Creation
        {
			subbgscroll_var += global.delta_time_var;
			
			if subbgalpha_var < 1
			subbgalpha_var += (0.04*global.delta_time_var);
			
			if button_state_var < (menuscroll_focal_var-1)
			menuscroll_focal_var -= 1;
			
			if button_state_var > (menuscroll_focal_var+1)
			menuscroll_focal_var += 1;
			
			menuscroll_var = 96*(menuscroll_focal_var-2);
			menuscroll_lerp_var = menuscroll_lerp_var + (menuscroll_var - menuscroll_lerp_var) * (0.2*global.delta_time_var)
			
            // Text Stretch
            time_var = (time_var+global.delta_time_var) mod 80;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            // Scroll
            if global.up_input_press_var { button_state_var -= 1; }
            if global.down_input_press_var { button_state_var += 1; }
            button_state_var = mod_scr(button_state_var,7);
            // Confirm
            if global.confirm_input_press_var
            {
                switch button_state_var
                {
                    // Play
                    case 0:
                    {
						state_var = 12;
						keyboard_string = '';
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
                }
            }
			
			if global.left_input_press_var
			{
				switch button_state_var
				{
					// mode
					case 1:
					{
						save_mode_var -= 1;
						
						if save_mode_var < 0
						save_mode_var = 2;
						break;
					}
					
					case 2:
					{
						save_diff_var -= 1;
						
						if save_diff_var < 0
						save_diff_var = 4;
						break;
					}
					
					case 3:
					{
						save_type -= 1;
						
						if save_type < 0
						save_type = 2;
						break;
					}
					
					case 4:
					{
						save_custom_var -= 1;
						
						if save_custom_var < 0
						save_custom_var = 1;
						break;
					}
				}
			}
			if global.right_input_press_var
			{
				switch button_state_var
				{
					// mode
					case 1:
					{
						save_mode_var += 1;
						
						if save_mode_var > 2
						save_mode_var = 0;
						break;
					}
					
					case 2:
					{
						save_diff_var += 1;
						
						if save_diff_var > 4
						save_diff_var = 0;
						break;
					}
					
					case 3:
					{
						save_type += 1;
						
						if save_type > 2
						save_type = 0;
						break;
					}
					
					case 4:
					{
						save_custom_var += 1;
						
						if save_custom_var > 1
						save_custom_var = 0;
						break;
					}
				}
			}
			break;
        }
        case 4: // Customize
        {
            // Effects! (I don't know how this works, but I trust Bird's judgement)
            subbgscroll_var += (1*global.delta_time_var);
			
			if subbgalpha_var < 1
			subbgalpha_var += (0.04*global.delta_time_var);
			
			if button_state_var < (menuscroll_focal_var-1)
			menuscroll_focal_var -= 1;
			
			if button_state_var > (menuscroll_focal_var+1)
			menuscroll_focal_var += 1;
			
			menuscroll_var = 96*(menuscroll_focal_var-2);
			menuscroll_lerp_var = menuscroll_lerp_var + (menuscroll_var - menuscroll_lerp_var) * (0.2*global.delta_time_var);
            // Text Stretch
            time_var = (time_var+global.delta_time_var) mod 80;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            // Scroll
            if global.up_input_press_var { button_state_var -= 1; }
            if global.down_input_press_var { button_state_var += 1; }
            button_state_var = mod_scr(button_state_var,21);
            // Confirm
            if global.confirm_input_press_var
            {
                switch button_state_var
                {
                    case 7: // Multichase (minimum)
                    {
                        save_mult_min_var =  max(-2,get_integer('Chase Min',save_mult_min_var));
                        global.confirm_input_var = 0; // Prevent persistent control issues
                        break;
                    }
                    case 8: // Multichase (maximum)
                    {
                        save_mult_max_var =  max(-2,get_integer('Chase Max',save_mult_max_var));
                        global.confirm_input_var = 0;
                        break;
                    }
                    case 9: // Multichase Start
                    {
                        save_mult_start_var =  max(-1,get_integer('Chase Start',save_mult_start_var));
                        global.confirm_input_var = 0;
                        break;
                    }
                    case 10: // Multichase End
                    {
                        save_mult_end_var =  max(-1,get_integer('Chase End',save_mult_end_var));
                        global.confirm_input_var = 0;
                        break;
                    }
                    case 12: // Count (minimum)
                    {
                        save_count_min_var = max(-1,get_integer('Count Min',save_count_min_var));
                        global.confirm_input_var = 0;
                        break;
                    }
                    case 13: // Count (maximum)
                    {
                        save_count_max_var = max(-1,get_integer('Count Max',save_count_max_var));
                        global.confirm_input_var = 0;
                        break;
                    }
                    case 14: // Count Start
                    {
                        save_count_start_var =  max(-1,get_integer('Count Start',save_count_start_var));
                        global.confirm_input_var = 0;
                        break;
                    }
                    case 15: // Count End
                    {
                        save_count_end_var =  max(-1,get_integer('Count End',save_count_end_var));
                        global.confirm_input_var = 0;
                        break;
                    }
                    case 17: // Monster Chance
                    {
                        save_chance_var =  max(-1,get_integer('Spawn Chance',save_chance_var));
                        global.confirm_input_var = 0;
                        break;
                    }
                    case 18: // Monster Chance Multiplier
                    {
                        save_chance_mult_var =  max(-1,get_integer('Spawn Chance',save_chance_mult_var));
                        global.confirm_input_var = 0;
                        break;
                    }
                    case 19: // Behavior
                    {
                        state_var = 5;
                        event_user(0);
                        break;
                    }
                    case 20: // Back
					{
						state_var = 3;
                        event_user(0);
						break;
					}
                }
            }
            // Directions
            if global.left_input_press_var == 1 || global.right_input_press_var == 1
            {
                local.add = global.right_input_press_var-global.left_input_press_var;
                switch button_state_var
                {
                    case 0: // Crouch
                    { save_crouch_var = mod_scr(save_crouch_var+1+local.add,3)-1; break; }
                    case 1: // Jump
                    { save_jump_var = mod_scr(save_jump_var+1+local.add,3)-1; break; }
                    case 2: // Persistent Stamina
                    { save_stam_per_var = mod_scr(save_stam_per_var+1+local.add,3)-1; break; }
                    case 3: // Fall
                    { save_fall_var = mod_scr(save_fall_var+1+local.add,3)-1; break; }
                    case 4: // Lock
                    { save_lock_var = mod_scr(save_lock_var+1+local.add,5)-1; break; }
                    case 5: // Damage Shake
                    { save_dmg_shake_var = mod_scr(save_dmg_shake_var+1+local.add,3)-1; break; }
                    case 6: // Multichase Type
                    { save_mult_type_var = mod_scr(save_mult_type_var+1+local.add,5)-1; break; }
                    case 7: // Multichase (minimum)
                    { save_mult_min_var =  max(-2,save_mult_min_var+local.add); break; }
                    case 8: // Multichase (maximum)
                    { save_mult_max_var =  max(-2,save_mult_max_var+local.add); break; }
                    case 9: // Multichase Start
                    { save_mult_start_var =  max(-1,save_mult_start_var+local.add); break; }
                    case 10: // Multichase End
                    { save_mult_end_var =  max(-1,save_mult_end_var+local.add); break; }
                    case 11: // Count Type
                    { save_count_type_var = mod_scr(save_count_type_var+1+local.add,6)-1; break; }
                    case 12: // Count (minimum)
                    { save_count_min_var = max(-1,save_count_min_var+local.add); break; }
                    case 13: // Count (maximum)
                    { save_count_max_var = max(-1,save_count_max_var+local.add); break; }
                    case 14: // Count Start
                    { save_count_start_var =  max(-1,save_count_start_var+local.add); break; }
                    case 15: // Count End
                    { save_count_end_var =  max(-1,save_count_end_var+local.add); break; }
                    case 16: // Dupe
                    { save_dupe_var = mod_scr(save_dupe_var+1+local.add,4)-1; break; }
                    case 17: // Monster Chance
                    { save_chance_var =  max(-1,save_chance_var+local.add); break; }
                    case 18: // Monster Chance Multiplier
                    { save_chance_mult_var =  max(-1,save_chance_mult_var+local.add); break; }
                }
            }
            break;
        }
		case 6: //Save Loads
        {
			subbgscroll_var += (1*global.delta_time_var);
			
			if subbgalpha_var < 1
			subbgalpha_var += (0.04*global.delta_time_var);
			
			if button_state_var < (menuscroll_focal_var-1)
			menuscroll_focal_var -= 1;
			
			if button_state_var > (menuscroll_focal_var+1)
			menuscroll_focal_var += 1;
			
			menuscroll_var = 96*(menuscroll_focal_var-2);
			menuscroll_lerp_var = menuscroll_lerp_var + (menuscroll_var - menuscroll_lerp_var) * (0.2*global.delta_time_var)
			
            // Text Stretch
            time_var = (time_var+global.delta_time_var) mod 80;
            str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
            // Scroll
            if global.up_input_press_var
			{
				button_state_var -= 1;
				
				if button_state_var != 0
				{
					local.name = string(ds_list_find_value(global.save_list,button_state_var-1));
					
					ini_open('save_'+local.name+'.ini');
					
					save_rm_count_var = ini_read_real('MAIN','rm_count',0);
					save_mode_var = ini_read_real('SETTING','mode',1);
					save_diff_var = ini_read_real('MAIN','diff',0);
					save_type = ini_read_real('BEHAVIOR','type',0);
					save_custom_var = ini_read_real('MAIN','custom',0);
					
					ini_close();
				}
			}
            if global.down_input_press_var
			{
				button_state_var += 1;
				
				if button_state_var != 0
				{
					local.name = string(ds_list_find_value(global.save_list,button_state_var-1));
					
					ini_open('save_'+local.name+'.ini');
					
					save_rm_count_var = ini_read_real('MAIN','rm_count',0);
					save_mode_var = ini_read_real('SETTING','mode',1);
					save_diff_var = ini_read_real('MAIN','diff',0);
					save_type = ini_read_real('BEHAVIOR','type',0);
					save_custom_var = ini_read_real('MAIN','custom',0);
					
					ini_close();
				}
			}
            button_state_var = mod_scr(button_state_var,1+ds_list_size(global.save_list));
            // Confirm
            if global.confirm_input_press_var
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
						
						ini_open('save_'+local.name+'.ini');
						
						// Main
						global.save_name_var = local.name;
						global.rm_count_var = ini_read_real('MAIN','rm_count',0);
						global.violence_var = ini_read_real('MAIN','violence',0);
						global.note_var = ini_read_real('MAIN','note',0);
						global.diff_var = ini_read_real('MAIN','diff',0);
						global.custom_var = ini_read_real('MAIN','custom',0);
                        global.mode_var = ini_read_real('SETTING','mode',1);
						save_rm_var = ini_read_real('MAIN','room',0);
						// Settings
                        global.jump_var = ini_read_real('SETTING','jump',false);
                        global.crouch_var = ini_read_real('SETTING','crouch',false);
						global.stam_per_var = ini_read_real('SETTING','stam_per',false);
						global.fall_var = ini_read_real('SETTING','fall',false);
						global.lock_var = ini_read_real('SETTING','lock',1);
						global.dmg_shake_var = ini_read_real('SETTING','dmg_shake',false);
						global.mult_type_var = ini_read_real('SETTING','multi_type',0);
						global.mult_min_var = ini_read_real('SETTING','multi_min',1);
						global.mult_max_var = ini_read_real('SETTING','multi_max',5);
						global.mult_start_var = ini_read_real('SETTING','multi_start',0);
						global.mult_end_var = ini_read_real('SETTING','multi_end',1000);
						global.count_type_var = ini_read_real('SETTING','count_type',0);
						global.count_min_var = ini_read_real('SETTING','count_min',0);
						global.count_max_var = ini_read_real('SETTING','count_max',20);
						global.count_start_var = ini_read_real('SETTING','count_start',0);
						global.count_end_var = ini_read_real('SETTING','count_end',1000);
                        global.dupe_var = ini_read_real('SETTING','dupe',dupe_canon_const);
                        global.mon_chance_var = ini_read_real('SETTING','mon_chance',mon_chance_const);
                        global.mon_chance_mult_var = ini_read_real('SETTING','mon_chance_mult',mon_chance_mult_const);
						// Behavior stuff
						global.default_type_var = ini_read_real('BEHAVIOR','type',0);
						global.player_type_var = ini_read_real('BEHAVIOR','player_type',global.default_type_var);
						global.axe_type_var = ini_read_real('BEHAVIOR','axe_type',global.default_type_var);
						global.gel_type_var = ini_read_real('BEHAVIOR','gel_type',global.default_type_var);
						global.bug_type_var = ini_read_real('BEHAVIOR','bug_type',global.default_type_var);
						global.ringu_type_var = ini_read_real('BEHAVIOR','ringu_type',global.default_type_var);
						global.bab_type_var = ini_read_real('BEHAVIOR','bab_type',global.default_type_var);
						global.pup_type_var = ini_read_real('BEHAVIOR','pup_type',global.default_type_var);
						global.flesh_type_var = ini_read_real('BEHAVIOR','flesh_type',global.default_type_var);
						global.dl_type_var = ini_read_real('BEHAVIOR','dl_type',global.default_type_var);
						global.taker_type_var = ini_read_real('BEHAVIOR','taker_type',global.default_type_var);
						global.para_type_var = ini_read_real('BEHAVIOR','para_type',global.default_type_var);
						global.fd_type_var = ini_read_real('BEHAVIOR','fd_type',global.default_type_var);
						global.killer_type_var = ini_read_real('BEHAVIOR','killer_type',global.default_type_var);
						global.mur_type_var = ini_read_real('BEHAVIOR','mur_type',global.default_type_var);
						global.sg_type_var = ini_read_real('BEHAVIOR','sg_type',global.default_type_var);
						global.body_type_var = ini_read_real('BEHAVIOR','body_type',global.default_type_var);
						global.stem_type_var = ini_read_real('BEHAVIOR','stem_type',global.default_type_var);
						global.patient_type_var = ini_read_real('BEHAVIOR','patient_type',global.default_type_var);
						global.cow_type_var = ini_read_real('BEHAVIOR','cow_type',global.default_type_var);
						global.bekka_type_var = ini_read_real('BEHAVIOR','bekka_type',global.default_type_var);
						global.husk_type_var = ini_read_real('BEHAVIOR','husk_type',global.default_type_var);
						global.wc_type_var = ini_read_real('BEHAVIOR','wc_type',global.default_type_var);
						global.clown_type_var = ini_read_real('BEHAVIOR','clown_type',global.default_type_var);
						global.hd_type_var = ini_read_real('BEHAVIOR','hd_type',global.default_type_var);
						global.frenzy_type_var = ini_read_real('BEHAVIOR','frenzy_type',global.default_type_var);
						global.real_ringu_type_var = ini_read_real('BEHAVIOR','real_ringu_type',global.default_type_var);
						global.tiri_type_var = ini_read_real('BEHAVIOR','tiri_type',global.default_type_var);
						global.lisa_type_var = ini_read_real('BEHAVIOR','lisa_type',global.default_type_var);
						global.otto_type_var = ini_read_real('BEHAVIOR','otto_type',global.default_type_var);
						global.spooper_type_var = ini_read_real('BEHAVIOR','spooper_type',global.default_type_var);
						global.wf_type_var = ini_read_real('BEHAVIOR','wf_type',global.default_type_var);
						
						ini_close();
						
						local.player = instance_create(0,0,global.player_obj);
                        local.hud = instance_create(0,0,global.hud_obj);
                        local.hud.par_var = local.player;
                        local.axe = instance_create(0,0,global.axe_obj);
                        local.axe.par_var = local.player;
                        fmod_snd_loop_scr(choose(amb_01_snd,amb_02_snd,amb_03_snd,amb_04_snd,amb_05_snd,amb_06_snd,amb_07_snd,amb_08_snd,amb_09_snd,amb_10_snd,amb_11_snd,amb_12_snd));
                        global.zone_num_var = irandom(global.zone_len_var+global.story_zone_len_var-1);
                        if global.zone_num_var >= global.zone_len_var
                        { global.zone_var = global.story_zone_arr[global.zone_num_var-global.zone_len_var]; }
                        else { global.zone_var = global.zone_arr[global.zone_num_var]; }
                        tex_scr(-1);
                        global.count_var = get_count_scr();
						
						room_goto(save_rm_var);
					}
				}
			}
			
			if keyboard_check_pressed(vk_backspace)
			{
				if button_state_var != 0
				{
					if show_message_ext('Are you sure you want to delete this file?','YES','NO','') = 1
					{
						local.name = string(ds_list_find_value(global.save_list,button_state_var-1));
						
						ds_list_delete(global.save_list,ds_list_find_index(global.save_list,string(local.name)));
					
						ini_open('saves.ini');
					
						ini_write_string('SAVES','SAVES',ds_list_write(global.save_list));
					
						ini_close();
						
						//file_delete(working_directory+'save_'+local.name+'.ini');
						
						file_delete('save_'+string(local.name)+'.ini');
						
						button_state_var = 0;
						
						button_str_arr[6] = -1;
						button_str_arr[6,0] = 'BACK';
					
						local.save_index = 0;
						local.name = '';
						
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
		case 12: //Name Entry
        {
			subbgscroll_var += (1*global.delta_time_var);
			
			if subbgalpha_var < 1
			subbgalpha_var += (0.04*global.delta_time_var);
			
			if keyboard_string = ' '
			{
				keyboard_string = '';
			}
			
			if string_length(keyboard_string) > 20
			{
				keyboard_string = string_copy(keyboard_string,1,20);
			}
			
			if keyboard_check_pressed(vk_escape)
			{
				state_var = 3;
				event_user(0);
			}
			
			if keyboard_check_pressed(vk_enter) and keyboard_string != ''
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
				
				// Settings
                if global.main_type_var == 1 { global.diff_var = 5; } // OG
                else if global.main_type_var == 2 { global.diff_var = 6; } // HD
                else { global.diff_var = save_diff_var; }
                
                if save_jump_var == -1 || !save_custom_var { global.jump_var = (save_type_var == 0); }
                else { global.jump_var = save_jump_var; }

                if save_crouch_var == -1 || !save_custom_var { global.crouch_var = (save_type_var == 0); }
                else { global.crouch_var = save_crouch_var; }

				if save_stam_per_var == -1 || !save_custom_var
                { global.stam_per_var = (global.diff_var == 3 || global.diff_var == 4); } // Hard & Hardest
                else { global.stam_per_var = save_stam_per_var; }

				if save_fall_var == -1 || !save_custom_var
                { global.fall_var = (global.diff_var == 4); } // Hardest
                else { global.fall_var = save_fall_var; }

				if save_lock_var == -1 || !save_custom_var
                { global.lock_var = 1; } // Not sure yet
                else { global.lock_var = save_lock_var; }

                if save_dmg_shake_var == -1 || !save_custom_var
				{ global.dmg_shake_var = (global.diff_var == 5 || global.diff_var = 4); } // Hardest & OG
                else { global.dmg_shake_var = save_dmg_shake_var; }

                if save_mult_type_var == -1 || !save_custom_var
                {
                    switch global.diff_var
                    {
                        case 0: // Easiest
                        case 1: // Easy
                        case 5: // OG
                        {
                            global.mult_type_var = 1;
                            break;
                        }
                        case 2: // Normal
                        case 3: // Hard
                        case 6: // HD
                        {
                            global.mult_type_var = 0;
                            break;
                        }
                        case 4: // Hardest
                        {
                            global.mult_type_var = 3;
                            break;
                        }
                    }
                }
				else { global.mult_type_var = save_mult_type_var; }

				if  save_mult_min_var == -1 || !save_custom_var
                {
                    if save_diff_var == 0 { global.mult_min_var = 0; }
                    else { global.mult_min_var = 1; }
                }
                else { global.mult_min_var = save_mult_min_var; }

				if save_mult_max_var == -1 || !save_custom_var
                { global.mult_max_var = 5; }
                else { global.mult_max_var = save_mult_max_var; }

				if save_mult_start_var == -1 || !save_custom_var
                { global.mult_start_var = 0; }
                else { global.mult_start_var = save_mult_start_var; }

				if save_mult_end_var || !save_custom_var
                { global.mult_end_var = 1000; }
                else { global.mult_end_var = save_mult_end_var; }

                if save_count_type_var == -1 || !save_custom_var
                {
                    switch global.diff_var
                    {
                        case 2: // Normal
                        {
                            global.count_type_var = 0;
                            break;
                        }
                        case 0: // Easiest
                        case 1: // Easy
                        case 5: // OG
                        {
                            global.count_type_var = 1;
                            break;
                        }
                        case 3: // Hard
                        case 4: // Hardest
                        case 6: // HD
                        {
                            global.count_type_var = 2;
                            break;
                        }
                    }
                }
				else { global.count_type_var = save_count_type_var; }

				if save_count_min_var == -1 || !save_custom_var
                { global.count_min_var = 0; }
                else { global.count_min_var = save_count_min_var; }

				if save_count_max_var == -1 || !save_custom_var
                { global.count_max_var = 20; }
                else { global.count_max_var = save_count_max_var; }

				if save_count_start_var == -1 || !save_custom_var
                { global.count_start_var = 0; }
                else { global.count_start_var = save_count_start_var; }

				if save_count_end_var == -1 || !save_custom_var
                { global.count_end_var = 1000; }
                else { global.count_end_var = save_count_end_var; }

                if save_dupe_var == -1 || !save_custom_var
                {
                    if global.diff_var == 4 || global.diff_var == 6 { global.dupe_var = dupe_always_const; }
                    else { global.dupe_var = dupe_canon_const; }
                }
                else { global.dupe_var = save_dupe_var; }

                if save_chance_var == -1 || !save_custom_var
                { global.mon_chance_var = mon_chance_const; }
                else { global.mon_chance_var = save_chance_var; }

                if save_chance_mult_var == -1 || !save_custom_var
                {
                    switch global.diff_var
                    {
                        case 0: // Easiest
                        case 1: // Easy
                        case 2: // Normal
                        case 5: // OG
                        {
                            global.mon_chance_mult_var = mon_chance_mult_const;
                            break;
                        }
                        case 3: // Hard
                        case 4: // Hardest
                        case 6: // HD
                        {
                            global.mon_chance_mult_var = 0;
                            break;
                        }
                    }
                    
                }
                else { global.mon_chance_mult_var = save_chance_mult_var; }

				// Behavior stuff
				if save_player_type == -1 || !save_custom_var
                { global.player_type_var = save_type; }
				else { global.player_type_var = save_player_type; }

				if save_axe_type == -1 || !save_custom_var
                { global.axe_type_var = save_type; }
				else { global.axe_type_var = save_axe_type; }
				
				if save_gel_type == -1 || !save_custom_var
                { global.gel_type_var = save_type; }
				else { global.gel_type_var = save_gel_type; }
				
				if save_bug_type == -1 || !save_custom_var
                { global.bug_type_var = save_type; }
				else { global.bug_type_var = save_bug_type; }
				
				if save_ringu_type_var == -1 || !save_custom_var
                { global.ringu_type_var = save_type_var; }
				else { global.ringu_type_var = save_ringu_type_var; }
				
				if save_bab_type_var == -1 || !save_custom_var
                { global.bab_type_var = save_type_var; }
				else { global.bab_type_var = save_bab_type_var; }
				
				if save_pup_type_var == -1 || !save_custom_var
                { global.pup_type_var = save_type_var; }
				else { global.pup_type_var = save_pup_type_var; }
				
				if save_flesh_type_var == -1 || !save_custom_var
                { global.flesh_type_var = save_type_var; }
				else { global.flesh_type_var = save_flesh_type_var; }
				
				if save_dl_type_var == -1 || !save_custom_var
                { global.dl_type_var = save_type_var; }
				else { global.dl_type_var = save_dl_type_var; }
				
				if save_taker_type_var == -1 || !save_custom_var
                { global.taker_type_var = save_type_var; }
				else { global.taker_type_var = save_taker_type_var; }
				
				if save_para_type_var == -1 || !save_custom_var
                { global.para_type_var = save_type_var; }
				else { global.para_type_var = save_para_type_var; }
				
				if save_fd_type_var == -1 || !save_custom_var
                { global.fd_type_var = save_type_var; }
				else { global.fd_type_var = save_fd_type_var; }
				
				if save_killer_type_var == -1 || !save_custom_var
                { global.killer_type_var = save_type_var; }
				else { global.killer_type_var = save_killer_type_var; }
				
				if save_mur_type_var == -1 || !save_custom_var
                { global.mur_type_var = save_type_var; }
				else { global.mur_type_var = save_mur_type_var; }
				
				if save_sg_type_var == -1 || !save_custom_var
                { global.sg_type_var = save_type_var; }
				else { global.sg_type_var = save_sg_type_var; }
				
				if save_body_type_var == -1 || !save_custom_var
                { global.body_type_var = save_type_var; }
				else { global.body_type_var = save_body_type_var; }
				
				if save_stem_type_var == -1 || !save_custom_var
                { global.stem_type_var = save_type_var; }
				else { global.stem_type_var = save_stem_type_var; }
				
				if save_patient_type_var == -1 || !save_custom_var
                { global.patient_type_var = save_type_var; }
				else { global.patient_type_var = save_patient_type_var; }
				
				if save_cow_type_var == -1 || !save_custom_var
                { global.cow_type_var = save_type_var; }
				else { global.cow_type_var = save_cow_type_var; }
				
				if save_bekka_type_var == -1 || !save_custom_var
                { global.bekka_type_var = save_type_var; }
				else { global.bekka_type_var = save_bekka_type_var; }
				
				if save_husk_type_var == -1 || !save_custom_var
                { global.husk_type_var = save_type_var; }
				else { global.husk_type_var = save_husk_type_var; }
				
				if save_wc_type_var == -1 || !save_custom_var
                { global.wc_type_var = save_type_var; }
				else { global.wc_type_var = save_wc_type_var; }
				
				if save_clown_type_var == -1 || !save_custom_var
                { global.clown_type_var = save_type_var; }
				else { global.clown_type_var = save_clown_type_var; }
				
				if save_hd_type_var == -1 || !save_custom_var
                { global.hd_type_var = save_type_var; }
				else { global.hd_type_var = save_hd_type_var; }
				
				if save_frenzy_type_var == -1 || !save_custom_var
                { global.frenzy_type_var = save_type_var; }
				else { global.frenzy_type_var = save_frenzy_type_var; }
				
				if save_real_ringu_type_var == -1 || !save_custom_var
                { global.real_ringu_type_var = save_type_var; }
				else { global.real_ringu_type_var = save_real_ringu_type_var; }
				
				if save_tiri_type == -1 || !save_custom_var
                { global.tiri_type_var = save_type; }
				else { global.tiri_type_var = save_tiri_type; }
				
				if save_lisa_type_var == -1 || !save_custom_var
                { global.lisa_type_var = save_type_var; }
				else { global.lisa_type_var = save_lisa_type_var; }
				
				if save_otto_type_var == -1 || !save_custom_var
                { global.otto_type_var = save_type_var; }
				else { global.otto_type_var = save_otto_type_var; }
				
				if save_spooper_type_var == -1 || !save_custom_var
                { global.spooper_type_var = save_type_var; }
				else { global.spooper_type_var = save_spooper_type_var; }
				
				if save_wf_type_var == -1 || !save_custom_var
                { global.wf_type_var = save_type_var; }
				else { global.wf_type_var = save_wf_type_var; }
				
				local.player = instance_create(0,0,global.player_obj);
				local.hud = instance_create(0,0,global.hud_obj);
				local.hud.par_var = local.player;
				local.axe = instance_create(0,0,global.axe_obj);
				local.axe.par_var = local.player;
				fmod_snd_loop_scr(choose(amb_01_snd,amb_02_snd,amb_03_snd,amb_04_snd,amb_05_snd,amb_06_snd,amb_07_snd,amb_08_snd,amb_09_snd,amb_10_snd,amb_11_snd,amb_12_snd));
				global.zone_num_var = irandom(global.zone_len_var+global.story_zone_len_var-1);
				if global.zone_num_var >= global.zone_len_var
				{ global.zone_var = global.story_zone_arr[global.zone_num_var-global.zone_len_var]; }
				else { global.zone_var = global.zone_arr[global.zone_num_var]; }
                tex_scr(-1);
				global.count_var = get_count_scr();
				
				room_goto(save_rm_var);
			}
			break;
		}
    }
");
// Alarm 0
object_event_add
(argument0,ev_alarm,0,"
    state_var += 1;
    y = 0;
    path_y_var = 720;
    path_cloud_y_var = 0;
    event_user(0);
");
// Reset state
object_event_add
(argument0,ev_other,ev_user0,"
    time_var = 0;
    button_state_var = 0;
");
// Draw
object_event_add
(argument0,ev_draw,0,"
    draw_background_stretched(bg_var,0,y,1280,720);
    // draw_background_stretched_ext(light_bg_var,0,y,1280,720,c_white,image_alpha);
    draw_background(cloud_bg_var,x,y+18);
    draw_background(cloud_bg_var,x+background_get_width(cloud_bg_var),y+18);
    switch state_var
    {
        case 0: // Story
        {
            draw_background_stretched(path_bg_var,0,path_y_var,1280,720);
            draw_background_stretched(path_cloud_bg_var,path_cloud_x_var,path_cloud_y_var,720,720);
            draw_background_stretched(path_cloud_bg_var,path_cloud_x_var+720,path_cloud_y_var,720,720);
            draw_background_stretched(path_cloud_bg_var,path_cloud_x_var-720,path_cloud_y_var,720,720);
            // Text
            draw_text_transformed(64,64,skip_str_var,0.3,0.3,0);
            draw_set_halign(fa_center); draw_set_color(c_red);
            draw_text_ext_transformed(640,story_y_var,story_str_var,215,2150,0.4,0.4,0); // 860, 86
            draw_set_halign(fa_left); draw_set_color(c_white);
            break;
        }
        case 1: // Press Confirm
        {
            draw_set_alpha(str_alpha_var); draw_set_halign(fa_center);
            draw_set_color(str_bg_color_var);
            draw_text_transformed(638,602,confirm_str_var,0.75,0.75,0);
            draw_text_transformed(636,604,confirm_str_var,0.75,0.75,0);
            draw_set_color(c_yellow);
            draw_text_transformed(640,600,confirm_str_var,0.75,0.75,0);
            draw_set_color(c_white); draw_set_alpha(1); draw_set_halign(fa_left);
            break;
        }
        case 2: // Main
        {
            draw_sprite(name_spr_var,0,393,name_y_var);
            for (local.i=0; local.i<4; local.i+=1)
            {
                if local.i != button_state_var
                {
                    local.ytmp = 336+(96*local.i);
                    draw_set_color(str_bg_color_var);
                    draw_text_transformed(92,local.ytmp+4,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_text_transformed(94,local.ytmp+2,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_set_color(c_yellow);
                    draw_text_transformed(96,local.ytmp,button_str_arr[state_var,local.i],0.75,0.75,0);
                }
            }
            if button_state_var < 4
            {
                local.xtmp = 96+(string_width(button_str_arr[state_var,button_state_var])*0.375);
                local.ytmp = 336+(96*button_state_var);
                draw_set_halign(fa_center);
				draw_set_color(str_bg_select_color_var);
                draw_text_transformed(local.xtmp-4,local.ytmp+4,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
                draw_text_transformed(local.xtmp-2,local.ytmp+2,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
                draw_set_color(c_white);
                draw_text_transformed(local.xtmp,local.ytmp,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
                draw_set_halign(fa_left); 
            }
            draw_sprite(set_spr_var,button_state_var == 4,1175,534);
            draw_sprite(set_spr_var,button_state_var == 5,1175,630);
            break;
        }
        case 3: // Save Creation
        {
			local.scrolly_var = 0;
			
			draw_background_tiled_ext(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,1,1,make_color_rgb(70,0,90),subbgalpha_var);
			
			draw_set_color(str_bg_color_var);
			draw_text_transformed(706,24,'CREATE SAVE FILE',0.95,0.95,0);
			draw_text_transformed(708,22,'CREATE SAVE FILE',0.95,0.95,0);
			draw_set_color(c_yellow);
			draw_text_transformed(710,20,'CREATE SAVE FILE',0.95,0.95,0);
			draw_set_color(c_white);
			
			local.stat_display_var = '';
			
            for (local.i=0; local.i<7; local.i+=1)
            {
                if local.i != button_state_var
                {
                    local.ytmp = 192+(96*local.i)-(menuscroll_lerp_var);
                    draw_set_color(str_bg_color_var);
                    draw_text_transformed(92,local.ytmp+4,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_text_transformed(94,local.ytmp+2,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_set_color(c_yellow);
                    draw_text_transformed(96,local.ytmp,button_str_arr[state_var,local.i],0.75,0.75,0);
					
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
							switch save_diff_var
							{
                                case 0: { local.stat_display_var = easiest_str_var; break; }
								case 1: { local.stat_display_var = easy_str_var; break; }
								case 2: { local.stat_display_var = normal_str_var; break; }
								case 3: { local.stat_display_var = hard_str_var; break; }
								case 4: { local.stat_display_var = hardest_str_var; break; }
							}
							break;
						}
						case 3:
						{
							switch save_type
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
						default: { local.stat_display_var = ''; }
					}
					
					if local.stat_display_var != ''
					{
						draw_set_color(str_bg_color_var);
						draw_text_transformed(496,local.ytmp+4,string(local.stat_display_var),0.75,0.75,0);
						draw_text_transformed(498,local.ytmp+2,string(local.stat_display_var),0.75,0.75,0);
						draw_set_color(c_yellow);
						draw_text_transformed(500,local.ytmp,string(local.stat_display_var),0.75,0.75,0);
					}
                }
            }
            local.xtmp = 96+(string_width(button_str_arr[state_var,button_state_var])*0.375);
            local.ytmp = 192+(96*button_state_var)-(menuscroll_lerp_var);
            draw_set_halign(fa_center); draw_set_color(str_bg_select_color_var);
            draw_text_transformed(local.xtmp-4,local.ytmp+4,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_text_transformed(local.xtmp-2,local.ytmp+2,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_set_color(c_white);
            draw_text_transformed(local.xtmp,local.ytmp,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_set_halign(fa_left); 
			
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
                    switch save_diff_var
                    {
                        case 0: { local.stat_display_var = easiest_str_var; break; }
                        case 1: { local.stat_display_var = easy_str_var; break; }
                        case 2: { local.stat_display_var = normal_str_var; break; }
                        case 3: { local.stat_display_var = hard_str_var; break; }
                        case 4: { local.stat_display_var = hardest_str_var; break; }
                    }
                    break;
                }
                case 3:
                {
                    switch save_type
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
                default: { local.stat_display_var = ''; }
			}
			
			if local.stat_display_var != ''
			{
				draw_set_color(str_bg_select_color_var);
				draw_text_transformed(496,local.ytmp+4,string(local.stat_display_var),0.75,0.75,0);
				draw_text_transformed(498,local.ytmp+2,string(local.stat_display_var),0.75,0.75,0);
				draw_set_color(c_white);
				draw_text_transformed(500,local.ytmp,string(local.stat_display_var),0.75,0.75,0);
			}
			
			break;
        }
        case 4: // Customize
        {
            local.scrolly_var = 0;
			
			draw_background_tiled_ext(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,1,1,make_color_rgb(70,0,90),subbgalpha_var);
			
			draw_set_color(str_bg_color_var);
			draw_text_transformed(706,24,'CUSTOMIZE SAVE FILE',0.95,0.95,0);
			draw_text_transformed(708,22,'CUSTOMIZE SAVE FILE',0.95,0.95,0);
			draw_set_color(c_yellow);
			draw_text_transformed(710,20,'CUSTOMIZE SAVE FILE',0.95,0.95,0);
			draw_set_color(c_white);
			
			local.stat_display_var = '';
			
            for (local.i=0; local.i<21; local.i+=1)
            {
                if local.i != button_state_var
                {
                    local.ytmp = 192+(96*local.i)-(menuscroll_lerp_var);
                    draw_set_color(str_bg_color_var);
                    draw_text_transformed(92,local.ytmp+4,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_text_transformed(94,local.ytmp+2,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_set_color(c_yellow);
                    draw_text_transformed(96,local.ytmp,button_str_arr[state_var,local.i],0.75,0.75,0);
					
					switch local.i
					{
                        case 0:
                        {
                            switch save_crouch_var
                            {
                                case -1: { local.stat_display_var = def_str_var; break; }
                                case 0: { local.stat_display_var = off_str_var; break; }
                                case 1: { local.stat_display_var = on_str_var; break; }
                            }
                            break;
                        }
						case 1:
						{	
							switch save_jump_var
                            {
                                case -1: { local.stat_display_var = def_str_var; break; }
                                case 0: { local.stat_display_var = off_str_var; break; }
                                case 1: { local.stat_display_var = on_str_var; break; }
                            }
							break;
						}
                        case 2:
						{	
							switch save_stam_per_var
                            {
                                case -1: { local.stat_display_var = def_str_var; break; }
                                case 0: { local.stat_display_var = off_str_var; break; }
                                case 1: { local.stat_display_var = on_str_var; break; }
                            }
							break;
						}
                        case 3:
						{	
							switch save_fall_var
                            {
                                case -1: { local.stat_display_var = def_str_var; break; }
                                case 0: { local.stat_display_var = off_str_var; break; }
                                case 1: { local.stat_display_var = on_str_var; break; }
                            }
							break;
						}
                        case 4:
						{	
							switch save_lock_var
                            {
                                case -1: { local.stat_display_var = def_str_var; break; }
                                case 0: { local.stat_display_var = off_str_var; break; }
                                case 1: { local.stat_display_var = on_str_var; break; }
                                case 2: { local.stat_display_var = alone_str_var; break; }
                                case 3: { local.stat_display_var = evil_str_var; break; }
                            }
							break;
						}
                        case 5:
						{	
							switch save_dmg_shake_var
                            {
                                case -1: { local.stat_display_var = def_str_var; break; }
                                case 0: { local.stat_display_var = off_str_var; break; }
                                case 1: { local.stat_display_var = on_str_var; break; }
                            }
							break;
						}
                        case 6:
                        {
                            if local.i != 6 { show_error('WTF?',true); }
                            switch save_mult_type_var
                            {
                                case -1: { local.stat_display_var = def_str_var; break; }
                                case 0: { local.stat_display_var = max_str_var; break; }
                                case 1: { local.stat_display_var = min_str_var; break; }
                                case 2: { local.stat_display_var = taper_str_var; break; }
                                case 3: { local.stat_display_var = always_str_var; break; }
                            }
                            break;
                        }
                        case 7:
                        {
                            switch save_mult_min_var
                            {
                                case -2: { local.stat_display_var = inf_str_var; break; }
                                case -1: { local.stat_display_var = def_str_var; break; }
                                default: { local.stat_display_var = string(save_mult_min_var); break; }
                            }
                            break;
                        }
                        case 8:
                        {
                            switch save_mult_max_var
                            {
                                case -2: { local.stat_display_var = inf_str_var; break; }
                                case -1: { local.stat_display_var = def_str_var; break; }
                                default: { local.stat_display_var = string(save_mult_max_var); break; }
                            }
                            break;
                        }
                        case 9:
                        {
                            if save_mult_start_var == -1 { local.stat_display_var = def_str_var; }
                            else { local.stat_display_var = string(save_mult_start_var);}
                            break;
                        }
                        case 10:
                        {
                            if save_mult_end_var == -1 { local.stat_display_var = def_str_var; }
                            else { local.stat_display_var = string(save_mult_end_var);}
                            break;
                        }
                        case 11:
                        {
                            if local.i != 11 { show_error('WTF?',true); }
                            switch save_count_type_var
                            {
                                case -1: { local.stat_display_var = def_str_var; break; }
                                case 0: { local.stat_display_var = rand_str_var; break; }
                                case 1: { local.stat_display_var = max_str_var; break; }
                                case 2: { local.stat_display_var = min_str_var; break; }
                                case 3: { local.stat_display_var = taper_str_var+' '+rand_str_var; break; }
                                case 4: { local.stat_display_var = taper_str_var; break; }
                            }
                            break;
                        }
                        case 12:
                        {
                            if save_count_min_var == -1 { local.stat_display_var = def_str_var; }
                            else { local.stat_display_var = string(save_count_min_var);}
                            break;
                        }
                        case 13:
                        {
                            if save_count_max_var == -1 { local.stat_display_var = def_str_var; }
                            else { local.stat_display_var = string(save_count_max_var);}
                            break;
                        }
                        case 14:
                        {
                            if save_count_start_var == -1 { local.stat_display_var = def_str_var; }
                            else { local.stat_display_var = string(save_count_start_var);}
                            break;
                        }
                        case 15:
                        {
                            if save_count_end_var == -1 { local.stat_display_var = def_str_var; }
                            else { local.stat_display_var = string(save_count_end_var); }
                            break;
                        }
                        case 16:
                        {
                            switch save_dupe_var
                            {
                                case -1: { local.stat_display_var = def_str_var; break; }
                                case dupe_never_const: { local.stat_display_var = never_str_var; break; }
                                case dupe_always_const: { local.stat_display_var = always_str_var; break; }
                                case dupe_canon_const: { local.stat_display_var = canon_str_var; break; }
                            }
                            break;
                        }
                        case 17:
                        {
                            if save_chance_var == -1 { local.stat_display_var = def_str_var; }
                            else { local.stat_display_var = string(save_chance_var); }
                            break;
                        }
                        case 18:
                        {
                            if save_chance_mult_var == -1 { local.stat_display_var = def_str_var; }
                            else { local.stat_display_var = string(save_chance_mult_var); }
                            break;
                        }
						default: { local.stat_display_var = ''; break; }
					}
					
					if local.stat_display_var != ''
					{
						draw_set_color(str_bg_color_var);
						draw_text_transformed(496,local.ytmp+4,string(local.stat_display_var),0.75,0.75,0);
						draw_text_transformed(498,local.ytmp+2,string(local.stat_display_var),0.75,0.75,0);
						draw_set_color(c_yellow);
						draw_text_transformed(500,local.ytmp,string(local.stat_display_var),0.75,0.75,0);
					}
                }
            }
            local.xtmp = 96+(string_width(button_str_arr[state_var,button_state_var])*0.375);
            local.ytmp = 192+(96*button_state_var)-(menuscroll_lerp_var);
            draw_set_halign(fa_center); draw_set_color(str_bg_select_color_var);
            draw_text_transformed(local.xtmp-4,local.ytmp+4,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_text_transformed(local.xtmp-2,local.ytmp+2,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_set_color(c_white);
            draw_text_transformed(local.xtmp,local.ytmp,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_set_halign(fa_left); 
			
			switch button_state_var
			{
                case 0:
                {
                    switch save_crouch_var
                    {
                        case -1: { local.stat_display_var = def_str_var; break; }
                        case 0: { local.stat_display_var = off_str_var; break; }
                        case 1: { local.stat_display_var = on_str_var; break; }
                    }
                    break;
                }
                case 1:
                {	
                    switch save_jump_var
                    {
                        case -1: { local.stat_display_var = def_str_var; break; }
                        case 0: { local.stat_display_var = off_str_var; break; }
                        case 1: { local.stat_display_var = on_str_var; break; }
                    }
                    break;
                }
                case 2:
                {	
                    switch save_stam_per_var
                    {
                        case -1: { local.stat_display_var = def_str_var; break; }
                        case 0: { local.stat_display_var = off_str_var; break; }
                        case 1: { local.stat_display_var = on_str_var; break; }
                    }
                    break;
                }
                case 3:
                {	
                    switch save_fall_var
                    {
                        case -1: { local.stat_display_var = def_str_var; break; }
                        case 0: { local.stat_display_var = off_str_var; break; }
                        case 1: { local.stat_display_var = on_str_var; break; }
                    }
                    break;
                }
                case 4:
                {	
                    switch save_lock_var
                    {
                        case -1: { local.stat_display_var = def_str_var; break; }
                        case 0: { local.stat_display_var = off_str_var; break; }
                        case 1: { local.stat_display_var = on_str_var; break; }
                        case 2: { local.stat_display_var = alone_str_var; break; }
                        case 3: { local.stat_display_var = evil_str_var; break; }
                    }
                    break;
                }
                case 5:
                {	
                    switch save_dmg_shake_var
                    {
                        case -1: { local.stat_display_var = def_str_var; break; }
                        case 0: { local.stat_display_var = off_str_var; break; }
                        case 1: { local.stat_display_var = on_str_var; break; }
                    }
                    break;
                }
                case 6:
                {
                    switch save_mult_type_var
                    {
                        case -1: { local.stat_display_var = def_str_var; break; }
                        case 0: { local.stat_display_var = max_str_var; break; }
                        case 1: { local.stat_display_var = min_str_var; break; }
                        case 2: { local.stat_display_var = taper_str_var; break; }
                        case 3: { local.stat_display_var = always_str_var; break; }
                    }
                    break;
                }
                case 7:
                {
                    switch save_mult_min_var
                    {
                        case -2: { local.stat_display_var = inf_str_var; break; }
                        case -1: { local.stat_display_var = def_str_var; break; }
                        default: { local.stat_display_var = string(save_mult_min_var); break; }
                    }
                    break;
                }
                case 8:
                {
                    switch save_mult_max_var
                    {
                        case -2: { local.stat_display_var = inf_str_var; break; }
                        case -1: { local.stat_display_var = def_str_var; break; }
                        default: { local.stat_display_var = string(save_mult_max_var); break; }
                    }
                    break;
                }
                case 9:
                {
                    if save_mult_start_var == -1 { local.stat_display_var = def_str_var; }
                    else { local.stat_display_var = string(save_mult_start_var);}
                    break;
                }
                case 10:
                {
                    if save_mult_end_var == -1 { local.stat_display_var = def_str_var; }
                    else { local.stat_display_var = string(save_mult_end_var);}
                    break;
                }
                case 11:
                {
                    switch save_count_type_var
                    {
                        case -1: { local.stat_display_var = def_str_var; break; }
                        case 0: { local.stat_display_var = rand_str_var; break; }
                        case 1: { local.stat_display_var = max_str_var; break; }
                        case 2: { local.stat_display_var = min_str_var; break; }
                        case 3: { local.stat_display_var = taper_str_var+' '+rand_str_var; break; }
                        case 4: { local.stat_display_var = taper_str_var; break; }
                    }
                    break;
                }
                case 12:
                {
                    if save_count_min_var == -1 { local.stat_display_var = def_str_var; }
                    else { local.stat_display_var = string(save_count_min_var); }
                    break;
                }
                case 13:
                {
                    if save_count_max_var == -1 { local.stat_display_var = def_str_var; }
                    else { local.stat_display_var = string(save_count_max_var); }
                    break;
                }
                case 14:
                {
                    if save_count_start_var == -1 { local.stat_display_var = def_str_var; }
                    else { local.stat_display_var = string(save_count_start_var); }
                    break;
                }
                case 15:
                {
                    if save_count_end_var == -1 { local.stat_display_var = def_str_var; }
                    else { local.stat_display_var = string(save_count_end_var); }
                    break;
                }
                case 16:
                {
                    switch save_dupe_var
                    {
                        case -1: { local.stat_display_var = def_str_var; break; }
                        case dupe_never_const: { local.stat_display_var = never_str_var; break; }
                        case dupe_always_const: { local.stat_display_var = always_str_var; break; }
                        case dupe_canon_const: { local.stat_display_var = canon_str_var; break; }
                    }
                    break;
                }
                case 17:
                {
                    if save_chance_var == -1 { local.stat_display_var = def_str_var; }
                    else { local.stat_display_var = string(save_chance_var); }
                    break;
                }
                case 18:
                {
                    if save_chance_mult_var == -1 { local.stat_display_var = def_str_var; }
                    else { local.stat_display_var = string(save_chance_mult_var); }
                    break;
                }
                default: { local.stat_display_var = ''; break; }
			}
			
			if local.stat_display_var != ''
			{
				draw_set_color(str_bg_select_color_var);
				draw_text_transformed(496,local.ytmp+4,string(local.stat_display_var),0.75,0.75,0);
				draw_text_transformed(498,local.ytmp+2,string(local.stat_display_var),0.75,0.75,0);
				draw_set_color(c_white);
				draw_text_transformed(500,local.ytmp,string(local.stat_display_var),0.75,0.75,0);
			}

            break;
        }
		case 6: // Save Loads
        {			
			draw_background_tiled_ext(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,1,1,make_color_rgb(70,0,90),subbgalpha_var);
			
			draw_set_color(str_bg_color_var);
			draw_text_transformed(756,24,'LOAD SAVE FILE',0.95,0.95,0);
			draw_text_transformed(758,22,'LOAD SAVE FILE',0.95,0.95,0);
			draw_set_color(c_yellow);
			draw_text_transformed(760,20,'LOAD SAVE FILE',0.95,0.95,0);
			
			
			local.stat_display_var = '';
			
			if button_state_var != 0
			{
				draw_set_halign(fa_right);
				draw_text_transformed(1232,125,'ROOM:'+string(save_rm_count_var),0.6,0.6,0);
				
				switch save_mode_var
				{
					case 0:
					{
						local.stat_display_var = 'STORY';
						break;
					}
					case 1:
					{
						local.stat_display_var = 'ENDLESS';
						break;
					}
					case 2:
					{
						local.stat_display_var = 'SANBOX';
						break;
					}
				}
				
				draw_text_transformed(1232,200,'MODE:'+string(local.stat_display_var),0.6,0.6,0);
				
                switch save_type_var
                {
                    case 1: { local.stat_display_var = 'OG'; }
                    case 2: { local.stat_display_var = 'HD'; }
                    default:
                    {
                        switch save_diff_var
                        {
                            case 0:
                            {
                                local.stat_display_var = 'EASIEST';
                                break;
                            }
                            case 1:
                            {
                                local.stat_display_var = 'EASY';
                                break;
                            }
                            case 2:
                            {
                                local.stat_display_var = 'NORMAL';
                                break;
                            }
                            case 3:
                            {
                                local.stat_display_var = 'HARD';
                                break;
                            }
                            case 4:
                            {
                                local.stat_display_var = 'HARDEST';
                                break;
                            }
                        }
                        break;
                    }
                }
				draw_text_transformed(1232,275,'DIFFICULTY:'+string(local.stat_display_var),0.6,0.6,0);
				
				switch save_type
				{
					case 0:
					{
						local.stat_display_var = 'RECODE';
						break;
					}
					case 1:
					{
						local.stat_display_var = 'OG';
						break;
					}
					case 2:
					{
						local.stat_display_var = 'HD';
						break;
					}
				}
				
				draw_text_transformed(1232,350,'BEHAVIOR:'+string(local.stat_display_var),0.6,0.6,0);
				
				switch save_custom_var
				{
					case 0:
					{
						local.stat_display_var = 'NO';
						break;
					}
					case 1:
					{
						local.stat_display_var = 'YES';
						break;
					}
				}
				
				draw_text_transformed(1232,425,'CUSTOM:'+string(local.stat_display_var),0.6,0.6,0);
				
				draw_set_halign(fa_left);
			}
			
			draw_set_color(c_white);
			draw_set_alpha(0.5);
			
			draw_text_transformed(855,690,'PRESS BACKSPACE TO DELETE A SAVE FILE',0.3,0.3,0);
			
			draw_set_alpha(1);
			
			for (local.i=0; local.i<(1+ds_list_size(global.save_list)); local.i+=1)
            {
                if local.i != button_state_var
                {
                    local.ytmp = 192+(96*local.i)-(menuscroll_lerp_var);
                    draw_set_color(str_bg_color_var);
                    draw_text_transformed(92,local.ytmp+4,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_text_transformed(94,local.ytmp+2,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_set_color(c_yellow);
                    draw_text_transformed(96,local.ytmp,button_str_arr[state_var,local.i],0.75,0.75,0);
				}
			}
			
			local.xtmp = 96+(string_width(button_str_arr[state_var,button_state_var])*0.375);
            local.ytmp = 192+(96*button_state_var)-(menuscroll_lerp_var);
            draw_set_halign(fa_center); draw_set_color(str_bg_select_color_var);
            draw_text_transformed(local.xtmp-4,local.ytmp+4,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_text_transformed(local.xtmp-2,local.ytmp+2,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_set_color(c_white);
            draw_text_transformed(local.xtmp,local.ytmp,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_set_halign(fa_left); 
			
			break;
		}
		case 12: // Name Entry
        {
			draw_background_tiled_ext(sub_bg_arr[sub_bg_var],0,subbgscroll_var*-1,1,1,make_color_rgb(70,0,90),subbgalpha_var);
			
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(340,330,940,420,0);
			draw_set_color(c_white);
			draw_set_alpha(1);
			
			draw_set_halign(fa_center);
			draw_set_color(str_bg_color_var);
			draw_text_transformed(636,24,'ENTER NAME',1,1,0);
			draw_text_transformed(638,22,'ENTER NAME',1,1,0);
			draw_set_color(c_yellow);
			draw_text_transformed(640,20,'ENTER NAME',1,1,0);
			draw_set_color(c_white);
			draw_text_transformed(640,120,'PRESS ESC TO CANCEL',0.5,0.5,0);
			
			draw_text_transformed(640,350,keyboard_string,0.75,0.75,0);
			
			draw_set_alpha(0.5);
			
			draw_text_transformed(640,600,'WARNING: CHOOSING AN EXISTING SAVE NAME
			WILL OVERWRITE THAT FILE.',0.3,0.3,0);
			
			draw_set_alpha(1);
			
			draw_set_halign(fa_left);
			
			break;
		}
    }
");