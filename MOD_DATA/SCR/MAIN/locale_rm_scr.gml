/*
Argument 0: Previous / Current Elevator room
Argument 1: Next Elevator Room
*/
switch global.locale_type_var
{
    case 0: // Scripted
    {
        if global.locale_var <= ds_list_size(locale_arr[global.type_var,global.mode_var])
        { return ds_list_find_value(locale_arr[global.type_var,global.mode_var],global.locale_var); }
    }
    case 1: // Minimum
    {
        return median(argument0+2,argument1-2,argument0+global.locale_rand_min_var);
    }
    case 2: // Random
    {
        local.minimum = median(argument0+2,argument1-2,argument0+global.locale_rand_min_var);
        local.maximum = median(argument0+2,argument1-2,argument0+global.locale_rand_max_var);
        return irandom_range(local.minimum,local.maximum);
    }
    case 3: // Random (Subtractive)
    {
        local.maximum = argument1-global.locale_rand_max_var;
        local.minimum = argument0+global.locale_rand_min_var;
        local.maximum = median(argument0+2,argument1-2,max(local.minimum,local.maximum));
        local.minimum = median(argument0+2,argument1-2,min(local.maximum,local.minimum));
        return irandom_range(local.minimum,local.maximum);
    }
}