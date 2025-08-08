/*
Argument 0: Yaw (Direction)
Argument 1: Pitch (Z Direction)
Argument 2: Target Yaw
Argument 3: Target Pitch
Argument 4: Turn rate
Argument 5: Return Type (0: Yaw, 1: Pitch)
Useful for if you want something to turn in 3D space while still being normalized.
*/
local.yaw = execute_file(global.deg_diff_scr,argument2,argument0);
local.pitch = execute_file(global.deg_diff_scr,argument3,argument1);
if !argument5
{
    local.turn = argument4*cos(degtorad(local.pitch));
    return argument0+local.turn;
}
else
{
    local.turn = argument4*-sin(degtorad(local.pitch));
    return argument1+local.turn;
}