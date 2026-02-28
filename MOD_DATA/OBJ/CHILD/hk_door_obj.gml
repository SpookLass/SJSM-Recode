// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,door_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    color_var = 3;
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if global.fog_dark_var { d3d_set_fog(false,c_black,0,1); }
	event_inherited();
    draw_set_alpha(image_alpha);
    if tone_var >= 0 { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    d3d_transform_set_identity();
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    d3d_model_draw(mdl_02_var,0,0,0,tex_02_var);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
    if global.fog_dark_var { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
');