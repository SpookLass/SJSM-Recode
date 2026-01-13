/*
Argument 0: Background
Argument 1-2: X and Y
Argument 3-4: Scale X and Y
Argument 5: Tile Type
    0: X
    1: Y
    2: Both
Argument 6-8: Rotation, Color, and Alpha
*/
local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
local.xtmp = argument1*local.viewscale;
local.ytmp = argument2*local.viewscale;
local.tilew = argument3*local.viewscale;
local.tileh = argument4*local.viewscale;
local.xscale = local.tilew/background_get_width(argument0);
local.yscale = local.tileh/background_get_height(argument0);
// Tile
local.startx = 0; local.endx = 0;
local.starty = 0; local.endy = 0;
// X or Both
if (argument5 == 0 || argument5 == 2)
{
    local.startx = floor(-local.xtmp/local.tilew)-1;
    local.endx = ceil((view_wview[view_current]-local.xtmp)/local.tilew)+1;
}
// Y or Both
if (argument5 == 1 || argument5 == 2)
{
    local.starty = floor(-local.ytmp/local.tileh)-1;
    local.endy = ceil((view_wview[view_current]-local.ytmp)/local.tileh)+1;
}
// Draw Loop
for (local.ix = local.startx; local.ix <= local.endx; local.ix += 1;)
{
    for (local.iy = local.starty; local.iy <= local.endy; local.iy += 1;)
    {
        draw_background_ext
        (
            argument0,
            local.xtmp+(local.ix*local.tilew),
            local.ytmp+(local.iy*local.tileh),
            local.xscale,local.yscale,
            argument6,argument7,argument8
        );
    }
}