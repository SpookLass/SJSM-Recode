// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    event_perform(ev_other,ev_room_start);
    
    ini_open(global.lang_var);
	rm_str_var = ini_read_string("UI","rm","UI_rm");
    hp_str_var = ini_read_string("UI","hp","UI_hp");
    stam_str_var = ini_read_string("UI","stam","UI_stam");
    spd_str_var = ini_read_string("UI","spd","UI_spd");
    health_str_var = ini_read_string("UI","health","UI_health");
    stamina_str_var = ini_read_string("UI","stamina","UI_stamina");
    taker_str_var = ini_read_string("UI","taker","UI_taker");
    tps_str_var = ini_read_string("UI","tps","UI_tps");
    fps_str_var = ini_read_string("UI","fps","UI_fps");
	ini_close();
    // Taker
    taker_color_var = make_color_rgb(159,0,0);
    taker_cool_var = true;
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    scale_min_var = 0.125;
    if view_wview[par_var.cam_id_var] >= view_hview[par_var.cam_id_var]
    { scale_var = view_hview[par_var.cam_id_var]/720; }
    else { scale_var = view_wview[par_var.cam_id_var]/1280; }
    scale_var = max(scale_var,scale_min_var);
    left_var = 54*scale_var;
    right_var = view_wview[par_var.cam_id_var]-(54*scale_var);
    top_var = 54*scale_var;
    bottom_var = view_hview[par_var.cam_id_var]-(54*scale_var);
    shadow_off_var = 2*scale_var;
    scale_big_var = max(0.75*scale_var,scale_min_var);
    scale_med_var = max(0.5*scale_var,scale_min_var);
    scale_small_var = max(0.25*scale_var,scale_min_var);
    // Subtitle
    center_var = view_wview[par_var.cam_id_var]/2;
    sub_bottom_var = view_hview[par_var.cam_id_var]-(120*scale_var);
    local.offset = 380;
    sub_hor_var = (view_wview[par_var.cam_id_var]-(380*scale_var))/2; // 450*scale_var
    sub_vert_var = 128*scale_var;
    sub_w_var = local.offset*2*scale_var/scale_med_var; // (view_wview[par_var.cam_id_var]-(sub_hor_var*2))/scale_med_var
    // Taker
    taker_xspd_var = -2*scale_var;
    taker_yspd_var = 2*scale_var;
    taker_xscale_var = 0.86*scale_var;
    taker_yscale_var = scale_var;
    draw_set_font(taker_font);
    taker_w_var = string_width_ext(taker_str_var,-1,-1)*taker_xscale_var;
    taker_h_var = (string_height_ext(taker_str_var,-1,-1)+8)*taker_yscale_var;
    draw_set_font(main_font);
    if taker_classic_var
    {
        taker_off_arr[0] = 222*scale_var;
        taker_off_arr[1] = 94*scale_var;
        taker_off_arr[2] = 13*scale_var;
        taker_off_arr[3] = 68*scale_var;
        taker_off_arr[4] = 94*scale_var;
        taker_off_arr[5] = 57*scale_var;
        taker_off_arr[6] = 230*scale_var;
        taker_off_len_var = 7*scale_var;
    }
    else
    {
        taker_off_len_var = round(view_hview[par_var.cam_id_var]/taker_h_var);
        for (local.i=0; local.i < taker_off_len_var; local.i+=1;)
        { taker_off_arr[local.i] = random(taker_w_var); }
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    taker_x_var += taker_xspd_var*global.delta_time_var;
    taker_y_var += taker_yspd_var*global.delta_time_var;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == par_var.cam_id_var && !par_var.dead_var && !global.hide_hud_var
    {
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        // Flare
        if par_var.flare_var > 0
        {
            draw_set_blend_mode(bm_add);
            draw_background_stretched_ext(lens_01_bg,0,0,view_wview[view_current],view_hview[view_current],c_white,par_var.flare_var);
            draw_set_blend_mode(bm_normal);
        }
        // Taker!
        if par_var.alarm_arr[3,0] < par_var.alarm_arr[3,1]/2
        {
            if par_var.alarm_arr[3,0] <= 0 { local.per = 1; }
            else { local.per = median(0,1,1-(2*par_var.alarm_arr[3,0]/par_var.alarm_arr[3,1])); }
            // Take your text!
            draw_set_color(taker_color_var); draw_set_alpha(local.per);
            draw_set_font(taker_font);
            for (local.i=0; local.i<round(view_hview[view_current]/taker_h_var)+(taker_off_len_var*2); local.i+=1;)
            {
                if taker_cool_var && (local.i mod taker_off_len_var) mod 2 { local.xtmp = ((-taker_x_var+taker_off_arr[local.i mod taker_off_len_var]) mod taker_w_var)-taker_w_var; }
                else { local.xtmp = ((taker_x_var+taker_off_arr[local.i mod taker_off_len_var]) mod taker_w_var)-taker_w_var; }
                local.ytmp = (taker_y_var mod (taker_h_var*taker_off_len_var))+(taker_h_var*(local.i-taker_off_len_var));
                for (local.w=0; local.w<round(view_wview[view_current]/taker_w_var)+2; local.w+=1;)
                { draw_text_transformed(local.xtmp+(local.w*taker_w_var),local.ytmp,taker_str_var,taker_xscale_var,taker_yscale_var,0); }
            }
            draw_set_font(main_font); draw_set_alpha(1);
            // Turn it red
            local.value = lerp_scr(0,255,local.per);
            draw_set_blend_mode(bm_subtract);
            draw_set_color(make_color_rgb(0,local.value,local.value));
            draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
            draw_set_color(c_white);
            draw_set_blend_mode(bm_normal);
        }
        // Monster Sub
        if global.sub_var > 0
        {
            draw_set_halign(fa_center); draw_set_valign(fa_bottom);
            with echidna_obj
            {
                local.dist = point_distance_3d_scr(x,y,z,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current])
                if local.dist < snd_dist_var && fmod_inst_is_play_scr(snd_var)
                && string(sub_var[0]) != "0" && (sub_var[1] || global.sub_var > 1)
                {
                    local.dir = global.cam_yaw_var[view_current]-point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]);
                    local.xtmp = other.center_var-lengthdir_x(other.sub_hor_var,local.dir-90);
                    local.ytmp = other.sub_bottom_var-other.sub_vert_var+lengthdir_y(other.sub_vert_var,local.dir-90); // 624
                    draw_set_alpha(1-(local.dist/snd_dist_var));
                    draw_set_color(make_color_rgb(30,0,50));
                    draw_text_ext_transformed(local.xtmp-2,local.ytmp+2,sub_var[0],-1,other.sub_w_var,other.scale_med_var,other.scale_med_var,0);
                    draw_set_color(c_white);
                    draw_text_ext_transformed(local.xtmp,local.ytmp,sub_var[0],-1,other.sub_w_var,other.scale_med_var,other.scale_med_var,0);
                }
            }
            draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_alpha(1);
        }
        // Health and Stamina bars
        if global.bar_hud_var != bar_hud_old_const
        {
            if !par_var.do_sprint_var { local.stam_bg = bar_stam_fake_bg; }
            else if !par_var.do_stam_var { local.stam_bg = bar_stam_inf_bg; }
            else { local.stam_bg = bar_stam_bg; }
            draw_background_ext(bar_bg,91*scale_var,57*scale_var,scale_var,scale_var,0,c_white,1);
            local.width = background_get_width(bar_stam_bg)*par_var.stam_var/par_var.stam_max_var;
            draw_background_part_ext(local.stam_bg,background_get_width(bar_stam_bg)-local.width,0,local.width,20,99*scale_var,96*scale_var,scale_var,scale_var,c_white,1);
            local.width = background_get_width(bar_hp_bg)*median(0,1,par_var.hp_var/par_var.hp_max_var);
            draw_background_part_ext(bar_hp_bg,background_get_width(bar_hp_bg)-local.width,0,local.width,27,99*scale_var,62*scale_var,scale_var,scale_var,c_white,1);
            if par_var.hp_var > par_var.hp_max_var
            {
                local.width = background_get_width(bar_hp_ex_bg)*median(0,1,(par_var.hp_var/par_var.hp_max_var)-1);
                draw_background_part_ext(bar_hp_ex_bg,background_get_width(bar_hp_ex_bg)-local.width,0,local.width,27,99*scale_var,62*scale_var,scale_var,scale_var,c_white,1);
            }
            draw_background_ext(bar_icon_bg,37*scale_var,34*scale_var,scale_var,scale_var,0,c_white,1);
        }
        // TPS
        if global.tps_hud_var
        {
            local.str = tps_str_var+": "+string(fps)+" | "+fps_str_var+": "+string(global.fps_curr_var);
            draw_set_color(make_color_rgb(30,0,50));
            draw_text_transformed(0,scale_var,local.str,scale_small_var,scale_small_var,0); // 106 138
            draw_set_color(c_yellow);
            draw_text_transformed(scale_var,0,local.str,scale_small_var,scale_small_var,0); // 107 137
        }
        // Health counter
        switch (global.bar_hud_var)
        {
            case bar_hud_num_const:
            {
                //draw_set_blend_mode_ext(bm_inv_dest_color,bm_zero);
                local.hp_str = hp_str_var+": "+string(round(par_var.hp_var))+" / "+string(par_var.hp_max_var);
                local.stam_str = stam_str_var+": "+string(round(par_var.stam_var))+" / "+string(par_var.stam_max_var);
                draw_set_valign(fa_middle);
                draw_set_color(make_color_rgb(100,0,0));
                for (local.i=0; local.i<4; local.i+=1;)
                {
                    local.xtmp = lengthdir_x(scale_var,local.i*90);
                    local.ytmp = lengthdir_y(scale_var,local.i*90);
                    draw_text_transformed((scale_var*107)+local.xtmp,(scale_var*77)+local.ytmp,local.hp_str,scale_small_var,scale_small_var,0);
                    draw_text_transformed((scale_var*107)+local.xtmp,(scale_var*107)+local.ytmp,local.stam_str,scale_small_var,scale_small_var,0);
                }
                draw_set_color(c_white);
                draw_text_transformed(scale_var*107,scale_var*77,local.hp_str,scale_small_var,scale_small_var,0);
                draw_text_transformed(scale_var*107,scale_var*107,local.stam_str,scale_small_var,scale_small_var,0);
                //draw_set_blend_mode(bm_normal);
                break;
            }
            case bar_hud_old_const:
            {
                local.hp_str = health_str_var+": "+string(round(par_var.hp_var));
                local.stam_str = stamina_str_var+": "+string(round(par_var.stam_var));
                draw_set_color(make_color_rgb(30,0,50));
                draw_text_transformed(left_var-shadow_off_var,top_var+shadow_off_var,local.hp_str,scale_big_var,scale_big_var,0);
                draw_text_transformed(left_var-shadow_off_var,(top_var*2)+shadow_off_var,local.stam_str,scale_big_var,scale_big_var,0);
                draw_set_color(c_yellow);
                draw_text_transformed(left_var,top_var,local.hp_str,scale_big_var,scale_big_var,0);
                draw_text_transformed(left_var,top_var*2,local.stam_str,scale_big_var,scale_big_var,0);
                break;
            }
        }
        // Monster list
        draw_set_valign(fa_bottom);
        if global.mon_hud_var && ds_list_size(global.mon_curr_list) > 0
        {
            local.offset = bottom_var;
            for (local.i=ds_list_size(global.mon_curr_list)-1; local.i>=0; local.i-=1;)
            {
                with ds_list_find_value(global.mon_curr_list,local.i)
                {
                    if !hide_var && string(name_var) != "0"
                    {
                        local.str = string(name_var);
                        if global.mon_hud_var == 2 { local.str += ": "+string(dur_var); }
                        draw_set_color(make_color_rgb(30,0,50));
                        draw_text_transformed(other.left_var-other.shadow_off_var,local.offset+other.shadow_off_var,local.str,other.scale_med_var,other.scale_med_var,0);
                        draw_set_color(c_yellow);
                        draw_text_transformed(other.left_var,local.offset,local.str,other.scale_med_var,other.scale_med_var,0);
                        local.offset -= other.scale_var*36;
                    }
                }
            }
        }
        // Speed Count
        draw_set_halign(fa_right);
        if global.game_spd_var != 1
        {
            local.str = spd_str_var+": "+string(global.game_spd_var);
            draw_set_color(make_color_rgb(100,0,0));
            draw_text_transformed(right_var-shadow_off_var,bottom_var+shadow_off_var,local.str,scale_med_var,scale_med_var,0);
            draw_set_color(c_white);
            draw_text_transformed(right_var,bottom_var,local.str,scale_med_var,scale_med_var,0);
        }
        draw_set_valign(fa_top);
        // Room Count
        local.str = rm_str_var+": "+string(global.rm_count_var);
        draw_set_color(make_color_rgb(30,0,50));
        draw_text_transformed(right_var-shadow_off_var,top_var+shadow_off_var,local.str,scale_big_var,scale_big_var,0);
        if global.rm_hud_var
        { draw_text_transformed(right_var-shadow_off_var,(top_var*2)+shadow_off_var,global.rm_name_var,scale_med_var,scale_med_var,0); }
        draw_set_color(c_yellow);
        draw_text_transformed(right_var,top_var,local.str,scale_big_var,scale_big_var,0);
        if global.rm_hud_var
        { draw_text_transformed(right_var,top_var*2,global.rm_name_var,scale_med_var,scale_med_var,0); }
        draw_set_color(c_white); draw_set_halign(fa_left);
        // Debug text
        if global.debug_var && !global.hide_debug_var
        {
            local.str = "
Position
    X: "+string(par_var.x)+"
    Y: "+string(par_var.y)+"
    Z: "+string(par_var.z)+"
Movement
    X speed: "+string(par_var.x_spd_var)+"
    Y speed: "+string(par_var.y_spd_var)+"
    Z speed: "+string(par_var.z_spd_var)+"
    Yaw: "+string(par_var.yaw_var)+"
    Pitch: "+string(par_var.pitch_var)+"
    On Floor: "+string(par_var.on_floor_var)+"
Looking
    Eye Yaw: "+string(par_var.eye_yaw_var)+"
    Eye Pitch: "+string(par_var.eye_pitch_var)+"
Clear Time
    Room Size: "+string(path_get_length(par_var.path_var))+"
    Clear Time: "+string(par_var.rm_clear_time_var)+"
Taker
    Taker: "+string(par_var.alarm_arr[3,0])+" / "+string(par_var.alarm_arr[3,1])
            draw_text_transformed(0,128*scale_var,local.str,scale_small_var,scale_small_var,0);
        }
        d3d_set_hidden(true);
    }
');