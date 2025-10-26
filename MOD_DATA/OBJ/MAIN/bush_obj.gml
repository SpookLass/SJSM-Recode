// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    store_tex_var = sprite_get_texture(bush_spr,irandom(sprite_get_number(bush_spr)-1));
    event_inherited();
    solid_var = false;
    type_var = 5; // Billboard
    w_var = 16;
    h_var = 16;
");