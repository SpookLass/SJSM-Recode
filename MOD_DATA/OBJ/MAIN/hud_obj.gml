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
(argument0,ev_create,0,"
    event_perform(ev_other,ev_room_start);
    ini_open(global.lang_var);
	rm_str_var = ini_read_string('UI','rm','UI_rm');
    hp_str_var = ini_read_string('UI','hp','UI_hp');
    stam_str_var = ini_read_string('UI','stam','UI_stam');
    spd_str_var = ini_read_string('UI','spd','UI_spd');
    health_str_var = ini_read_string('UI','health','UI_health');
    stamina_str_var = ini_read_string('UI','stamina','UI_stamina');
	ini_close();
    
");
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,"
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
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if view_current == par_var.cam_id_var 
    {
        d3d_set_projection_ortho
        (
            view_xview[view_current],
            view_yview[view_current],
            view_xview[view_current]+view_wview[view_current],
            view_yview[view_current]+view_hview[view_current],
            0
        );
        d3d_set_hidden(false);
        // Taker!
        if par_var.alarm_arr[3,0] < par_var.alarm_arr[3,1]/2
        {
            draw_set_blend_mode(bm_subtract);
            if par_var.alarm_arr[3,0] <= 0 { local.value = 255; }
            else { local.value = lerp_scr(255,0,median(0,1,2*par_var.alarm_arr[3,0]/par_var.alarm_arr[3,1])); }
            draw_set_color(make_color_rgb(0,local.value,local.value));
            draw_rectangle
            (
                view_xview[view_current],
                view_yview[view_current],
                view_xview[view_current]+view_wview[view_current],
                view_yview[view_current]+view_hview[view_current],
                false
            );
            draw_set_color(c_white);
            draw_set_blend_mode(bm_normal);
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
            local.str = 'TPS: '+string(fps)+' | FPS: '+string(global.fps_curr_var);
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
                local.hp_str = hp_str_var+': '+string(round(par_var.hp_var))+' / '+string(par_var.hp_max_var);
                local.stam_str = stam_str_var+': '+string(round(par_var.stam_var))+' / '+string(par_var.stam_max_var);
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
                local.hp_str = health_str_var+': '+string(round(par_var.hp_var));
                local.stam_str = stamina_str_var+': '+string(round(par_var.stam_var));
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
        if global.mon_hud_var && instance_exists(mon_par_obj)
        {
            local.offset = bottom_var-((instance_number(mon_par_obj)-1)*36*scale_var);
            with mon_par_obj
            {
                if string(name_var) != '0'
                {
                    local.str = name_var;
                    if global.mon_hud_var == 2 { local.str += ': '+string(dur_var); }
                    draw_set_color(make_color_rgb(30,0,50));
                    draw_text_transformed(other.left_var-other.shadow_off_var,local.offset+other.shadow_off_var,local.str,other.scale_med_var,other.scale_med_var,0);
                    draw_set_color(c_yellow);
                    draw_text_transformed(other.left_var,local.offset,local.str,other.scale_med_var,other.scale_med_var,0);
                    local.offset += other.scale_var*36;
                }
            }
        }
        // Speed Count
        draw_set_halign(fa_right);
        if global.game_spd_var != 1
        {
            local.str = spd_str_var+': '+string(global.game_spd_var);
            draw_set_color(make_color_rgb(100,0,0));
            draw_text_transformed(right_var-shadow_off_var,bottom_var+shadow_off_var,local.str,scale_med_var,scale_med_var,0);
            draw_set_color(c_white);
            draw_text_transformed(right_var,bottom_var,local.str,scale_med_var,scale_med_var,0);
        }
        draw_set_valign(fa_top);
        // Room Count
        local.str = rm_str_var+': '+string(global.rm_count_var);
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
        if global.debug_var
        {
            local.str = '
Position
    X: '+string(par_var.x)+'
    Y: '+string(par_var.y)+'
    Z: '+string(par_var.z)+'
Movement
    X speed: '+string(par_var.x_spd_var)+'
    Y speed: '+string(par_var.y_spd_var)+'
    Z speed: '+string(par_var.z_spd_var)+'
    Yaw: '+string(par_var.yaw_var)+'
    Pitch: '+string(par_var.pitch_var)+'
    On Floor: '+string(par_var.on_floor_var)+'
Looking
    Eye Yaw: '+string(par_var.eye_yaw_var)+'
    Eye Pitch: '+string(par_var.eye_pitch_var)+'
Clear Time
    Room Size: '+string(path_get_length(par_var.path_var))+'
    Clear Time: '+string(par_var.rm_clear_time_var)+'
Taker
    Taker: '+string(par_var.alarm_arr[3,0])+' / '+string(par_var.alarm_arr[3,1])
            draw_text_transformed(0,128*scale_var,local.str,scale_small_var,scale_small_var,0);
            d3d_set_hidden(true);
        }
    }
");