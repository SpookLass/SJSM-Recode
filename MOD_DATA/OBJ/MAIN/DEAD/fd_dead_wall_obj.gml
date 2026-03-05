// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Fake wall
globalvar fd_dead_wall_coll;
global.fd_dead_wall_coll[1] = 48;
global.fd_dead_wall_coll[2] = 32;
local.radius = global.fd_dead_wall_coll[2]/2;
global.fd_dead_wall_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_wall_scr(0,-local.radius,global.fd_dead_wall_coll[1],0,local.radius,0)
p3dc_end_mdl_scr();
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = background_get_texture(load_par_obj.bg_arr_var[0,0]);
    event_inherited();
    solid_var = true;
    type_var = 1;
    w_var = 32;
    h_var = 40;
    radius_var = 0;
    color_var = true;
    // Collisions
    coll_var[0] = fd_dead_wall_coll[0];
    coll_var[1] = fd_dead_wall_coll[1];
    coll_var[2] = fd_dead_wall_coll[2];
    coll_var[3] = 0;
');