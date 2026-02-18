// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Make collisions
global.pole_wood_coll[1] = 64;
global.pole_wood_coll[2] = 2;
global.pole_wood_coll[3] = 2;
global.pole_wood_coll[0] = prop_to_coll_scr(2,'',global.pole_wood_coll[2],global.pole_wood_coll[3],global.pole_wood_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = wood_01_bg_tex;
    event_inherited();
    solid_var = true;
    type_var = 2;
    w_var = 2;
    l_var = 2;
    h_var = 64;
    // Collisions
    coll_var[0] = global.pole_wood_coll[0];
    coll_var[1] = global.pole_wood_coll[1];
    coll_var[2] = global.pole_wood_coll[2];
    coll_var[3] = global.pole_wood_coll[3];
');