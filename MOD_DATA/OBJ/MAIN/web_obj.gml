// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    snap_var = 2; // Snap to ceiling
    stored_tex_var = sprite_get_texture(web_spr,irandom(sprite_get_number(web_spr)-1));
    event_inherited();
    type_var = 1;
    w_var = 12;
    h_var = -16; // Hang down
    solid_var = false;
");