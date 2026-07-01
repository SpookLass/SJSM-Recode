/*
Argument 0: Hue (0-360)
Argument 1: Saturation (0-100)
Argument 2: Value (0-100)
Returns a color based on the inputs given
*/
return make_color_hsv(51*argument0/72,2.55*argument1,2.55*argument2);