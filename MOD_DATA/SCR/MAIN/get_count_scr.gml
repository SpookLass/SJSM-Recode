switch (global.count_type)
{
    case 0: // Plus
    {
        return lerp_scr
        (
            global.count_min_var,
            global.count_max_var,
            median
            (
                0,
                1,
                (global.room_var-global.count_start)/(global.count_end-global.count_start)
            )
        ); 
        break;
    }
    case 1: { return global.count_max_var; break; } // OG
    case 2: { return global.count_min_var; break; } // HD
}