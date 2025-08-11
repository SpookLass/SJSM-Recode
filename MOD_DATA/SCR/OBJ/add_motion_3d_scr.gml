/*
Argument 0: Speed
Argument 1: Yaw
Argument 2: Pitch
*/
x_spd_var += lengthdir_x(lengthdir_x(argument0,argument1),argument2);
y_spd_var += lengthdir_x(lengthdir_y(argument0,argument1),argument2);
z_spd_var -= lengthdir_y(argument0,argument2);
// Set speed, yaw, and pitch variables to match
execute_file(global.get_spd_3d_scr);
execute_file(global.get_yaw_scr);
execute_file(global.get_pitch_scr);