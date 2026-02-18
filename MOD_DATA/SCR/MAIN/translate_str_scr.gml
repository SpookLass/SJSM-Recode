/*
Argument 0: Category
Argument 1: Translation Key
Argument 2: Name (if applicable)
Argument 3: Key (if applicable)
Argument 4: Player (if applicable)
Open the ini before running. Not able to do more than one input at a time unfortunately, mostly due to modded inputs.
*/
local.str = ini_read_string(argument0,argument1,argument0+" "+argument1);
if string_pos("@n",local.str) { string_replace(local.str,"@n",argument2); }
if string_pos("@k",local.str) { string_replace(local.str,"@k",key_to_str_scr(input_key_arr[argument3,argument4])); }