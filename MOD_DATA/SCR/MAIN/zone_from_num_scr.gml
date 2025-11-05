/*
Argument 0: Zone to load (Does not accept -1)
Loads a zone directly and resets the room list
*/
global.zone_num_var = median(0,global.zone_len_var+global.story_zone_len_var-1,argument0);
if global.zone_num_var < global.zone_len_var { local.zone = global.zone_arr[global.zone_num_var]; }
else { local.zone = global.story_zone_arr[global.zone_num_var-global.zone_len_var]; }
if local.zone != global.zone_var { global.zone_var = local.zone; zone_reset_scr(); }