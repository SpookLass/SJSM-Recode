/*
Argument 0: FOV
Argument 1: Return Type (0: Vertical, 1: Horizontal)
Returns the specified FOV. 
Classic player sight sprite is 70 degrees horizontal
Classic FOV is 50 degrees vertical
*/
if argument1 { local.rate = 16/9; } else { local.rate = 9/16; }
return 2*radtodeg(arctan(tan(degtorad(argument0)/2)*(local.rate)));