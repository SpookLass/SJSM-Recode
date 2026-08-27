// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,light_torch_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    if instance_exists(load_par_obj) { spr_var = load_par_obj.ben_flame_spr; }
    z = 15;
    h_var = 12;
    w_var = 8;
    spr_spd_var = 1/6;
    par_var = noone;
    inst_var = noone;
');