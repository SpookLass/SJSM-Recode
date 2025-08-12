// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,light_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    z = 21.2;
    h_var = 4.8;
    w_var = 3;
    spr_var = torch_spr;
    event_inherited();
");
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    spr_id_var = (spr_id_var+(global.delta_time_var/4)) mod sprite_get_number(spr_var);
    if gold_var && image_blend != c_white { image_blend = c_white; }
    visible = torch_var.on_var;
")
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
    d3d_transform_set_identity();
    d3d_transform_add_rotation_y(-point_direction_3d_scr(x,y,z,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]));
    d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
    d3d_transform_add_translation(x,y,z);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_draw_wall(0,-w_var/2,h_var/2,0,w_var/2,-h_var/2,sprite_get_texture(spr_var,spr_id_var),1,1);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
    if global.fog_dark_var 
    { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
");