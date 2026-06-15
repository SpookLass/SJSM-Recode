// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,fog_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Draw event
object_event_add
(argument0,ev_draw,0,'
    global.fog_var = fog_var;
    global.fog_color_var = fog_color_var;
    global.fog_dark_var = fog_dark_var;
    global.fog_start_var = fog_start_var;
    global.fog_end_var = fog_end_var;
    if instance_exists(water_obj)
    {
        if global.cam_z_var[view_current] < water_obj.z
        {
            global.fog_var = fog_water_var;
            global.fog_color_var = fog_water_color_var;
            global.fog_dark_var = fog_water_dark_var;
            local.per = anti_lerp_scr(-320,water_obj.z,global.cam_z_var[view_current]);
            global.fog_start_var = fog_water_start_var*local.per;
            global.fog_end_var = fog_water_end_var*local.per;
        }
    }
    background_color = global.fog_color_var;
    event_inherited();
');