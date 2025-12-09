/*
Argument 0: Background
Argument 1-2: X and Y
Argument 3: Stretch
Argument 4: Stretch Type
    0: X
    1: Y
    2: Both
Argument 5-7: Rotation, Color, and Alpha
*/
local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
local.xtmp = argument1*local.viewscale;
local.ytmp = argument2*local.viewscale;
local.xscale = argument3*local.viewscale/background_get_width(argument0);
local.yscale = argument3*local.viewscale/background_get_height(argument0);
switch argument4
{
    case 0: { local.yscale = local.xscale; break; }
    case 1: { local.xscale = local.yscale; break; }
}
draw_background_ext(argument0,local.xtmp,local.ytmp,local.xscale,local.yscale,argument5,argument6,argument7);