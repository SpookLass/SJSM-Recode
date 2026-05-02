/*
Argument 0: Variable Name
Argument 1: Name
Argument 2: Description
Argument 3: Translate
Argument 4: Type
    0: set_enum_const
    1: set_num_const
    2: set_clamp_num_const
    3: set_max_clamp_num_const
    4: set_min_clamp_num_const
    5: set_str_const
    6: set_pointer_const
    7: set_input_const
    8: set_state_const
    9: set_mon_enum_const
Argument 5: Min Clamp
Argument 6: Max Clamp
Argument 7: Wrap
Argument 8: Category
Argument 9: Is Player Specific
Argument 10: Has Descriptions
Argument 11: Special 1
Add save file setting
*/
// Main
set_arr[global.set_len_var,0] = argument0; // Variable name
set_arr[global.set_len_var,1] = argument1; // Name
set_arr[global.set_len_var,2] = argument2; // Description
set_arr[global.set_len_var,3] = argument3; // Translate name and descripion
set_arr[global.set_len_var,4] = argument4; // Type
set_arr[global.set_len_var,5] = argument5; // Min
set_arr[global.set_len_var,6] = argument6; // Max
set_arr[global.set_len_var,7] = argument7; // Wrap
set_arr[global.set_len_var,8] = argument8; // Category
set_arr[global.set_len_var,9] = argument9; // Is Player Specific
set_arr[global.set_len_var,10] = argument10; // Has Description Array
set_arr[global.set_len_var,11] = argument11; // Special (Usually input or monster name)
global.set_len_var += 1;
return global.set_len_var-1;