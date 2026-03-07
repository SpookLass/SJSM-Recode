// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Translation
    ini_open(global.lang_var);
    str_var = ini_read_string("DEAD","pup","DEAD_pup");
    ini_close();
    // Assets
    spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\FACE_04_spr.png",2,0,0,0,0);
    sprite_set_offset(spr_var,sprite_get_width(spr_var)/2,sprite_get_height(spr_var));
    eye_face_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\FACE_04b_spr.png",1,0,0,0,0);
    sprite_set_offset(eye_face_spr_var,sprite_get_width(eye_face_spr_var)/2,sprite_get_height(eye_face_spr_var));
    hand_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\FACE_04c_spr.png",1,0,0,0,0);
    sprite_set_offset(hand_spr_var,sprite_get_width(hand_spr_var),0);
    eye_spr_var = execute_file(main_directory_const+"\SPR\DEAD\pup_eye_spr.gml",main_directory_const+"\SPR\DEAD\pup_eye_spr.png");
    fade_spr_var = execute_file(main_directory_const+"\SPR\UI\static_fade_spr.gml",main_directory_const+"\SPR\UI\static_fade_spr.png");
    bg_01_var = background_add(main_directory_const+"\BG\DEAD\pup_dead_01_bg.png",false,false);
    bg_02_var = background_add(main_directory_const+"\BG\DEAD\pup_dead_02_bg.png",false,false);
    snd_01_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\pup_"+choose("01","02","03","04")+"_snd.wav",false);
    snd_02_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\pup_dead_snd.wav",false);
    snd_03_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\pup_wake_snd.wav",false);
    load_var = true;
    // Sprites
    spr_id_var = 0;
    spr_spd_var = 0.5;
    eye_spr_id_var = 0;
    eye_spr_spd_var = 0.5;
    fade_spr_id_var = 0;
    fade_spr_spd_var = 0.1;
    // Scale
    spr_scale_var = 612
    eye_face_scale_var = 244;
    eye_scale_var = 120;
    hand_scale_var = 480;
    bg_01_xscale_var = 1024;
    bg_01_yscale_var = 512;
    bg_02_xscale_var = 512;
    bg_02_yscale_var = 512;
    bg_02_xspd_var = 80;
    bg_02_yspd_var = 3;
    fade_xscale_var = 64;
    fade_yscale_var = 192;
    // Position
    bg_01_y_var = 0;
    eye_y_var = eye_face_scale_var;
    hand_y_var = -hand_scale_var;
    bg_02_x_var = 0;
    bg_02_y_var = 0;
    // String
    str_x_var = 100;
    str_y_var = 100;
    str_xscale_var = 0.6;
    str_yscale_var = 1;
    // Sound
    fmod_snd_play_scr(snd_01_var);
    inst_var = fmod_snd_play_scr(snd_02_var);
    // State
    state_var = 0;
    state_len_var = 6;
    // Alarms (Beat x 360/13)
    alarm_var[0] = 720/13;
    alarm_var[1] = 720/13;
    alarm_var[2] = 5760/13;
    alarm_var[3] = 6480/13;
    alarm_var[4] = 400;
    alarm_var[5] = 120;
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,alarm_var[state_var]);
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
    if load_var
    {
        sprite_delete(spr_var);
        sprite_delete(eye_face_spr_var);
        sprite_delete(hand_spr_var);
        sprite_delete(eye_spr_var);
        sprite_delete(fade_spr_var);
        background_delete(bg_01_var);
        background_delete(bg_02_var);
        fmod_snd_free_scr(snd_01_var);
        fmod_snd_free_scr(snd_02_var);
        fmod_snd_free_scr(snd_03_var);
        load_var = false;
    }
