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
mad_clock_big_coll[1] = mad_clock_coll[1]*15;
mad_clock_big_coll[2] = mad_clock_coll[2]*15;
mad_clock_big_coll[3] = mad_clock_coll[3]*15;
mad_clock_big_coll[0] = prop_to_coll_scr(7,'',mad_clock_big_coll[2],mad_clock_big_coll[3],mad_clock_big_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    local.scale = 15; // 20
    w_var *= local.scale;
    h_var *= local.scale;
    l_var *= local.scale;
    dist_var *= local.scale;
    hand_h_var *= local.scale;
    minute_hand_w_var *= local.scale;
    minute_hand_h_var *= local.scale;
    hour_hand_w_var *= local.scale;
    hour_hand_h_var *= local.scale;
    z = -hand_h_var+64; // 304
    // Collisions
    coll_var[0] = mad_clock_big_coll[0];
    coll_var[1] = mad_clock_big_coll[1];
    coll_var[2] = mad_clock_big_coll[2];
    coll_var[3] = mad_clock_big_coll[3];
');