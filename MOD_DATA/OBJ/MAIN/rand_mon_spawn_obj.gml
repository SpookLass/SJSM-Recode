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
    if local.mons < get_mult_scr() && !global.no_mon_var
    {
        if global.count_var <= 0
        {
            if global.mult_type_var == 3 // Hardest
            {
                ds_list_clear(global.mon_spawn_list);
                ds_list_copy(global.mon_spawn_list,global.mon_list);
                for (local.i=0; local.i<ds_list_size(global.mon_curr_list); local.i+=1;)
                {
                    local.mon = ds_list_find_value(global.mon_curr_list,local.i);
                    if local.mon.dupe_var < global.dupe_var
                    {
                        local.index = ds_list_find_index(global.mon_spawn_list,local.mon);
                        if local.index != -1 { ds_list_delete(global.mon_spawn_list,local.index); }
                    }
                }
                while ds_list_size(global.mon_spawn_list) > 0 && local.mons < get_mult_scr()
                {
                    local.mon = ds_list_find_value(global.mon_spawn_list,irandom(local.size-1));
                    ds_list_add(global.mon_curr_list,local.mon);
                    if local.mon.dupe_var < global.dupe_var
                    {
                        local.index = ds_list_find_index(global.mon_spawn_list,local.mon);
                        if local.index != -1 { ds_list_delete(global.mon_spawn_list,local.index); }
                    }
                    instance_create(0,0,local.mon);
                    local.mons += 1;
                }
                global.count_var = get_count_scr();
            }
            else
            {
                if !irandom(global.mon_chance_var-1-global.mon_fail_var)
                {
                    ds_list_clear(global.mon_spawn_list);
                    ds_list_copy(global.mon_spawn_list,global.mon_list);
                    for (local.i=0; local.i<ds_list_size(global.mon_curr_list); local.i+=1;)
                    {
                        local.mon = ds_list_find_value(global.mon_curr_list,local.i);
                        if local.mon.dupe_var < global.dupe_var
                        {
                            local.index = ds_list_find_index(global.mon_spawn_list,local.mon);
                            if local.index != -1 { ds_list_delete(global.mon_spawn_list,local.index); }
                        }
                    }
                    local.size = ds_list_size(global.mon_spawn_list);
                    if local.size > 0
                    {
                        local.mon = ds_list_find_value(global.mon_spawn_list,irandom(local.size-1));
                        ds_list_add(global.mon_curr_list,local.mon);
                        instance_create(0,0,local.mon);
                        global.count_var = get_count_scr();
                        global.mon_fail_var = 0;
                    }
                }
                else { global.mon_fail_var += 1; }
            }
        }
        else { global.count_var = max(0,global.count_var-1); }
    }
");
// Try summon
object_event_add
(argument0,ev_other,ev_user0,"
    ds_list_clear(global.mon_spawn_list);
    ds_list_copy(global.mon_spawn_list,global.mon_list);
    for (local.i=0; local.i<ds_list_size(global.mon_curr_list); local.i+=1;)
    {
        local.mon = ds_list_find_value(global.mon_curr_list,local.i);
        if local.mon.dupe_var >= global.dupe_var
        {
            local.index = ds_list_find_index(global.mon_spawn_list,local.mon);
            if local.index != -1 { ds_list_delete(global.mon_spawn_list,local.index); }
        }
    }
    local.size = ds_list_size(global.mon_spawn_list);
    if local.size > 0
    {
        local.mon = ds_list_find_value(global.mon_spawn_list,irandom(local.size-1));
        ds_list_add(global.mon_curr_list,local.mon);
        instance_create(0,0,local.mon);
        global.count_var = get_count_scr();
        global.mon_fail_var = 0;
    }
");