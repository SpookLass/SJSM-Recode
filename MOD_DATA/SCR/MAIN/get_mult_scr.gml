switch (global.mult_type)
{
    case 0: // Plus
    {
        return lerp_scr
        (
            global.mult_min_var,
            global.mult_max_var,
            median
            (
                0,
                1,
                (global.room_var-global.mult_start)/(global.mult_end-global.mult_start)
            )
        ); 
        break;
    }
    case 1: { return global.mult_min_var; break; } // OG
    case 3: // HARDEST
    case 2: { return global.mult_max_var; break; } // HD
}