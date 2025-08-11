// Basically just a combination of point_distance and point_direction without second points
// Used to set the pitch after changing x speed, y speed, or z speed, primarily for adding speed
pitch_var = radtodeg(arctan2(z_spd_var,sqrt(sqr(x_spd_var)+sqr(y_spd_var))));