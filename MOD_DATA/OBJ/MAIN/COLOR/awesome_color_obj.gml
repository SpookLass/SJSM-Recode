// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,color_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    time_var = (time_var+global.delta_time_var) mod 255;
    image_blend = make_color_hsv(time_var,255,255);
    if global.color_var < 2
    {
        with (floor_par_obj) { image_blend = make_color_hsv((other.time_var+x+y) mod 255,255,255); }
        with (ceil_par_obj) { image_blend = make_color_hsv((other.time_var+x+y) mod 255,255,255); }
        with (wall_par_obj) { image_blend = make_color_hsv((other.time_var+x+y) mod 255,255,255); }
        // Recode
        if global.color_var != 1
        {
            with prop_par_obj { if color_var { image_blend = make_color_hsv((other.time_var+x+y) mod 255,255,255); }}
            with echidna_obj { if color_var { image_blend = make_color_hsv((other.time_var+x+y) mod 255,255,255); }}
            with light_floor_par_obj { if color_var { image_blend = make_color_hsv((other.time_var+x+y) mod 255,191,255); }}
            with light_wall_par_obj { if color_var { image_blend = make_color_hsv((other.time_var+x+y) mod 255,191,255); }}
            with light_torch_obj { if color_var { image_blend = make_color_hsv((other.time_var+x+y) mod 255,191,255); }}
        }
    }
");