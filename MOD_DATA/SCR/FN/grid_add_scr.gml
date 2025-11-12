/*
Argument 0: Grid Index
Argument 1: Column
Argument 2: Value
Returns the current y position
*/
local.add = ds_grid_height(argument0);
local.width = ds_grid_width(argument0);
ds_grid_resize(argument0,local.add+1,local.width);
ds_grid_add(argument0,local.add,argument1,argument2);
return local.add;