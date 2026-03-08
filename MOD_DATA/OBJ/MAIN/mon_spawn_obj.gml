// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Room end event
object_event_add
(argument0,ev_other,ev_room_start,'
    with echidna_obj
    {
        on_var = true;
        enter_var = false;
        x = other.x;
        y = other.y;
    }
    instance_destroy();
');