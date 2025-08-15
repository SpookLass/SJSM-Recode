/*
Argument 0: Delta Time (1 if not used)
Argument 1: Acceleration
Argument 2: Friction
Argument 3: Yaw
Argument 4: Pitch
Argument 5: Clamp
*/
if argument5 > 0 && spd_var <= argument5
{
    execute_file(global.add_motion_3d_scr,argument0,argument1,argument3,argument4);
    // If speed is greater than clamp, set it.
    if spd_var > argument5
    { execute_file(global.set_motion_3d_scr,argument5,true); }
}
else if spd_var > 0 { execute_file(global.set_motion_3d_scr,max(spd_var-(argument0*argument2),0),true); }