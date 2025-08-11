/*
Argument 0: Cylinder 1 X
Argument 1: Cylinder 1 Y
Argument 2: Cylinder 1 Z
Argument 3: Cylinder 1 Diameter
Argument 4: Cylinder 1 Height
Argument 5: Cylinder 2 X
Argument 6: Cylinder 2 Y
Argument 7: Cylinder 2 Z
Argument 8: Cylinder 2 Diameter
Argument 9: Cylinder 1 Height
*/
local.cyl1_z1 = argument2;
local.cyl1_z2 = argument2+argument4;
local.cyl2_z1 = argument7;
local.cyl2_z2 = argument7+argument9;
local.radius = (argument3+argument8)/2;
return point_distance(argument0,argument1,argument5,argument6) < local.radius
&& local.cyl1_z2 >= local.cyl2_z1 && local.cyl2_z2 >= local.cyl1_z1