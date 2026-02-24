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
    //event_perform(ev_other,ev_room_start);
    // Text
    ini_open(global.lang_var);
	rm_str_var = ini_read_string("UI","rm","UI_rm");
    hp_str_var = ini_read_string("UI","hp","UI_hp");
    stam_str_var = ini_read_string("UI","stam","UI_stam");
    spd_str_var = ini_read_string("UI","spd","UI_spd");
    health_str_var = ini_read_string("UI","health","UI_health");
    stamina_str_var = ini_read_string("UI","stamina","UI_stamina");
    taker_str_var = ini_read_string("UI","taker","UI_taker")+" ";
    tps_str_var = ini_read_string("UI","tps","UI_tps");
    fps_str_var = ini_read_string("UI","fps","UI_fps");
	ini_close();
    // Other
    par_var = noone;
    scale_min_var = 0.125;
    sub_offset_var = 380;
    hp_var = 100;
    hp_rate_var = 0.2;
    hp_rate_min_var = 0.5;
    // Taker
    taker_color_var = make_color_rgb(159,0,0);
    taker_cool_var = true;
    taker_classic_var = false;
    taker_x_var = 0;
    taker_y_var = 0;
    taker_xspd_var = -2; // -10
    taker_yspd_var = 2;
    // Scale
    taker_xscale_min_var = 0.86;
    taker_xscale_max_var = 2.58;
    taker_xscale_var = taker_xscale_min_var;
    taker_yscale_var = 1;
    // Offset
    if taker_classic_var
    {
        taker_off_arr_var[0] = 222;
        taker_off_arr_var[1] = 94;
        taker_off_arr_var[2] = 13;
        taker_off_arr_var[3] = 68;
        taker_off_arr_var[4] = 94;
        taker_off_arr_var[5] = 57;
        taker_off_arr_var[6] = 230;
        taker_off_len_var = 7;
    }
    else
    {
        draw_set_font(taker_font);
        taker_off_len_var = round(720/(string_height(taker_str_var)*taker_yscale_var));
        for (local.i=0; local.i < taker_off_len_var; local.i+=1;)
        { taker_off_arr_var[local.i] = random(string_width(taker_str_var)*taker_xscale_var); }
        draw_set_font(main_font);
    }
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    hp_var = par_var.hp_var;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if par_var.alarm_arr[3,0] < par_var.alarm_arr[3,1]/2 && par_var.on_var && par_var.taker_var
    {
        taker_x_var += taker_xspd_var*global.delta_time_var;
        taker_y_var += taker_yspd_var*global.delta_time_var;
    }
    if hp_var != par_var.hp_var
    {
        local.hp_diff = abs(par_var.hp_var-hp_var);
        local.hp_rate = max(hp_rate_min_var,local.hp_diff*hp_rate_var)*global.delta_time_var;
        hp_var += min(local.hp_diff,local.hp_rate)*sign(par_var.hp_var-hp_var);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == par_var.cam_id_var && !global.hide_hud_var
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
        // TPS
        if global.tps_hud_var
        {
            local.str = tps_str_var+": "+string(fps)+" | "+fps_str_var+": "+string(global.fps_curr_var);
            draw_str_shadow_scr(local.str,1,1,0.25,0.25,scale_min_var,fa_left,fa_top,-1,1,make_color_rgb(30,0,50),c_yellow,1,0);
        }
        // Monster Sub
        if global.sub_var > 0
        {
            local.index = noone;
            if par_var.possess_var { local.index = par_var.mon_var; }
            draw_set_halign(fa_center); draw_set_valign(fa_bottom);
            // Calculations
            local.sub_x = view_wview[view_current]/2;
            local.sub_y = view_hview[view_current]-(120*local.viewscale);
            local.sub_xdist = (view_wview[view_current]-(sub_offset_var*local.viewscale))/2;
            local.sub_ydist = 128*local.viewscale;
            local.sub_scale = 0.5*local.viewscale;
            local.sub_w = sub_offset_var/0.5;
            local.sub_shadow_dist = 2*local.viewscale;
            // Loop through monsters
            with echidna_obj
            {
                if id != local.index && do_snd_var
                {
                    local.dist = point_distance_3d_scr(x,y,z,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]);
                    local.bool = false;
                    if local.dist < snd_dist_max_var && fmod_inst_is_play_scr(snd_var)
                    && (sub_var[1] || global.sub_var > 1) 
                    {
                        local.bool = true;
                        local.str = sub_var[0];
                        draw_set_alpha(1-((local.dist-snd_dist_min_var)/(snd_dist_max_var-snd_dist_min_var)));
                    }
                    else if loop_snd_var[0]
                    {
                        if local.dist < loop_snd_dist_max_var && fmod_inst_is_play_scr(loop_inst_var) && (loop_snd_var[3] || global.sub_var > 1)
                        {
                            local.bool = true;
                            local.str = loop_snd_var[2];
                            draw_set_alpha(1-((local.dist-loop_snd_dist_min_var)/(loop_snd_dist_max_var-loop_snd_dist_min_var)));
                        }
                    }
                    if local.bool
                    {
                        local.dir = global.cam_yaw_var[view_current]-point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current])-90;
                        local.xtmp = local.sub_x-lengthdir_x(local.sub_xdist,local.dir);
                        local.ytmp = local.sub_y-local.sub_ydist+lengthdir_y(local.sub_ydist,local.dir); // 624
                        draw_set_color(make_color_rgb(100,0,0));
                        draw_text_ext_transformed(local.xtmp-local.sub_shadow_dist,local.ytmp+local.sub_shadow_dist,local.str,-1,local.sub_w,local.sub_scale,local.sub_scale,0);
                        draw_set_color(c_white);
                        draw_text_ext_transformed(local.xtmp,local.ytmp,local.str,-1,local.sub_w,local.sub_scale,local.sub_scale,0);
                    }
                }
            }
            draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_alpha(1);
        }
        // Taker!
        if par_var.alarm_arr[3,0] < par_var.alarm_arr[3,1]/2 && par_var.on_var && par_var.taker_var
        {
            if par_var.alarm_arr[3,0] <= 0 { local.per = 1; }
            else { local.per = median(0,1,1-(2*par_var.alarm_arr[3,0]/par_var.alarm_arr[3,1])); }
            draw_set_alpha(local.per);
            // Calculate Scale
            local.xscale = max(scale_min_var,taker_xscale_var*local.viewscale);
            local.yscale = max(scale_min_var,taker_yscale_var*local.viewscale);
            // Set color and font
            draw_set_color(make_color_rgb(159,0,0)); draw_set_font(taker_font);
            // Calculate width for tiling
            local.width = string_width(taker_str_var)*local.xscale;
            local.height = (string_height(taker_str_var)+8)*local.yscale;
            // Loop top to bottom
            for (local.i=0; local.i<round(view_hview[view_current]/local.height)+(taker_off_len_var*2); local.i+=1;)
            {
                // Calculate horizontal offset (what a mess!)
                if taker_cool_var && (local.i mod taker_off_len_var) mod 2 { local.xtmp = (((-taker_x_var+taker_off_arr_var[local.i mod taker_off_len_var])*local.viewscale) mod local.width)-local.width; }
                else { local.xtmp = (((taker_x_var+taker_off_arr_var[local.i mod taker_off_len_var])*local.viewscale) mod local.width)-local.width; }
                // Calculate vertical offset
                local.ytmp = ((taker_y_var * local.viewscale) mod (local.height*taker_off_len_var))+(local.height*(local.i-taker_off_len_var));
                // Loop left to right
                for (local.w=0; local.w<round(view_wview[view_current]/local.width)+2; local.w+=1;)
                // Draw!
                { draw_text_transformed(local.xtmp+(local.w*local.width),local.ytmp,taker_str_var,local.xscale,local.yscale,0); }
            }
            draw_set_color(c_white); draw_set_font(main_font); draw_set_alpha(1);
            // Turn it red
            local.value = 255*local.per;
            draw_set_blend_mode(bm_subtract);
            draw_set_color(make_color_rgb(0,local.value,local.value));
            draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
            draw_set_color(c_white);
            draw_set_blend_mode(bm_normal);
        }
        // Main
        if !par_var.dead_var
        {
            // Flare
            if par_var.flare_var > 0
            {
                draw_set_blend_mode(bm_add);
                draw_background_stretched_ext(lens_01_bg,0,0,view_wview[view_current],view_hview[view_current],c_white,par_var.flare_var);
                draw_set_blend_mode(bm_normal);
            }
            // Health and Stamina bars
            if global.bar_hud_var != bar_hud_old_const
            {
                draw_bg_stretch_scr(bar_bg,91,57,308,0);
                // Stamina
                if !par_var.do_sprint_var { local.stam_bg = bar_stam_fake_bg; }
                else if !par_var.do_stam_var { local.stam_bg = bar_stam_inf_bg; }
                else { local.stam_bg = bar_stam_bg; }
                local.width = background_get_width(bar_stam_bg)*par_var.stam_var/par_var.stam_max_var;
                draw_background_part_ext(local.stam_bg,background_get_width(bar_stam_bg)-local.width,0,local.width,20,99*local.viewscale,96*local.viewscale,local.viewscale,local.viewscale,c_white,1);
                // Health
                local.width = background_get_width(bar_hp_bg)*median(0,1,hp_var/par_var.hp_max_var);
                draw_background_part_ext(bar_hp_bg,background_get_width(bar_hp_bg)-local.width,0,local.width,27,99*local.viewscale,62*local.viewscale,local.viewscale,local.viewscale,c_white,1);
                // Extra Health
                if par_var.hp_var > par_var.hp_max_var
                {
                    local.width = background_get_width(bar_hp_ex_bg)*median(0,1,(par_var.hp_var/par_var.hp_max_var)-1);
                    draw_background_part_ext(bar_hp_ex_bg,background_get_width(bar_hp_ex_bg)-local.width,0,local.width,27,99*local.viewscale,62*local.viewscale,local.viewscale,local.viewscale,c_white,1);
                }
                // Icon
                draw_bg_stretch_scr(bar_icon_bg,37,34,69,0);
            }
            // Health counter
            switch (global.bar_hud_var)
            {
                case bar_hud_num_const:
                {
                    //draw_set_blend_mode_ext(bm_inv_dest_color,bm_zero);
                    local.hp_str = hp_str_var+": "+string(round(par_var.hp_var))+" / "+string(par_var.hp_max_var);
                    local.stam_str = stam_str_var+": "+string(round(par_var.stam_var))+" / "+string(par_var.stam_max_var);
                    // I really gotta make text alignment separate from view alignment
                    draw_set_valign(fa_middle);
                    draw_str_outline_scr(local.hp_str,107,77,0.25,0.25,scale_min_var,fa_left,fa_top,1,1,make_color_rgb(100,0,0),c_white,1,4); // 68
                    draw_str_outline_scr(local.stam_str,107,107,0.25,0.25,scale_min_var,fa_left,fa_top,1,1,make_color_rgb(0,100,0),c_white,1,4); // 98
                    draw_set_valign(fa_top);
                    break;
                }
                case bar_hud_old_const:
                {
                    local.hp_str = health_str_var+": "+string(round(par_var.hp_var));
                    local.stam_str = stamina_str_var+": "+string(round(par_var.stam_var));
                    draw_str_shadow_scr(local.hp_str,54,54,0.75,0.75,scale_min_var,fa_left,fa_top,-2,2,make_color_rgb(30,0,50),c_yellow,1,0);
                    draw_str_shadow_scr(local.stam_str,54,108,0.75,0.75,scale_min_var,fa_left,fa_top,-2,2,make_color_rgb(30,0,50),c_yellow,1,0);
                    break;
                }
            }
            // Monster list
            if global.mon_hud_var && ds_list_size(global.mon_curr_list) > 0
            {
                local.offset = -54;
                for (local.i=ds_list_size(global.mon_curr_list)-1; local.i>=0; local.i-=1;)
                {
                    with ds_list_find_value(global.mon_curr_list,local.i)
                    {
                        if !hide_var
                        {
                            local.str = name_var;
                            if global.mon_hud_var == 2 { local.str += ": "+string(dur_var); }
                            draw_set_valign(fa_bottom);
                            draw_str_shadow_scr(local.str,54,local.offset,0.5,0.5,other.scale_min_var,fa_left,fa_bottom,-2,2,make_color_rgb(30,0,50),c_yellow,1,0);
                            draw_set_valign(fa_top);
                            local.offset -= 36;
                        }
                    }
                }
            }
            // Speed Count
            if global.game_spd_var != 1 && !global.pause_var
            {
                local.str = spd_str_var+": "+string(global.game_spd_var);
                draw_set_halign(fa_right); draw_set_valign(fa_bottom);
                draw_str_shadow_scr(local.str,-54,-54,0.5,0.5,scale_min_var,fa_right,fa_bottom,-2,2,make_color_rgb(100,0,0),c_white,1,0);
                draw_set_halign(fa_left); draw_set_valign(fa_top);
            }
            // Room Count
            local.str = rm_str_var+": "+string(global.rm_count_var);
            draw_set_halign(fa_right); 
            draw_str_shadow_scr(local.str,-54,54,0.75,0.75,scale_min_var,fa_right,fa_top,-2,2,make_color_rgb(30,0,50),c_yellow,1,0);
            if global.rm_hud_var { draw_str_shadow_scr(global.rm_name_var,-54,108,0.5,0.5,scale_min_var,fa_right,fa_top,-2,2,make_color_rgb(30,0,50),c_yellow,1,0); }
            draw_set_halign(fa_left);
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
    Collided: "+string(par_var.did_coll_var)+"
    Slide: "+string(par_var.did_slide_var)+"
Looking
    Eye Yaw: "+string(par_var.eye_yaw_var)+"
    Eye Pitch: "+string(par_var.eye_pitch_var)+"
Clear Time
    Room Size: "+string(path_get_length(par_var.path_var))+"
    Clear Time: "+string(par_var.clear_time_var)+"
Taker
    Taker: "+string(par_var.alarm_arr[3,0])+" / "+string(par_var.alarm_arr[3,1])+"
Zone
    Zone: "+cond_scr(global.zone_num_var < global.zone_len_var,"Endless "+string(global.zone_num_var),"Story "+string(global.zone_num_var-global.zone_len_var))+"
    Tex: "+cond_scr(global.tex_var < global.tex_story_len_var,"Story "+string(global.tex_var),"Endless "+string(global.tex_var-global.tex_story_len_var))+"
    Rooms Left: "+string(ds_list_size(global.rm_list_var))+"
Spawning
    Count: "+string(global.count_var)+"
    Fail: "+string(global.mon_fail_var)+"
    Chance: 1/"+string(global.mon_chance_var+(global.mon_chance_mult_var*instance_number(mon_par_obj)-global.mon_fail_var))
                draw_str_shadow_scr(local.str,1,128,0.25,0.25,scale_min_var,fa_left,fa_top,-1,1,make_color_rgb(100,0,0),c_white,1,0);
            }
        }
        else if par_var.possess_var
        {
            d3d_set_fog(false,c_black,0,0);
            d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
            d3d_set_hidden(false);
            switch par_var.mon_var.object_index
            {
                case gel_obj:
                {
                    /*draw_set_blend_mode(bm_subtract);
                    draw_set_color(c_white-make_color_rgb(74,144,101));
                    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
                    draw_set_color(c_white);
                    draw_set_blend_mode(bm_normal);*/
                    draw_set_blend_mode(bm_add);
                    draw_background_stretched_ext(par_var.mon_var.overlay_bg_var,view_wview[view_current]*-0.15,0,view_wview[view_current]*2.15,view_hview[view_current],c_white,0.5);
                    draw_set_blend_mode(bm_normal);
                    break;
                }
                case bug_obj:
                {
                    draw_set_blend_mode(bm_add);
                    draw_set_color(make_color_rgb(45,43,3));
                    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
                    draw_set_color(c_white);
                    draw_set_blend_mode(bm_normal);
                    break;
                }
                /*case ringu_obj:
                {
                    draw_set_blend_mode(bm_add);
                    draw_sprite_tiled_ext(spr_var,spr_id_var,0,y,1,1,image_blend,0.625);
                    draw_set_blend_mode(bm_normal);
                    break;
                }*/
                case bab_obj:
                {
                    draw_set_blend_mode(bm_add);
                    draw_sprite_stretched_ext(par_var.mon_var.overlay_spr_var,0,0,0,view_wview[view_current],view_hview[view_current],c_white,0.25);
                    draw_set_blend_mode(bm_normal);
                    break;
                }
                case para_obj:
                {
                    local.per = par_var.mon_var.target_dist_var/par_var.mon_var.state_dist_var[2];
                    draw_sprite_stretched_ext(par_var.mon_var.spr_overlay_var,2,0,0,view_wview[view_current],view_hview[view_current],c_white,local.per-0.4);
                    draw_sprite_stretched_ext(par_var.mon_var.spr_overlay_var,1,0,0,view_wview[view_current],view_hview[view_current],c_white,local.per-0.2);
                    draw_sprite_stretched_ext(par_var.mon_var.spr_overlay_var,0,0,0,view_wview[view_current],view_hview[view_current],c_white,local.per);
                    if par_var.mon_var.state_var == 2 // Leech
                    {
                        draw_set_color(c_red); draw_set_alpha(local.per-0.5);
                        draw_rectangle(0,0,view_xview[view_current]+view_wview[view_current],view_yview[view_current]+view_hview[view_current],false);
                        draw_set_color(c_white); draw_set_alpha(1);
                    }
                    break;
                }
                case fd_obj:
                {
                    draw_set_blend_mode(bm_add);
                    draw_background_stretched_ext(lens_02_bg,0,0,view_wview[view_current],view_hview[view_current],c_white,0.5);
                    draw_set_blend_mode(bm_normal);
                    break;
                }
                case killer_obj:
                {
                    draw_set_blend_mode(bm_add);
                    draw_set_color(make_color_rgb(63,0,0));
                    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
                    draw_set_color(c_white);
                    draw_set_blend_mode(bm_normal);
                    // Other
                    draw_background_ext(bar_bg,91*scale_var,57*scale_var,scale_var,scale_var,0,c_white,1);
                    local.width = background_get_width(bar_stam_bg)*par_var.mon_var.stam_var/par_var.mon_var.stam_max_var;
                    draw_background_part_ext(bar_stam_bg,background_get_width(bar_stam_bg)-local.width,0,local.width,20,99*scale_var,96*scale_var,scale_var,scale_var,c_white,1);
                    local.width = background_get_width(bar_hp_bg)*median(0,1,par_var.mon_var.dur_var/par_var.mon_var.dur_start_var);
                    draw_background_part_ext(bar_hp_bg,background_get_width(bar_hp_bg)-local.width,0,local.width,27,99*scale_var,62*scale_var,scale_var,scale_var,c_white,1);
                    draw_background_ext(bar_icon_bg,37*scale_var,34*scale_var,scale_var,scale_var,0,c_white,1);
                    break;
                }
            }
            if !par_var.mon_var.on_var || par_var.mon_var.enter_var
            {
                draw_set_color(c_black);
                draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
                draw_set_color(c_white);
            }
        }
        d3d_set_hidden(true);
    }
');