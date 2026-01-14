/*
Argument 0: Sprite
Argument 1: Sprite Index
Argument 2-3: X and Y
Argument 4-6: Rotation, color, and alpha 
*/
local.width = sprite_get_width(argument0);
local.height = sprite_get_height(argument0);
local.scale = min(view_wview[view_current]/local.width,view_hview[view_current]/local.height)
local.xtmp = (view_wview[view_current]-(local.width*local.scale))/2;
local.ytmp = (view_hview[view_current]-(local.height*local.scale))/2;
// Messy offsets, couldn't find a better way
local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
local.xtmp += argument2*local.viewscale;
local.ytmp += argument3*local.viewscale;
// Draw
draw_sprite_ext(argument0,argument1,local.xtmp,local.ytmp,local.scale,local.scale,argument4,argument5,argument6);