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
    event_inherited();
    if instance_exists(load_par_obj) { if load_par_obj.cat_var { instance_destroy(); exit; }}
');
// User 0
object_event_add
(argument0,ev_other,ev_user0,'
    with instance_create(mark_arr[0,0],mark_arr[0,1],mad_cat_obj)
    {
        z = mark_arr[0,2];
        snd_id_var = 6;
        translate_id_var = "cat_01";
        on_var = false;
        event_user(1);
    }
    with fake_wall_obj
    {
        local.wall = id;
        with instance_create(x,y,mad_trim_doorframe_vert_obj)
        {
            z = local.wall.z;
            direction = local.wall.direction;
        }
        instance_destroy();
    }
    with load_par_obj { cat_var = true; }
');