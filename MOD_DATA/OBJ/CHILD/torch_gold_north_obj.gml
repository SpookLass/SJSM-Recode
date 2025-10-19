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
(argument0,ev_create,0,"
    gold_var = true;
    auto_var = true;
    color_var = false;
    local.light = instance_create(x+lengthdir_x(-1.5,direction+90),y+lengthdir_y(-1.5,direction+90),gold_part_obj);
    local.light.z += z;
    local.light.torch_var = id;
    event_inherited();
    store_tex_var = background_get_texture(torch_gold_bg);
    tex_var = store_tex_var;
");