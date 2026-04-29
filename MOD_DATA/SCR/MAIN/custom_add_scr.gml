/*
Argument 0: Variable Name
Argument 1: Name
Argument 2: Description
Argument 3: Translate
Argument 4: Type
    0: custom_enum_const
    1: custom_num_const
    2: custom_clamp_num_const
    3: custom_max_clamp_num_const
    4: custom_min_clamp_num_const
    5: custom_str_const
    6: custom_type_const
    7: custom_state_const
Argument 5: Min Clamp
Argument 6: Max Clamp
Argument 7: Wrap
Argument 8: Category
Argument 9: Has Descriptions
Add save file setting
*/
// Main
custom_arr[global.custom_len_var,0] = argument0; // Variable name
custom_arr[global.custom_len_var,1] = argument1; // Name
custom_arr[global.custom_len_var,2] = argument2; // Description
custom_arr[global.custom_len_var,3] = argument3; // Translate name and descripion
custom_arr[global.custom_len_var,4] = argument4; // Type
custom_arr[global.custom_len_var,5] = argument5; // Min
custom_arr[global.custom_len_var,6] = argument6; // Max
custom_arr[global.custom_len_var,7] = argument7; // Wrap
custom_arr[global.custom_len_var,8] = argument8; // Category (Main)
custom_arr[global.custom_len_var,9] = argument9; // Has Description Array
global.custom_len_var += 1;
return global.custom_len_var-1;