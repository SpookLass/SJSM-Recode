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
global.tree_pot_coll[1] = 3;
global.tree_pot_coll[2] = 4;
global.tree_pot_coll[3] = 4;
global.tree_pot_coll[0] = prop_to_coll_scr(3,'',global.tree_pot_coll[2],global.tree_pot_coll[3],global.tree_pot_coll[1],true,8);
p3dc_set_trimask_scr(mask_basic_const);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = save_ped_01_bg_tex;
    snap_var = 1;
    event_inherited();
    solid_var = true;
    type_var = 3;
    w_var = 4;
    l_var = 4;
    h_var = 3;
    tex_w_var = 1;
    step_var = 8;
    close_var = true;
    // Collisions
    coll_var[0] = global.tree_pot_coll[0];
    coll_var[1] = global.tree_pot_coll[1];
    coll_var[2] = global.tree_pot_coll[2];
    coll_var[3] = global.tree_pot_coll[3];
    // Tree
    with instance_create(x,y,tree_obj)
    {
        par_var = other.id;
        z += other.z+other.h_var;
    }
');