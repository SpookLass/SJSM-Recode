// Builtin Variables
object_set_depth(argument0,-102);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    delay_var = true;
    store_spd_var = global.game_spd_var;
    global.game_spd_var = 0;
    global.mouse_free_var = true;
    action_set_cursor(-1,global.mouse_free_var);
    fmod_group_set_pause_scr(snd_group_mon_const,true);
    fmod_group_set_pause_scr(snd_group_voice_const,true);
    fmod_inst_set_pause_scr(mus_control_obj.snd_var,true);
    global.pause_var = true;
    fmod_snd_play_scr(deny_snd);
    // Static
    spr_var = static_01_spr;
    spr_spd_var = 0.25;
    image_alpha = 0.2;
    scale_min_var = 128;
    scale_max_var = 768;
    scale_alarm_var = 30;
    scale_var = random_range(scale_min_var,scale_max_var);
    // Spooky
    spook_scale_min_var = 1140;
    spook_scale_max_var = 1900;
    spook_scale_base_var = random_range(spook_scale_min_var,spook_scale_max_var);
    spook_scale_var = spook_scale_base_var;
    spook_alpha_max_var = 0.08;
    spook_x_var = random(1280)-640;
    spook_y_var = random(1280)-640;
    // Music
    mus_snd_var = fmod_snd_loop_scr(pause_drum_mus_snd);
    fmod_inst_set_vol_scr(mus_snd_var,0);
    // fmod_inst_set_mute_scr(mus_snd_var,true);
    alarm_len_var = 6;
    set_alarm_scr(0,60);
    set_alarm_scr(1,scale_alarm_var);
    set_alarm_scr(2,2400);
    // Menu
    image_blend = make_color_rgb(59,59,119)
    button_len_var = 4;
    button_state_var = 0;
    str_bg_color_var = make_color_rgb(57,0,91);
    str_bg_select_color_var = make_color_rgb(138,0,0);
    // String
    str_var = "GAME PAUSED"
    button_arr[0] = "CONTINUE"
    button_arr[1] = "SETTINGS"
    button_arr[2] = "EXIT TO MENU"
    button_arr[3] = "QUIT"
