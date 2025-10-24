// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Destroy
object_event_add
(argument0,ev_destroy,0,"
    event_user(0);
");
// Room end event
object_event_add
(argument0,ev_other,ev_room_end,"
    event_user(0);
");
// Delete sound
object_event_add
(argument0,ev_other,ev_user0,"
    if load_var
    {
        fmod_snd_free_scr(snd_var);
        bg_load_var = false;
    }
");