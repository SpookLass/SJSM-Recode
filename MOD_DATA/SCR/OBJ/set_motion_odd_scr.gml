/*
Argument 0: Forward Speed
Argument 1: Set Forward Speed
Argument 2: Side Speed
Argument 3: Set Side Speed
Argument 4: Yaw
Argument 5: Set Yaw
*/
if argument1 { for_spd_var = argument0; }
if argument3 { side_spd_var = argument2; }
if argument5 { yaw_var = execute_file(global.mod_scr,argument4,360); }
x_spd_var = lengthdir_x(for_spd_var,yaw_var)-lengthdir_y(side_spd_var,yaw_var);
y_spd_var = lengthdir_y(for_spd_var,yaw_var)+lengthdir_x(side_spd_var,yaw_var);
// Set speed to match
execute_file(global.get_spd_scr);