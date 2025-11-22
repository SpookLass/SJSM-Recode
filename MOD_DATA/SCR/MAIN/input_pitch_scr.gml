/*
Argument 0: Player ID
Returns the amount to move the pitch
Run this one second, resets the mouse
*/
// Camera
local.tempid = max(argument0,1);
switch global.input_cam_var[argument0]
{
    case cam_mouse_const: // Mouse
    {
        if !global.mouse_free_var
        {
            local.pitch = ((display_get_height()/2)-display_mouse_get_y())*global.sens_var[argument0]/1600;
            display_mouse_set(display_get_width()/2,display_get_height()/2);
        }
        else { return 0; }
        break;
    }
    case cam_joy_r_const: // Joystick Right
    {
        if abs(joystick_rpos(local.tempid)) > global.joy_sens_var[argument0]
        && global.input_move_var[argument0] != move_joy_r_const
        { local.pitch = -joystick_rpos(local.tempid)*global.delta_time_var*global.sens_var[argument0]/40; }
        else { return 0; }
        break;
    }
    case cam_joy_rs_const: // Joystick Right (Switch)
    {
        if abs(joystick_rpos(local.tempid)) > global.joy_sens_var[argument0]
        && global.input_move_var[argument0] != move_joy_rs_const
        { local.pitch = -joystick_rpos(local.tempid)*global.delta_time_var*global.sens_var[argument0]/40; }
        else { return 0; }
        break;
    }
    case cam_joy_l_const: // Joystick Left (should be universal)
    {
        if abs(joystick_ypos(local.tempid)) > global.joy_sens_var[argument0]
        && global.input_move_var[argument0] != move_joy_l_const
        { local.pitch = -joystick_ypos(local.tempid)*global.delta_time_var*global.sens_var[argument0]/40; }
        else { return 0; }
        break;
    }
    case cam_dpad_const: // D-Pad
    {
        if joystick_has_pov(local.tempid)
        && global.input_move_var[argument0] != move_dpad_const
        { local.pitch = lengthdir_x(1,joystick_pov(local.tempid))*global.delta_time_var*global.sens_var[argument0]/40; }
        else { return 0; }
        break;
    }
    case cam_button_const: // Keyboard / Button
    {
        local.pitch = (global.input_arr[cam_up_input_const,argument0]-global.input_arr[cam_down_input_const,argument0])*global.delta_time_var*global.sens_var[argument0]/40;
        break;
    }
}
if global.invert_pitch_var[argument0] { local.pitch *= -1; }
return local.pitch;