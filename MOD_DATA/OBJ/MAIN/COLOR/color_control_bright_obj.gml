// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create event
object_event_add
(argument0,ev_create,0,"
    // I'm gonna                                  !
    if frac_chance_scr(1,33333) && !instance_exists(mon_par_obj)
    {
        instance_create(3,3,w_mus_obj);
        with player_obj
        {
            local.eff = instance_create(3,3,w_eff_obj);
            local.eff.par_var = id;
            local.player = id;
            with hud_obj
            {
                if par_var == local.player
                { par_var = local.eff; }
            }
        }
    }
    // I'm gonna plusinate!
    else if !irandom(63)
    {
        local.len = 0;
        if current_month == 6 { local.arr[local.len] = global.pride_arr[irandom(global.pride_len_var-1)]; local.len += 1; }
        if current_month == 10 || ds_list_find_index(global.zone_var,med_01_rm) != -1 { local.arr[local.len] = med_color_obj; local.len += 1; }
        if current_month == 10 || ds_list_find_index(global.zone_var,purp_01_rm) != -1 { local.arr[local.len] = purp_color_obj; local.len += 1; }
        if current_month == 10 { local.arr[local.len] = lass_color_obj; local.len += 1; }
        if local.len > 0 { instance_create(0,0,local.arr[irandom(local.len-1)]); }
    }
");