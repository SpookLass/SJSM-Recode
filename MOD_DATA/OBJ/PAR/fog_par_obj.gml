// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,noone);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,"
    event_perform(ev_step,ev_step_begin);
");
// Room start
object_event_add
(argument0,ev_other,ev_room_start,"
    event_perform(ev_step,ev_step_begin);
");
// Step event
object_event_add
(argument0,ev_step,ev_step_begin,"
    global.fog_var = fog_var;
    global.fog_color_var = fog_color_var;
    global.fog_start_var = fog_start_var;
    global.fog_end_var = fog_end_var;
    global.fog_dark_var = fog_dark_var;
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
");