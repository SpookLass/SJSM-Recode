/*
Argument 0: Box 1 x
Argument 1: Box 1 y
Argument 2: Box 1 z
Argument 3: Box 1 width
Argument 4: Box 1 length
Argument 5: Box 1 height

Argument 6: Box 2 x
Argument 7: Box 2 y
Argument 8: Box 2 z
Argument 9: Box 2 width
Argument 10: Box 2 length
Argument 11: Box 2 height

Making Coca-Cola the old fashioned way because otherwise box collisions suck
*/
local.radiusx = argument3/2;
local.radiusy = argument4/2;
local.box1_x1 = argument0-local.radiusx;
local.box1_x2 = argument0+local.radiusx;
local.box1_y1 = argument1-local.radiusy;
local.box1_y2 = argument1+local.radiusy;
local.box1_z1 = argument2;
local.box1_z2 = argument2+argument5;
local.radiusx = argument9/2;
local.radiusy = argument10/2;
local.box2_x1 = argument6-local.radiusx;
local.box2_x2 = argument6+local.radiusx;
local.box2_y1 = argument7-local.radiusy;
local.box2_y2 = argument7+local.radiusy;
local.box2_z1 = argument8;
local.box2_z2 = argument8+argument11;
return local.box1_x2 >= local.box2_x1 && local.box2_x2 >= local.box1_x1
&& local.box1_y2 >= local.box2_y1 && local.box2_y2 >= local.box1_y1
&& local.box1_z2 >= local.box2_z1 && local.box2_z2 >= local.box1_z1