// Builtin Variables
object_set_depth(argument0,98);
object_set_mask(argument0,noone);
object_set_parent(argument0,skybox_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    top_tex_var = white_bg_tex;
    bottom_tex_var = white_bg_tex;
    side_tex_var = sky_03_bg_tex;
    top_color_var = make_color_rgb(163,90,255);
    bottom_color_var = make_color_rgb(203,223,152);
    type_var = 1;
    dist_var = 128;
    h_var = 133;
    z_off_var = -4;
    step_var = 12;
    with rain_part_obj { instance_destroy(); }
');
// Draw Skybox
object_event_add
(argument0,ev_other,ev_user0,'
    d3d_transform_add_translation(0,0,z_off_var);
    draw_set_color(bottom_color_var);
    d3d_draw_floor(-dist_var,-dist_var,0,dist_var,dist_var,0,bottom_tex_var,1,1);
    draw_set_color(top_color_var);
    d3d_draw_floor(-dist_var,-dist_var,h_var,dist_var,dist_var,h_var,top_tex_var,1,1);
    draw_set_color(c_white);
    d3d_draw_cylinder(-dist_var,-dist_var,h_var,dist_var,dist_var,0,side_tex_var,4,1,false,step_var);
');