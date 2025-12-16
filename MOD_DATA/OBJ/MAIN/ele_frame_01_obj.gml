// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
p3dc_set_trimask_scr(mask_metal_const);
global.ele_frame_02_coll[1] = 24;
global.ele_frame_02_coll[2] = 4;
global.ele_frame_02_coll[3] = 16;
global.ele_frame_02_coll[0] = prop_to_coll_scr(12,'',global.ele_frame_02_coll[2],global.ele_frame_02_coll[3],global.ele_frame_02_coll[1]);
p3dc_set_trimask_scr(mask_basic_const);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = metal_01_bg_tex;
    event_inherited();
    solid_var = true;
    no_grid_var = true;
    w_var = 4;
    h_var = 24;
    l_var = 16;
    type_var = 12;
    // Collisions
    coll_var[0] = global.ele_frame_02_coll[0];
    coll_var[1] = global.ele_frame_02_coll[1];
    coll_var[2] = global.ele_frame_02_coll[2];
    coll_var[3] = global.ele_frame_02_coll[3];
');