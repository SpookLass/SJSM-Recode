// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if view_current == cam_id_var 
    {
        d3d_set_projection_ortho(0,0,1280,720,0);
        d3d_set_hidden(false);
        // Health and Stamina bars
        draw_background(bar_bg,91,57);
        local.width = background_get_width(bar_stam_bg)*player_obj.stam_var/player_obj.stam_max_var;
        draw_background_part(bar_stam_bg,background_get_width(bar_stam_bg)-local.width,0,local.width,20,99,96);
        local.width = background_get_width(bar_hp_bg)*player_obj.hp_var/player_obj.hp_max_var;
        draw_background_part(bar_hp_bg,background_get_width(bar_hp_bg)-local.width,0,local.width,27,99,62);
        draw_background(bar_icon_bg,37,34);
        // Health counter
        //draw_set_blend_mode_ext(bm_inv_dest_color,bm_zero);
        local.hp_str = string(round(player_obj.hp_var))+' / '+string(player_obj.hp_max_var);
        local.stam_str = string(round(player_obj.stam_var))+' / '+string(player_obj.stam_max_var);
        draw_set_valign(fa_middle);
        draw_set_color(make_color_rgb(30,0,50));
        for (local.i=0; local.i<4; local.i+=1;)
        {
            local.xtmp = lengthdir_x(1,local.i*90);
            local.ytmp = lengthdir_y(1,local.i*90);
            draw_text_transformed(107+local.xtmp,76+local.ytmp,local.hp_str,0.25,0.25,0);
            draw_text_transformed(107+local.xtmp,106+local.ytmp,local.stam_str,0.25,0.25,0);
        }
        
        draw_text_transformed(108,75,local.hp_str,0.25,0.25,0);
        draw_text_transformed(106,75,local.hp_str,0.25,0.25,0);
        draw_text_transformed(108,77,local.hp_str,0.25,0.25,0);
        
        draw_text_transformed(108,105,local.stam_str,0.25,0.25,0);
        draw_text_transformed(106,105,local.stam_str,0.25,0.25,0);
        draw_text_transformed(108,107,local.stam_str,0.25,0.25,0);
        draw_set_color(c_yellow);
        draw_text_transformed(107,76,local.hp_str,0.25,0.25,0);
        draw_text_transformed(107,106,local.stam_str,0.25,0.25,0);
        //draw_set_blend_mode(bm_normal);
        // Monster list
        draw_set_valign(fa_bottom);
        if instance_exists(mon_par_obj)
        {
            local.offset = 720-(instance_number(mon_par_obj)*54);
            with mon_par_obj
            {
                if string(name_var) != '0'
                {
                    draw_set_color(make_color_rgb(100,0,0));
                    draw_text_transformed(52,local.offset+2,name_var,0.75,0.75,0);
                    draw_set_color(c_white);
                    draw_text_transformed(54,local.offset,name_var,0.75,0.75,0);
                    local.offset += 54;
                }
            }
        }
        // Speed Count
        draw_set_halign(fa_right);
        if global.game_spd_var != 1
        {
            local.str = 'SPEED: '+string(global.game_spd_var);
            draw_set_color(make_color_rgb(100,0,0));
            draw_text_transformed(1224,668,local.str,0.75,0.75,0);
            draw_set_color(c_white);
            draw_text_transformed(1226,666,local.str,0.75,0.75,0);
        }
        draw_set_valign(fa_top);
        // Room Count
        local.str = 'ROOM: '+string(global.rm_count_var);
        draw_set_color(make_color_rgb(30,0,50));
        draw_text_transformed(1224,56,local.str,0.75,0.75,0);
        draw_set_color(c_yellow);
        draw_text_transformed(1226,54,local.str,0.75,0.75,0);
        draw_set_color(c_white); draw_set_halign(fa_left);
        // Debug text
        if global.debug_var
        {
            local.str = '
Position
    X: '+string(player_obj.x)+'
    Y: '+string(player_obj.y)+'
    Z: '+string(player_obj.z)+'
Movement
    X speed: '+string(player_obj.x_spd_var)+'
    Y speed: '+string(player_obj.y_spd_var)+'
    Z speed: '+string(player_obj.z_spd_var)+'
    Yaw: '+string(player_obj.yaw_var)+'
    Pitch: '+string(player_obj.pitch_var)+'
    On Floor: '+string(player_obj.on_floor_var)+'
Looking
    Eye Yaw: '+string(player_obj.eye_yaw_var)+'
    Eye Pitch: '+string(player_obj.eye_pitch_var)+'
Input
    Forward: '+string(global.forward_input_var)+'
    Backward: '+string(global.backward_input_var)+'
    Left: '+string(global.strafe_left_input_var)+'
    Right: '+string(global.strafe_right_input_var)+'
Taker
    Taker: '+string(player_obj.alarm_arr[3,0])+' / '+string(player_obj.alarm_arr[3,1])
            draw_text_transformed(0,128,local.str,0.25,0.25,0);
            d3d_set_hidden(true);
        }
    }
");