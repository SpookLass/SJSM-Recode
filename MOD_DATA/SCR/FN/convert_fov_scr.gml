/*
Argument 0: FOV
Argument 1: Width
Argument 2: Height
Argument 3: Return Type (0: Vertical, 1: Horizontal)
Returns the specified FOV. 
Classic player sight sprite is 70 degrees horizontal
Classic FOV is 50 degrees vertical
*/
if argument3 { local.rate = argument1/argument2; } else { local.rate = argument2/argument1; }
return 2*radtodeg(arctan(tan(degtorad(argument0)/2)*(local.rate)));