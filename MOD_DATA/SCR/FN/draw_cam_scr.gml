/*
Argument 0: Camera ID
Argument 1: Camera X
Argument 2: Camera Y
Argument 3: Camera Z
Argument 4: Camera Yaw
Argument 5: Camera Pitch
Argument 6: FOV (vertical)
Argument 7: Camera Roll
*/
if view_current == argument0
{
    global.cam_x_var[argument0] = argument1;
    global.cam_y_var[argument0] = argument2;
    global.cam_z_var[argument0] = argument3;
    global.cam_yaw_var[argument0] = mod_scr(argument4,360);
    global.cam_pitch_var[argument0] = median(89.9,89.9,argument5);
    global.cam_roll_var[argument0] = mod_scr(argument7,360);
    local.xturn = (cos(degtorad(global.cam_pitch_var[argument0]))*cos(degtorad(global.cam_yaw_var[argument0])));
    local.yturn = (cos(degtorad(global.cam_pitch_var[argument0]))*-sin(degtorad(global.cam_yaw_var[argument0])));
    local.zturn = sin(degtorad(global.cam_pitch_var[argument0]));
    if global.cam_roll_var[argument0] == 0 { local.xup = 0; local.yup = 0; local.zup = 1; }
    else if global.cam_roll_var[argument0] == 180 { local.xup = 0; local.yup = 0; local.zup = -1; }
    else
    {
        local.xrturn = sin(degtorad(global.cam_yaw_var[argument0]));
        local.yrturn = cos(degtorad(global.cam_yaw_var[argument0]));
        // local.zrturn = 0; // Since this is always0, it literally doesn't matter
        local.xuturn = -local.zturn*local.yrturn; // +(local.yturn*local.zrturn)
        local.yuturn = local.zturn*local.xrturn; // -(local.xturn*local.zrturn)
        local.zuturn = (local.xturn*local.yrturn)-(local.yturn*local.xrturn);
        local.rollcos = cos(degtorad(global.cam_roll_var[argument0]));
        local.rollsin = sin(degtorad(global.cam_roll_var[argument0]));
        local.xup = (local.xuturn*local.rollcos)-(local.xrturn*local.rollsin);
        local.yup = (local.yuturn*local.rollcos)-(local.yrturn*local.rollsin);
        local.zup = (local.zuturn*local.rollcos); // -(local.zrturn*local.rollsin)
    }
    d3d_set_projection_ext(argument1,argument2,argument3,argument1+local.xturn,argument2+local.yturn,argument3+local.zturn,local.xup,local.yup,local.zup,median(1,179,argument6),view_wport[argument0]/view_hport[argument0],1,1280); // 800
}