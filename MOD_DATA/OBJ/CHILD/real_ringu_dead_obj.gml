// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,ringu_dead_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    load_var = false;
    if !global.dh_var { event_inherited(); }
    else
    {
        true_time_var = true;
        // Translation
        ini_open("lang_"+global.lang_var+".ini");
        str_var = ini_read_string("DEAD","real_ringu","DEAD_real_ringu");
        ini_close();
        // State 0
        state_var = 0;
        spr_var = spr_add_scr(ringu_real_dead_spr_path,12,false,false,0,0);
        txt_spr_var = spr_add_scr(ringu_real_txt_dead_spr_path,1,false,false,242,34);
        bg_var = bg_add_scr(ringu_real_dead_bg_path,false,false);
        // Text
        x = 0;
        y = 0;
        image_xscale = 966;
        halign_var = fa_center;
        valign_var = fa_middle;
        scale_min_var = 0.125; // Just in case
        // Sprite
        spr_id_var = 0;
        // Sound
        load_var = 2;
        snd_01_var = snd_add_scr(ringu_real_wake_snd_path,false,snd_group_sfx_const,1,0,0);
        snd_02_var = snd_add_scr(gel_dead_snd_path,false,snd_group_mus_const,1,0,0);
        inst_var = fmod_snd_play_scr(snd_01_var);
        // Alarms
        alarm_len_var = 4;
        alarm_ini_scr();
        fade_alarm_var = 20;
        set_alarm_scr(0,48);
        set_alarm_scr(3,48);
        // New
        y_scale_min_var = 136;
        y_scale_max_var = 149.6;
        image_yscale = random_range(y_scale_min_var,y_scale_max_var);
        alpha_min_var = 0;
        alpha_max_var = 0.6;
        image_alpha = random_range(alpha_min_var,alpha_max_var);
    }
    
');
// Alarm 3 Event
object_event_add
(argument0,ev_alarm,3,'
    if state_var
    {
        image_yscale = random_range(y_scale_min_var,y_scale_max_var);
        image_alpha = random_range(alpha_min_var,alpha_max_var);
    }
    set_alarm_scr(3,1);
');
// Delete background
object_event_add
(argument0,ev_other,ev_user0,'
    if load_var == 2
    {
        sprite_delete(txt_spr_var);
        load_var = 1;
    }
    event_inherited();
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if load_var == 2 && state_var
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_spr_scale_ext_scr(txt_spr_var,0,x,y,image_xscale,image_yscale,halign_var,valign_var,image_angle,image_blend,image_alpha);
        d3d_set_hidden(true);
    }
    else { event_inherited(); }
');