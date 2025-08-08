/*
Argument 0: Angle in degrees
Returns a value between -180 and 180
*/
local.dir = argument0 mod 360;
if abs(local.dir) > 180 { local.dir -= 360*sign(local.dir); }
return local.dir;