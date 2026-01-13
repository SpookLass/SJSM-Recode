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
    // Assets
    menu_bg_var = background_add(vanilla_directory_const+"\TEX\menu\menu4_tex.png",false,false);
    bg_var = background_add(main_directory_const+"\BG\DEAD\dead_bg.png",false,false);
    fade_spr_var = execute_file(main_directory_const+"\SPR\UI\static_fade_spr.gml",main_directory_const+"\SPR\UI\static_fade_spr.png");
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\dead_snd.wav");
    mus_snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\GAMEOVER_AMB.mp3");
    fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    load_var = true;
    // Translation
    ini_open(global.lang_var);
    switch global.mode_var
    {
        case 0: { str_var = ini_read_string("DEAD","sm","DEAD_sm"); break; }
        default:
        {
            if file_exists(working_directory+"\The_Doll_House\SDH.exe") && frac_chance_scr(1,8)
            {
                local.str = string(irandom(11));
                if string_length(local.str) <= 1 { local.str = "0"+local.str; }
                local.str = "dh_"+local.str;
                str_var = ini_read_string("DEAD",local.str,"DEAD_"+local.str);
            }
            else { str_var = ini_read_string("DEAD","em","DEAD_em"); }
            break;
        }
    }
    // Fade in
    fade_spr_spd_var = 0.1;
    // String
    str_scale_var = 1;
    str_stretch_scale_var = 3;
    str_stretch_var = 6;
    str_dist_var = 96;
    margin_var = 64;
    // Alarms
    alarm_len_var = 2;
    set_alarm_scr(0,180);
    // Main
    x_spd_var = 80;
    y_spd_var = -2;
    image_xscale = 256;
    image_yscale = 1024;
    image_alpha = 0.3;
    // Sound
    fmod_snd_play_scr(snd_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[interact_input_const,global.dead_player_var] == 1
    || global.input_press_arr[back_input_const,global.dead_player_var] == 1
    || global.input_press_arr[pause_input_const,global.dead_player_var] == 1
    {
        fmod_update_take_over_when_lock_scr();
        highscore_show_ext(global.rm_count_var,menu_score_bg,true,c_yellow,c_purple,"Lunchtime Doubly So",16);
        global.last_time_var = current_time;
        fmod_update_take_over_done_scr();
        rm_goto_menu_scr(menu_rm);
    }
    if do_str_var && alarm_arr[1,0] > 0 { str_prog_var = 1-(alarm_arr[1,0]/alarm_arr[1,1]); }
    if fade_spr_id_var < sprite_get_number(fade_spr_var) { fade_spr_id_var += fade_spr_spd_var; }
    x = mod_scr(x+x_spd_var,image_xscale);
    y = mod_scr(y+y_spd_var,image_yscale);
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    do_str_var = true;
    set_alarm_scr(1,24);
');
// Alarm 0
object_event_add
(argument0,ev_alarm,1,'
    str_prog_var = 1;
    fmod_snd_loop_scr(mus_snd_var);
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
        background_delete(menu_bg_var);
        background_delete(bg_var);
        sprite_delete(fade_spr_var);
        fmod_snd_free_scr(snd_var);
        fmod_snd_free_scr(mus_snd_var);
        load_var = false;
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_bg_fit_scr(menu_bg_var,0,0);
    if do_str_var
    {
        if str_prog_var < 1
        {
            local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
            // Stretch
            local.scale = lerp_scr(str_stretch_scale_var,str_scale_var,str_prog_var)*local.viewscale;
            local.dist = str_dist_var*(1-str_prog_var)*local.viewscale;
            // Simplified
            local.xtmp = view_wview[view_current]/2;
            local.ytmp = 464*local.viewscale;
            local.width = ((view_wview[view_current]/local.viewscale)-margin_var)/str_scale_var;
            // Stretched Shadows
            draw_set_halign(fa_center); draw_set_valign(fa_top); draw_set_color(c_black); draw_set_alpha(0.25);
            for (local.i=0; local.i<str_stretch_var; local.i+=1)
            {
                local.distoff = ((2*local.i/str_stretch_var)-1)*local.dist;
                for (local.j=0; local.j<4; local.j+=1;)
                {
                    local.dir = 360*local.j/8;
                    
                    local.xoff = local.xtmp+local.distoff+(sign(local.distoff)*lengthdir_x(local.xdist,local.dir));
                    local.yoff = local.ytmp+(sign(local.distoff)*lengthdir_y(local.ydist,local.dir));
                    draw_text_ext_transformed(local.xoff,local.yoff,str_var,local.sep,local.width,local.scale,str_scale_var,0);
                }
            }
            // Stretched Text
            draw_set_color(c_yellow);
            for (local.i=0; local.i<str_stretch_var; local.i+=1)
            {
                local.distoff = ((2*local.i/str_stretch_var)-1)*local.dist;
                draw_text_ext_transformed(local.xtmp+local.distoff,local.ytmp,str_var,local.sep,local.width,local.scale,str_scale_var,0);
            }
            // Reset
            draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white); draw_set_alpha(1);
        }
        else { draw_str_ext_outline_scr(str_var,0,464,str_scale_var,str_scale_var,0.125,fa_center,fa_top,-1,margin_var,4,4,c_black,c_yellow,1,8); }
    }
    draw_bg_tiled_scale_ext_scr(bg_var,x,y,image_xscale,image_yscale,2,image_angle,image_blend,image_alpha);
    if fade_spr_id_var < sprite_get_number(fade_spr_var) { draw_spr_tiled_scale_scr(fade_spr_var,floor(fade_spr_id_var),0,0,64,192,2); }
    d3d_set_hidden(true);
');