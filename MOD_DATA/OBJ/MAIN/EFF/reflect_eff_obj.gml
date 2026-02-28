// Builtin Variables
object_set_depth(argument0,4);
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
    if !variable_local_exists("reflect_axis_var") { reflect_axis_var = 2; }
    if !variable_local_exists("reflect_pos_var") { reflect_pos_var = 0; }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    global.reflect_var = true;
    global.reflect_pos_var = reflect_pos_var;
    global.reflect_axis_var = reflect_axis_var;
    with par_3d_obj
    {
        if reflect_var && object_index != other.object_index && visible
        { event_perform(ev_draw,0); }
    }
    global.reflect_var = false;
');