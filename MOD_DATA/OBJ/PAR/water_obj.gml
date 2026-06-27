// Builtin Variables
object_set_depth(argument0,-4);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    if !variable_local_exists("store_tex_var") { store_tex_var = water_bg_tex; }
    tex_var = store_tex_var;
    x = 0;
    y = 0;
    spd_mult_var = 0.6;
    spd_mult_deep_var = 0.6;
    deep_per_var = 0.5;
    grav_mult_var = 0.5;
    grav_mult_deep_var = 0;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    with player_obj
    {
        water_var = (z < other.z);
        if water_var
        {
            if z+(coll_var[1]*other.deep_per_var) <= other.z
            {
                spd_mult_var *= other.spd_mult_deep_var;
                grav_mult_var *= other.grav_mult_deep_var;
            }
            else
            {
                spd_mult_var *= other.spd_mult_var;
                grav_mult_var *= other.grav_mult_var;
            }
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_transform_set_identity();
    d3d_transform_set_translation(x,y,z);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_draw_floor(-32,-32,0,global.rm_size_var+32,global.rm_size_var+32,0,tex_var,(global.rm_size_var/32)+2,(global.rm_size_var/32)+2);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');