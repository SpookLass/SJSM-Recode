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
    // State
    state_len_var = 5;
    state_var = 0;
    draw_state_var = 0;
    alarm_len_var = 1;
    alarm_ini_scr();
');

// String Alarm Var
object_event_add
(argument0,ev_alarm,0,'
    state_var += 1;
    switch draw_state_var
    {
        case 0:
        {
            // Release the hounds!!
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
            }
            else
            {
                draw_state_var = 2;
                set_alarm_scr(0,str_flash_alarm_var);
            }
            break;
        }
    }
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
    // Text
    draw_set_color(str_color_var); draw_set_alpha(str_alpha_var); draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_str_ext_scr(str_var[state_var],0,0,str_scale_var[state_var],str_scale_var[state_var]*str_yscale_var,0.125,fa_center,fa_middle,-1,108,0);
    draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white); draw_set_alpha(1);
    d3d_set_hidden(true);
');