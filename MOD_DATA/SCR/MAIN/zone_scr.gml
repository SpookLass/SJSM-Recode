/*
Argument 0: Zone to load (-1 for default)
*/
if argument0 < 0
{
    if global.mode_var == 0 // Story Mode
    {
        switch floor(global.rm_count_var/50)
        {
            case 0: { global.zone_var = global.story_zone_arr[0]; break; } // 0-49
            case 1: { global.zone_var = global.story_zone_arr[1]; break; } // 50-99
            case 2: case 3: { global.zone_var = global.story_zone_arr[2]; break; } // 100-199
            case 4: case 5: { global.zone_var = global.story_zone_arr[3]; break; } // 200-299
            case 6: case 7: { global.zone_var = global.story_zone_arr[4]; break; } // 300-399
            case 8: case 9: { global.zone_var = global.story_zone_arr[5]; break; } // 400-499
            case 10: case 11: { global.zone_var = global.story_zone_arr[6]; break; } // 500-599
            case 12: case 13: { global.zone_var = global.story_zone_arr[7]; break; } // 600-699
            case 14: case 15: { global.zone_var = global.story_zone_arr[8]; break; } // 700-799
            case 16: case 17: { global.zone_var = global.story_zone_arr[9]; break; } // 800-899
            case 18: case 19: { global.zone_var = global.story_zone_arr[10]; break; } // 800-899
            default: { global.zone_var = global.story_zone_arr[0]; break; } // 0- & 1000+
        }
    }
    else { global.zone_var = global.zone_arr[irandom(global.zone_len_var-1)]; }
}
else
{
    local.zone = median(0,global.zone_len_var+global.story_zone_len_var-1,argument0);
    if local.zone < global.zone_len_var { global.zone_var = global.zone_arr[local.zone]; }
    else { global.zone_var = global.story_zone_arr[local.zone-global.zone_len_var]; }
}
ds_list_clear(global.rm_list_var);
ds_list_copy(global.rm_list_var,global.zone_var);
ds_list_shuffle(global.rm_list_var);
local.rm = ds_list_find_value(global.rm_list_var,0);
ds_list_delete(global.rm_list_var,0);
room_goto_scr(local.rm);