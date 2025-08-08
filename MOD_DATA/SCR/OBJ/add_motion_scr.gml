/*
Argument 0: Speed
Argument 1: Yaw
*/
x_spd_var += lengthdir_x(argument0,argument1);
y_spd_var += lengthdir_y(argument0,argument1);
// Set speed, yaw, and pitch variables to match
execute_file(global.get_spd_scr);
execute_file(global.get_yaw_scr);