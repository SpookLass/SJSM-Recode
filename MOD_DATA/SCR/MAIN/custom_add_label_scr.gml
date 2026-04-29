/*
Argument 0: Custom Setting ID
Argument 1: Label ID
Argument 2: Label
Argument 3: Translate
Argument 4: Description (Leave blank for default, not used if setting doesn't have descriptions)
All values must be given a label or the game will crash! Only works with Enums
*/
local.current = (argument1-custom_arr[argument0,5])*2;
// Label
custom_label_arr[argument0,local.current] = argument2; // Value 1
custom_label_arr[argument0,local.current+1] = argument3; // Translate
// Description
if custom_arr[argument0,9]
{
    if argument4 == ""
    { custom_desc_arr[argument0,local.current] = custom_arr[argument0,1]+"_"+argument2; }
    else { custom_desc_arr[argument0,local.current] = argument4; }
    custom_desc_arr[argument0,local.current+1] = argument3;
}