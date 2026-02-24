/*
Argument 0: String
Argument 1-2: Position
Argument 3-4: Scale
Argumment 5: Min Scale
Argument 6-7: Alignment
Argument 8: Shadow Dist X
Argument 9: Shadow Dist Y
    Pro Tip: Set negative for other directions
Argument 10: Shadow Color
Argument 11: Normal Color
Argument 12: Shadow Num
Argument 13: Rotation
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
draw_set_color(argument10);
local.shadownum = max(1,argument12);
for (local.i=local.shadownum; local.i>=1; local.i-=1;)
{
    local.xoff = local.xtmp+(argument8*local.viewscale*local.i/local.shadownum);
    local.yoff = local.ytmp+(argument9*local.viewscale*local.i/local.shadownum);
    draw_text_transformed(local.xoff,local.yoff,argument0,local.xscale,local.yscale,argument13);
}
draw_set_color(argument11);
draw_text_transformed(local.xtmp,local.ytmp,argument0,local.xscale,local.yscale,argument13);
draw_set_color(c_white);