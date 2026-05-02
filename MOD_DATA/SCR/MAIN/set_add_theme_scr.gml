/*
Argument 0: Name
Argument 1: Translate
Argument 2: Max
Argument 3: Category
*/
// Main
set_arr[global.set_len_var,0] = argument0+"_theme"; // Variable name
set_arr[global.set_len_var,1] = "mon_theme"; // Name
set_arr[global.set_len_var,2] = "mon_theme"; // Description
set_arr[global.set_len_var,3] = argument1; // Translate name and descripion
set_arr[global.set_len_var,4] = set_mon_enum_const; // Type
set_arr[global.set_len_var,5] = -2; // Min
set_arr[global.set_len_var,6] = argument2; // Min
set_arr[global.set_len_var,7] = true; // Wrap
set_arr[global.set_len_var,8] = argument3; // Category
set_arr[global.set_len_var,9] = false; // Is Player Specific
set_arr[global.set_len_var,10] = true; // Has Description Array
set_arr[global.set_len_var,11] = argument0; // Special
set_label_arr[global.set_len_var,0] = "rand"; // Value 1
set_desc_arr[global.set_len_var,0] = "theme_rand"; // Value 1
set_label_arr[global.set_len_var,1] = argument1; // Translate
set_desc_arr[global.set_len_var,1] = argument1; // Translate
set_label_arr[global.set_len_var,2] = "def"; // Value 1
set_desc_arr[global.set_len_var,2] = "theme_def"; // Value 1
set_label_arr[global.set_len_var,3] = argument1; // Translate
set_desc_arr[global.set_len_var,3] = argument1; // Translate
set_default_arr[global.set_len_var,0] = -1;
global.set_len_var += 1;
return global.set_len_var-1;