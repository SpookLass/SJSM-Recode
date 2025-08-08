/*
Argument 0: Acceleration
Argument 1: Friction
Argument 2: Yaw
Argument 3: Pitch
Argument 4: Clamp
*/
if argument4 > 0 && spd_var <= argument4
{
    execute_file(global.add_motion_3d_scr,argument0,argument2,argument3);
    // If speed is greater than clamp, set it.
    if spd_var > argument4
    { execute_file(global.set_motion_3d_scr,argument4,true); }
}
else if spd_var > 0 { execute_file(global.set_motion_3d_scr,max(spd_var-argument1,0),true); }