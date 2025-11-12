// Builtin Variables
object_set_depth(argument0,99);
object_set_mask(argument0,noone);
object_set_parent(argument0,noone);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add // ev_create,0
(argument0,ev_other,ev_room_start,'
    ds_list_clear(global.mon_curr_list);
    local.mons = 0;
    with mon_par_obj
    {
        ds_list_add(global.mon_curr_list,id);
        local.mons += 1;
        if intro_var || boss_var
        { local.nospawn = true; }
    }
    if local.mons < get_mult_scr() && !global.no_mon_var && !local.nospawn
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
                    if global.dupe_var == dupe_never_const || local.mon.dupe_var == dupe_never_const
                    || (global.dupe_var == dupe_canon_const && local.mon.dupe_var != dupe_canon_const)
                    {
                        local.index = ds_list_find_index(global.mon_spawn_list,local.mon.object_index);
                        if local.index != -1 { ds_list_delete(global.mon_spawn_list,local.index); }
                    }
                }
                local.size = ds_list_size(global.mon_spawn_list);
                while local.size > 0 && local.mons < get_mult_scr()
                {
                    local.mon = instance_create(0,0,ds_list_find_value(global.mon_spawn_list,irandom(local.size-1)));
                    if global.dupe_var == dupe_never_const || local.mon.dupe_var == dupe_never_const
                    || (global.dupe_var == dupe_canon_const && local.mon.dupe_var != dupe_canon_const)
                    {
                        local.index = ds_list_find_index(global.mon_spawn_list,local.mon.object_index);
                        if local.index != -1 { ds_list_delete(global.mon_spawn_list,local.index); }
                        local.size = ds_list_size(global.mon_spawn_list)
                    }
                    local.mons += 1;
                    if global.reset_spd_var > 0 && global.game_spd_var > 1
                    { global.game_spd_var = 1; fmod_group_set_pitch_scr(0,global.game_spd_var); }
                }
                global.count_var = get_count_scr();
            }
            else
            {
                if !irandom(global.mon_chance_var+(global.mon_chance_mult_var*local.mons)-1-global.mon_fail_var)
                {
                    ds_list_clear(global.mon_spawn_list);
                    ds_list_copy(global.mon_spawn_list,global.mon_list);
                    for (local.i=0; local.i<ds_list_size(global.mon_curr_list); local.i+=1;)
                    {
                        local.mon = ds_list_find_value(global.mon_curr_list,local.i);
                        if global.dupe_var == dupe_never_const || local.mon.dupe_var == dupe_never_const
                        || (global.dupe_var == dupe_canon_const && local.mon.dupe_var != dupe_canon_const)
                        {
                            local.index = ds_list_find_index(global.mon_spawn_list,local.mon.object_index);
                            if local.index != -1 { ds_list_delete(global.mon_spawn_list,local.index); }
                        }
                    }
                    local.size = ds_list_size(global.mon_spawn_list);
                    if local.size > 0
                    {
                        local.mon = instance_create(0,0,ds_list_find_value(global.mon_spawn_list,irandom(local.size-1)));
                        ds_list_add(global.mon_curr_list,local.mon);
                        global.count_var = get_count_scr();
                        global.mon_fail_var = 0;
                        if global.reset_spd_var > 0 && global.game_spd_var > 1
                        { global.game_spd_var = 1; fmod_group_set_pitch_scr(0,global.game_spd_var); }
                    }
                }
                else { global.mon_fail_var += 1; }
            }
        }
        else { global.count_var = max(0,global.count_var-1); }
    }
    ds_list_sort(global.mon_curr_list,true);
');
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