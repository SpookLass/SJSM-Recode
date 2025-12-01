/*
Argument 0: Direction
Argument 1: Target Direction
Argument 2: Turn rate
*/
local.dir = deg_diff_scr(argument1,argument0);
return argument0+(sign(local.dir)*min(abs(local.dir),argument2));