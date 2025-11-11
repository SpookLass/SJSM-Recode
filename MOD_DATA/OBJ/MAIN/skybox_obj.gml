// Builtin Variables
object_set_depth(argument0,98);
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
    side_tex_var = sky_01_bg_tex;
    top_tex_var = sky_02_bg_tex;
    dist_var = 16;
');
// Destroy Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    fmod_inst_stop_scr(snd_var);
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    //dist_var = sqrt(power(global.cam_end_var,2)/3)-1;
    snd_var = fmod_snd_loop_scr(rain_snd);
');
// Room End
object_event_add
(argument0,ev_other,ev_room_end,'
    fmod_inst_stop_scr(snd_var);
    event_inherited();
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_hidden(false);
    d3d_set_fog(false,c_black,0,0);
    d3d_transform_set_identity();
    d3d_transform_add_translation(global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]);
    d3d_draw_wall(-dist_var,dist_var,dist_var,dist_var,dist_var,-dist_var,side_tex_var,1,1);
    d3d_draw_wall(-dist_var,-dist_var,dist_var,dist_var,-dist_var,-dist_var,side_tex_var,1,1);
    d3d_draw_wall(dist_var,-dist_var,dist_var,dist_var,dist_var,-dist_var,side_tex_var,1,1);
    d3d_draw_wall(-dist_var,-dist_var,dist_var,-dist_var,dist_var,-dist_var,side_tex_var,1,1);
    d3d_draw_floor(-dist_var,-dist_var,-dist_var,dist_var,dist_var,-dist_var,top_tex_var,1,1);
    d3d_draw_floor(-dist_var,-dist_var,dist_var,dist_var,dist_var,dist_var,top_tex_var,1,1);
    d3d_transform_set_identity();
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    d3d_set_hidden(true);
');