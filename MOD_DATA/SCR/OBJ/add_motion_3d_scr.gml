/*
Argument 0: Delta Time (1 if not used)
Argument 1: Speed
Argument 2: Yaw
Argument 3: Pitch
*/
x_spd_var += lengthdir_x(lengthdir_x(argument0*argument1,argument2),argument3);
y_spd_var += lengthdir_x(lengthdir_y(argument0*argument1,argument2),argument3);
z_spd_var -= lengthdir_y(argument0*argument1,argument3);
// Set speed, yaw, and pitch variables to match
execute_file(global.get_spd_3d_scr);
execute_file(global.get_yaw_scr);
execute_file(global.get_pitch_scr);