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
    image_blend = make_color_rgb(251,255,143);
    image_alpha = 0;
    alpha_01_var = 0;
    alpha_02_var = 0;
    alpha_03_var = 0;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if instance_exists(play_var) { per_var = play_var.hp_infect_var/play_var.hp_max_var; }
    else { per_var = 1; }
    image_alpha = per_var-0.5;
    alpha_01_var = per_var;
    alpha_02_var = per_var-0.2;
    alpha_03_var = per_var-0.4;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const && (view_current == cam_id_var || cam_id_var == -1)
    {
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_sprite_stretched_ext(spr_var,2,0,0,view_wview[view_current],view_hview[view_current],c_white,alpha_03_var);
        draw_sprite_stretched_ext(spr_var,1,0,0,view_wview[view_current],view_hview[view_current],c_white,alpha_02_var);
        draw_sprite_stretched_ext(spr_var,0,0,0,view_wview[view_current],view_hview[view_current],c_white,alpha_01_var);
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        draw_rectangle(0,0,view_xview[view_current]+view_wview[view_current],view_yview[view_current]+view_hview[view_current],false);
        draw_set_color(c_white); draw_set_alpha(1);
        d3d_set_hidden(true);
    }
');