// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,js_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create event
object_event_add
(argument0,ev_create,0,'
    if !variable_local_exists("chance_num_var")
    {
        chance_num_var = 1;
        chance_den_var = 5;
    }
    if frac_chance_scr(chance_num_var,chance_den_var)
    {
        event_inherited();
        par_var = multi_js_obj;
        coll_var[3] = global.js_trig_coll[2];
    }
    else { instance_destroy(); }
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    for (local.i=0; local.i<global.js_mark_len_var; local.i+=1;)
    {
        if !global.js_mark_arr[local.i,4]
        {
            with instance_create(global.js_mark_arr[local.i,0],global.js_mark_arr[local.i,1],multi_js_obj)
            {
                z += global.js_mark_arr[local.i,2];
                base_dir_var += global.js_mark_arr[local.i,3];
                direction += global.js_mark_arr[local.i,3];
                trig_var = other.id;
            }
            global.js_mark_arr[local.i,4] = true;
        }
    }
');