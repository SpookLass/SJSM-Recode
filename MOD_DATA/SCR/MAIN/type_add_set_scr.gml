/*
Argument 0: Monster array ID
Argument 1: Variable Name
Argument 2: Description
Argument 3: Category
Argument 4: Can be disabled
Used to add monsters to the chase pool and CAT-DOS. This is required for your custom specimen to spawn. Unfortunately, individual behavior settings are not included.
Returns setting ID
*/
// Name
custom_arr[global.custom_len_var,0] = argument1; // Variable name
custom_arr[global.custom_len_var,1] = mon_arr[argument0,0]; // Name
custom_arr[global.custom_len_var,2] = argument2; // Description
custom_arr[global.custom_len_var,3] = mon_arr[argument0,1]; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 6; // Type (Type)
custom_arr[global.custom_len_var,8] = argument3; // Category
custom_arr[global.custom_len_var,9] = true; // Has Description Array
custom_arr[global.custom_len_var,10] = argument0; // Special 1 (Monster)
if argument4
{
    // Label
    custom_label_arr[global.custom_len_var,0] = "off"; // Value -2
    custom_label_arr[global.custom_len_var,1] = true; // Translate
    custom_label_arr[global.custom_len_var,2] = "rand"; // Value -1
    custom_label_arr[global.custom_len_var,3] = true; // Translate
    // Description
    custom_desc_arr[global.custom_len_var,0] = custom_label_arr[global.custom_len_var,0]; // Value -2
    custom_desc_arr[global.custom_len_var,1] = true; // Translate
    custom_desc_arr[global.custom_len_var,2] = custom_label_arr[global.custom_len_var,2]; // Value -1
    custom_desc_arr[global.custom_len_var,3] = true; // Translate
    // Clamp
    custom_arr[global.custom_len_var,5] = -2; // Min
}
else
{
    // Label
    custom_label_arr[global.custom_len_var,0] = "rand"; // Value -1
    custom_label_arr[global.custom_len_var,1] = true; // Translate
    // Description
    custom_desc_arr[global.custom_len_var,0] = custom_label_arr[global.custom_len_var,0]; // Value -1
    custom_desc_arr[global.custom_len_var,1] = true; // Translate
    // Clamp
    custom_arr[global.custom_len_var,5] = -1; // Min
}
custom_arr[global.custom_len_var,6] = -1; // Max
custom_arr[global.custom_len_var,7] = true; // Wrap
global.custom_len_var += 1;
return global.custom_len_var-1;