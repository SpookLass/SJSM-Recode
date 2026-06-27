/*
Argument 0: Normal X
Argument 1: Normal Y
Argument 2: Bounciness
*/
if argument0 == 0 { local.nx = p3dc_tri_data_scr(9); }
else { local.nx = argument0; }
if argument1 == 0 { local.ny = p3dc_tri_data_scr(10); }
else { local.ny = argument1; }
// Dot product? (I hardly know 'er)
local.dot = (x_spd_var*local.nx)+(y_spd_var*local.ny);
// Reflect
x_spd_var -= (2*local.dot*local.nx)*argument2;
y_spd_var -= (2*local.dot*local.ny)*argument2;