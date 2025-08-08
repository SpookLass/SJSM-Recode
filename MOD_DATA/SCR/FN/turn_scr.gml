/*
Argument 0: Direction
Argument 1: Target Direction
Argument 2: Turn rate
*/
local.dir = execute_file(global.deg_diff_scr,argument1,argument0);
return argument1+(argument2*sign(local.dir));