// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,table_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    if !irandom(1)
    {
        event_inherited();
        
    }
    else { instance_destroy(); }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    // Spawn note and candle
    if !irandom(1)
    {
        with instance_create(x,y,candle_obj)
        {
            z += other.h_var;
            light_var.z += other.h_var;
        }
    }
    else if !irandom(1) && !instance_exists(enemy_par_obj)
    {
        with instance_create(x,y,note_obj)
        { z += other.h_var; }
    }
');