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
    if ds_list_find_index(global.mon_list,bug_obj) < 0
    { ds_list_add(global.mon_list,bug_obj); }
    with spawn_door_trig_obj { lock_var = true; }
    with instance_create(0,0,bug_obj)
    {
        hole_x_var = lab_hole_obj.x;
        hole_y_var = lab_hole_obj.y;
        hole_z_var = lab_hole_obj.z+lab_hole_obj.h_var-16;
        event_user(15);
    }
');