// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,fog_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    fog_var = true;
    fog_color_var = c_red;
    per_var = 0;
    fog_start_min_var = 0;
    fog_start_max_var = 32;
    fog_end_min_var = 128;
    fog_end_max_var = 320;
    fog_dark_var = false;
    event_user(1);
    event_inherited();
');
// Calculate Fog
object_event_add
(argument0,ev_other,ev_user1,'
    fog_start_var = lerp_scr(fog_start_max_var,fog_start_min_var,per_var);
    fog_end_var = lerp_scr(fog_end_max_var,fog_end_min_var,per_var);
    event_user(0);
');
    