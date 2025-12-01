/*
Argument 0: Yaw (Direction)
Argument 1: Pitch (Z Direction)
Argument 2: Target Yaw
Argument 3: Target Pitch
Argument 4: Turn rate
Argument 5: Return Type (0: Yaw, 1: Pitch)
Useful for if you want something to turn in 3D space while still being normalized.
*/
local.yaw = deg_diff_scr(argument2,argument0);
local.pitch = deg_diff_scr(argument3,argument1);
local.mag = sqrt(sqr(local.yaw)+sqr(local.pitch));
// Normalize
if local.mag > argument4
{
    local.yaw *= argument4/local.mag;
    local.pitch *= argument4/local.mag;
}
if !argument5 { return argument0+local.yaw; }
else { return argument1+local.pitch; }