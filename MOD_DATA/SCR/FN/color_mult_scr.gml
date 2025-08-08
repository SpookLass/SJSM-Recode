/*
Argument 0 & 1: Colors
Returns the multiplied colors, similar to how texture / color blending works.
*/
return
    make_color_rgb
    (
        (color_get_red(argument0)*color_get_red(argument1))/255,
        (color_get_green(argument0)*color_get_green(argument1))/255,
        (color_get_blue(argument0)*color_get_blue(argument1))/255
    );