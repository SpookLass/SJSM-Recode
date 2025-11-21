/*
Argument 0: Player ID
Returns the amount to move the yaw
Run this one first, does not reset the mouse
*/
// Camera
local.tempid = max(argument0,1);
switch global.input_cam_var[argument0]
{
    case cam_mouse_const: // Mouse
    {
        if !global.mouse_free_var
        { local.yaw = ((display_get_width()/2)-display_mouse_get_x())*global.sens_var[argument0]/1600; }
        else { return 0; }
        break;
    }
    case cam_joy_r_const: // Joystick Right (Xbox)
    {
        if abs(joystick_upos(local.tempid)) > global.joy_sens_var[argument0]
        { local.yaw = -joystick_upos(local.tempid)*global.delta_time_var*global.sens_var[argument0]/40; }
        else { return 0; }
        break;
    }
    case cam_joy_rs_const: // Joystick Right (Switch)
    {
        if abs(joystick_zpos(local.tempid)) > global.joy_sens_var[argument0]
        { local.yaw = -joystick_zpos(local.tempid)*global.delta_time_var*global.sens_var[argument0]/40; }
        else { return 0; }
        break;
    }
    case cam_joy_l_const: // Joystick Left (should be universal)
    {
        if abs(joystick_xpos(local.tempid)) > global.joy_sens_var[argument0]
        { local.yaw = -joystick_xpos(local.tempid)*global.delta_time_var*global.sens_var[argument0]/40; }
        else { return 0; }
        break;
    }
    case cam_dpad_const: // D-Pad
    {
        if joystick_has_pov(local.tempid)
        { local.yaw = -lengthdir_y(1,joystick_pov(local.tempid))*global.delta_time_var*global.sens_var[argument0]/40; }
        else { return 0; }
        break;
    }
    case cam_button_const: // Keyboard / Button
    {
        local.yaw = (global.input_arr[cam_left_input_const,argument0]-global.input_arr[cam_right_input_const,argument0])*global.delta_time_var*global.sens_var[argument0]/40;
        break;
    }
}
if global.invert_yaw_var[argument0] { local.yaw *= -1; }
return local.yaw;