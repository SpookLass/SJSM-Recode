// Builtin Variables
object_set_depth(argument0,1);
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
    x = 0;
    y = 0;
    z -= 1;
    rate_var = 2400;
    mult_var = 12;
    store_tex_var = water_bg_tex;
    tex_var = store_tex_var;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    time_var = (time_var+global.delta_time_var) mod rate_var;
    y = sin((2*time_var*pi)/rate_var)*mult_var;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
    d3d_transform_set_identity();
    d3d_transform_set_translation(x,y,z);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_draw_floor(-32,-32,0,room_width+32,room_height+32,0,tex_var,(room_width/32)+2,(room_height/32)+2);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
    if global.fog_dark_var 
    { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
');