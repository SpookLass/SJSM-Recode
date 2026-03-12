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
    store_tex_var = sprite_get_texture(dev_spr,7);
    name_var = "Baka-Chan
by the way, when potatoes invented hashbrowns they did it because they loved mankind and wanted us to be happy, just like jesus. potatoes is like jesus to me";
    link_var = "https://karamari.straw.page/";
    event_inherited();
');