/*
Argument 0: Zone to load (-1 for default)
Argument 1: Go to room
Loads a zone, it's default, and automatically loads the room to prevent door shenanigans
*/
if argument0 < 0
{
    if global.mode_var == 0 // Story Mode
    {
        switch floor(global.rm_count_var/50)
        {
            case 0: { local.zone = 0; break; } // 0-49
            case 1: { local.zone = 1; break; } // 50-99
            case 2: case 3: { local.zone = 2; break; } // 100-199
            case 4: case 5: { local.zone = 3; break; } // 200-299
            case 6: case 7: { local.zone = 4; break; } // 300-399
            case 8: case 9: { local.zone = 5; break; } // 400-499
            case 10: case 11: { local.zone = 6; break; } // 500-599
            case 12: case 13: { local.zone = 7; break; } // 600-699
            case 14: case 15: { local.zone = 8; break; } // 700-799
            case 16: case 17: { local.zone = 9; break; } // 800-899
            case 18: case 19: { local.zone = 10; break; } // 800-899
            default: { local.zone = mod_scr((global.rm_count_var/100)+1,global.story_zone_len_var); break; } // 0- & 1000+
        }
        local.zone += global.zone_len_var;
    }
    else { local.zone = irandom(global.zone_len_var-1); }
}
else { local.zone = argument0; }
zone_from_num_scr(local.zone);
if argument1
{
    local.rm = ds_list_find_value(global.rm_list_var,0);
    ds_list_delete(global.rm_list_var,0);
    rm_goto_scr(local.rm);
}
