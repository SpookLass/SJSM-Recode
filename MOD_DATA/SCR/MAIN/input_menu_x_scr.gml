/*
Argument 0: Player ID
*/
switch global.input_menu_var[argument0]
{
    // Keyboard
    case menu_pc_const: { return global.input_arr[right_input_const,argument0]-global.input_arr[left_input_const,argument0]; break; }
    // D-Pad
    case menu_dpad_const:
    {
        if joy_hats_scr(global.joy_id_var[argument0]) > 0
        {
            local.dir = joy_hat_scr(global.joy_id_var[argument0]);
            if local.dir >= 0 { return -sign(lengthdir_y(1,local.dir)); }
        }
        return 0;
    }
    // Left Joystick
    case menu_joy_l_const: { if abs(joy_x_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100 { return sign(joy_x_scr(global.joy_id_var[argument0])); } return 0; }
    // Right Joystick
    case menu_joy_r_const: { if abs(joy_u_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100 { return sign(joy_u_scr(global.joy_id_var[argument0])); } return 0; }
    // Right Joystick (Switch)
    case menu_joy_rs_const:  { if abs(joy_z_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100 { return sign(joy_z_scr(global.joy_id_var[argument0])); } return 0; }
    default: { return 0; }
}