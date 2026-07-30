/*
Argument 0: Previous / Current Elevator room
Returns next locale room, which must be stored.
*/
local.next = ele_next_scr(argument0);
local.progress = ele_prog_scr(argument0);
if ds_list_size(locale_list) > 0
{
    switch global.locale_type_var
    {
        case 0: // Scripted
        {
            if locale_arr[global.main_type_var,global.mode_var] > 0
            {
                if local.progress < ds_list_size(locale_arr[global.main_type_var,global.mode_var])
                { return ds_list_find_value(locale_arr[global.main_type_var,global.mode_var],local.progress); }
            }
        }
        case 1: // Minimum
        {
            return median(argument0+2,local.next-2,argument0+global.locale_rand_min_var);
        }
        case 2: // Random
        {
            local.minimum = median(argument0+2,local.next-2,argument0+global.locale_rand_min_var);
            local.maximum = median(argument0+2,local.next-2,argument0+global.locale_rand_max_var);
            return irandom_range(local.minimum,local.maximum);
        }
        case 3: // Random (Subtractive)
        {
            local.maximum = local.next-global.locale_rand_max_var;
            local.minimum = argument0+global.locale_rand_min_var;
            local.maximum = median(argument0+2,local.next-2,max(local.minimum,local.maximum));
            local.minimum = median(argument0+2,local.next-2,min(local.maximum,local.minimum));
            return irandom_range(local.minimum,local.maximum);
        }
    }
}
