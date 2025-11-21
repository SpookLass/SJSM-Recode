/*
Argument 0: Player ID
*/
local.tempid = max(argument0,1);
switch global.input_move_var[argument0]
{
    // Keyboard
    case move_button_const: { return global.input_arr[strafe_right_input_const,player_id_var]-global.input_arr[strafe_left_input_const,argument0]; break; }
    case move_joy_l_const: // Left Joystick
    {
        if abs(joystick_xpos(local.tempid)) > global.joy_sens_var[argument0]
        && global.input_cam_var[argument0] != cam_joy_l_const
        { return joystick_xpos(local.tempid); }
        return 0;
    }
    case move_joy_r_const: // Right Joystick
    {
        if abs(joystick_upos(local.tempid)) > global.joy_sens_var[argument0]
        && global.input_cam_var[argument0] != cam_joy_r_const
        { return joystick_upos(local.tempid); }
        return 0;
    }
    case move_joy_rs_const: // Left Joystick
    {
        if abs(joystick_zpos(local.tempid)) > global.joy_sens_var[argument0]
        && global.input_cam_var[argument0] != cam_joy_rs_const
        { return joystick_zpos(local.tempid); }
        return 0;
    }
    case move_dpad_const: // D-Pad
    {
        if joystick_has_pov(1) && global.input_cam_var[argument0] != cam_dpad_const
        { return -lengthdir_y(1,joystick_pov(local.tempid)); }
        return 0;
    }
    default: { return 0; }
}