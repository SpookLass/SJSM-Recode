// Basically just point_direction without the second point
// Used to set the yaw after changing x speed or y speed, primarily for adding speed
yaw_var = radtodeg(arctan2(-y_spd_var,x_spd_var));