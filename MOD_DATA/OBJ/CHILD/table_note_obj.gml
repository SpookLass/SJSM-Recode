// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,table_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    if global.note_override_var
    {
        local.num = global.note_override_num_var;
        local.den = global.note_override_den_var;
    }
    else
    {
        local.num = !instance_exists(enemy_par_obj);
        local.den = 1;
    }
    if frac_chance_scr(local.num,local.den) && is_string(note_scr()) && !instance_exists(note_obj)
    {
        with instance_create(x,y,note_obj)
        { z += other.h_var; }
    }
');