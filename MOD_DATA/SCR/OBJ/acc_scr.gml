/*
Argument 0: Delta Time (1 if not used)
Argument 1: Acceleration
Argument 2: Friction
Argument 3: Yaw
Argument 4: Clamp
*/
// New backwards handling
local.yaw = argument3;
local.spd = abs(argument4);
if argument4 < 0 { local.yaw += 180; }
// Should work fine
if local.spd > 0 && spd_var <= local.spd
{
    add_motion_scr(argument0,argument1,local.yaw);
    // If speed is greater than clamp, set it.
    if spd_var > local.spd
    { set_motion_scr(local.spd,true); }
}
else if spd_var > 0 { set_motion_scr(max(spd_var-(argument2*argument0),0),true); }