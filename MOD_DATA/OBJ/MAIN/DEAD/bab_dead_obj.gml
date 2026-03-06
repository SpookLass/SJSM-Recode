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
    // Translations
    ini_open(global.lang_var);
    str_len_var = 5;
    str_arr_var[0] = ini_read_string("DEAD","bab_01","DEAD_bab_01");
    str_arr_var[1] = ini_read_string("DEAD","bab_02","DEAD_bab_02");
    str_arr_var[2] = ini_read_string("DEAD","bab_03","DEAD_bab_03");
    str_arr_var[3] = ini_read_string("DEAD","bab_04","DEAD_bab_04");
    str_arr_var[4] = ini_read_string("DEAD","bab_05","DEAD_bab_05");
    ini_close();
    // Assets
    load_var = true;
    spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS4_04_spr.png",2,false,false,0,0);
    snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\BAB_D.mp3",false);
    fmod_snd_set_group_scr(snd_var,snd_group_mus_const);
    snd_len_var = 6;
    snd_arr_var[0] = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\bab_txt_01_snd.wav",false);
    snd_arr_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\bab_txt_02_snd.wav",false);
    snd_arr_var[2] = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\bab_txt_03_snd.wav",false);
    snd_arr_var[3] = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\bab_txt_04_snd.wav",false);
    snd_arr_var[4] = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\bab_txt_05_snd.wav",false);
    snd_arr_var[5] = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\bab_txt_06_snd.wav",false);
    static_spr_var = static_01_spr;
    // Sprite
    spr_visible_var = true;
    spr_id_var = 0;
    static_spr_spd_var = 0.5;
    static_spr_id_var = 0;
    spr_y_var = 0;
    // Text
    char_var = 0;
    str_var = 0;
    char_alarm_var = 2;
    char_delay_var = 89; // On average
    str_draw_var = "";
    image_blend = c_red;
    image_alpha = 0.8;
    image_xscale = 0.8;
    image_yscale = 0.8;
    // Sound
    inst_var = noone;
    fmod_snd_loop_scr(snd_var);
    // Alarms
    fade_alarm_var = 40;
    alarm_len_var = 4;
    alarm_ini_scr();
    if !global.reduce_flash_var
    { set_alarm_scr(0,1); }
    set_alarm_scr(1,60);
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
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr_var[local.i]); }
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    {
        reset_alarm_scr();
        if spr_id_var < 1 { event_perform(ev_alarm,0); }
        else if str_var >= str_len_var { event_perform(ev_alarm,3); }
        else if char_var < string_length(str_arr_var[str_var])
        {
            str_draw_var = str_arr_var[str_var];
            set_alarm_scr(2,char_delay_var);
            str_var += 1;
            char_var = 0;
        }
        else { event_perform(ev_alarm,2); }
    }
    if global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { event_perform(ev_alarm,3); }
    static_spr_id_var = mod_scr(static_spr_id_var+(static_spr_spd_var*global.delta_time_var),sprite_get_number(static_spr_var));
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    spr_visible_var = !irandom(1);
    spr_y_var = random_range(-4,4);
    set_alarm_scr(0,1);
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    // FLASH!!!
    if !global.reduce_flash_var
    {
        with instance_create(0,0,flash_eff_obj)
        {
            image_blend = c_red; 
            set_alarm_scr(0,6);
            cam_id_var = -1;
        }
    }
    spr_id_var = 1;
    set_alarm_scr(2,6);
');
// String Alarm Event
object_event_add
(argument0,ev_alarm,2,'
    if str_var >= str_len_var
    {
        set_alarm_scr(3,fade_alarm_var);
        with instance_create(0,0,fade_eff_obj)
        {
            cam_id_var = -1;
            image_blend = c_black;
            invert_var = true;
            set_alarm_scr(0,other.fade_alarm_var);
        }
    }
    else if char_var < string_length(str_arr_var[str_var])
    {
        char_var += 1;
        // Sound
        local.per = lerp_scr(str_var/str_len_var,(str_var+1)/str_len_var,char_var/string_length(str_arr_var[str_var]));
        local.pitch = lerp_scr(1,0.5,local.per);
        fmod_inst_stop_scr(inst_var);
        inst_var = fmod_snd_play_scr(snd_arr_var[irandom(snd_len_var-1)]);
        fmod_inst_set_pitch_scr(inst_var,local.pitch);
        // Next string
        if char_var >= string_length(str_arr_var[str_var])
        {
            str_draw_var = str_arr_var[str_var];
            set_alarm_scr(2,char_delay_var);
            str_var += 1;
            char_var = 0;
        }
        else
        {
            str_draw_var = string_copy(str_arr_var[str_var], 0, char_var);
            set_alarm_scr(2,char_alarm_var);
        }
    }
');
// Alarm 3
object_event_add
(argument0,ev_alarm,3,'
    rm_goto_menu_scr(dead_rm,true);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if spr_visible_var { draw_spr_fit_scr(spr_var,spr_id_var,0,spr_y_var); }
    draw_spr_tiled_stretch_ext_scr(static_spr_var,floor(static_spr_id_var),0,0,512,0,2,0,c_white,0.5);
    draw_set_color(image_blend); draw_set_alpha(image_alpha); draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_str_ext_scr(str_draw_var,0,0,image_xscale,image_yscale,0.125,fa_center,fa_middle,-1,54,0)
    draw_set_color(c_white); draw_set_alpha(1); draw_set_halign(fa_left); draw_set_valign(fa_top);
');