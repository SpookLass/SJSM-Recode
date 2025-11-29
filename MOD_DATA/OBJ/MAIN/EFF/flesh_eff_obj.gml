// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const
    {
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false); draw_set_blend_mode_ext(bm_dest_color,bm_src_color);
        draw_background_stretched_ext(bg_var,0,0,view_wview[view_current],view_hview[view_current],image_blend,image_alpha);
        d3d_set_hidden(true); draw_set_blend_mode(bm_normal);
    }
');