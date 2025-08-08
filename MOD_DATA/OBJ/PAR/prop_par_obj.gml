// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    solid_var = true;
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    d3d_transform_set_identity();
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_model_draw(mdl_var,0,0,0,tex_var);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
");