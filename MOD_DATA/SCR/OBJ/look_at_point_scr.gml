/*
Argument 0: Point X
Argument 1: Point Y
Argument 2: Point Z
*/
cam_yaw_var = point_direction(x+cam_x_var,y+cam_y_var,argument0,argument1);
cam_pitch_var = execute_file(point_direction_3d,x+cam_x_var,y+cam_y_var,z+cam_z_var,argument0,argument1,argument2);