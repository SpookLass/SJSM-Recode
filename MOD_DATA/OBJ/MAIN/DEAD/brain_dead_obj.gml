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
    str_01_var = string_replace_all(ini_read_string("DEAD","brain_01","DEAD_brain_01"),"@l","
");
    str_02_var = ini_read_string("DEAD","brain_02","DEAD_brain_02");
    str_03_var = ini_read_string("DEAD","brain_03","DEAD_brain_03");
    ini_close();
    // Load assets
    spr_01_var = spr_add_scr(static_strobe_spr_path,8,false,false,0,0);
    spr_02_var = spr_add_scr(strobe_spr_path,3,false,false,0,0); // spr_02_var = spr_add_scr(color_strobe_spr_path,13,false,false,0,0);
    snd_var = snd_add_scr(brain_dead_snd_path,false,snd_group_sfx_const,1,0,0);
    load_var = true;
    // Sprite
    spr_id_01_var = choose(0,2,5);
    spr_id_02_var = irandom(sprite_get_number(spr_02_var)-1);
    spr_xscale_var = 2560;
    spr_yscale_var = 64;
    x_spd_var = 8;
    y_spd_var = 0;
    image_blend = c_gray;
    // Offsets
    off_len_var = ceil(720/spr_yscale_var);
    local.width = sprite_get_width(spr_01_var);
    for (local.i=0; local.i < off_len_var; local.i+=1;)
    { off_arr_var[local.i] = irandom(local.width-1)*spr_xscale_var/local.width; }
    // Sound
    fmod_snd_play_scr(snd_var);
    // String
    str_color_var = c_white;
    str_02_scale_var = 0.9;
    str_02_xscale_var = str_02_scale_var*view_wview[0]/string_width(str_02_var);
    str_02_yscale_var = str_02_scale_var*1.25*view_hview[0]/string_height(str_02_var);
    str_03_xscale_var = str_02_scale_var*view_wview[0]/string_width(str_03_var);
    str_visible_var = 1;
    str_alpha_min_var = 0.33;
    str_alpha_max_var = 0.67;
    str_alpha_var = 0.5*(str_alpha_min_var+str_alpha_max_var);
    // Alarm
    fade_alarm_var = 30;
    alarm_len_var = 3;
    alarm_ini_scr();
    set_alarm_scr(0,270);
    // Flashing
    if !global.reduce_flash_var
    {
        set_alarm_scr(2,1);
        x_spd_var = 128;
        y_spd_var = 8;
        image_blend = c_ltgray;
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
        sprite_delete(spr_01_var);
        sprite_delete(spr_02_var);
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
    x = mod_scr(x+(x_spd_var*global.true_delta_time_var),spr_xscale_var);
    y = mod_scr(y+(y_spd_var*global.true_delta_time_var),spr_yscale_var);
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    set_alarm_scr(1,fade_alarm_var);
    with instance_create(0,0,static_fade_obj)
    {
        cam_id_var = -1;
        image_blend = c_black;
        invert_var = true;
        set_alarm_scr(0,other.fade_alarm_var);
    }
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    rm_goto_menu_scr(dead_rm,true);
');
// Effect Alarm
object_event_add
(argument0,ev_alarm,2,'
    spr_id_01_var = choose(0,2,5);
    spr_id_02_var = irandom(sprite_get_number(spr_02_var)-1);
    str_color_var = merge_color(c_black,c_white,random(1));
    if frac_chance_scr(1,2) { str_visible_var = irandom(2); }
    else { str_visible_var = 0; }
    str_alpha_var = random_range(str_alpha_min_var,str_alpha_max_var)
    set_alarm_scr(2,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    // Static

    local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
    local.tilew = spr_xscale_var*local.viewscale;
    local.tileh = spr_yscale_var*local.viewscale;
    local.xscale = local.tilew/sprite_get_width(spr_01_var);
    local.yscale = local.tileh/sprite_get_height(spr_01_var);
    // Draw Loop
    for (local.iy = 0; local.iy <= ceil(view_hview[view_current]/local.tileh)+(off_len_var*2); local.iy += 1;)
    {
        local.xtmp = (((x+off_arr_var[local.iy mod off_len_var])*local.viewscale) mod local.tilew)-local.tilew;
        local.ytmp = ((y * local.viewscale) mod (local.tileh*off_len_var))+(local.tileh*(local.iy-off_len_var));
        for (local.ix = 0; local.ix <= ceil(view_wview[view_current]/local.tilew)+2; local.ix += 1;)
        { draw_sprite_ext(spr_01_var,spr_id_01_var,local.xtmp+(local.ix*local.tilew),local.ytmp,local.xscale,local.yscale,0,image_blend,1); }
    }
    // draw_spr_tiled_scale_scr(spr_01_var,spr_id_01_var,x,y,spr_xscale_var,spr_yscale_var,2);
    // Text 2
    draw_set_halign(fa_center); draw_set_valign(fa_middle); draw_set_color(c_black); draw_set_alpha(str_alpha_var);
    switch str_visible_var
    {
        case 1: { draw_text_transformed(view_wview[view_current]*0.5,view_hview[view_current]*0.625,str_02_var,str_02_xscale_var,str_02_yscale_var,0); break; }
        case 2: { draw_text_transformed(view_wview[view_current]*0.5,view_hview[view_current]*0.625,str_03_var,str_03_xscale_var,str_02_yscale_var,0); break; }
    }
    draw_set_alpha(1);
    // Text
    draw_set_halign(fa_center); draw_set_valign(fa_middle); draw_set_color(str_color_var);
    draw_str_scr(str_01_var,0,0,0.6,0.75,0.125,fa_center,fa_middle,0);
    draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white);
    // Effect
    draw_set_blend_mode_ext(bm_dest_color,bm_src_color);
    draw_sprite_stretched(spr_02_var,spr_id_02_var,0,0,view_wview[view_current],view_hview[view_current]);
    draw_set_blend_mode(bm_normal);
');