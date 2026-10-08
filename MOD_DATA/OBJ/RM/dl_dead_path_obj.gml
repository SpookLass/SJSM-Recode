// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
// global.dl_dead_path_coll[0] = prop_to_coll_scr(0,main_directory_const+"\MDL\DEAD\dl_dead_path_mdl.gmmod");
globalvar dl_dead_path_coll;
global.dl_dead_path_coll[1] = 32;
global.dl_dead_path_coll[2] = 64;
global.dl_dead_path_coll[3] = 64;
local.width = global.dl_dead_path_coll[2]/2;
local.length = global.dl_dead_path_coll[3]/2;
global.dl_dead_path_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_floor_scr(-local.width,-local.length,0,local.width,local.length,0);
p3dc_add_wall_scr(-local.width,-local.length,0,local.width,-local.length,global.dl_dead_path_coll[1]);
p3dc_add_wall_scr(-local.width,local.length,0,local.width,local.length,global.dl_dead_path_coll[1]);
p3dc_end_mdl_scr();
// Create event
object_event_add
(argument0,ev_create,0,'
    par_var = '+string(argument2)+'
    store_tex_var = '+string(argument2.bg_arr_var[argument3,4])+'
    mdl_var = '+string(argument.mdl_arr_var[argument4,0])+'
    mdl_path_var = '+string(argument.mdl_arr_var[argument4,1])+'
    event_inherited();
    solid_var = true;
    // For grid (I dont really know how wide it is)
    w_var = 64;
    l_var = 64;
    h_var = 32;
    // Collisions
    coll_var[0] = global.dl_dead_path_coll[0];
    coll_var[1] = global.dl_dead_path_coll[1];
    coll_var[2] = global.dl_dead_path_coll[2];
    coll_var[3] = global.dl_dead_path_coll[3];
');