/*
Argument 0: Monster ID
Argument 1: Setting ID
Argument 2: Label
Argument 3: Description (leave empty for auto)
Argument 4: Translate
*/
mon_arr[argument0,8] += 1;
custom_arr[argument1,6] += 1;
local.current = (custom_arr[argument1,6]-custom_arr[argument1,5])*2;
custom_label_arr[argument1,local.current] = argument2; // Value 1+
custom_label_arr[argument1,local.current+1] = argument4;
if argument3 == ""
{ custom_desc_arr[argument1,local.current] = custom_arr[argument1,1]+"_"+argument2; }
else { custom_desc_arr[argument1,local.current] = argument3; }
custom_desc_arr[argument1,local.current+1] = argument4;