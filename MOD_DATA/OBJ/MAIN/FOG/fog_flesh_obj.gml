// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,fog_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Draw event
object_event_add
(argument0,ev_draw,0,'
    if par_var.fog_consume_var[view_current]
    {
        global.fog_start_var = fog_start_consume_var;
        global.fog_end_var = fog_end_consume_var;
    }
    else
    {
        global.fog_start_var = fog_start_var;
        global.fog_end_var = fog_end_var;
    }
    event_inherited();
');