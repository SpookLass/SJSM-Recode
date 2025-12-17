// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,lp_pic_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = sprite_get_texture(lp_spr,0);
    name_var = "Forksnapper";
    link_var = "https://www.youtube.com/watch?v=uhtE_I3YSWQ";
    // https://www.youtube.com/@forksnapper
    event_inherited();
');