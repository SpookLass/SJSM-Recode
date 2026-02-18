/*
Argument 0: Player ID
*/
switch global.input_move_var[argument0]
{
    // Keyboard
    case move_button_const: { return global.input_arr[forward_input_const,argument0]-global.input_arr[backward_input_const,argument0]; }
    // Left Joystick
    case move_joy_l_const:  { if abs(joy_y_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100 { return -joy_y_scr(global.joy_id_var[argument0]); } return 0; }
    // Right Joystick
    case move_joy_r_const:
    case move_joy_rs_const: 
    { if abs(joy_r_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100 { return -joy_r_scr(global.joy_id_var[argument0]); } return 0; }
    // D-Pad
    case move_dpad_const:
    { if joy_hats_scr(global.joy_id_var[argument0]) > 0 { return lengthdir_x(1,joy_hat_scr(global.joy_id_var[argument0])); } return 0;}
    default: { return 0;}
}