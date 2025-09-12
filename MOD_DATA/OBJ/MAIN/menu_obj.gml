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
    // Sprites
    set_spr_var = sprite_add(main_directory_const+'\SPR\UI\settings_spr.png',2,false,false,0,0);
    sprite_set_offset(set_spr_var,sprite_get_width(set_spr_var)/2,sprite_get_height(set_spr_var)/2);
    if !irandom(7)
    { local.path = vanilla_directory_const+'\TEX\menu\'+choose('name_uhh_spr2','name_uhh_spr3','name_uhh_spr4')+'.png' }
    else { local.path = vanilla_directory_const+'\TEX\menu\name_uhh_spr.png' }
    name_spr_var = sprite_add(local.path,1,false,false,0,0);
    sprite_set_offset(name_spr_var,sprite_get_width(name_spr_var)/2,sprite_get_height(name_spr_var)/2);
    name_y_var = 180;
    // Text
    skip_str_var = 'Press Confirm to Skip.'; // Maybe get a string of the key?
    confirm_str_var = 'PRESS CONFIRM';
    story_str_var = 'For as long as you can remember, legends have been told about the derelict mansion upon the hill that casts a blanket of darkness over the town. The history of the house itself is virtually unknown, and even the towns oldest residents cannot remember the mansions origin. Being an avid history enthusiast, you embark up the mountain to visit the manor. Hoping to shed some light on the backstory of this crumbling fortress of darkness.';
    str_bg_color_var = make_color_rgb(57,0,91);
    str_bg_select_color_var = make_color_rgb(138,0,0);
    // Button Text
        // Main
    button_str_arr[2,0] = 'NEW GAME';
    button_str_arr[2,1] = 'LOAD GAME';
    button_str_arr[2,2] = 'SCORES';
    button_str_arr[2,3] = 'EXIT';
    button_str_arr[2,4] = 'SETTINGS';
    button_str_arr[2,5] = 'CONFIG';
        // Save Creation
    button_str_arr[3,0] = 'PLAY';
    button_str_arr[3,1] = 'MODE';
    button_str_arr[3,2] = 'DIFFICULTY';
    button_str_arr[3,3] = 'BEHAVIOR';
    button_str_arr[3,4] = 'CUSTOM';
    button_str_arr[3,5] = 'CUSTOMIZE';
    button_str_arr[3,6] = 'BACK';
        // Ditto (Customize)
    button_str_arr[4,0] = 'CROUCH';
    button_str_arr[4,1] = 'JUMP';
    button_str_arr[4,2] = 'STAMINA';
    button_str_arr[4,3] = 'FALL';
    button_str_arr[4,4] = 'LOCK';
    button_str_arr[4,5] = 'DAMAGE SHAKE';
    button_str_arr[4,6] = 'MULTICHASE TYPE';
    button_str_arr[4,7] = 'MULTICHASE MIN';
    button_str_arr[4,8] = 'MULTICHASE MAX';
    button_str_arr[4,9] = 'MULTICHASE START';
    button_str_arr[4,10] = 'MULTICHASE END';
    button_str_arr[4,11] = 'COUNT TYPE';
    button_str_arr[4,12] = 'COUNT MIN';
    button_str_arr[4,13] = 'COUNT MAX';
    button_str_arr[4,14] = 'COUNT START';
    button_str_arr[4,15] = 'COUNT END';
    button_str_arr[4,16] = 'BEHAVIOR';
        // Behavior
    button_str_arr[5,0] = 'PLAYER';
    button_str_arr[5,1] = 'AXE';
    button_str_arr[5,2] = 'GEL';
    button_str_arr[5,3] = 'BUG';
    button_str_arr[5,4] = 'RINGU';
    button_str_arr[5,5] = 'BAB';
    button_str_arr[5,6] = 'PUPPET';
    button_str_arr[5,7] = 'FLESH';
    button_str_arr[5,8] = 'DEER LORD';
    button_str_arr[5,9] = 'TAKER';
    button_str_arr[5,10] = 'PARASITE';
    button_str_arr[5,11] = 'FOOD DEMON';
    button_str_arr[5,12] = 'KILLER';
    button_str_arr[5,13] = 'MERMAID';
    button_str_arr[5,14] = 'SECURITY GUARD';
    button_str_arr[5,15] = 'BODY BAG';
    button_str_arr[5,16] = 'STEM';
    button_str_arr[5,17] = 'PATIENT';
    button_str_arr[5,18] = 'GHOST COW';
    button_str_arr[5,19] = 'BEKKA';
    button_str_arr[5,20] = 'HUSKS';
    button_str_arr[5,21] = 'WOORMY CHARLES';
    button_str_arr[5,22] = 'CLOWN';
    button_str_arr[5,23] = 'HOOKED DOLL';
    button_str_arr[5,24] = 'FRENZY';
    button_str_arr[5,25] = 'REAL RINGU';
    button_str_arr[5,26] = 'TIRSIAK';
    button_str_arr[5,27] = 'LISA';
    button_str_arr[5,28] = 'OTTO';
    button_str_arr[5,29] = 'SPOOPER';
    button_str_arr[5,30] = 'WHITE FACE';
        // Other
    on_str_var = 'ON';
    off_str_var = 'OFF';
    true_str_var = 'TRUE';
    false_str_var = 'FALSE';
    const_str_var = 'CONSTANT';
    taper_str_var = 'TAPER';
    mod_str_var = 'RECODE';
    og_str_var = 'ORIGINAL';
    hd_str_var = 'RENOVATION';
    kh_str_var = 'KARAMARI';
    dh_str_var = 'DOLLHOUSE';
    alt_str_var = 'ALTERNATE';
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
            name_y_var = 180+(sin(2*time_var*pi/160)*24)
            if global.confirm_input_press_var
            {
                switch button_state_var
                {
                    case 0: { state_var = 3; event_user(0); break; }
                    case 1: { state_var = 6; event_user(0); break; }
                    case 2:
                    {
                        highscore_show_ext(-1,menu_score_bg,true,c_yellow,c_purple,'Lunchtime Doubly So',16);
                        global.last_time_var = current_time;
                        break;
                    }
                    case 3: { game_end(); break; }
                    case 4: { state_var = 7; event_user(0); break; }
                    case 5: { state_var = 9; event_user(0); break; }
                }
            }
            break;
        }
        case 3:
        {
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
                        instance_create(0,0,global.player_obj);
                        instance_create(0,0,global.hud_obj);
                        caster_loop(choose(amb_01_snd,amb_02_snd,amb_03_snd,amb_04_snd,amb_05_snd,amb_06_snd,amb_07_snd,amb_08_snd,amb_09_snd,amb_10_snd,amb_11_snd,amb_12_snd),global.vol_var,1);
                        room_goto(hall_01_rm);
                    }
                    // Back
                    case 6: { state_var = 2; event_user(0); break; }
                }
            }
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
                draw_set_halign(fa_center); draw_set_color(str_bg_select_color_var);
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
            // Temporary, I just need to be able to see. This is where you come in, Bird
            for (local.i=0; local.i<7; local.i+=1)
            {
                if local.i != button_state_var
                {
                    local.ytmp = 96+(96*local.i);
                    draw_set_color(str_bg_color_var);
                    draw_text_transformed(92,local.ytmp+4,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_text_transformed(94,local.ytmp+2,button_str_arr[state_var,local.i],0.75,0.75,0);
                    draw_set_color(c_yellow);
                    draw_text_transformed(96,local.ytmp,button_str_arr[state_var,local.i],0.75,0.75,0);
                }
            }
            local.xtmp = 96+(string_width(button_str_arr[state_var,button_state_var])*0.375);
            local.ytmp = 96+(96*button_state_var);
            draw_set_halign(fa_center); draw_set_color(str_bg_select_color_var);
            draw_text_transformed(local.xtmp-4,local.ytmp+4,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_text_transformed(local.xtmp-2,local.ytmp+2,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_set_color(c_white);
            draw_text_transformed(local.xtmp,local.ytmp,button_str_arr[state_var,button_state_var],str_scale_var,0.75,0);
            draw_set_halign(fa_left); 
        }
    }
");
