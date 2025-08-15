/*
Argument 0: Delta Time (1 if not used)
Argument 1: Speed
Argument 2: Yaw
*/
x_spd_var += lengthdir_x(argument0*argument1,argument2);
y_spd_var += lengthdir_y(argument0*argument1,argument2);
// Set speed, yaw, and pitch variables to match
execute_file(global.get_spd_scr);
execute_file(global.get_yaw_scr);