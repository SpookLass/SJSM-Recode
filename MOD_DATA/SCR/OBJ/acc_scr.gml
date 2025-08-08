/*
Argument 0: Acceleration
Argument 1: Friction
Argument 2: Yaw
Argument 3: Clamp
*/
if argument3 > 0 && spd_var <= argument3
{
    execute_file(global.add_motion_scr,argument0,argument2);
    // If speed is greater than clamp, set it.
    if spd_var > argument3
    { execute_file(global.set_motion_scr,argument3,true); }
}
else if spd_var > 0 { execute_file(global.set_motion_scr,max(spd_var-argument1,0),true); }