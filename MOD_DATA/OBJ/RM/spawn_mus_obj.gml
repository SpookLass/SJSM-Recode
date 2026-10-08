/*
Argument 2: Load Parent
Argument 3: Sound Index
Argument 4: Priority
*/

// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,mus_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    par_var = '+string(argument2)+'
    snd_var = '+string(argument2.snd_arr_var[argument3,0])+'
    prio_var = '+string(argument4)+'
');