// Builtin Variables
object_set_depth(argument0,-4);
object_set_mask(argument0,noone);
object_set_parent(argument0,fog_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    fog_var = true;
    fog_color_var = c_dkgray; // c_black for flashlight
    fog_start_var = 0;
    fog_end_var = 360; // 96 for flashlight, 128 for flashlight 2
    fog_dark_var = true;
    event_inherited();
    wall_num_var = 6;
    wall_start_var = 24;
    wall_end_var = 64;
    image_blend = make_color_rgb(192,192,192); // 98, 57, 57 for flashlight
    image_alpha = 0.1; // 0.15 for flashlight
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    d3d_transform_set_identity();
    d3d_transform_add_rotation_y(global.cam_pitch_var[view_current]);
    d3d_transform_add_rotation_z(global.cam_yaw_var[view_current]);
    d3d_transform_add_translation(global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    if fog_type_var == 1 { d3d_set_fog(false,c_black,0,0); }
    for (local.i=0; local.i<wall_num_var; local.i+=1;)
    {
        local.scale = tan(degtorad(global.cam_fov_var[view_current]/2));
        local.dist = lerp_scr(wall_end_var,wall_start_var,local.i/wall_num_var);
        local.height = local.scale*local.dist;
        local.width = local.height*view_wview[view_current]/view_hview[view_current];
        d3d_draw_wall(local.dist,-local.width,local.height,local.dist,local.width,-local.height,white_bg_tex,1,1);
    }
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
    if fog_type_var == 1 { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
')