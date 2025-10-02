// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,noone);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,"
    ds_list_clear(global.mon_curr_list);
    local.mons = 0;
    with mon_par_obj { ds_list_add(global.mon_curr_list,object_index); local.mons += 1; }
    if global.count_var <= 0
    {
        if !irandom(7) && local.mons < get_mult_scr() 
        {
            ds_list_clear(global.mon_spawn_list);
            ds_list_copy(global.mon_spawn_list,global.mon_list);
            for (local.i=0; local.i<ds_list_size(global.mon_curr_list); local.i+=1;)
            {
                local.index = ds_list_find_index(global.mon_spawn_list,ds_list_find_value(global.mon_curr_list,local.i));
                if local.index != -1 { ds_list_delete(global.mon_spawn_list,local.index); }
            }
            local.size = ds_list_size(global.mon_spawn_list);
            if local.size > 0
            {
                instance_create
                (
                    0,0
                    ds_list_find_value(global.mon_spawn_list,irandom(local.size-1))
                );
            }
        }
    }
    else if local.mons <= 0
    { global.count_var = max(0,global.count_var-1); }

");