/*
Argument 0: Setting ID
Argument 1: Label ID
Argument 2: Label
Argument 3: Translate
Argument 4: Description (Leave blank for default, not used if setting doesn't have descriptions)
All values must be given a label or the game will crash! Only works with Enums
*/
local.current = (argument1-set_arr[argument0,5])*2;
// Label
set_label_arr[argument0,local.current] = argument2; // Value 1
set_label_arr[argument0,local.current+1] = argument3; // Translate
// Description
if set_arr[argument0,10]
{
    if argument4 == ""
    { set_desc_arr[argument0,local.current] = set_arr[argument0,1]+"_"+argument2; }
    else { set_desc_arr[argument0,local.current] = argument4; }
    set_desc_arr[argument0,local.current+1] = argument3;
}