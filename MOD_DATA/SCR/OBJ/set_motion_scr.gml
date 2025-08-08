/*
Argument 0: Speed
Argument 1: Set Speed
Argument 2: Yaw
Argument 3: Set Yaw
*/
if argument1 { spd_var = argument0; }
if argument3 { yaw_var = execute_file(global.mod_scr,argument2,360); }
x_spd_var = lengthdir_x(spd_var,yaw_var);
y_spd_var = lengthdir_y(spd_var,yaw_var);