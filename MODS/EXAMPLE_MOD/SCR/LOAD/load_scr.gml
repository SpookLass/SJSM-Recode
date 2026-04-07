/*
Argument 0: Mod Directory
*/
global.example_directory_var = argument0;
    // Example Group
mon_group_arr[global.mon_group_len_var,0] = "Example" // Name
mon_group_arr[global.mon_group_len_var,1] = false; // Translate
    // Gurgle
mon_arr[global.mon_len_var,0] = "gurgle"; // Variable
mon_arr[global.mon_len_var,1] = "GURGLE"; // Name
mon_arr[global.mon_len_var,2] = "So retro!"; // Description
mon_arr[global.mon_len_var,3] = "It's a Gurgle! Don't think about it too hard."; // CAT-DOS
mon_arr[global.mon_len_var,4] = false; // Translate
mon_arr[global.mon_len_var,5] = true; // Chases
mon_arr[global.mon_len_var,6] = true; // Has CAT-DOS
mon_arr[global.mon_len_var,7] = global.mon_group_len_var; // Group
mon_arr[global.mon_len_var,8] = 0; // Extra behaviors
mon_arr[global.mon_len_var,9] = gurgle_obj; // Object
mon_arr[global.mon_len_var,10] = noone; // Locale
// Descriptions
mon_desc_arr[global.mon_len_var,0] = "No notable version differences.";
mon_desc_arr[global.mon_len_var,1] = false;
mon_desc_arr[global.mon_len_var,2] = "No notable version differences.";
mon_desc_arr[global.mon_len_var,3] = false;
mon_desc_arr[global.mon_len_var,4] = "No notable version differences.";
mon_desc_arr[global.mon_len_var,5] = false;
local.gurgle = global.mon_len_var;
global.mon_len_var += 1;
    // Example List
mon_list_arr[global.mon_list_len_var,0] = noone;
mon_list_arr[global.mon_list_len_var,1] = ds_list_create();
ds_list_clear(mon_list_arr[global.mon_list_len_var,1]);
ds_list_add(mon_list_arr[global.mon_list_len_var,1],local.gurgle);
    // Example List Config
// Name
custom_arr[global.custom_len_var,0] = "ex_list"; // Variable name
custom_arr[global.custom_len_var,1] = "EXAMPLE"; // Name
custom_arr[global.custom_len_var,2] = "Monsters from the example mod. This only includes Gurgle."; // Description
custom_arr[global.custom_len_var,3] = false; // Translate name and descripion
custom_arr[global.custom_len_var,4] = 6; // Type (Monster list)
custom_arr[global.custom_len_var,5] = global.mon_list_len_var; // Special (Array index)
// Label
custom_label_arr[global.custom_len_var,0] = "none"; // Value 1
custom_label_arr[global.custom_len_var,1] = true; // Translate
custom_label_arr[global.custom_len_var,2] = "all"; // Value 2
custom_label_arr[global.custom_len_var,3] = true; // Translate
// Clamp
custom_clamp_arr[global.custom_len_var,0] = 0; // Min
custom_clamp_arr[global.custom_len_var,1] = 1; // Max
custom_clamp_arr[global.custom_len_var,2] = true; // Wrap
// Defaults
custom_arr_add_len_scr(0,1);
custom_arr_set_scr(1,global.custom_len_var,-1,-1,-1); // Default (All)
custom_arr_set_scr(0,global.custom_len_var,-1,0,-1); // Story (None)
custom_arr_set_scr(0,global.custom_len_var,-1,1,1); // OG Endless (None)
custom_arr_set_scr(0,global.custom_len_var,-1,1,2); // HD Endless (None)
// Plus one to everything
global.mon_group_len_var += 1;
global.mon_list_len_var += 1;
global.custom_len_var += 1;