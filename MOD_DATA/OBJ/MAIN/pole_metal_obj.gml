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
    global.pole_metal_coll[1] = 32;
    global.pole_metal_coll[2] = 2;
    global.pole_metal_coll[3] = 2;
    global.pole_metal_coll[0] = prop_to_coll_scr(2,'',global.pole_metal_coll[2],global.pole_metal_coll[3],global.pole_metal_coll[1]);
");
// Create event
object_event_add
(argument0,ev_create,0,"
    stored_tex_var = pole_metal_bg_tex;
    event_inherited();
    type_var = 2;
    w_var = 2;
    l_var = 2;
    h_var = 32;
    tex_h_var = 8;
    // Collisions
    coll_var[0] = global.pole_metal_coll[0];
    coll_var[1] = global.pole_metal_coll[1];
    coll_var[2] = global.pole_metal_coll[2];
    coll_var[3] = global.pole_metal_coll[3];
");