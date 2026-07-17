// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,mad_trim_side_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    z = -320;
    h_var = 640;
');
// Draw event
object_event_add
(argument0,ev_draw,0,'
    for (local.i=-10; local.i<10; local.i+=1;)
    {
        z = local.i*32;
        event_inherited();
    }
    z = -320;
');