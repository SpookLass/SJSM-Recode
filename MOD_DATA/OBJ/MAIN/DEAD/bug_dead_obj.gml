// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
Static Rendered at 4x scale
Black bar is 360 pixels, centered
Text is about 60 pixels tall
*/
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    true_time_var = true;
    // Translate
    str_len_var = 5;
    ini_open("lang_"+global.lang_var+".ini");
    for (local.i=0; local.i<str_len_var; local.i+=1;)
    {
        local.num = string(local.i+1);
        if string_length(local.num) < 2 { local.num = "0"+local.num; }
        str_var[local.i] = ini_read_string("DEAD","bug_"+local.num,"DEAD_bug_"+local.num);
        str_len_arr_var[local.i] = 0;
        local.lastindex = 1;
        for (local.j=1; local.j<=string_length(str_var[local.i]); local.j+=1;)
        {
            if string_char_at(str_var[local.i],local.j) == " " || local.j == string_length(str_var[local.i])
            {
                str_arr_var[local.i,str_len_arr_var[local.i]] = string_copy(str_var[local.i],local.lastindex,local.j-local.lastindex+1);
                str_len_arr_var[local.i] += 1;
                local.lastindex = local.j+1;
            }
        }
    }
    ini_close();
    // String
    str_var = "";
    str_alarm_var = 18;
    str_flash_alarm_var = 12;
    str_delay_alarm_var = 30;
    str_state_var = 0;
    delay_alarm_var = 180;
    // Sprite
    spr_var = static_01_spr;
    spr_id_var = irandom(sprite_get_number(static_01_spr)-1);
    if global.reduce_flash_var { spr_spd_var = 0;}
    else { spr_spd_var = 0.25; }
    // Sound
    snd_var = load_par_obj.snd_arr_var[0,0];
    inst_var = noone;
    // State
    state_len_var = str_len_var+3;
    state_var = 0;
    draw_state_var = 0;
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,600);
    // Stuff
    cam_fov_var = 50;
    cam_control_var = false;
    color_var = make_color_rgb(53,53,53);
    // Type
    if global.bug_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.bug_type_var; }
    switch local.type
    {
        case 0:
        {
            cam_fov_var = global.fov_var;
            cam_control_var = true;
            color_var = make_color_rgb(97,97,106);
            break;
        }
    }
    // Camera
    with instance_create(327.5733,250.56,cam_dead_obj)
    {
        control_var = other.cam_control_var;
        fov_var = other.cam_fov_var;
        h_var = 6.4;
        yaw_var = 16.9317; // 73.0683
        pitch_var = 17.6956;
        roll_var = 289.6053;
        yaw_clamp_var = true;
        yaw_clamp_min_var = yaw_var-45;
        yaw_clamp_max_var = yaw_var+45;
        pitch_clamp_var = 45;
    }
    // Fade in
    with instance_create(0,0,fade_eff_obj)
    {
        image_blend = c_black;
        set_alarm_scr(0,600);
    }
    // Bugs
        bug_len_var = 3;
        bug_id_var = 0;
        // Baby 1
            with instance_create(517.44,273.3867,bug_dead_3d_obj)
            {
                other.bug_arr_var[0] = id;
                z = 28.8;
                path_len_var = 7; // 13
                // A
                    path_var[0,0] = 517.44;
                    path_var[0,1] = 273.3867; // 273.38r6
                    path_var[0,2] = 28.8;
                // B
                    path_var[1,0] = 476.7253; // 476.725r3
                    path_var[1,1] = 272.4373; // 272.437r3
                    path_var[1,2] = 20.128;
                // Handle A
                    /*path_var[2,0] = 495.7333; // 495.7r3
                    path_var[2,1] = 274.8267; // 274.82r6
                    path_var[2,2] = 25.376;*/
                // C
                    path_var[2,0] = 456.576;
                    path_var[2,1] = 270.3467; // 270.34r6
                    path_var[2,2] = 10.5067; // 10.50r6
                // Handle B
                    /*path_var[4,0] = 474.336;
                    path_var[4,1] = 271.4133; // 271.41r3
                    path_var[4,2] = 8.928;*/
                // D
                    path_var[3,0] = 448.7253; // 448.725r3
                    path_var[3,1] = 268.3733; // 268.37r3
                    path_var[3,2] = 0;
                // Handle C
                    /*path_var[6,0] = 444.6293; // 444.629r3
                    path_var[6,1] = 268.32;
                    path_var[6,2] = 0;*/
                // E
                    path_var[4,0] = 420.2667; // 420.2r6
                    path_var[4,1] = 236.48;
                    path_var[4,2] = 0;
                // Handle D
                    /*path_var[8,0] = 420.928;
                    path_var[8,1] = 266.3253; // 266.325r3
                    path_var[8,2] = 0;*/
                // F
                    path_var[5,0] = 381.3333; // 381.r3
                    path_var[5,1] = 199.4667; // 199.4r6
                    path_var[5,2] = 0;
                // Handle E
                    /*path_var[10,0] = 413.8667; // 413.8r6
                    path_var[10,1] = 196.6933; // 196.69r3
                    path_var[10,2] = 0;*/
                // G
                    path_var[6,0] = 361.0667; // 361.0r6
                    path_var[6,1] = 228.2667; // 228.2r6
                    path_var[6,2] = 0;
                // Handle F
                    /*path_var[12,0] = 365.8667; // 365.8r6
                    path_var[12,1] = 204.8;
                    path_var[12,2] = 0;*/
                yaw_var = 180;
                event_user(0);
            }
        // Baby 2
            with instance_create(462.2933,241.3867,bug_dead_3d_obj)
            {
                other.bug_arr_var[1] = id;
                z = 104.4267;
                path_len_var = 5; // 9
                // A
                    path_var[0,0] = 462.2933; // 462.29r3
                    path_var[0,1] = 241.3867; // 241.38r6
                    path_var[0,2] = 104.4267; // 104.42r6
                // B
                    path_var[1,0] = 467.4133; // 467.41r3
                    path_var[1,1] = 240.7467; // 240.74r6
                    path_var[1,2] = 61.9733; // 61.97r3
                // Handle A
                    /*path_var[2,0] = 471.7867; // 471.78r6
                    path_var[2,1] = 241.6;
                    path_var[2,2] = 79.8933; // 79.89r3*/
                // C
                    path_var[2,0] = 461.44;
                    path_var[2,1] = 245.9733; // 245.97r3
                    path_var[2,2] = 0.5333; // 0.5r3
                // Handle B
                    /*path_var[4,0] = 476.8;
                    path_var[4,1] = 234.0267; // 234.02r6
                    path_var[4,2] = -1.8133; // -1.81r3*/
                // D
                    path_var[3,0] = 389.8667; // 389.8r6
                    path_var[3,1] = 274.3467; // 274.34r6
                    path_var[3,2] = 0;
                // Handle C
                    /*path_var[6,0] = 410.7733; // 410.77r3
                    path_var[6,1] = 296.64;
                    path_var[6,2] = 0;*/
                // E
                    path_var[4,0] = 360.32;
                    path_var[4,1] = 256.4267; // 256.42r6
                    path_var[4,2] = 0;
                // Handle D
                    /*path_var[8,0] = 373.408;
                    path_var[8,1] = 241.0667; // 241.0r6
                    path_var[8,2] = 0;*/
                pitch_var = -90;
                event_user(0);
            }
        // Mama
            with instance_create(401.2267,207.584,bug_dead_3d_obj)
            {
                other.bug_arr_var[2] = id;
                z = 121.792;
                path_len_var = 10; // 19
                // A
                    path_var[0,0] = 401.2267; // 401.22r6
                    path_var[0,1] = 207.584; // This makes no sense... uh oh
                    path_var[0,2] = 121.792;
                // B
                    path_var[1,0] = 401.09867; // 401.098r6
                    path_var[1,1] = 210.2827; // 210.282r6
                    path_var[1,2] = 53.12;
                // Handle A
                    /*path_var[2,0] = 406.432;
                    path_var[2,1] = 207.744;
                    path_var[2,2] = 57.5893; // 57.589r3*/
                // C
                    path_var[2,0] = 403.2;
                    path_var[2,1] = 232.4267; // 232.42r6
                    path_var[2,2] = 30.9333; // 30.9r3
                // Handle B
                    /*path_var[4,0] = 382.88;
                    path_var[4,1] = 213.8347; // 213.834r6
                    path_var[4,2] = 43.6267; // 43.62r6*/
                // D
                    path_var[3,0] = 436.48;
                    path_var[3,1] = 219.3067; // 219.30r6
                    path_var[3,2] = 19.3067; // 19.30r6
                // Handle C
                    /*path_var[6,0] = 429.33; // 429.r3
                    path_var[6,1] = 242.0267; // 242.02r6
                    path_var[6,2] = 19.52;*/
                // E
                    path_var[4,0] = 395.6267; // 395.62r6
                    path_var[4,1] = 197.3333; // 197.r3
                    path_var[4,2] = 0;
                // Handle D
                    /*path_var[8,0] = 431.1467; // 431.14r6
                    path_var[8,1] = 188.9067; // 188.90r6
                    path_var[8,2] = 17.1733; // 17.17r3*/
                // F
                    path_var[5,0] = 388.3733; // 388.37r3
                    path_var[5,1] = 226.6667; // 226.r6
                    path_var[5,2] = 0;
                // Handle E
                    /*path_var[10,0] = 372.5867; // 372.58r6
                    path_var[10,1] = 203.84;
                    path_var[10,2] = 0;*/
                // G
                    path_var[6,0] = 361.344;
                    path_var[6,1] = 237.5147; // 237.514r6
                    path_var[6,2] = 2.4747; // 2.474r6
                // Handle F
                    /*path_var[12,0] = 378.8693; // 378.869r3
                    path_var[12,1] = 238.7733; // 238.77r3
                    path_var[12,2] = -0.256;*/
                // H
                    path_var[7,0] = 361.33; // 361.r3
                    path_var[7,1] = 234.3893; // 234.389r3
                    path_var[7,2] = 17.1627; // 17.162r6
                // Handle G
                    /*path_var[14,0] = 355.11467; // 355.114r6
                    path_var[14,1] = 236.7147; // 236.714r6
                    path_var[14,2] = 6.2293; // 6.229r3*/
                // I
                    path_var[8,0] = 358.57067; // 358.570r6
                    path_var[8,1] = 238.5493; // 238.549r3
                    path_var[8,2] = 34.1333; // 34.1r3
                // Handle H
                    /*path_var[16,0] = 373.07733; // 373.077r3
                    path_var[16,1] = 233.5787; // 233.578r6
                    path_var[16,2] = 31.1253; // 31.125r3*/
                // J
                    path_var[9,0] = 348.98133; // 348.981r3
                    path_var[9,1] = 244.1707; // 244.170r6
                    path_var[9,2] = 16.8747; // 16.874r6
                // Handle I
                    /*path_var[18,0] = 345.28;
                    path_var[18,1] = 243.9467; // 243.94r6
                    path_var[18,2] = 26.176;*/
                pitch_var = -90;
                event_user(0);
            }
    // Color
    with instance_create(0,0,color_par_obj)
    {
        image_blend = other.color_var;
        event_user(0);
    }
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Room end event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// Delete background
object_event_add
(argument0,ev_other,ev_user0,'
    with load_par_obj { instance_destroy(); }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    spr_id_var = mod_scr(spr_id_var+(spr_spd_var*global.delta_time_var),sprite_get_number(spr_var));
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    {
        if state_var < str_len_var
        {
            if str_state_var == str_len_arr_var[state_var] || draw_state_var == 0
            {
                set_alarm_scr(0,-1);
                event_perform(ev_alarm,0);
            }
            else
            {
                for (local.i=str_state_var; local.i<str_len_arr_var[state_var]; local.i+=1;)
                { str_var += str_arr_var[state_var,local.i]; }
                draw_state_var = 1;
                str_state_var = str_len_arr_var[state_var];
                set_alarm_scr(0,str_delay_alarm_var);
            }
        }
        else { rm_goto_menu_scr(dead_rm,true); }
    }
    if global.input_press_arr[back_input_const,global.menu_player_var] == 1
    || global.input_press_arr[pause_input_const,global.menu_player_var] == 1
    { rm_goto_menu_scr(dead_rm,true); }
');
// String Alarm Var
object_event_add
(argument0,ev_alarm,0,'
    if state_var < str_len_var
    {
        switch draw_state_var
        {
            case 0:
            {
                // Release the hounds!!
                if bug_id_var < bug_len_var && state_var != 1
                {
                    with bug_arr_var[bug_id_var]
                    {
                        on_var = true;
                        inst_var = fmod_snd_3d_loop_scr(snd_var);
                        local.bug = id;
                        with bug_bod_obj
                        {
                            if par_var == local.bug
                            { on_var = true; }
                        }
                    }
                    bug_id_var += 1;
                }
                inst_var = fmod_snd_loop_scr(snd_var);
            }
            case 2:
            {
                draw_state_var = 1;
                str_var += str_arr_var[state_var,str_state_var];
                str_state_var += 1;
                if str_state_var == str_len_arr_var[state_var]
                { set_alarm_scr(0,str_delay_alarm_var); }
                else { set_alarm_scr(0,str_alarm_var); }
                break;
            }
            case 1:
            {
                if str_state_var == str_len_arr_var[state_var]
                {
                    draw_state_var = 0;
                    set_alarm_scr(0,delay_alarm_var);
                    str_var = "";
                    str_state_var = 0;
                    state_var += 1;
                    fmod_inst_stop_scr(inst_var);
                }
                else
                {
                    draw_state_var = 2;
                    set_alarm_scr(0,str_flash_alarm_var);
                }
                break;
            }
        }
    }
    else
    {
        switch state_var
        {
            case str_len_var:
            {
                with instance_create(0,0,fade_eff_obj)
                {
                    image_blend = c_black;
                    set_alarm_scr(0,60);
                    invert_var = true;
                    stay_var = true;
                    depth = -99;
                }
                with bug_dead_3d_obj
                {
                    xstart = x;
                    ystart = y;
                    zstart = z;
                    atk_var = true;
                    set_alarm_scr(0,18);
                }
                set_alarm_scr(0,18);
                break;
            }
            case str_len_var+1:
            {
                event_perform(ev_alarm,1);
                with instance_create(0,0,fade_eff_obj)
                {
                    image_blend = c_black;
                    set_alarm_scr(0,180);
                    invert_var = true;
                    depth = -101;
                }
                set_alarm_scr(0,180);
                break;
            }
            case state_len_var-1:
            {
                rm_goto_menu_scr(dead_rm,true);
                break;
            }
        }
        state_var += 1;
    }
');
// String Alarm Var
object_event_add
(argument0,ev_alarm,1,'
    fmod_snd_play_scr(claw_snd);
    with instance_create(0,0,flash_eff_obj)
    {
        image_blend = c_red;
        set_alarm_scr(0,12);
        depth = -100;
    }
    set_alarm_scr(1,irandom_range(6,24));
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if draw_state_var == 1 || (global.reduce_flash_var && draw_state_var)
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        // Background
        draw_set_color(c_black);
        draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
        draw_spr_tiled_stretch_scr(spr_var,floor(spr_id_var),0,0,512,0,2);
        draw_rectangle(0,view_hview[view_current]*0.25,view_wview[view_current],view_hview[view_current]*0.75,false);
        draw_set_color(c_white);
        // Text
        draw_set_halign(fa_center); draw_set_valign(fa_middle);
        draw_str_scr(str_var,0,0,0.75,0.75,0.125,fa_center,fa_middle,0);
        draw_set_halign(fa_left); draw_set_valign(fa_top);
        d3d_set_hidden(true);
    }
');