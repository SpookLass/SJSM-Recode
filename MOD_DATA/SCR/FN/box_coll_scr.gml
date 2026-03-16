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
return abs(argument0-argument6) < (abs(argument3)+abs(argument9))*0.5
&& abs(argument1-argument7) < (abs(argument4)+abs(argument10))*0.5
&& abs(argument2-argument8+((argument5-argument11)*0.5)) < (abs(argument5)+abs(argument11))*0.5;