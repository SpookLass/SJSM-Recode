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
    state_len_var = 8;
    load_var = true;
    // Translations
    ini_open(global.lang_var);
    for (local.i=0; local.i<state_len_var; local.i+=1;)
    {
        str_arr_var[local.i] = string_replace_all(ini_read_string("TRAILER","trailer_"+string(local.i+1),"TRAILER_trailer_"+string(local.i+1)),"@l","
");
    }
    ini_close();
    // Background
    bg_var = background_add(main_directory_const+"\BG\UI\multi_bg.png",false,false);
    bg_xscale_var = 512;
    bg_yscale_var = 512;
    bg_x_var = 0;
    bg_y_var = 0;
    bg_spd_x_var = 1;
    bg_spd_y_var = 1;
    bg_color_var = make_color_rgb(70,0,90);
    // String
    str_var = str_arr_var[0];
    str_color_var = c_yellow;
    str_bg_color_var = make_color_rgb(57,0,91);
    str_scale_true_min_var = 0.125;
    str_scale_min_var = 1;
    str_scale_max_var = 2;
    str_scale_var = str_scale_min_var;
    str_dl_scale_min_var = 0.6;
    str_dl_scale_max_var = 1;
    str_dl_scale_rate_var = 80;
    str_dl_time_var = 0;
    // Title
    spr_var = execute_file(main_directory_const+"\SPR\UI\menu_title_spr.gml",main_directory_const+"\SPR\UI\menu_title_spr.png");
    spr_scale_min_var = 500;
    spr_scale_max_var = 1057;
    spr_scale_var = spr_scale_min_var;
    // Alarm
    bar_var = 960/11;
    alarm_len_var = 1;
    alarm_ini_scr();
    // State
    state_var = 0;
    substate_var = 0;
    fade_alpha_var = 0;
    // Arrays
    alarm_var[0] = bar_var;
    alarm_var[1] = bar_var;
    alarm_var[2] = bar_var;
    alarm_var[3] = bar_var;
    alarm_var[4] = bar_var;
    alarm_var[5] = bar_var;
    alarm_var[6] = 9*bar_var;
    alarm_var[7] = 3*bar_var;
    substate_arr_var[0] = 0;
    substate_arr_var[1] = 0;
    substate_arr_var[2] = 1; // Bring the Noise!
    substate_arr_var[3] = 0;
    substate_arr_var[4] = 0;
    substate_arr_var[5] = 0;
    substate_arr_var[6] = 2; // Ending card thing
    substate_arr_var[7] = 3; // Ending card fade out
    color_arr_var[0] = make_color_rgb(70,0,90); // Background Color!
    color_arr_var[1] = make_color_rgb(152,61,70); // Settings Color!
    color_arr_var[2] = make_color_rgb(138,0,0); // That Other Red!
    color_arr_var[3] = make_color_rgb(59,59,119); // Pause Blue!
    color_arr_var[4] = make_color_rgb(226,205,124); // Gold!
    color_arr_var[5] = make_color_rgb(6,213,119); // Stamina Green
    color_arr_var[6] = make_color_rgb(70,0,90); // Back to purple!
    color_arr_var[7] = make_color_rgb(70,0,90); // Back to purple!
    set_alarm_scr(0,alarm_var[0]);
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
        background_delete(bg_var);
        sprite_delete(spr_var);
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,0,'
    bg_x_var = mod_scr(bg_x_var+(bg_spd_x_var*global.true_delta_time_var),bg_xscale_var)
    bg_y_var = mod_scr(bg_y_var+(bg_spd_y_var*global.true_delta_time_var),bg_yscale_var)
    switch substate_var
    {
        case 0:
        {
            local.per = alarm_arr[0,0]/alarm_arr[0,1];
            fade_alpha_var = max(0,(abs(local.per-0.5)*4)-1);
            str_scale_var = lerp_scr(str_scale_max_var,str_scale_min_var,local.per);
            break;
        }
        case 1:
        {
            local.per = alarm_arr[0,0]/alarm_arr[0,1];
            fade_alpha_var = max(0,(abs(local.per-0.5)*4)-1);
            str_scale_var = lerp_scr(str_scale_min_var,str_scale_max_var,median(0,1,floor((1-local.per)*4)*0.5));
            break;
        }
        case 3:
        case 2:
        {
            if substate_var == 2
            {
                fade_alpha_var = median(0,1,1-((alarm_arr[0,1]-alarm_arr[0,0])/20));
                spr_scale_var = lerp_scr(spr_scale_max_var,spr_scale_min_var,alarm_arr[0,0]/alarm_arr[0,1]);
            }
            else { fade_alpha_var = 1-(alarm_arr[0,0]/alarm_arr[0,1]); }
            str_dl_time_var = mod_scr(str_dl_time_var+global.true_delta_time_var,str_dl_scale_rate_var);
            str_scale_var = lerp_scr(str_dl_scale_min_var,str_dl_scale_max_var,(sin(2*str_dl_time_var*pi/str_dl_scale_rate_var)+1)*0.5);
        }
    }
');
// Alarm Event
object_event_add
(argument0,ev_alarm,0,'
    state_var += 1;
    if state_var >= state_len_var { game_end(); }
    else
    {
        substate_var = substate_arr_var[state_var];
        str_var = str_arr_var[state_var];
        bg_color_var = color_arr_var[state_var];
        if substate_var == 2 { fade_alpha_var = 0; }
        else { fade_alpha_var = 1; }
        if substate_var == 3 { spr_scale_var = spr_scale_max_var; }
        set_alarm_scr(0,alarm_var[state_var]);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_bg_tiled_scale_ext_scr(bg_var,bg_x_var,bg_y_var,bg_xscale_var,bg_yscale_var,2,0,bg_color_var,1);
    switch substate_var
    {
        case 0:
        case 1:
        {
            draw_set_halign(fa_center); draw_set_valign(fa_middle);
            draw_str_shadow_scr(str_var,0,0,str_scale_var,str_scale_var,str_scale_true_min_var,fa_center,fa_middle,-4,4,str_bg_color_var,str_color_var,2,0);
            draw_set_halign(fa_left); draw_set_valign(fa_top);
            break;
        }
        case 2:
        case 3:
        {
            draw_spr_stretch_scr(spr_var,0,0,-100,spr_scale_var,0,fa_center,fa_middle);
            draw_set_halign(fa_center); draw_set_valign(fa_middle);
            draw_str_shadow_scr(str_var,0,260,str_scale_var,str_scale_var,str_scale_true_min_var,fa_center,fa_center,-4,4,str_bg_color_var,str_color_var,2,0);
            draw_set_halign(fa_left); draw_set_valign(fa_top);
            break;
        }
    }
    draw_set_color(c_black); draw_set_alpha(fade_alpha_var);
    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
    draw_set_color(c_white); draw_set_alpha(1);
');