/*
Argument 0: Normal X
Argument 1: Normal Y
Argument 2: Normal Z
Argument 3: Bounciness
*/
if argument0 == 0 { local.nx = p3dc_tri_data_scr(9); }
else { local.nx = argument0; }
if argument1 == 0 { local.ny = p3dc_tri_data_scr(10); }
else { local.ny = argument1; }
if argument2 == 0 { local.nz = p3dc_tri_data_scr(11); }
else { local.nz = argument2; }
// Dot product? (I hardly know 'er)
local.dot = (x_spd_var*local.nx)+(y_spd_var*local.ny)+(z_spd_var*local.nz);
// Reflect
x_spd_var -= (2*local.dot*local.nx)*argument3;
y_spd_var -= (2*local.dot*local.ny)*argument3;
z_spd_var -= (2*local.dot*local.nz)*argument3;