// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
global.rail_coll[1] = 14;
global.rail_coll[2] = 6;
global.rail_coll[3] = 32;
global.rail_coll[0] = prop_to_coll_scr(1,'',global.rail_coll[3],0,global.rail_coll[1],false,0,global.rail_coll[2]/2);
p3dc_set_trimask_scr(mask_metal_const);
global.rail_metal_coll[0] = prop_to_coll_scr(1,'',global.rail_coll[3],0,global.rail_coll[1],false,0,global.rail_coll[2]/2);
p3dc_set_trimask_scr(mask_basic_const);
// Messy
global.rail_coll[3] += global.rail_coll[2];
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    solid_var = true;
    type_var = 1;
    w_var = 32;
    h_var = 14;
    radius_var = 3;
    // Collisions
    coll_var[0] = global.rail_coll[0];
    coll_var[1] = global.rail_coll[1];
    coll_var[2] = global.rail_coll[2];
    coll_var[3] = global.rail_coll[3];
');