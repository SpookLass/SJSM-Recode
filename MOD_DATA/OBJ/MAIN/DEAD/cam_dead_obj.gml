// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    fov_var = global.fov_var;
    h_var = 114/7; // 16 + 2/7
    roll_var = 0;
    cam_id_var = 0;
    player_id_var = global.menu_player_var;
    // Idle Bob
    breath_rate_var = 1;
    breath_mult_var = global.idle_bob_var/100;
    breath_var = 0;
    breath_time_var = 0;
    // Shake
    shake_var = 0;
    shake_angle_base_var = 5;
    shake_pos_base_var = 1;
    // Collision
    coll_var[0] = global.player_coll[0];
    coll_var[1] = global.player_coll[1];
    coll_var[2] = global.player_coll[2];
    // Add HD variables for accuracy at some point
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    yaw_var += input_yaw_scr(player_id_var);
    pitch_var += input_pitch_scr(player_id_var);
    yaw_var = mod_scr(yaw_var,360);
    pitch_var = median(-89.9,89.9,pitch_var);
    // As We Breathe
    breath_time_var = (breath_time_var+(breath_rate_var*global.delta_time_var)) mod 360;
    breath_var = breath_mult_var*sin(degtorad(breath_time_var));
');
// End Step
object_event_add
(argument0,ev_step,ev_step_end,'
    // Camera
    cam_x_var = x;
    cam_y_var = y;
    cam_z_var = z+h_var+breath_var;
    cam_yaw_var = yaw_var;
    cam_pitch_var = pitch_var;
    cam_roll_var = roll_var;
    // Camera shake
    if shake_var > 0
    {
        switch (global.shake_type_var)
        {
            case shake_classic_const:
            {
                cam_x_var += random_range(-shake_var,shake_var);
                cam_y_var += random_range(-shake_var,shake_var);
                cam_z_var += random_range(-shake_var,shake_var);
                break;
            }
            case shake_modern_const:
            {
                cam_yaw_var += random_range(-shake_var,shake_var);
                cam_pitch_var += random_range(-shake_var,shake_var);
                cam_roll_var += random_range(-shake_var,shake_var);
                break;
            }
        }
    }
    // Set camera and listener position
    cam_set_scr(cam_id_var,cam_x_var,cam_y_var,cam_z_var,cam_yaw_var,cam_pitch_var,fov_var,cam_roll_var,false);
    // Could put this in control, but needs extra camera boolean
    fmod_listen_pos_ex_scr
    (
        cam_id_var+1,
        global.cam_x_var[cam_id_var],global.cam_y_var[cam_id_var],global.cam_z_var[cam_id_var],
        global.cam_fx_var[cam_id_var],global.cam_fy_var[cam_id_var],global.cam_fz_var[cam_id_var],
        global.cam_ux_var[cam_id_var],global.cam_uy_var[cam_id_var],global.cam_uz_var[cam_id_var],
    );
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    cam_draw_scr(cam_id_var);
');