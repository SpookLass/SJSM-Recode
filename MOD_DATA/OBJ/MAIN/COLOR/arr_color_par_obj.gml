// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,color_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    event_user(0);
');
object_event_add
(argument0,ev_other,ev_user0,'
    image_blend = color_arr[0];
    light_color_var = light_color_scr(color_arr[0]);
    if global.color_var < 2
    {
        with floor_par_obj { if color_var { image_blend = other.color_arr[mod_scr(floor(x/other.dist_var),other.color_len_var)]; }}
        with ceil_par_obj { if color_var { image_blend = other.color_arr[mod_scr(floor(x/other.dist_var),other.color_len_var)]; }}
        with wall_par_obj { if color_var { image_blend = other.color_arr[mod_scr(floor(x/other.dist_var),other.color_len_var)]; }}
        // Recode
        if global.color_var != 1
        {
            with axe_obj { if color_var { image_blend = other.image_blend; }}
            with prop_par_obj { if color_var { image_blend = other.color_arr[mod_scr(floor(x/other.dist_var),other.color_len_var)]; }}
            with enemy_par_obj { if color_var { image_blend = other.color_arr[mod_scr(floor(x/other.dist_var),other.color_len_var)]; }}
            with light_floor_par_obj { if color_var { image_blend = light_color_scr(other.color_arr[mod_scr(floor(x/other.dist_var),other.color_len_var)]); }}
            with light_wall_par_obj { if color_var { image_blend = light_color_scr(other.color_arr[mod_scr(floor(x/other.dist_var),other.color_len_var)]); }}
            with light_torch_obj { if color_var { image_blend = light_color_scr(other.color_arr[mod_scr(floor(x/other.dist_var),other.color_len_var)]); }}
        }
        visible = false;
    }
');
// Room Start event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_user(0);
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if global.color_var <= 0 
    {
        with enemy_par_obj 
        {
            if color_var
            {
                image_blend = other.color_arr[mod_scr(floor(x/other.dist_var),other.color_len_var)];
            }
        }
    }
');
// Draw event
object_event_add
(argument0,ev_draw,0,'
    if global.color_var == 2 // HD style
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,1,1,0);
        d3d_set_hidden(false);
        // draw_set_blend_mode_ext(bm_dest_color,bm_src_color);
        draw_set_blend_mode(bm_subtract);
        draw_set_color(c_white-image_blend);
        draw_rectangle(0,0,1,1,false);
        draw_set_color(c_white);
        draw_set_blend_mode(bm_normal);
        d3d_set_hidden(true);
    }
');