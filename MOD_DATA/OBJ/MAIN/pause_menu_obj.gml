// Builtin Variables
object_set_depth(argument0,-101);
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
    // Music
    mus_snd_var = fmod_snd_loop_scr(pause_mus_snd);//fmod_snd_loop_scr(pause_drum_mus_snd);
    fmod_inst_set_vol_scr(mus_snd_var,0);
    // fmod_inst_set_mute_scr(mus_snd_var,true);
    alarm_len_var = 1;
    set_alarm_scr(0,60);
    // Scale
    cam_id_var = 0;
    event_user(1);
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
// Step Event
object_event_add
(argument0,ev_step,ev_step_end,'
    if delay_var { delay_var = false; }
    else
    {
        if global.input_press_arr[up_input_const,player_id_var] { button_state_var -= 1; }
        if global.input_press_arr[down_input_const,player_id_var] { button_state_var += 1; }
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

                }
                case 2: // Exit to Menu
                {
                    with all
                    {
                        if persistent && object_index != other.object_index && object_index != control_obj
                        { instance_destroy(); }
                    }
                    fmod_all_stop_scr();
                    room_goto_scr(menu_rm);
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
    if alarm_arr[0,0] > 0
    {
        fmod_inst_set_vol_scr(mus_snd_var,1-(alarm_arr[0,0]/alarm_arr[0,1]));
    }
    time_var = (time_var+global.true_delta_time_var) mod 80;
    str_stretch_scale_var = str_base_scale_var+(cos(2*time_var*pi/80)*0.2*scale_var);
    button_state_var = mod_scr(button_state_var,button_len_var);
    update_alarm_scr(global.true_delta_time_var);
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
// Scale Event
object_event_add
(argument0,ev_other,ev_user1,'
    scale_min_var = 0.125;
    if view_wview[cam_id_var] >= view_hview[cam_id_var]
    { scale_var = view_hview[cam_id_var]/720; }
    else { scale_var = view_wview[cam_id_var]/1280; }
    scale_var = max(scale_var,scale_min_var);
    str_scale_var = max(scale_min_var,scale_var*0.75);
    str_base_scale_var = max(scale_min_var,scale_var*0.8);
    left_var = 96*scale_var;
    bottom_var = view_hview[cam_id_var]-(96*scale_var);
    top_var = 120*scale_var;
    center_var = view_wview[cam_id_var]/2;
    shadow_off_01_var = 2*scale_var;
    shadow_off_02_var = 4*scale_var;
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    fmod_inst_set_vol_scr(mus_snd_var,1);
')
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    // Color
    draw_set_blend_mode(bm_subtract);
    draw_set_color(c_white-image_blend);
    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
    draw_set_blend_mode(bm_normal);
    if view_current == cam_id_var
    {
        // Buttons
        draw_set_valign(fa_bottom);
        for (local.i=0; local.i<button_len_var; local.i+=1)
        {
            if local.i != button_state_var
            {
                local.ytmp = bottom_var+(96*(local.i+1-button_len_var)*scale_var)
                draw_set_color(str_bg_color_var);
                draw_text_transformed(left_var-shadow_off_02_var,local.ytmp+shadow_off_02_var,button_arr[local.i],str_scale_var,str_scale_var,0);
                draw_text_transformed(left_var-shadow_off_01_var,local.ytmp+shadow_off_01_var,button_arr[local.i],str_scale_var,str_scale_var,0);
                draw_set_color(c_yellow);
                draw_text_transformed(left_var,local.ytmp,button_arr[local.i],str_scale_var,str_scale_var,0);
            }
        }
        // Selected Button
        local.xtmp = left_var+(string_width(button_arr[button_state_var])*0.375*scale_var);
        local.ytmp = bottom_var+(96*(button_state_var+1-button_len_var)*scale_var);
        draw_set_halign(fa_center); draw_set_color(str_bg_select_color_var);
        draw_text_transformed(local.xtmp-shadow_off_02_var,local.ytmp+shadow_off_02_var,button_arr[button_state_var],str_stretch_scale_var,str_scale_var,0);
        draw_text_transformed(local.xtmp-shadow_off_01_var,local.ytmp+shadow_off_01_var,button_arr[button_state_var],str_stretch_scale_var,str_scale_var,0);
        draw_set_color(c_white);
        draw_text_transformed(local.xtmp,local.ytmp,button_arr[button_state_var],str_stretch_scale_var,str_scale_var,0);
        // Title
        draw_set_valign(fa_top); draw_set_color(str_bg_select_color_var);
        draw_text_transformed(center_var-shadow_off_02_var,top_var+shadow_off_02_var,str_var,scale_var,scale_var,0);
        draw_text_transformed(center_var-shadow_off_01_var,top_var+shadow_off_01_var,str_var,scale_var,scale_var,0);
        draw_set_color(c_white);
        draw_text_transformed(center_var,top_var,str_var,scale_var,scale_var,0);
        draw_set_halign(fa_left);
        // Hidden
        d3d_set_hidden(true);
    }
');