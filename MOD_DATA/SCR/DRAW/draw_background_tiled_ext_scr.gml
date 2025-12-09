/*
Argument 0: Background
Argument 1-2: X and Y
Argument 3-4: X scale and Y scale (0 to 1280)
Argument 5-7: Rotation, color, and alpha 
Argument 8-9: Offset Horizontal and Vertical (uses fa variables)
Argument 10-11: View Width and Height
Argument 12: Lock
Argument 13-14: Tile X and Y
*/
// Background
local.bgwidth = background_get_width(argument0);
local.bgheight = background_get_height(argument0);
// Calculate scale
if argument12
{
    local.xtmp = argument1/1280;
    local.ytmp = argument2/1280;
    local.width = argument3/1280;
    local.height = argument4/1280;
    if argument11 >= argument10
    {
        local.xtmp *= argument10;
        local.ytmp *= argument10;
        local.width *= argument10;
        local.height *= argument10;
        
    }
    else
    {
        local.xtmp *= argument11;
        local.ytmp *= argument11;
        local.width *= argument11;
        local.height *= argument11;
    }
}
else
{
    local.xtmp = argument1*argument10/1280;
    local.ytmp = argument2*argument11/720;
    local.width = argument3*argument10/1280;
    local.height = argument4*argument11/720;
}
local.xscale = local.width/local.bgwidth
local.yscale = local.height/local.bgheight;
// Position
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
// Tiling
if argument13
{
    local.ynum = local.mult/argument4;
    local.remainder = (1280/argument3) mod 1;
    local.right = local.remainder*local.bgwidth*(argument1 mod argument3)/1280;
    local.left = local.bgwidth-local.right;
    local.xtmp = local.xtmp mod local.width;
}
else
{
    local.xnum = 1;
    local.xdraw = local.xtmp;
}
if argument14
{
    if argument12 { local.mult = 1280; }
    else { local.mult = 720; }
    local.ynum = local.mult/argument4;
    local.remainder = local.ynum mod 1;
    local.bottom = local.remainder*local.ytmp*local.bgheight*(argument2 mod argument4)/local.mult;
    local.top = local.bgheight-local.bottom;
    local.ytmp = local.ytmp mod local.height;
}
else
{
    local.ynum = 1;
    local.ydraw = local.ytmp;
}
// Draw (WHAT A DISASTER)
for (local.i=0; local.i<local.xnum; local.i+=1;)
{
    for (local.j=0; local.j<local.ynum; local.j+=1;)
    {
        local.drawleft = 0;
        local.drawwidth = local.bgwidth;
        local.drawtop = 0;
        local.drawheight = local.bgheight;
        if argument13
        {
            if local.i == 0
            {
                local.drawleft = local.right;
                local.drawwidth = local.left;
            }
            if local.i == local.xnum-1;
            { local.drawwidth = local.right; }
        }
        if argument14
        {
            if local.j == 0
            {
                local.drawtop = local.bottom;
                local.drawheight = local.top;
            }
            if local.j == local.ynum-1;
            { local.drawheight = local.bottom; }
        }
        draw_background_part_ext(argument0,local.drawleft,local.drawtop,local.drawwidth,local.drawheight,local.xdraw,local.ydraw,local.xscale,local.yscale,argument6,argument7);
        if argument13
        {
            if local.i == 0 { local.xdraw += local.xtmp; }
            else { local.xdraw += local.width; }
        }
        if argument14
        {
            if local.j == 0 { local.ydraw += local.ytmp; }
            else { local.ydraw += local.height; }
        }
    }
}
// Pseudo tile code
/*
Times looped = 1280 / width argument
Remainder = times looped mod 1
Left scale = remainder * x argument * background width / 1280
Right scale = background width - left scale
*/