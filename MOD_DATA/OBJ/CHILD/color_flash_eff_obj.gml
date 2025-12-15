// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,flash_eff_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var || cam_id_var == -1
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_set_blend_mode(bm_subtract); draw_set_color(c_white-image_blend);
        draw_rectangle
        (
            view_xview[view_current],
            view_yview[view_current],
            view_xview[view_current]+view_wview[view_current],
            view_yview[view_current]+view_hview[view_current],
            false
        );
        draw_set_color(c_white); draw_set_blend_mode(bm_normal);
        d3d_set_hidden(true);
    }
');