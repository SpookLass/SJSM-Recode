// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = background_get_texture(taker_dead_3d_obj.spot_bg_var);
    event_inherited();
    solid_var = false;
    type_var = 4; // Floor
    w_var = 32;
    l_var = 32;
');
// Turn on
object_event_add
(argument0,ev_other,ev_user0,'
    visible = true;
    fmod_snd_3d_play_scr(taker_dead_3d_obj.spot_snd_var,x,y,z);
');