// Builtin Variables
object_set_depth(argument0,99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    prio_var = 0;
    event_inherited();
    if !variable_local_exists("fog_var") { fog_var = false; }
    if !variable_local_exists("fog_color_var") { fog_color_var = c_black; }
    if !variable_local_exists("fog_start_var") { fog_start_var = 0; }
    if !variable_local_exists("fog_end_var") { fog_end_var = 0; }
    if !variable_local_exists("fog_dark_var") { fog_dark_var = false; }
    event_user(0);
');
// Room start
object_event_add
(argument0,ev_other,ev_room_start,'
    event_user(0);
');
// Set fog
object_event_add
(argument0,ev_other,ev_user0,'
    global.fog_var = fog_var;
    global.fog_color_var = fog_color_var;
    global.fog_start_var = fog_start_var;
    global.fog_end_var = fog_end_var;
    global.fog_dark_var = fog_dark_var;
    background_color = global.fog_color_var;
    window_set_color(global.fog_color_var);
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
');
// Draw event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const { global.fog_var = fog_var; }
    else { global.fog_var = false; }
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
');