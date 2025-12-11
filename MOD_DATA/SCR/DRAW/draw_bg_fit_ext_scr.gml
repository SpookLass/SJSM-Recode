/*
Argument 0: Background
Argument 1-2: X and Y
Argument 3-5: Rotation, color, and alpha 
*/
local.width = background_get_width(argument0);
local.height = background_get_height(argument0);
local.scale = min(view_wview[view_current]/local.width,view_hview[view_current]/local.height)
local.xtmp = (view_wview[view_current]-(local.width*local.scale))/2;
local.ytmp = (view_hview[view_current]-(local.height*local.scale))/2;
// Messy offsets, couldn't find a better way
local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
local.xtmp += argument1*local.viewscale;
local.ytmp += argument2*local.viewscale;
// Draw
draw_background_ext(argument0,local.xtmp,local.ytmp,local.scale,local.scale,argument3,argument4,argument5);