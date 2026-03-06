/*
Argument 0: Player ID
Returns the amount to move the yaw
Run this one first, does not reset the mouse
*/
// Camera
switch global.input_cam_var[argument0]
{
    // Mouse
    case cam_mouse_const: { if !global.mouse_free_var { local.yaw = ((display_get_width()/2)-display_mouse_get_x())*global.sens_var[argument0]/1600; break; } return 0; }
    // Joystick Right (Xbox)
    case cam_joy_r_const: { if abs(joy_u_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100 { local.yaw = -joy_u_scr(global.joy_id_var[argument0])*global.delta_time_var*global.sens_var[argument0]/40; break; } return 0; }
    // Joystick Right (Switch)
    case cam_joy_rs_const: { if abs(joy_z_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100 { local.yaw = -joy_z_scr(global.joy_id_var[argument0])*global.delta_time_var*global.sens_var[argument0]/40; break; } return 0; }
    // Joystick Left (should be universal)
    case cam_joy_l_const: { if abs(joy_x_scr(global.joy_id_var[argument0])) > global.joy_sens_var[argument0]/100 { local.yaw = -joy_x_scr(global.joy_id_var[argument0])*global.delta_time_var*global.sens_var[argument0]/40; break; } return 0; }
    // D-Pad
    case cam_dpad_const: 
    {
        if joy_hats_scr(global.joy_id_var[argument0]) > 0
        {
            local.dir = joy_hat_scr(global.joy_id_var[argument0]);
            if local.dir >= 0 { local.yaw = -lengthdir_y(1,local.dir)*global.delta_time_var*global.sens_var[argument0]/40; break; }
        }
        return 0;
    }
    // Keyboard / Button
    case cam_button_const: { local.yaw = (global.input_arr[cam_left_input_const,argument0]-global.input_arr[cam_right_input_const,argument0])*global.delta_time_var*global.sens_var[argument0]/40; break; }
}
if global.invert_yaw_var[argument0] { local.yaw *= -1; }
return local.yaw;