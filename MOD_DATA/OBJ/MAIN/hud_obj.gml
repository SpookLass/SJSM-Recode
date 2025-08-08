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
        draw_background(bar_bg,91,57);
        local.width = background_get_width(bar_stam_bg)*player_obj.stam_var/player_obj.stam_max_var;
        draw_background_part(bar_stam_bg,background_get_width(bar_stam_bg)-local.width,0,local.width,20,99,96);
        local.width = background_get_width(bar_hp_bg)*player_obj.hp_var/player_obj.hp_max_var;
        draw_background_part(bar_hp_bg,background_get_width(bar_hp_bg)-local.width,0,local.width,27,99,62);
        draw_background(bar_icon_bg,37,34);
        local.str = '
Health: '+string(global.player_obj.hp_var)+'
Stamina: '+string(global.player_obj.stam_var)+'
X: '+string(global.player_obj.x)+'
Y: '+string(global.player_obj.y)+'
Z: '+string(global.player_obj.z)+'
X speed: '+string(global.player_obj.x_spd_var)+'
Y speed: '+string(global.player_obj.y_spd_var)+'
Z speed: '+string(global.player_obj.z_spd_var)+'
On Floor: '+string(global.player_obj.on_floor_var)+'
Forward: '+string(global.forward_input_var)+'
Backward: '+string(global.backward_input_var)+'
Left: '+string(global.strafe_left_input_var)+'
Right: '+string(global.strafe_right_input_var)
        draw_text(0,0,local.str);
    }
");