object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,spawn_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,'
    if global.diff_var == 0 { instance_destroy(); exit; }
    event_inherited();
');
// User 0
object_event_add
(argument0,ev_other,ev_user0,'
    mon_spawn_locale_scr
    (
        '+string(argument3)+', // Monster
        '+string(argument4)+', // X
        '+string(argument5)+', // Y
        '+string(argument6)+', // Z
        '+string(argument7)+' // Position
    );
    with spawn_door_trig_obj { lock_var = true; }
');