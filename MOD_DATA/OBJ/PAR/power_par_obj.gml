// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    if !variable_local_exists("player_var") { player_var = player_obj; }
    if !variable_local_exists("dur_var") { dur_var = -1; }
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    if dur_var > 0
    {
        dur_var -= 1;
        if dur_var <= 0
        {
            instance_destroy();
            exit;
        }
    }
    event_inherited();
');