// Basically just point_distance_3d without the second point
// Used to set the speed after changing x speed, y speed, or z speed, primarily for adding speed
spd_var = sqrt(sqr(x_spd_var)+sqr(y_spd_var)+sqr(z_spd_var));