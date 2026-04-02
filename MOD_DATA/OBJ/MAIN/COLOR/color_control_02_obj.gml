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
(argument0,ev_create,0,'
    event_inherited();
    // Im gonna plusinate!
    if !irandom(63)
    {
        local.len = 0;
        // Trans day of visibility
        if (current_month == 3 && current_day == 31) || global.pride_var == 2
        { local.arr[local.len] = global.trans_arr[irandom(global.trans_len_var-1)]; local.len += 1; }
        // Pride Month!
        else if current_month == 6 || global.pride_var == 1 { local.arr[local.len] = global.pride_arr[irandom(global.pride_len_var-1)]; local.len += 1; }
        // Halloween, Saint Patricks Day, or Halloween
        if current_month == 10 || global.halloween_var || (current_month == 3 && current_day == 17) || ds_list_find_index(global.zone_var,med_01_rm) != -1
        { local.arr[local.len] = med_color_obj; local.len += 1; }
        // Halloween or Purple
        if current_month == 10 || global.halloween_var || ds_list_find_index(global.zone_var,purp_01_rm) != -1 { local.arr[local.len] = purp_color_obj; local.len += 1; }
        // Halloween
        if current_month == 10 || global.halloween_var { local.arr[local.len] = lass_color_obj; local.len += 1; }
        if local.len > 0 { instance_create(0,0,local.arr[irandom(local.len-1)]); }
    }
    else if frac_chance_scr(2,3) { instance_create(0,0,choose(dark_color_obj,dark_rand_color_obj)); }
');
// Room Start
// Despite the depth being super low, it still doesnt run last, weird
object_event_add
(argument0,ev_other,ev_room_start,'
    if frac_chance_scr(4,9) { with torch_obj { if !gold_var { on_var = false; }} }
');