// Builtin Variables
object_set_depth(argument0,100);
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
    // Translations
    ini_open(global.lang_var);
    mod_str_var = ini_read_string("MOD","mod","MOD_mod");
    mod_load_str_var = ini_read_string("MOD","mod_load","MOD_mod_load");
    ini_close();
    // Variables
    bg_x_var = 0;
    bg_y_var = 0;
    bg_xspd_var = 1;
    bg_yspd_var = 1;
    margin_var = 96;
    str_margin_var = 56;
    str_bg_color_var = make_color_rgb(57,0,91);
    str_bg_select_color_var = make_color_rgb(138,0,0);
    time_var = 0;
    str_scale_var = 0.8;
    // Mod
    mod_var = 0;
    mod_load_var = 0;
    state_var = 0;
    // Sound
    fmod_snd_loop_scr(result_mus_snd);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    time_var = (time_var+global.true_delta_time_var) mod 80;
    str_scale_var = 0.8+(cos(2*time_var*pi/80)*0.2);
    bg_x_var += bg_xspd_var*global.delta_time_var;
    bg_y_var += bg_yspd_var*global.delta_time_var;
    if input_menu_hold_x_scr() != 0
    { state_var = !state_var; fmod_snd_play_scr(select_snd); }
    local.input = input_menu_hold_y_scr();
    if local.input != 0
    {
        
        if state_var
        {
            if ds_list_size(global.mod_load_list) > 0
            {
                mod_load_var = mod_scr(mod_load_var-local.input,ds_list_size(global.mod_load_list));
                fmod_snd_play_scr(select_snd);
            }
            
        }
        else if ds_list_size(global.mod_list) > 0
        {
            mod_var = mod_scr(mod_var-local.input,ds_list_size(global.mod_list));
            fmod_snd_play_scr(select_snd);
        }
    }
    if global.input_press_arr[confirm_input_const,0]
    {
        if state_var
        {
            if ds_list_size(global.mod_load_list) > 0
            {
                fmod_snd_play_scr(confirm_snd);
                local.str = ds_list_find_value(global.mod_load_list,mod_load_var);
                if ds_list_find_index(global.mod_list,local.str) < 0
                { ds_list_add(global.mod_list,local.str); }
            }
        }
        else if ds_list_size(global.mod_list) > 0
        {
            fmod_snd_play_scr(deny_snd);
            ds_list_delete(global.mod_list,mod_var);
        }
    }
    if global.input_press_arr[back_input_const,0]
    {
        ini_open("mods.ini");
        ini_write_string("MODS","mods",ds_list_write(global.mod_list));
        ini_close();
        game_end();
    }
');
// Create Event
object_event_add
(argument0,ev_draw,0,'
    draw_bg_tiled_stretch_scr(settings_bg,bg_x_var,bg_y_var,512,0,2);
    draw_str_shadow_scr
    (
        mod_str_var,
        20,20,0.95,0.95,0.125,fa_left,fa_top,
        -4,4,str_bg_color_var,c_yellow,2,0
    );
    draw_str_shadow_scr
    (
        mod_load_str_var,
        20,20,0.95,0.95,0.125,fa_center,fa_top,
        -4,4,str_bg_color_var,c_yellow,2,0
    );
    // Rectangle
    draw_set_color(c_black); draw_set_alpha(0.5);
    local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
    local.center = view_wview[view_current]/2;
    local.margin = margin_var*local.viewscale
    draw_rectangle(local.margin,local.margin,local.center-local.margin,view_hview[view_current]-local.margin,false);
    draw_rectangle(local.center+local.margin,local.margin,view_wview[view_current]-local.margin,view_hview[view_current]-local.margin,false);
    draw_set_color(c_white); draw_set_alpha(1);
    // Text
    local.count = floor((view_hview[view_current]-(local.margin*2))/192);
    local.mod_scroll = median(local.count,ds_list_size(global.mod_list)-1-local.count,mod_var);
    local.mod_load_scroll = median(local.count,ds_list_size(global.mod_load_list)-1-local.count,mod_load_var);
    for (local.i=0; local.i<(local.count*2)+1; local.i+=1;)
    {
        // Mod
        local.index = local.i+local.mod_scroll-local.count;
        local.str = filename_name(ds_list_find_value(global.mod_list,local.index));
        if local.index == mod_var && !state_var
        {
            local.ytmp = margin_var+str_margin_var+(96*local.i);
            draw_spr_stretch_scr(select_spr,0,margin_var+str_margin_var,local.ytmp,132,0,fa_left,fa_top);
            draw_str_select_scr
            (
                local.str,
                margin_var+str_margin_var,local.ytmp,str_scale_var,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_select_color_var,c_white,2,0,0.75,fa_left
            );
        }
        else
        {
            draw_str_shadow_scr
            (
                local.str,
                margin_var+str_margin_var,margin_var+str_margin_var+(96*local.i),0.75,0.75,0.125,fa_left,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
        }
        // Mod Load
        local.index = local.i+local.mod_load_scroll-local.count;
        local.str = filename_name(ds_list_find_value(global.mod_load_list,local.index));
        if local.index == mod_load_var && state_var
        {
            local.ytmp = margin_var+str_margin_var+(96*local.i);
            draw_spr_stretch_scr(select_spr,0,margin_var+str_margin_var,local.ytmp,132,0,fa_center,fa_top);
            draw_str_select_scr
            (
                local.str,
                margin_var+str_margin_var,local.ytmp,str_scale_var,0.75,0.125,fa_center,fa_top,
                -4,4,str_bg_select_color_var,c_white,2,0,0.75,fa_left
            );
        }
        else
        {
            draw_str_shadow_scr
            (
                local.str,
                margin_var+str_margin_var,margin_var+str_margin_var+(96*local.i),0.75,0.75,0.125,fa_center,fa_top,
                -4,4,str_bg_color_var,c_yellow,2,0
            );
        }
    }
');
