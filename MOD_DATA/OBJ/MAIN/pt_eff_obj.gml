// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Animate
    spr_var = static_01_spr;
    spr_spd_var = 0.1;
    spr_id_var = 0;
    // Set
    image_blend = make_color_rgb(179,179,179); // 178.5
    image_alpha = 0.1;
    image_xscale = 128;
    image_yscale = 384;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const
    {
        // Draw
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_spr_tiled_scale_ext_scr
        (
            spr_var,floor(spr_id_var),0,0,
            image_xscale,image_yscale,2,
            0,image_blend,image_alpha
        );
        d3d_set_hidden(true);
    }
');