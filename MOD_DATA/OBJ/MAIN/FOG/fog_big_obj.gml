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
(argument0,ev_create,0,"
    fog_var = true;
    fog_color_var = c_black;
    fog_start_var = 32;
    fog_end_var = 200;
    fog_dark_var = true;
    event_inherited();
");
// Draw event
object_event_add
(argument0,ev_draw,0,"
    local.per = median(0,1,1-(abs(global.cam_z_var[view_current])/256));
    fog_start_var = 32*local.per;
    fog_end_var = 200*local.per;
    event_perform(ev_other,ev_user0);
");