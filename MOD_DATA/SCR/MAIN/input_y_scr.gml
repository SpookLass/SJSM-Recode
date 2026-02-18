/*
Argument 0: Player ID
*/
switch global.input_move_var[argument0]
{
    // Keyboard
    case move_button_const: { return global.input_arr[strafe_right_input_const,argument0]-global.input_arr[strafe_left_input_const,argument0]; break; }
    case move_joy_l_const: // Left Joystick
    {
        if abs(joy_x_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100
        && global.input_cam_var[argument0] != cam_joy_l_const
        { return joy_x_scr(global.joy_id_var[argument0]); }
        return 0;
    }
    case move_joy_r_const: // Right Joystick
    {
        if abs(joy_u_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100
        && global.input_cam_var[argument0] != cam_joy_r_const
        { return joy_u_scr(global.joy_id_var[argument0]); }
        return 0;
    }
    case move_joy_rs_const: // Left Joystick
    {
        if abs(joy_z_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100
        && global.input_cam_var[argument0] != cam_joy_rs_const
        { return joy_z_scr(global.joy_id_var[argument0]); }
        return 0;
    }
    case move_dpad_const: // D-Pad
    {
        if joy_hats_scr(global.joy_id_var[argument0]) > 0 && global.input_cam_var[argument0] != cam_dpad_const
        { return -lengthdir_y(1,joy_hat_scr(global.joy_id_var[argument0])); }
        return 0;
    }
    default: { return 0; }
}