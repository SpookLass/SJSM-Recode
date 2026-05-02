/*
Argument 0: Setting ID
Argument 1: Default 1
Argument 2: 
    0: Unique Defaults
    1: Same as Argument 1
    2: Same as Argument 3
Argument 3+: Defaults (only 1 is used if not player specific)
*/
set_default_arr[argument0,0] = argument1;
if set_arr[argument0,9]
{
    switch argument2
    {
        case 0:
        {
            set_default_arr[argument0,1] = argument3;
            set_default_arr[argument0,2] = argument4;
            set_default_arr[argument0,3] = argument5;
            set_default_arr[argument0,4] = argument6;
            set_default_arr[argument0,5] = argument7;
            set_default_arr[argument0,6] = argument8;
            set_default_arr[argument0,7] = argument9;
            break;
        }
        case 1:
        {
            for (local.i=1; local.i<8; local.i+=1;)
            { set_default_arr[argument0,local.i] = argument1; }
            break;
        }
        case 2:
        {
            for (local.i=1; local.i<8; local.i+=1;)
            { set_default_arr[argument0,local.i] = argument3; }
            break;
        }
    }
}