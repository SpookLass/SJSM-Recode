// Builtin Variables
object_set_depth(argument0,-5);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    image_blend = c_black;
    image_alpha = 0.3;
');
// Draw event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_transform_set_identity();
        d3d_transform_set_rotation_y(global.cam_pitch_var[view_current]);
        d3d_transform_add_rotation_z(global.cam_yaw_var[view_current]);
        d3d_transform_add_translation(global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]);  
        draw_set_alpha(image_alpha); draw_set_color(image_blend);
        d3d_draw_ellipsoid(-20,-30,-20,150,30,20,white_bg_tex,1,1,8);
        d3d_draw_ellipsoid(-30,-25,-16,125,25,16,white_bg_tex,1,1,8);
        d3d_draw_ellipsoid(-40,-20,-12.5,100,20,12.5,white_bg_tex,1,1,8);
        d3d_draw_ellipsoid(-50,-15,-11.5,75,15,11.5,white_bg_tex,1,1,8);
        d3d_draw_ellipsoid(-60,-10,-10,50,10,10,white_bg_tex,1,1,8);
        draw_set_alpha(1); draw_set_color(c_white); d3d_transform_set_identity();
    }
');