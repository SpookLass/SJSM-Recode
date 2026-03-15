// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,torch_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    direction = 270;
    gold_var = true;
    color_var = false;
    auto_var = true;
    do_light_var = false;
    store_tex_var = sprite_get_texture(gold_lamp_spr,0);
    event_inherited();
    spr_var = gold_lamp_spr;
    mdl_var = lamp_mdl;
    mdl_path_var = lamp_mdl_path;
    part_var = instance_create(x+lengthdir_x(-1.5,direction+90),y+lengthdir_y(-1.5,direction+90),gold_part_obj);
    part_var.z += z;
    part_var.par_var = id;
');