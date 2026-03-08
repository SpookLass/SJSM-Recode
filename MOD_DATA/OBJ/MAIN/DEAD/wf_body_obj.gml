// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    // Draw
    bg_var = load_par_obj.bg_arr_var[0,0];
    str_var = global.player_name_var[global.menu_player_var];
    str_color_var = c_white;
    str_scale_var = 5/14;
    if global.player_len_var > 1 { str_color_var = global.player_color_var[global.menu_player_var]; }
    // Surface
    surf_w_var = 98;
    surf_h_var = 339;
    surf_var = surface_create(surf_w_var,surf_h_var);
    event_user(1);
    store_tex_var = surface_get_texture(surf_var);
    load_var = false;
    // Prop
    event_inherited();
    solid_var = false;
    type_var = 5; // Billboard
    w_var = 8; // 9.8
    h_var = 27.6; // 33.9
    z += 8.4;
    step_var = 8;
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
        surface_free(surf_var);
        load_var = false;
    }
');
// Redraw Surface
object_event_add
(argument0,ev_other,ev_user1,'
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    d3d_set_projection_ortho(0,0,surf_w_var,surf_h_var,0);
    d3d_set_hidden(false);
    d3d_set_fog(false,c_black,0,0);
    draw_background_stretched(bg_var,0,0,surf_w_var,surf_h_var);
    draw_set_color(str_color_var); draw_set_halign(fa_center);
    draw_text_transformed(surf_w_var/2,168,str_var,str_scale_var,str_scale_var,0);
    draw_set_color(c_white); draw_set_halign(fa_left);
    d3d_set_hidden(true);
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    surface_reset_target();
');