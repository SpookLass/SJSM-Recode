// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,mad_clock_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
globalvar mad_clock_big_coll;
mad_clock_big_coll[1] = 480;
mad_clock_big_coll[2] = 180;
mad_clock_big_coll[3] = 180;
mad_clock_big_coll[0] = prop_to_coll_scr(7,'',mad_clock_big_coll[2],mad_clock_big_coll[3],mad_clock_big_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    w_var = 180;
    h_var = 480;
    l_var = 180;
    z = -304;
    dist_var = 1;
    hand_h_var = 390.9375;
    minute_hand_w_var = 45;
    minute_hand_h_var = 120;
    hour_hand_w_var = 30;
    hour_hand_h_var = 90;
    // Collisions
    coll_var[0] = mad_clock_big_coll[0];
    coll_var[1] = mad_clock_big_coll[1];
    coll_var[2] = mad_clock_big_coll[2];
    coll_var[3] = mad_clock_big_coll[3];
');