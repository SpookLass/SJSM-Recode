// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // Translations
    ini_open(global.lang_var);
    pass_wrong_var = ini_read_string("DEAD","wf_04","DEAD_wf_04");
    pass_var = ini_read_string("DEAD","wf_05","DEAD_wf_05");
    ini_close();
    // Variables
    reflect_var = true;
    event_inherited();
    dist_var = 2;
    spd_base_var = 0.03;
    move_var = false;
    fov_var = 30;
    // Draw
    w_var = 3;
    h_var = 4.1;
    x_off_var = 0;
    y_off_var = 0;
    z_off_var = 14;
    spr_var = load_par_obj.spr_arr_var[0,0];
    spr_id_var = 0;
    spr_spd_var = 0;
    tex_var = sprite_get_texture(spr_var,spr_id_var);
    // Text
    char_alarm_var = 10/3;
    char_delay_var = 105; // On average
    pass_delay_var = 130;
    // Props
    body_x_var = 125;
    body_y_var = 60;
    body_z_var = 8.4;
    chair_x_var = 125;
    chair_y_var = 60;
    chair_z_var = 5;
    // Behavior
    if global.wf_type_var == -1 { local.type = irandom(7); }
    else { local.type = global.wf_type_var; }
    switch local.type
    {
        case 5: // Imscared
        {
            // Movement
            dist_var = 20;
            spd_base_var = 0.07;
            // Draw
            w_var = 10; // 16 x 40 / 64
            h_var = 10.3125; // 12 x 55 / 64
            z_off_base_var = 16;
            // Distance
            x += 32;
            y -= 4;
            break;
        }
        case 0: // Recode
        case 6: // Maya
        case 7: // Imscared Recode
        {
            char_alarm_var = 3;
            fov_var = 50;
            // Movement
            dist_var = 20;
            spd_base_var = 0.07;
            // Make bigger
            w_var = 9;
            h_var = 12.3;
            z_off_var = 10;
            // Distance
            x += 32;
            y -= 4;
            // Props
            body_x_var = 104;
            body_y_var = 67;
            body_z_var = 8.4; // 13
            chair_x_var = 101;
            chair_y_var = 63;
            break;
        }
        case 2: // HD
        case 4: // Old HD
        {
            char_alarm_var = 12;
            char_delay_var = 120;
            fov_var = 50;
            // Movement
            dist_var = 2/pixel_meter_rate_const;
            spd_base_var = 0.067;
            // Make bigger
            w_var = 8;
            h_var = 11;
            z_off_base_var = 12;
            spr_spd_var = 1/6;
            // Distance
            x += 32;
            y -= 4.72;
            // Props
            body_x_var = 48+(1.77/pixel_meter_rate_const);
            body_y_var = 48+(5.24/pixel_meter_rate_const);
            body_z_var = 1.24/pixel_meter_rate_const;
            chair_x_var = 48+(5/pixel_meter_rate_const);
            chair_y_var = 48+(1.4/pixel_meter_rate_const);
            break;
        }
    }
    // Effects
    with instance_create(0,0,wf_eff_obj)
    {
        par_var = other.id;
        spr_var = load_par_obj.spr_arr_var[1,0];
    }
    cam_dead_obj.fov_var = fov_var;
    with wf_chair_obj
    {
        x = other.chair_x_var;
        y = other.chair_y_var;
        z = other.chair_z_var;
    }
    with wf_body_obj
    {
        x = other.body_x_var;
        y = other.body_y_var;
        z = other.body_z_var;
    }
    // Alarms
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,90);
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    move_var = true;
    with instance_create(0,0,wf_dead_txt_obj)
    {
        par_var = other.id;
        char_alarm_var = other.char_alarm_var;
        char_delay_var = other.char_delay_var; // On average
        set_alarm_scr(0,char_alarm_var);
    }
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    with load_par_obj { instance_destroy(); }
    message_alpha(0.7);
    local.str = get_string("",pass_wrong_var);
    message_alpha(1);
    if string_lower(string_letters(local.str)) == string_lower(string_letters(pass_var))
    { rm_goto_menu_scr(wf_dead_rm,2); }
    else
    {
        if global.permadeath_var { delete_save_scr(global.save_name_var); }
        rm_goto_menu_scr(dead_crash_rm,true);
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    // Animate
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    // Move
    if move_var && point_distance_3d_scr(x,y,z,cam_dead_obj.x,cam_dead_obj.y,cam_dead_obj.z) > dist_var
    {
        local.yaw = point_direction(x,y,cam_dead_obj.x,cam_dead_obj.y);
        local.pitch = point_direction_3d_scr(x,y,z,cam_dead_obj.x,cam_dead_obj.y,cam_dead_obj.z);
        set_motion_3d_scr(spd_base_var,true,local.yaw,true,local.pitch,true);
    }
    else if spd_var > 0
    {
        move_var = false;
        set_motion_3d_scr(0,true);
    }
    // Skip All
    if global.input_press_arr[back_input_const,global.menu_player_var] == 1
    {
        with wf_dead_txt_obj { instance_destroy(); }
        event_perform(ev_alarm,1);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_transform_set_identity();
    // Get position
    local.xtmp = x+x_off_var;
    local.ytmp = y+y_off_var;
    local.ztmp = z+z_off_var;
    // Reflection handling (more complex for billboarded sprites)
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { local.xtmp = global.reflect_pos_var-local.xtmp; d3d_transform_add_scaling(-1,1,1); break; }
            case 1: { local.ytmp = global.reflect_pos_var-local.ytmp; d3d_transform_add_scaling(1,-1,1); break; }
            case 2: { local.ztmp = global.reflect_pos_var-local.ztmp; d3d_transform_add_scaling(1,1,-1); break; }
        }
    }
    d3d_transform_add_rotation_z(point_direction(local.xtmp,local.ytmp,global.cam_x_var[view_current],global.cam_y_var[view_current]));
    d3d_transform_add_translation(local.xtmp,local.ytmp,local.ztmp);
    // Draw
    d3d_draw_wall(0,w_var/2,h_var,0,-w_var/2,0,tex_var,1,1);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');