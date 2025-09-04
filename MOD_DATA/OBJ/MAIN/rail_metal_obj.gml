// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
execute_string
("
    global.rail_metal_coll[1] = 14;
    global.rail_metal_coll[2] = 32;
    global.rail_metal_coll[0] = prop_to_coll_scr(1,'',global.rail_metal_coll[2],0,global.rail_metal_coll[1],false,0,3);
");
// Create event
object_event_add
(argument0,ev_create,0,"
    stored_tex_var = rail_metal_bg_tex;
    event_inherited();
    solid_var = true;
    type_var = 1;
    w_var = 32;
    h_var = 14;
    radius_var = 3;
    // Collisions
    coll_var[0] = global.rail_metal_coll[0];
    coll_var[1] = global.rail_metal_coll[1];
    coll_var[2] = global.rail_metal_coll[2];
");