/*
Argument 0: Background
Argument 1-2: X and Y
Argument 3-4: X scale and Y scale (0 to 1280)
Argument 5-7: Rotation, color, and alpha 
Argument 8-9: Offset Horizontal and Vertical (uses fa variables)
Argument 10-11: View Width and Height
Argument 12: Lock
*/
local.xview = argument10;
local.yview = argument11;
if argument12
{
    if argument10 >= argument11
    { local.xview = argument11; }
    else { local.yview = argument10; }
}
local.xtmp = argument1*local.xview/1280;
local.ytmp = argument2*local.yview/720;
local.width = argument3*local.xview/1280;
local.height = argument4*local.yview/720;
switch argument8
{
    case fa_center: { local.xtmp -= local.width/2; break; }
    case fa_right: { local.xtmp -= local.width; break; }
}
switch argument9
{
    case fa_middle: { local.ytmp -= local.height/2; break; }
    case fa_bottom: { local.ytmp -= local.height; break; }
}
local.xscale = local.width/background_get_width(argument0);
local.yscale = local.height/background_get_height(argument0);
draw_background_ext(argument0,local.xtmp,local.ytmp,local.xscale,local.yscale,argument5,argument6,argument7);