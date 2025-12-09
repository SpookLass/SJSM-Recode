/*
Argument 0: Sprite
Argument 1: Sprite Index
Argument 2-3: X and Y
Argument 4: Stretch
Argument 5: Stretch Type
    0: X
    1: Y
    2: Both
Argument 6-7: Alignment (uses font variables)
Argument 8-10: Rotation, Color, and Alpha
*/
local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
local.xtmp = argument2*local.viewscale;
local.ytmp = argument3*local.viewscale;
local.xscale = argument4*local.viewscale/sprite_get_width(argument0);
local.yscale = argument4*local.viewscale/sprite_get_height(argument0);
switch argument5
{
    case 0: { local.yscale = local.xscale; break; }
    case 1: { local.xscale = local.yscale; break; }
}
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
draw_sprite_ext(argument0,argument1,local.xtmp,local.ytmp,local.xscale,local.yscale,argument8,argument9,argument10);