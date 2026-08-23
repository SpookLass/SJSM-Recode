object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,spawn_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,'
    if global.diff_var == 0 { instance_destroy(); exit; }
    event_inherited();
');
// User 0
object_event_add
(argument0,ev_other,ev_user0,'
    with mon_spawn_locale_scr(bug_obj,lab_hole_obj.x,lab_hole_obj.y,lab_hole_obj.z+lab_hole_obj.h_var-16,1);
    {
        z += spawn_dist_var;
        hole_x_var = x;
        hole_y_var = y;
        hole_z_var = lab_hole_obj.z+16;
        event_user(15);
    }
    with spawn_door_trig_obj { lock_var = true; }
');