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
local.xtmp += argument1*local.scale;
local.ytmp += argument2*local.scale;
draw_background_ext(argument0,local.xtmp,local.ytmp,local.scale,local.scale,argument3,argument4,argument5);