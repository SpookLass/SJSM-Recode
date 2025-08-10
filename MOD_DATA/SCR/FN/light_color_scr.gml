/*
Argument 0: Color
Returns the light version of a respective color
*/
return make_color_hsv(color_get_hue(argument0),color_get_saturation(argument0)/2,255);