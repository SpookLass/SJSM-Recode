switch (global.mult_type_var)
{
    
    case 1: { return global.mult_min_var; break; } // Min, OG
    case 3: // HARDEST
    case 0: { return global.mult_max_var; break; } // Max, Recode & HD
    case 2: // Taper, Plus
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
}