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
    // Translation
    ini_open(global.lang_var);
    str_var = ini_read_string("DEAD","flesh","DEAD_flesh");
    str_len_var = 9;
    str_arr_var[0] = ini_read_string("DEAD","flesh_01","DEAD_flesh_01");
    str_arr_var[1] = ini_read_string("DEAD","flesh_02","DEAD_flesh_02");
    str_arr_var[2] = ini_read_string("DEAD","flesh_03","DEAD_flesh_03");
    str_arr_var[3] = ini_read_string("DEAD","flesh_04","DEAD_flesh_04");
    str_arr_var[4] = ini_read_string("DEAD","flesh_05","DEAD_flesh_05");
    str_arr_var[5] = ini_read_string("DEAD","flesh_06","DEAD_flesh_06");
    str_arr_var[6] = ini_read_string("DEAD","flesh_07","DEAD_flesh_07");
    str_arr_var[7] = ini_read_string("DEAD","flesh_08","DEAD_flesh_08");
    str_arr_var[8] = ini_read_string("DEAD","flesh_09","DEAD_flesh_09");
    ini_close();
    // Load assets
    spr_var = execute_file(main_directory_const+"\SPR\DEAD\flesh_dead_spr.gml",main_directory_const+"\SPR\DEAD\flesh_dead_spr.png");
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\flesh_dead_snd.wav");
    load_var = true;
    // Sound
    fmod_snd_play_scr(snd_var);
    // Sprite
    image_alpha = 0;
    spr_x_var = 0;
    spr_y_var = 0;
    // String
    x = 0;
    y = 0;
    image_xscale = 1;
    image_yscale = 1;
    image_blend = c_red;
    min_scale_var = 0.125;
    str_alpha_01_var = 0;
    str_alpha_02_var = 0;
    str_draw_02_var = str_arr_var[irandom(str_len_var-1)];
    str_draw_01_var = string_replace(str_var,"@1",str_draw_02_var);
    str_x_var = 0;
    str_y_var = 0;
    // Alarm
    alarm_len_var = 4;
    alarm_ini_scr();
    set_alarm_scr(0,120);
    if !global.reduce_flash_var
    {
        alarm_var = 6;
        set_alarm_scr(3,1);
    }
    else { alarm_var = 30; }
    set_alarm_scr(2,alarm_var);
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
    { event_perform(ev_alarm,1); }
    if alarm_arr[0,0] > 0 { str_alpha_01_var = lerp_scr(1,0,alarm_arr[0,0]/alarm_arr[0,1]); }
    if alarm_arr[1,0] > 0
    {
        local.per = alarm_arr[1,0]/alarm_arr[1,1];
        str_alpha_02_var = lerp_scr(0.5,0,local.per);
        image_alpha = lerp_scr(1.25,0,local.per);
    }
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    str_alpha_01_var = 1;
    set_alarm_scr(1,240);
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    rm_goto_menu_scr(dead_rm,true);
');
// Effect Alarm
object_event_add
(argument0,ev_alarm,2,'
    str_draw_02_var = str_arr_var[irandom(str_len_var-1)];
    str_draw_01_var = string_replace(str_var,"@1",str_draw_02_var);
    set_alarm_scr(2,alarm_var);
');
// Shake Alarm
object_event_add
(argument0,ev_alarm,3,'
    local.offset1 = image_alpha*4;
    local.offset2 = 8+local.offset1;
    spr_x_var = random_range(-local.offset2,local.offset2);
    spr_y_var = random_range(-local.offset2,local.offset2);
    str_x_var = random_range(-local.offset1,local.offset1);
    str_y_var = random_range(-local.offset1,local.offset1);
    set_alarm_scr(3,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    // Calculate Scale
    local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
    // Sprites
    local.xtmp = spr_x_var*local.viewscale;
    local.ytmp = spr_y_var*local.viewscale;
    draw_sprite_stretched_ext(spr_var,0,0,0,view_wview[view_current],view_hview[view_current],c_white,1);
    draw_sprite_stretched_ext(spr_var,1,min(local.xtmp,0),min(local.ytmp,0),view_wview[view_current]+max(local.xtmp,0),view_hview[view_current]+max(local.ytmp,0),c_white,image_alpha);
    // Text
    draw_set_halign(fa_center); draw_set_valign(fa_middle); draw_set_alpha(str_alpha_01_var);
    draw_str_shadow_scr(str_draw_01_var,x,y,image_xscale,image_yscale,min_scale_var,fa_center,fa_middle,-4,4,c_black,image_blend,2,0);
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    // Looping Text (maybe I should add a script for this)
    local.xscale = max(min_scale_var,image_xscale*local.viewscale);
    local.yscale = max(min_scale_var,image_yscale*local.viewscale);
    // Calculate width for tiling
    local.width = string_width(str_draw_02_var)*local.xscale;
    local.height = string_height(str_draw_02_var)*local.yscale;
    // Offsets
    local.xtmp = mod_scr(str_x_var*local.viewscale,local.width);
    local.ytmp = mod_scr(str_y_var*local.viewscale,local.height);
    // Set color and alpha
    draw_set_color(image_blend); draw_set_alpha(str_alpha_02_var);
    // Loop top to bottom
    for (local.i=-1; local.i<=round(view_hview[view_current]/local.height); local.i+=1;)
    {
        // Loop left to right
        for (local.w=-1; local.w<=round(view_wview[view_current]/local.width); local.w+=1;)
        // Draw!
        { draw_text_transformed(local.xtmp+(local.w*local.width),local.ytmp+(local.height*local.i),str_draw_02_var,local.xscale,local.yscale,0); }
    }
    // Reset
    draw_set_color(c_white); draw_set_alpha(1);
');