');
object_event_add
(argument0,ev_alarm,0,'
    state_var += 1;
    switch state_var
    {
        case state_len_var: { rm_goto_menu_scr(dead_rm,true); break; }
        case 3:
        {
            eye_y_var = 0;
            bg_01_y_var = -eye_face_scale_var*0.5;
            set_alarm_scr(0,alarm_var[state_var]);
            break;
        }
        case 4:
        {
            fmod_snd_loop_scr(snd_03_var);
            set_alarm_scr(0,alarm_var[state_var]);
            break;
        }
        case 5:
        {
            with instance_create(0,0,fade_eff_obj)
            {
                cam_id_var = -1;
                image_blend = c_black;
                invert_var = true;
                set_alarm_scr(0,other.alarm_var[other.state_var]);
            }
        }
        default: { set_alarm_scr(0,alarm_var[state_var]); break; }
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    {
        reset_alarm_scr();
        if state_var < 1 || state_var == 4
        { state_var += 1; }
        event_perform(ev_alarm,0);
    }
    if global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { rm_goto_menu_scr(dead_rm,true); }
    bg_02_x_var = mod_scr(bg_02_x_var+(bg_02_xspd_var*global.delta_time_var),bg_02_xscale_var);
    bg_02_y_var = mod_scr(bg_02_y_var+(bg_02_yspd_var*global.delta_time_var),bg_02_yscale_var);
    switch state_var
    {
        case 0:
        {
            spr_id_var = mod_scr(spr_id_var+(spr_spd_var*global.delta_time_var),sprite_get_number(spr_var));
            break;
        }
        case 2:
        {
            local.per = power(alarm_arr[0,0]/alarm_arr[0,1],2);
            bg_01_y_var = lerp_scr(-eye_face_scale_var*0.5,0,local.per);
            eye_y_var = lerp_scr(0,eye_face_scale_var,local.per);
            eye_spr_id_var = mod_scr(eye_spr_id_var+(eye_spr_spd_var*global.delta_time_var),sprite_get_number(eye_spr_var));
            break;
        }
        case 3:
        {
            local.per = power(alarm_arr[0,0]/alarm_arr[0,1],2);
            hand_y_var = lerp_scr(0,-hand_scale_var,local.per);
            eye_spr_id_var = mod_scr(eye_spr_id_var+(eye_spr_spd_var*global.delta_time_var),sprite_get_number(eye_spr_var));
            break;
        }
    }
    if state_var && fade_spr_id_var < sprite_get_number(fade_spr_var)
    { fade_spr_id_var += fade_spr_spd_var*global.delta_time_var; }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    switch state_var
    {
        case 0:
        {
            draw_spr_stretch_scr(spr_var,floor(spr_id_var),0,0,spr_scale_var,1,fa_center,fa_bottom);
            break;
        }
        case 4:
        case 5:
        {
            draw_set_color(c_red);
            draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
            draw_set_color(c_white);
            draw_str_scr(str_var,str_x_var,str_y_var,str_xscale_var,str_yscale_var,0.125,fa_left,fa_top,0);
            break;
        }
        default:
        {
            draw_bg_tiled_scale_scr(bg_01_var,0,bg_01_y_var,bg_01_xscale_var,bg_01_yscale_var,2);
            if state_var > 1
            {
                draw_spr_stretch_scr(eye_face_spr_var,0,0,eye_y_var,eye_face_scale_var,1,fa_center,fa_bottom);
                draw_spr_stretch_scr(eye_spr_var,floor(eye_spr_id_var),0,eye_y_var,eye_scale_var,1,fa_center,fa_bottom);
            }
            if state_var > 2 { draw_spr_stretch_scr(hand_spr_var,0,0,hand_y_var,hand_scale_var,1,fa_right,fa_top); }
            break;
        }
    }
    draw_bg_tiled_scale_scr(bg_02_var,bg_02_x_var,bg_02_y_var,bg_02_xscale_var,bg_02_yscale_var,2);
    if state_var && fade_spr_id_var < sprite_get_number(fade_spr_var)
    { draw_spr_tiled_scale_scr(fade_spr_var,floor(fade_spr_id_var),0,0,fade_xscale_var,fade_yscale_var,2); }
');