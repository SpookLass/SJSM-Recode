// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
execute_string
("
    global.engine_coll[1] = 24;
    global.engine_coll[2] = 16;
    global.engine_coll[3] = 16;
    global.engine_coll[0] = prop_to_coll_scr(3,'',global.engine_coll[2],global.engine_coll[3],global.engine_coll[1],false,8);
");
// Create event
object_event_add
(argument0,ev_create,0,"
    store_tex_var = machine_02_bg_tex;
    event_inherited();
    solid_var = true;
    type_var = 3;
    w_var = 16;
    l_var = 16;
    h_var = 24;
    tex_w_var = 4;
    step_var = 8;
    close_var = false;
    // Collisions
    coll_var[0] = global.engine_coll[0];
    coll_var[1] = global.engine_coll[1];
    coll_var[2] = global.engine_coll[2];
    coll_var[3] = global.engine_coll[3];
");