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
    ds_list_clear(mon_curr_list);
    local.mons = 0;
    local.nospawn = global.no_mon_var;
    with mon_par_obj
    {
        ds_list_add(mon_curr_list,id);
        local.mons += 1;
        if intro_var || boss_var
        { local.nospawn = true; }
    }
    local.mult = get_mult_scr();
    if global.mult_type_var == 3 && local.mult < 0 { local.mult = 5; }
    if (local.mons < local.mult || local.mult < 0) && !local.nospawn && ds_list_size(mon_list) > 0
    {
        if global.count_var <= 0
        {
            // Unified
            local.spawnmons = 0;
            local.bool = (global.mult_type_var == 3);
            if !local.bool { local.bool = (!irandom(global.mon_chance_var+(global.mon_chance_mult_var*local.mons)-1-global.mon_fail_var)); }
            if local.bool
            {
                // Create spawn list
                ds_list_clear(mon_spawn_list);
                ds_list_copy(mon_spawn_list,mon_list);
                // Check dupes, blacklists, and whitelists
                for (local.i=0; local.i<ds_list_size(mon_curr_list); local.i+=1;)
                {
                    with ds_list_find_value(mon_curr_list,local.i)
                    {
                        if global.dupe_var == dupe_never_const || dupe_var == dupe_never_const
                        || (global.dupe_var == dupe_canon_const && dupe_var != dupe_canon_const)
                        { list_remove_value_scr(mon_spawn_list,object_index,true); }
                        if blacklist_var != noone { list_remove_list_scr(mon_spawn_list,blacklist_var,true); }
                        if whitelist_var != noone { list_whitelist_scr(mon_spawn_list,whitelist_var); }
                    }
                }
                // Monsters to spawn
                if global.mult_type_var == 3 { local.spawn = -1; }
                else { local.spawn = 1; }
                // Size
                local.size = ds_list_size(mon_spawn_list);
                if local.size > 0
                {
                    // Freeze handling
                    fmod_update_take_over_when_lock_scr();
                    // Loop
                    while local.size > 0
                    && (local.mons < local.mult || local.mult < 0)
                    && (local.spawnmons < local.spawn || local.spawn < 0)
                    {
                        local.mon = noone;
                        with instance_create(0,0,ds_list_find_value(mon_spawn_list,irandom(local.size-1)))
                        {
                            // Double check spawn
                            if blacklist_var != noone
                            {
                                if list_has_list_scr(mon_curr_list,blacklist_var,false)
                                {
                                    list_remove_value_scr(mon_spawn_list,object_index,true);
                                    instance_destroy();
                                    break;
                                }
                            }
                            if whitelist_var != noone
                            {
                                if list_not_whitelist_scr(mon_curr_list,whitelist_var)
                                {
                                    list_remove_value_scr(mon_spawn_list,object_index,true);
                                    instance_destroy();
                                    break;
                                }
                            }
                            // Variables
                            local.mon = id;
                            local.mons += 1;
                            local.spawnmons += 1;
                            // Recalculate spawn list
                            ds_list_add(mon_curr_list,id);
                            if global.dupe_var == dupe_never_const || dupe_var == dupe_never_const
                            || (global.dupe_var == dupe_canon_const && dupe_var != dupe_canon_const)
                            { list_remove_value_scr(mon_spawn_list,object_index,true); }
                            if blacklist_var != noone { list_remove_list_scr(mon_spawn_list,blacklist_var,true); }
                            if whitelist_var != noone { list_whitelist_scr(mon_spawn_list,whitelist_var); }
                        }
                        local.size = ds_list_size(mon_spawn_list);
                    }
                    // Freeze handling
                    io_handle();
                    global.last_time_var = current_time;
                    fmod_update_take_over_done_scr();
                }
            }
            // Set variables
            if local.spawnmons > 0
            {
                if global.reset_spd_var > 0 && global.game_spd_var > 1
                { global.game_spd_var = 1; fmod_group_set_pitch_scr(0,global.game_spd_var); }
                global.count_var = get_count_scr();
                global.mon_fail_var = 0;
            }
            else { global.mon_fail_var += 1; }
        }
        else { global.count_var = max(0,global.count_var-1); }
    }
    ds_list_sort(mon_curr_list,true);
');