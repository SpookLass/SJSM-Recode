/*
Argument 0: Name
Argument 1: Category
Mostly made this because I'm lazy. Doesn't work if not translatable.
*/
// Menu Up
set_arr[global.set_len_var,0] = argument0; // Variable name
set_arr[global.set_len_var,1] = argument0+"_input"; // Name
set_arr[global.set_len_var,2] = argument0+"_input"; // Description
set_arr[global.set_len_var,3] = true; // Translate name and descripion
set_arr[global.set_len_var,4] = set_input_const; // Type (Input)
set_arr[global.set_len_var,5] = 0; // Min
set_arr[global.set_len_var,6] = 0; // Max
set_arr[global.set_len_var,7] = false; // Wrap
set_arr[global.set_len_var,8] = argument1; // Category
set_arr[global.set_len_var,9] = true; // Player Specific
set_arr[global.set_len_var,10] = false; // Has Descriptions
execute_string
("
    set_arr[global.set_len_var,11] = "+argument0+"_input_const;
    set_default_arr[global.set_len_var,0] = "+argument0+"_key_const;
");
for (local.i=1; local.i<8; local.i+=1;)
{ execute_string("set_default_arr[global.set_len_var,"+string(local.i)+"] = "+argument0+"_button_const;"); }
set_arr[global.set_len_var,10] = up_input_const; // ID (Input Only)
global.set_len_var += 1;
return global.set_len_var-1;