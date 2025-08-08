// Basically just point_distance without the second point
// Used to set the speed after changing x speed or y speed, primarily for adding speed
spd_var = sqrt(sqr(x_spd_var)+sqr(y_spd_var));