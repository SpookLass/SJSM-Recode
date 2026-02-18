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
    // Effects
    instance_create(0,0,flash_dead_obj);
    instance_create(0,0,static_dead_obj);
    // Sprite
    spr_var = taker_spr;
    spr_h_var = 1280;
    spr_w_min_var = 512;
    spr_w_max_var = 1280;
    spr_w_var = random_range(spr_w_min_var,spr_w_max_var);
    // Sounds
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\taker_dead_snd.wav");
    fmod_snd_loop_scr(snd_var);
    load_var = true;
    // Alarms
    alarm_len_var = 3;
    alarm_ini_scr();
    fade_alarm_var = 20;
    set_alarm_scr(0,180);
    set_alarm_scr(2,30);
    // Translation
    ini_open(global.lang_var);
    str_var = ini_read_string("UI","taker","UI_taker")+" ";
    ini_close();
    // Text
    image_blend = make_color_rgb(159,0,0);
    x_spd_var = -2; // -10
    y_spd_var = 2;
    min_scale_var = 0.125;
    cool_var = true;
    classic_var = false;
    // Scale
    w_min_var = 0.86;
    w_max_var = 2.58;
    image_xscale = random_range(w_min_var,w_max_var);
    image_yscale = 1;
    // Offset
    if classic_var
    {
        off_arr_var[0] = 222;
        off_arr_var[1] = 94;
        off_arr_var[2] = 13;
        off_arr_var[3] = 68;
        off_arr_var[4] = 94;
        off_arr_var[5] = 57;
        off_arr_var[6] = 230;
        off_len_var = 7;
    }
    else
    {
        off_len_var = round(720/(string_height(str_var)*image_yscale));
        for (local.i=0; local.i < off_len_var; local.i+=1;)
        { off_arr_var[local.i] = random(string_width(str_var)*image_xscale); }
    }
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
        fmod_snd_free_scr(snd_var);
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if global.input_press_arr[confirm_input_const,global.dead_player_var] == 1
    || global.input_press_arr[back_input_const,global.dead_player_var] == 1
    { event_perform(ev_alarm,1); }
    x += x_spd_var;
    y += y_spd_var;
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    set_alarm_scr(1,fade_alarm_var);
    with instance_create(0,0,fade_eff_obj)
    {
        cam_id_var = -1;
        image_blend = c_black;
        invert_var = true;
        set_alarm_scr(0,other.fade_alarm_var);
    }
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    rm_goto_menu_scr(dead_rm,true);
');
// Alarm 2 Event
object_event_add
(argument0,ev_alarm,2,'
    if !irandom(1)
    { spr_w_var = random_range(spr_w_min_var,spr_w_max_var); }
    image_xscale = random_range(w_min_var,w_max_var);
    set_alarm_scr(2,30);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    // SPRITE
    draw_spr_scale_scr(spr_var,0,0,0,spr_w_var,spr_h_var,fa_center,fa_middle);
    // JUST TEXT
    // Calculate Scale
    local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
    local.xscale = max(min_scale_var,image_xscale*local.viewscale);
    local.yscale = max(min_scale_var,image_yscale*local.viewscale);
    // Set color and font
    draw_set_color(image_blend); draw_set_font(taker_font);
    // Calculate width for tiling
    local.width = string_width(str_var)*local.xscale;
    local.height = string_height(str_var)*local.yscale;
    // Loop top to bottom
    for (local.i=0; local.i<round(view_hview[view_current]/local.height)+(off_len_var*2); local.i+=1;)
    {
        // Calculate horizontal offset (what a mess!)
        if cool_var && (local.i mod off_len_var) mod 2 { local.xtmp = (((-x+off_arr_var[local.i mod off_len_var])*local.viewscale) mod local.width)-local.width; }
        else { local.xtmp = (((x+off_arr_var[local.i mod off_len_var])*local.viewscale) mod local.width)-local.width; }
        // Calculate vertical offset
        local.ytmp = ((y * local.viewscale) mod (local.height*off_len_var))+(local.height*(local.i-off_len_var));
        // Loop left to right
        for (local.w=0; local.w<round(view_wview[view_current]/local.width)+2; local.w+=1;)
        // Draw!
        { draw_text_transformed(local.xtmp+(local.w*local.width),local.ytmp,str_var,local.xscale,local.yscale,0); }
    }
    draw_set_color(c_white); draw_set_font(main_font);
');