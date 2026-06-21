object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    load_var = false;
    if (global.mode_var != 0 || global.rm_count_var > 100)
    && ds_list_size(poster_02_arr[global.mode_var]) > 0 && frac_chance_scr(2,3)
    {
        if global.mode_var == 0
        {
            local.rand = 0;
            if global.rm_count_var >= 500 { local.rand = irandom(ds_list_size(poster_02_arr[global.mode_var])-1); }
            else if global.rm_count_var >= 400 { local.rand = irandom(1); }
            local.path = ds_list_find_value(poster_02_arr[global.mode_var],local.rand);
        }
        else { local.path = ds_list_find_value(poster_02_arr[global.mode_var],irandom(ds_list_size(poster_02_arr[global.mode_var])-1)); }
        bg_var = bg_add_scr(local.path,false,false);
        load_var = true;
        store_tex_var = background_get_texture(bg_var);
        event_inherited();
        type_var = 10;
        dist_var = 0.1;
        direction = 0;
        w_var = 12;
        h_var = 17.2;
        z = 11;
    }
    else { instance_destroy(); }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Room end event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// Delete Event
object_event_add
(argument0,ev_other,ev_user0,'
    if load_var
    {
        background_delete(bg_var);
        load_var = false;
    }
');