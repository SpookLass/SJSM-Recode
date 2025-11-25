// Builtin Variables
object_set_depth(argument0,98);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Draw Skybox
object_event_add
(argument0,ev_other,ev_user0,'
    d3d_draw_wall(-dist_var,dist_var,dist_var,dist_var,dist_var,-dist_var,side_tex_var,1,1);
    d3d_draw_wall(-dist_var,-dist_var,dist_var,dist_var,-dist_var,-dist_var,side_tex_var,1,1);
    d3d_draw_wall(dist_var,-dist_var,dist_var,dist_var,dist_var,-dist_var,side_tex_var,1,1);
    d3d_draw_wall(-dist_var,-dist_var,dist_var,-dist_var,dist_var,-dist_var,side_tex_var,1,1);
    d3d_draw_floor(-dist_var,-dist_var,-dist_var,dist_var,dist_var,-dist_var,top_tex_var,1,1);
    d3d_draw_floor(-dist_var,-dist_var,dist_var,dist_var,dist_var,dist_var,top_tex_var,1,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_hidden(false);
    d3d_set_fog(false,c_black,0,0);
    d3d_transform_set_identity();
    d3d_transform_add_translation(global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]);
    event_user(0);
    d3d_transform_set_identity();
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    d3d_set_hidden(true);
');