');
// Step Begin
object_event_add
(argument0,ev_step,ev_step_begin,'
    update_alarm_scr(global.true_delta_time_var);
');
// Step Normal
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if alarm_arr[0,0] > 0
    {
        fmod_inst_set_vol_scr(mus_snd_var,1-(alarm_arr[0,0]/alarm_arr[0,1]));
    }
    time_var = (time_var+global.true_delta_time_var) mod 80;
    str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
    spr_id_var = (spr_id_var+(spr_spd_var*global.true_delta_time_var)) mod sprite_get_number(spr_var);
    if alarm_arr[3,0] > 0 { spook_alpha_var = spook_alpha_max_var*(1-(alarm_arr[3,0]/alarm_arr[3,1])); }
    if alarm_arr[4,0] > 0 { spook_alpha_var = spook_alpha_max_var*(alarm_arr[4,0]/alarm_arr[4,1]); }
');
// Step End
object_event_add
(argument0,ev_step,ev_step_end,'
    event_inherited();
    if delay_var { delay_var = false; }
    else if !state_var
    {
        if global.input_press_arr[up_input_const,player_id_var] { button_state_var -= 1; fmod_snd_play_scr(select_snd); }
        if global.input_press_arr[down_input_const,player_id_var] { button_state_var += 1; fmod_snd_play_scr(select_snd); }
        button_state_var = mod_scr(button_state_var,button_len_var);
        if global.input_press_arr[back_input_const,player_id_var]
        {
            instance_destroy();
            fmod_snd_play_scr(confirm_snd);
        }
        if global.input_press_arr[confirm_input_const,player_id_var] //|| keyboard_check_pressed(vk_escape)
        {
            switch button_state_var
            {
                case 0: // Continue
                {
                    instance_destroy();
                    fmod_snd_play_scr(confirm_snd);
                    break;
                }
                case 1: // Settings
                {
                    instance_create(0,0,set_menu_obj);
                    fmod_snd_play_scr(confirm_snd);
                    state_var = 1;
                    break;
                }
                case 2: // Exit to Menu
                {
                    rm_goto_menu_scr(menu_rm,true);
                    break;
                }
                case 3: // Quit
                {
                    game_end();
                    break;
                }
            }
        }
    }
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Stop Event
object_event_add
(argument0,ev_other,ev_user0,'
    global.game_spd_var = store_spd_var;
    global.mouse_free_var = false;
    action_set_cursor(-1,global.mouse_free_var);
    display_mouse_set(display_get_width()/2,display_get_height()/2);
    fmod_inst_stop_scr(mus_snd_var);
    fmod_group_set_pause_scr(snd_group_mon_const,false);
    fmod_group_set_pause_scr(snd_group_voice_const,false);
    fmod_inst_set_pause_scr(mus_control_obj.snd_var,false);
    global.pause_var = false;
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    fmod_inst_set_vol_scr(mus_snd_var,1);
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    if !irandom(1)
    { scale_var = random_range(scale_min_var,scale_max_var); }
    set_alarm_scr(1,scale_alarm_var);
');
// Alarm 2 Event
object_event_add
(argument0,ev_alarm,2,'
    if !irandom(1)
    {
        spook_x_var = random(1280)-640;
        spook_y_var = random(1280)-640;
        spook_scale_base_var = random_range(spook_scale_min_var,spook_scale_max_var);
        set_alarm_scr(3,irandom_range(10,20));
        set_alarm_scr(5,1);
    }
    else { set_alarm_scr(2,irandom_range(60,120)); }
');
// Alarm 3 Event
object_event_add
(argument0,ev_alarm,3,'
    spook_alpha_var = spook_alpha_max_var;
    set_alarm_scr(4,irandom_range(20,40));
');
// Alarm 4 Event
object_event_add
(argument0,ev_alarm,4,'
    spook_alpha_var = 0;
    set_alarm_scr(2,irandom_range(60,120));
    set_alarm_scr(5,-1);
');
// Alarm 5 Event
object_event_add
(argument0,ev_alarm,5,'
    spook_scale_var = spook_scale_base_var+random_range(3.8,-3.8);
    set_alarm_scr(5,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    // Color
    draw_set_blend_mode(bm_subtract);
    draw_set_color(c_white-image_blend);
    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
    draw_set_blend_mode(bm_normal);
    // Static
    draw_spr_tiled_scale_ext_scr
    (
        spr_var,floor(spr_id_var),0,0,
        163840,scale_var,1,0,c_white,image_alpha
    )
    if spook_alpha_var > 0
    {
        draw_spr_stretch_ext_scr
        (
            spooky_spr,0,spook_x_var,spook_y_var,
            spook_scale_var,0,fa_center,fa_middle,
            0,c_white,spook_alpha_var
        )
    }
    // Text
    if view_current == cam_id_var
    {
        // Title
        draw_str_shadow_scr
        (
            str_var,
            0,120,1,1,0.125,fa_center,fa_top,
            -4,4,str_bg_select_color_var,c_white,2,0
        );
        // Buttons
        for (local.i=0; local.i<button_len_var; local.i+=1)
        {
            if local.i != button_state_var
            {
                local.ytmp = -96+(96*(local.i+1-button_len_var))
                draw_str_shadow_scr
                (
                    button_arr[local.i],
                    96,local.ytmp,0.75,0.75,0.125,fa_left,fa_bottom,
                    -4,4,str_bg_color_var,c_yellow,2,0
                );
            }
        }
        // Selected Button
        local.ytmp = -96+(96*(button_state_var+1-button_len_var));
        local.ytmp2 = local.ytmp-(string_height(button_arr[button_state_var])*0.75);
        draw_spr_stretch_scr(select_spr,0,96,local.ytmp2,132,0,fa_left,fa_bottom);
        draw_str_select_scr
        (
            button_arr[button_state_var],
            96,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_bottom,
            -4,4,str_bg_select_color_var,c_white,2,0,0.75
        );
    }
    // Hidden
    d3d_set_hidden(true);
');