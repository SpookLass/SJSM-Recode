// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
global.bone_coll[1] = 6.5;
global.bone_coll[2] = 12.1;
global.bone_coll[0] = prop_to_coll_scr(5,"",global.bone_coll[2],0,global.bone_coll[1],true,8);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = sprite_get_texture(bone_spr,irandom(sprite_get_number(bone_spr)-1));
    event_inherited();
    solid_var = false;
    type_var = 5; // Billboard
    w_var = 12.1;
    h_var = 6.5;
    step_var = 8;
    // Collisions
    coll_var[0] = global.bone_coll[0];
    coll_var[1] = global.bone_coll[1];
    coll_var[2] = global.bone_coll[2];
');