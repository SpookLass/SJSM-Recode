/*
Argument 0: Grid to clear
Resets height so it can be used like a list.
*/
local.width = ds_grid_width(argument0);
ds_grid_resize(argument0,local.width,0);