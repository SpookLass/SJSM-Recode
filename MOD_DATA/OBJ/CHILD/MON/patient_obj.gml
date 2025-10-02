// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_other,ev_user7,"
    type_var = 0;
    spd_base_var = 2;
    dur_var = irandom_range(20,33);
    delay_var = 60;
    dmg_var = 10;
    dmg_alarm_var = 30;
    // Seen
    do_seen_var = true;
    seen_yaw_var = 30;
    seen_pitch_var = 30;
    seen_spd_mult_var = 0.02;
    tp_alarm_var = 220;
    tp_sight_var = false;
    // Render
    spr_var = sprite_add(main_directory_const+'\SPR\MON\patient_spr.png',3,false,false,0,0); // vanilla_directory_const+'\3D\npc_6_tex.png'
    tex_var = sprite_get_texture(spr_var,0);
    mdl_01_var = d3d_model_create();
    mdl_02_var = d3d_model_create();
    d3d_model_load(mdl_01_var,main_directory_const+'\MDL\MON\patient_01_mdl.gmmod');
    d3d_model_load(mdl_02_var,main_directory_const+'\MDL\MON\patient_02_mdl.gmmod');
    mdl_var = mdl_01_var;
    // Rand
    rand_chance_var = 3;
    rand_alarm_min_var = 3;
    rand_alarm_max_var = 9;
    // Behavior
    if global.patient_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.patient_type_var; }
    switch local.type
    {
        case 0:
        {
            tp_sight_var = true;
            draw_pos_var = true;
            weird_var = true;
            weird_chance_var = 16;
            break;
        }
        case 2:
        {
            type_var = 2;
            spd_base_var = 8/9; // 0.r8
            do_acc_var = true;
            acc_var = 16/675; // 0.02r370
            seen_yaw_var = 60;
            seen_pitch_var = 60;
            seen_spd_mult_var = 1;
            draw_pos_var = true;
            break;
        }
    }
    // Alarms
    alarm_len_var = 10;
    alarm_arr[8,2] = '';
    alarm_arr[9,2] = '';
    // Inherit
    event_inherited();
    do_mdl_var = true;
    do_anim_var = false;
    do_snd_var = false;
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    sprite_delete(spr_var);
    d3d_model_destroy(mdl_01_var);
    d3d_model_destroy(mdl_02_var);
");
// Room start
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    enter_var = false;
    x = global.spawn_arr[0,0];
    y = global.spawn_arr[0,1];
    z = global.spawn_arr[0,2];
    draw_x_var = x;
    draw_y_var = y;
    draw_z_var = z;
    draw_yaw_var = yaw_var;
    image_alpha = 1;
");
// Delay
object_event_add
(argument0,ev_alarm,0,"
    event_perform(ev_alarm,8);
    event_inherited();
");
// Random anim
object_event_add
(argument0,ev_alarm,8,"
    if frac_chance_scr(1,rand_chance_var)
    { image_alpha = 0; }
    else
    {
        if image_alpha == 0
        {
            if draw_pos_var
            {
                draw_x_var = x;
                draw_y_var = y;
                draw_z_var = z;
                draw_yaw_var = yaw_var;
            }
            if weird_var
            {
                if frac_chance_scr(1,weird_chance_var)
                {
                    if frac_chance_scr(1,4)
                    {
                        mdl_var = mdl_02_var;
                        tex_var = sprite_get_texture(spr_var,1);
                        draw_yaw_var += 180;
                    }
                    else
                    {
                        mdl_var = mdl_01_var;
                        tex_var = sprite_get_texture(spr_var,2);
                    }
                    
                }
                else
                {
                    mdl_var = mdl_01_var;
                    tex_var = sprite_get_texture(spr_var,0);
                }
            }
        }
        image_alpha = 1;
    }
    set_alarm_scr(8,irandom_range(rand_alarm_min_var,rand_alarm_max_var));
");
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if seen_var == 1
    {
        spd_mult_var = seen_spd_mult_var;
        if alarm_arr[9,0] <= 0 { set_alarm_scr(9,tp_alarm_var); }
    }
    else if alarm_arr[9,0] > 0 { set_alarm_scr(9,-1); }
    event_inherited();
");
// Attack Success
// Uses attack_target_var as an argument, usually the player.
object_event_add
(argument0,ev_other,ev_user3,"
    event_inherited();
    image_alpha = 1;
    draw_x_var = x;
    draw_y_var = y;
    draw_z_var = z;
    draw_yaw_var = yaw_var;
");
// Teleport
object_event_add
(argument0,ev_other,ev_user15,"
    // Originally anywhere in the room (0-1280 x 0-720 y)
    if tp_sight_var { local.dir = random_range(target_eye_yaw_var+seen_yaw_var,target_eye_yaw_var+360-seen_yaw_var); }
    else { local.dir = random(360); }
    local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
    x = target_x_var+lengthdir_x(local.dist,local.dir);
    y = target_y_var+lengthdir_x(local.dist,local.dir);
    z = target_z_var;
    image_alpha = 1;
    draw_x_var = x;
    draw_y_var = y;
    draw_z_var = z;
    draw_yaw_var = yaw_var;
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if !draw_pos_var { event_inherited(); }
    else if on_var || visible_var
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        if do_mdl_var
        {
            // d3d_transform_add_rotation_y(pitch_var);
            d3d_transform_add_rotation_z(draw_yaw_var);
            d3d_transform_add_translation(draw_x_var+x_off_var,draw_y_var+y_off_var,draw_z_var+z_off_var);
            d3d_model_draw(mdl_var,0,0,0,tex_var);
        }
        else
        {
            d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
            d3d_transform_add_translation(draw_x_var+x_off_var,draw_y_var+y_off_var,draw_z_var+z_off_var);
            d3d_draw_wall(0,w_var/2,h_var,0,-w_var/2,0,tex_var,1,1);
        }
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1); d3d_set_hidden(false);
        if path_exists(path_var)
        { draw_path(path_var,x,y,false); }
        d3d_set_hidden(true);
        // mp_grid_draw(grid_var);
    }
");
