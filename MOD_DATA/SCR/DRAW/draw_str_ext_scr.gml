/*
Argument 0: String
Argument 1-2: Position
Argument 3-4: Scale
Argumment 5: Min Scale
Argument 6-7: Alignment
Argument 8: Separation
Argument 9: Margin
Argument 10: Rotation

*/
local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
local.xtmp = argument1*local.viewscale;
local.ytmp = argument2*local.viewscale;
local.xscale = max(argument5,argument3*local.viewscale);
local.yscale = max(argument5,argument4*local.viewscale);
switch argument6
{
    case fa_center: { local.xtmp += view_wview[view_current]/2; break; }
    case fa_right: { local.xtmp += view_wview[view_current]; break; }
}
switch argument7
{
    case fa_middle: { local.ytmp += view_hview[view_current]/2; break; }
    case fa_bottom: { local.ytmp += view_hview[view_current]; break; }
}
if argument8 > 0 { local.sep = argument8/argument4; }
else { local.sep = argument8; }
if argument9 > 0 { local.width = (view_wview[view_current]-(argument9*local.viewscale))/local.xscale; }
else { local.width = argument9; }
draw_text_ext_transformed(local.xtmp,local.ytmp,argument0,local.sep,local.width,local.xscale,local.yscale,argument10);