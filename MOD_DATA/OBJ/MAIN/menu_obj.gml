// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,noone);
object_set_persistent(argument0,true);
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
        0: Mode (Story, Endless, Sandbox, Modded?)
        1: Difficulty (Easiest?, Easy, Normal, Hard, Hardest)
        2: Behavior (Recode, OG, HD, Modded?)
        3: Custom
        4: Customize (Grayed out if not custom)
        5: Back
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
    bg_var = background_add(vanilla_directory_const+'\DATA\TEX\menu\menu_tex.png',false,false);
    cloud_bg_var = background_add(vanilla_directory_const+'\DATA\TEX\menu\menu_tex.png',false,false);
    light_01_bg_var = background_add(vanilla_directory_const+'\DATA\TEX\menu\menu_tex.png',false,false);
    light_02_bg_var = background_add(vanilla_directory_const+'\DATA\TEX\menu\menu_tex.png',false,false);
    path_bg_var = background_add(vanilla_directory_const+'\DATA\TEX\menu\menu_tex.png',false,false);
    path_cloud_bg_var = background_add(vanilla_directory_const+'\DATA\TEX\menu\menu_tex.png',false,false);
    alarm_len_var = 1;
    alarm_arr[0,2] = '';
    set_alarm_scr(0,3000);
    image_alpha = 0;
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    x -= global.delta_time_var;
    if state_var == 0
    {
        y = lerp_scr(1440,0,alarm_arr[0,0]/alarm_arr[0,1]);
        path_y_var = lerp_scr(720,-720,alarm_arr[0,0]/alarm_arr[0,1]);
        path_cloud_y_var = lerp_scr(720,0,alarm_arr[0,0]/alarm_arr[0,1]);
        path_cloud_x_var += global.delta_time_var;
    }
    else
    {
        
    }
");
// Alarm 0
object_event_add
(argument0,ev_alarm,0,"
    state_var += 1;
    y = 0;
");
// Draw
object_event_add
(argument0,ev_draw,0,"
    draw_background_stretched(bg_var,0,y,1280,720);
    draw_background_stretched_ext(light_bg_var,0,MENU_SCROLL_Y-720,1280,720,c_white,image_alpha);
    draw_background(cloud_bg_var,x,y+18);
    draw_background(cloud_bg_var,x-background_get_width(cloud_bg_var),y+18);
");
