/*
Argument 0: Camera ID
Argument 1: Camera X
Argument 2: Camera Y
Argument 3: Camera Z
Argument 4: Camera Yaw
Argument 5: Camera Pitch
Argument 6: FOV (vertical)
Argument 7: Camera Roll
Argument 8: Type (Alive, Dead, Monster)
Stores camera variables for use in other functions, like cam_draw_scr and cam_snd_scr
*/
global.cam_x_var[argument0] = argument1;
global.cam_y_var[argument0] = argument2;
global.cam_z_var[argument0] = argument3;
global.cam_yaw_var[argument0] = mod_scr(argument4,360);
global.cam_pitch_var[argument0] = median(-89.9,89.9,argument5);
global.cam_roll_var[argument0] = mod_scr(argument7,360);
global.cam_fov_var[argument0] = median(argument6,1,179);
global.cam_fx_var[argument0] = (cos(degtorad(global.cam_pitch_var[argument0]))*cos(degtorad(global.cam_yaw_var[argument0])));
global.cam_fy_var[argument0] = (cos(degtorad(global.cam_pitch_var[argument0]))*-sin(degtorad(global.cam_yaw_var[argument0])));
global.cam_fz_var[argument0] = sin(degtorad(global.cam_pitch_var[argument0]));
global.cam_ux_var[argument0] = 0;
global.cam_uy_var[argument0] = 0;
global.cam_type_var[argument0] = argument8;
if global.cam_roll_var[argument0] == 0
{ global.cam_uz_var[argument0] = 1; }
else if global.cam_roll_var[argument0] == 180
{ global.cam_uz_var[argument0] = -1; }
else
{
    local.xrturn = sin(degtorad(global.cam_yaw_var[argument0]));
    local.yrturn = cos(degtorad(global.cam_yaw_var[argument0]));
    // local.zrturn = 0; // Since this is always 0, it literally doesn't matter
    local.xuturn = -global.cam_fz_var[argument0]*local.yrturn; // +(global.cam_fy_var[argument0]*local.zrturn)
    local.yuturn = global.cam_fz_var[argument0]*local.xrturn; // -(global.cam_fx_var[argument0]*local.zrturn)
    local.zuturn = (global.cam_fx_var[argument0]*local.yrturn)-(global.cam_fy_var[argument0]*local.xrturn);
    local.rollcos = cos(degtorad(global.cam_roll_var[argument0]));
    local.rollsin = sin(degtorad(global.cam_roll_var[argument0]));
    global.cam_ux_var[argument0] = (local.xuturn*local.rollcos)-(local.xrturn*local.rollsin);
    global.cam_uy_var[argument0] = (local.yuturn*local.rollcos)-(local.yrturn*local.rollsin);
    global.cam_uz_var[argument0] = (local.zuturn*local.rollcos); // -(local.zrturn*local.rollsin)
}