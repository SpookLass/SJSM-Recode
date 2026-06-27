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
    true_time_var = true;
    // Translation
    ini_open("lang_"+global.lang_var+".ini");
    str_var = string_replace_all(ini_read_string("DEAD","splode","DEAD_splode"),"@l","
");
    ini_close();
    // Load assets
    spr_var = spr_add_scr(splode_dead_spr_path,2,false,false,0,0);
    snd_var = snd_add_scr(splode_dead_snd_path,false,snd_group_sfx_const,1,0,0);
    load_var = true;
    // Sound
    fmod_snd_play_scr(snd_var);
    // Background
    pos_off_min_var = 8;
    pos_off_max_var = 18.8;
    pos_off_var = pos_off_min_var;
    scale_min_var = 720;
    scale_max_var = 3384;
    scale_var = scale_min_var;
    alpha_max_var = 1; // 0.225?
    image_alpha = 0;
    // String
    str_x_var = 0;
    str_y_var = 0;
    str_xscale_var = 0.5;
    str_yscale_var = 0.8;
    str_alpha_min_var = 0.4;
    str_alpha_max_var = 0.8;
    str_alpha_var = 0.5*(str_alpha_min_var+str_alpha_max_var);
    str_xoff_var = 1;
    str_yoff_var = 1.5;
    // Alarm
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,45);
    if !global.reduce_flash_var
    { set_alarm_scr(1,1); }
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
        fmod_snd_free_scr(snd_var);
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    || global.input_press_arr[pause_input_const,global.menu_player_var] == 1
    { event_perform(ev_alarm,0); }
    local.per = alarm_arr[0,0]/alarm_arr[0,1];
    pos_off_var = lerp_scr(pos_off_max_var,pos_off_min_var,local.per);
    scale_var = lerp_scr(scale_max_var,scale_min_var,local.per);
    image_alpha = lerp_scr(alpha_max_var,0,local.per);
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    rm_goto_menu_scr(dead_rm,true);
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    x = random_range(-pos_off_var,pos_off_var);
    y = random_range(-pos_off_var,pos_off_var);
    str_alpha_var = random_range(str_alpha_min_var,str_alpha_max_var);
    str_x_var = random_range(-str_xoff_var,str_xoff_var)
    str_y_var = random_range(-str_yoff_var,str_yoff_var)
    set_alarm_scr(1,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_spr_stretch_ext_scr(spr_var,0,x,y,scale_var,1,fa_center,fa_middle,0,c_white,1);
    draw_spr_stretch_ext_scr(spr_var,1,x,y,scale_var,1,fa_center,fa_middle,0,c_white,image_alpha);
    draw_set_halign(fa_center); draw_set_valign(fa_middle); draw_set_alpha(str_alpha_var);
    draw_str_ext_scr(str_var,str_x_var,str_y_var,str_xscale_var,str_yscale_var,0.125,fa_center,fa_middle,128,-1,0);
    draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_alpha(1);
');