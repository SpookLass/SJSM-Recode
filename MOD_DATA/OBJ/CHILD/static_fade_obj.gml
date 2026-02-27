// Builtin Variables
object_set_depth(argument0,-101);
object_set_mask(argument0,noone);
object_set_parent(argument0,fade_eff_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    //Defaults
    static_color_var = c_white;
    spr_var = static_01_spr;
    spr_id_var = 0;
    spr_spd_var = 0.25;
    image_xscale = 128;
    image_yscale = 128;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    event_inherited();
    if view_current == cam_id_var || cam_id_var == -1
    {
        // Draw
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_spr_tiled_scale_ext_scr
        (
            spr_var,floor(spr_id_var),0,0,
            image_xscale,image_yscale,2,
            0,static_color_var,image_alpha
        );
        d3d_set_hidden(true);
    }
');