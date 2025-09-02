// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
type_var
    0: Model. Uses model and model string to do rendering and collisions.
    1: Plane. Renders like a wall, but uses block collisions.
snap_var
    0: No snap
    1: Snap to floor
    2: Snap to ceiling
*/
// Create event
object_event_add
(argument0,ev_create,0,"
    solid_var = true;
    tex_var = stored_tex_var;
    if snap_var > 0
    {
        switch snap_var
        {
            case 1: { z = instance_nearest(x,y,floor_par_obj).z; break; }
            case 2: { z = instance_nearest(x,y,ceil_par_obj).z; break; }
        }
    }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    d3d_transform_set_identity();
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    switch type_var
    {
        case 0: { d3d_model_draw(mdl_var,0,0,0,tex_var); break; }
        case 1: { d3d_draw_wall(0,-w_var/2,h_var,0,w_var/2,0,tex_var,1,sign(h_var)); break; }
    }
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
");