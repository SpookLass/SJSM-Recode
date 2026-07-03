/*
Argument 0: Line X 1
Argument 1: Line Y 1
Argument 2: Line X 2
Argument 3: Line Y 2
Argument 4: Point X
Argument 5: Point Y
*/
local.linedist = sqr(argument0-argument2)+sqr(argument1-argument3);
if local.linedist == 0 { return point_distance(argument0,argument1,argument4,argument5); }
local.dot = median(0,1,(((argument4-argument0)*(argument2-argument0))+((argument5-argument1)*(argument3-argument1)))/local.linedist);
return point_distance(argument0+(local.dot*(argument2-argument0)),argument1+(local.dot*(argument3-argument1)),argument4,argument5);