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
        // Room Count
        local.str = 'ROOM: '+string(global.rm_count_var);
        draw_set_halign(fa_right); draw_set_color(make_color_rgb(30,0,50));
        draw_text_transformed(1224,56,local.str,0.75,0.75,0);
        draw_set_color(c_yellow);
        draw_text_transformed(1226,54,local.str,.75,0.75,0);
        draw_set_color(c_white); draw_set_halign(fa_left);
        // Debug text
        if global.debug_var
        {
            local.str = '
Player Stats
    Health: '+string(player_obj.hp_var)+'
    Stamina: '+string(player_obj.stam_var)+'
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
            draw_text_transformed(0,96,local.str,0.25,0.25,0);
            d3d_set_hidden(true);
        }
    }
");