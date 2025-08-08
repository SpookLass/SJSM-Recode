/*
Argument 0: Line X
Argument 1: Line Y
Argument 2: Line Angle (degrees)
Argument 3: Target X
Argument 4: Target Y
*/
local.dx = cos(degtorad(argument2));
local.dy = -sin(degtorad(argument2));
local.px = argument0-argument3;
local.py = argument1-argument4;
return abs((local.py*local.dx)-(local.px*local.dy));