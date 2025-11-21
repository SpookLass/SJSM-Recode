/*
Argument 0: Player ID
*/
local.tempid = max(argument0,1);
switch global.input_move_var[argument0]
{
    // Keyboard
    case move_button_const: { return global.input_arr[forward_input_const,player_id_var]-global.input_arr[backward_input_const,argument0]; }
    // Left Joystick
    case move_joy_l_const:  { if abs(joystick_ypos(local.tempid)) > global.joy_sens_var[argument0] { return -joystick_ypos(local.tempid); } return 0; }
    // Right Joystick
    case move_joy_r_const:
    case move_joy_rs_const: 
    { if abs(joystick_rpos(local.tempid)) > global.joy_sens_var[argument0] { return -joystick_rpos(local.tempid); } return 0; }
    // D-Pad
    case move_dpad_const:
    { if joystick_has_pov(1) { return lengthdir_x(1,joystick_pov(local.tempid)); } return 0;}
    default: { return 0;}
}