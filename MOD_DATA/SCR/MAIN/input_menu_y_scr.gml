/*
Argument 0: Player ID
*/
switch global.input_menu_var[argument0]
{
    // Keyboard
    case menu_pc_const: { return global.input_arr[up_input_const,argument0]-global.input_arr[down_input_const,argument0]; }
    // D-Pad
    case menu_dpad_const: { if joy_hats_scr(global.joy_id_var[argument0]) > 0 { return lengthdir_x(1,joy_hat_scr(global.joy_id_var[argument0])); } return 0;}
    // Left Joystick
    case menu_joy_l_const:  { if abs(joy_y_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100 { return -sign(joy_y_scr(global.joy_id_var[argument0])); } return 0; }
    // Right Joystick
    case menu_joy_r_const:
    case menu_joy_rs_const: 
    { if abs(joy_r_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100 { return -sign(joy_r_scr(global.joy_id_var[argument0])); } return 0; }
    default: { return 0;}
}