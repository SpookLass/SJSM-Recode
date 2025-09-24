/*
Argument 0: Camera ID
Argument 1: Camera X
Argument 2: Camera Y
Argument 3: Camera Z
Argument 4: Camera Yaw
Argument 5: Camera Pitch
Argument 6: FOV (vertical)
*/
if view_current == argument0
{
    global.cam_x_var[argument0] = argument1;
    global.cam_y_var[argument0] = argument2;
    global.cam_z_var[argument0] = argument3;
    global.cam_yaw_var[argument0] = argument4;
    global.cam_pitch_var[argument0] = argument5;
    local.xturn = (cos(degtorad(argument5))*cos(degtorad(argument4)));
    local.yturn = (cos(degtorad(argument5))*-sin(degtorad(argument4)));
    local.zturn = sin(degtorad(argument5));
    d3d_set_projection_ext(argument1,argument2,argument3,argument1+local.xturn,argument2+local.yturn,argument3+local.zturn,0,0,1,median(1,179,argument6),view_wport[argument0]/view_hport[argument0],1,1280); // 800
}