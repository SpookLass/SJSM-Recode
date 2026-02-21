/*
Argument 0: String
Argument 1-2: Position
Argument 3-4: Scale
Argumment 5: Min Scale
Argument 6-7: Alignment
Argument 8: Outline Dist X
Argument 9: Outline Dist Y
Argument 10: Outline Color
Argument 11: Normal Color
Argument 12: Outline Width
Argument 13: Outline Number
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
draw_set_halign(argument6); draw_set_valign(argument7); draw_set_color(argument10);
local.shadownum = max(1,argument12);
for (local.i=local.shadownum; local.i>=1; local.i-=1;)
{
    local.xdist = argument8*local.viewscale*local.i/local.shadownum;
    local.ydist = argument9*local.viewscale*local.i/local.shadownum;
    for (local.j=0; local.j<argument13; local.j+=1;)
    {
        local.dir = 360/argument13*local.j;
        local.xoff = local.xtmp+lengthdir_x(local.xdist,local.dir);
        local.yoff = local.ytmp+lengthdir_y(local.ydist,local.dir);
        draw_text_transformed(local.xoff,local.yoff,argument0,local.xscale,local.yscale,0);
    }
}
draw_set_color(argument11);
draw_text_transformed(local.xtmp,local.ytmp,argument0,local.xscale,local.yscale,0);
draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white);