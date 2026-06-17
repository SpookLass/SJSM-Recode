// Builtin Variables
object_set_depth(argument0,1);
object_set_mask(argument0,noone);
object_set_parent(argument0,water_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = water_bg_tex;
    event_inherited();
    z -= 1;
    rate_var = 2400;
    mult_var = 12;
    time_var = 0;
    deep_per_var = 0;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    time_var = (time_var+global.delta_time_var) mod rate_var;
    y = sin((2*time_var*pi)/rate_var)*mult_var;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.fog_dark_var
    {
        d3d_set_fog(false,c_black,0,0);
        event_inherited();
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    }
    else { event_inherited(); }
');