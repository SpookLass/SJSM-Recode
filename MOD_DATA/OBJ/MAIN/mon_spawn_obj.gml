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
        x = other.x;
        y = other.y;
        event_perform(ev_alarm,0);
        set_alarm_scr(0,-1);
        enter_var = false;
        if type_var > 0 { do_coll_var = mon_solid_const; }
    }
    instance_destroy();
');