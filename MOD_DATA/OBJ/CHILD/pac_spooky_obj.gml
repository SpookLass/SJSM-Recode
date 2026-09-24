// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,pac_ghost_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    base_spr_var = par_var.spooky_spr_var;
    eye_spr_var = par_var.spooky_eye_spr_var;
    scare_base_spr_var = base_spr_var;
    scare_eye_spr_var = eye_spr_var;
    smart_var = true;
');