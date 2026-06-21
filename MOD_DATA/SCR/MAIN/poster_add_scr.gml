/*
Argument 0: Path
Argument 1: Which one
Argument 2: Mode
*/
switch argument1
{
    case 0: // Poster 1
    {
        if argument2 < 0
        {
            for (local.i=0; local.i<global.mode_len_var; local.i+=1;)
            { ds_list_add(poster_01_arr[local.i],argument0); }
        }
        else { ds_list_add(poster_01_arr[argument2],argument0); }
        break;
    }
    case 1: // Poster 2
    {
        if argument2 < 0
        {
            for (local.i=0; local.i<global.mode_len_var; local.i+=1;)
            { ds_list_add(poster_02_arr[local.i],argument0); }
        }
        else { ds_list_add(poster_02_arr[argument2],argument0); }
        break;
    }
    default: // Both
    {
        if argument2 < 0
        {
            for (local.i=0; local.i<global.mode_len_var; local.i+=1;)
            {
                ds_list_add(poster_01_arr[local.i],argument0);
                ds_list_add(poster_02_arr[local.i],argument0);
            }
        }
        else
        {
            ds_list_add(poster_01_arr[argument2],argument0);
            ds_list_add(poster_02_arr[argument2],argument0);
        }
        break;
    }
}