// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,noone);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    hp_max_var = 1;
    stam_max_var = 1;
    alarm_arr[3,1] = 1;
')
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    per_var = power(fmod_inst_get_pos_scr(mus_control_obj.snd_var)/0.85,3);
    if per_var > 1 { game_end(); }
    invert_per_var = 1-per_var;
    image_blend = make_color_rgb(70*invert_per_var,70*invert_per_var,70*invert_per_var);
    // Player Spoofing
    cam_id_var = par_var.cam_id_var;
    hp_max_var = par_var.hp_max_var;
    hp_var = random_range(par_var.hp_var,invert_per_var*par_var.hp_var);
    stam_max_var = par_var.stam_max_var;
    stam_var = random_range(par_var.stam_var,invert_per_var*par_var.stam_var);
    alarm_arr[3,0] = par_var.alarm_arr[3,1];
    alarm_arr[3,1] = par_var.alarm_arr[3,1];
    do_sprint_var = par_var.do_sprint_var;
    do_stam_var = par_var.do_stam_var;
    // Oh god
    cam_roll_var += random_range(-per_var,per_var)*global.delta_time_var;
    // par_var.shake_var = per_var;
    with light_par_obj { spr_id_var += random_range(-other.per_var,other.per_var)*global.delta_time_var; }
    // Window madness!
    window_set_rectangle
    (
        window_get_x()+(random_range(-per_var,per_var)*global.delta_time_var),
        window_get_y()+(random_range(-per_var,per_var)*global.delta_time_var),
        window_get_width()+(random_range(-per_var,per_var)*global.delta_time_var),
        window_get_height()+(random_range(-per_var,per_var)*global.delta_time_var)
    );
');
// Step end
object_event_add
(argument0,ev_step,ev_step_end,'
    with par_var
    {
        breath_time_var += breath_rate_var*breath_asthma_rate_var*random_range(-other.per_var,other.per_var)*global.delta_time_var;
        bob_time_var += bob_rate_var*random_range(-other.per_var,other.per_var)*global.delta_time_var;
        cam_roll_var += other.cam_roll_var;
        // Set camera and listener position
        cam_set_scr(cam_id_var,cam_x_var,cam_y_var,cam_z_var,cam_yaw_var,cam_pitch_var,current_fov_var,cam_roll_var);
    }
');
// Room End
object_event_add
(argument0,ev_other,ev_room_end,'
    // Return to normal
    with hud_obj { if par_var == other.id { par_var = other.par_var; } }
');
// Draw event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var
    {
        d3d_set_projection_ortho
        (
            view_xview[view_current],
            view_yview[view_current],
            view_xview[view_current]+view_wview[view_current],
            view_yview[view_current]+view_hview[view_current],
            0
        );
        d3d_set_hidden(false);
        draw_set_blend_mode_ext(bm_dest_color,bm_dest_color);
        draw_set_color(image_blend);
        draw_rectangle
        (
            view_xview[view_current],
            view_yview[view_current],
            view_xview[view_current]+view_wview[view_current],
            view_yview[view_current]+view_hview[view_current],
            false
        );
        draw_set_color(c_white);
        draw_set_blend_mode(bm_normal);
        d3d_set_hidden(true);
    }
    
');
// 333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333