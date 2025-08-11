/*
Argument 0: Speed
Argument 1: Set Speed
Argument 2: Yaw
Argument 3: Set Yaw
Argument 4: Pitch
Argument 5: Set Pitch
*/
if argument1 { spd_var = argument0; }
if argument3 { yaw_var = execute_file(global.mod_scr,argument2,360); }
if argument5 { pitch_var = median(-90,90,argument4); }
// Set x speed, y speed, and z speed to match
x_spd_var = lengthdir_x(lengthdir_x(spd_var,yaw_var),pitch_var);
y_spd_var = lengthdir_x(lengthdir_y(spd_var,yaw_var),pitch_var);
z_spd_var = -lengthdir_y(spd_var,pitch_var);