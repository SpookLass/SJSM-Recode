// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,door_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    par_var = '+string(argument2)+'
    store_tex_var = '+string(argument2.bg_arr_var[argument3,4])+'
    tex_var = store_tex_var;
    type_var = 10; // Single Plane
    w_var = 14;
    h_var = 23;
    dist_var = 0.1;
    spot_var = false;
');
// Draw event
object_event_add
(argument0,ev_draw,0,'
    if spot_var && global.fog_dark_var
    {
        d3d_set_fog(false,c_black,0,0);
        event_inherited();
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    }
    else { event_inherited(); }
');