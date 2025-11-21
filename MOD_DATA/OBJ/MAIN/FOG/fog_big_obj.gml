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
    fog_color_var = c_black;
    fog_base_start_var = 80;
    fog_base_end_var = 320;
    fog_start_var = fog_base_start_var; // OG: 32, HD: 106.r6
    fog_end_var = fog_base_end_var; // OG: 200, HD: 320?
    fog_dark_var = true;
    event_inherited();
');
// Draw event
object_event_add
(argument0,ev_draw,0,'
    local.per = median(0,1,1-(abs(global.cam_z_var[view_current])/320));
    global.fog_start_var = fog_base_start_var*local.per;
    global.fog_end_var = fog_base_end_var*local.per;
    event_inherited();
');