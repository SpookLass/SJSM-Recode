// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
globalvar food_meat_coll;
food_meat_coll[1] = -30;
food_meat_coll[2] = 15;
food_meat_coll[0] = prop_to_coll_scr(5,"",food_meat_coll[2],0,food_meat_coll[1],true,8);
// Create event
object_event_add
(argument0,ev_create,0,'
    snap_var = 2; // Snap to ceiling
    event_inherited();
    solid_var = true;
    type_var = 5;
    w_var = 15;
    h_var = -30; // Hang down
    // Collisions
    coll_var[0] = food_meat_coll[0];
    coll_var[1] = food_meat_coll[1];
    coll_var[2] = food_meat_coll[2];
');