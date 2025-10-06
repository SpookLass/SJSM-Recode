switch (global.count_type)
{
    case 0: // Random, Recode
    {
        return irandom_range(global.count_min_var,global.count_max_var);
        break;
    }
    case 1: { return global.count_max_var; break; } // Max, OG
    case 2: { return global.count_min_var; break; } // Min, HD
    case 3: // Taper Random, Plus
    {
        return random_range(global.count_max_var,lerp_scr
        (
            global.count_max_var,
            global.count_min_var,
            median
            (
                0,
                1,
                (global.room_var-global.count_start)/(global.count_end-global.count_start)
            )
        )); 
        break;
    }
    case 4: // Taper, Old Plus
    {
        return lerp_scr
        (
            global.count_max_var,
            global.count_min_var,
            median
            (
                0,
                1,
                (global.room_var-global.count_start)/(global.count_end-global.count_start)
            )
        ); 
        break;
    }
}