// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    prio_var = 0;
    event_inherited();
    light_color_var = light_color_scr(image_blend);
    direction = random(360);
    dir_add_var = 3;
    //event_user(0);
    color_len_var = 6;
    color_arr_var[0] = make_color_rgb(32,26,30); // 201A1E
    color_arr_var[1] = make_color_rgb(173,94,215); // AD5ED7
    color_arr_var[2] = make_color_rgb(84,12,33); // 540C21
    color_arr_var[3] = make_color_rgb(233,49,42); // E9312A
    color_arr_var[4] = c_black; // Gave up
    color_arr_var[5] = make_color_rgb(98,89,108); // 62596C
');
object_event_add
(argument0,ev_step,ev_step_normal,'
    direction += dir_add_var*global.delta_time_var;
    with par_3d_obj
    {
        if color_var == 1 || (color_var > 0 && global.color_var != 1)
        {
            local.thing = other.color_len_var*(point_direction(other.x,other.y,x,y)+other.direction)/360;
            local.per = mod_scr(local.thing,1);
            local.indexa = mod_scr(floor(local.thing),other.color_len_var);
            local.indexb = mod_scr(ceil(local.thing),other.color_len_var);
            local.color = merge_color(other.color_arr_var[local.indexa],other.color_arr_var[local.indexb],local.per);
            if color_var == 3 { image_blend = light_color_scr(local.color); }
            else { image_blend = local.color; }
        }
    }
');
// Room Start event
object_event_add
(argument0,ev_other,ev_room_start,'event_user(0);');
// Draw event
object_event_add
(argument0,ev_draw,0,'
    if global.color_var // HD style
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