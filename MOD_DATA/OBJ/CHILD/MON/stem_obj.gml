// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
move_type_var
    0: Default behavior
    1: OG Stem
    2: HD Stem
*/
// Create Event
object_event_add
(argument0,ev_other,ev_user7,"
    type_var = 0;
    spd_base_var = 0.4;
    dur_var = irandom_range(15,30);
    delay_var = 0;
    dmg_var = 15;
    dmg_alarm_var = 30;
    do_acc_var = true;
    acc_var = 1/60;
    frick_var = acc_var;
    w_var = 10;
    h_var = 10;
    // Movement
    move_type_var = 1;
    stop_dist_var = 4; // OG only
    slow_dist_var = 16; // OG only
    turn_rate_var = 5/3;
    turn_min_var = 10; // HD only
    // Boost
    boost_var = false;
    spd_mult_min_var = 3;
    spd_mult_max_var = 8;
    turn_mult_min_var = 3;
    turn_mult_max_var = 8;
    acc_mult_min_var = 3;
    acc_mult_max_var = 8;
    turn_mult_var = 1;
    acc_mult_var = 1;
    // Teleport
    tp_dist_min_var = 32;
    tp_dist_max_var = 300;
    // Model
    bg_var = background_add(vanilla_directory_const+'\3D\npc_5_tex.png',false,false);
    tex_var = background_get_texture(bg_var);
    mdl_01_var = d3d_model_create();
    mdl_02_var = d3d_model_create();
    d3d_model_load(mdl_01_var,main_directory_const+'\MDL\MON\stem_01_mdl.gmmod');
    d3d_model_load(mdl_02_var,main_directory_const+'\MDL\MON\stem_02_mdl.gmmod');
    mdl_var = mdl_01_var;
    mdl_yaw_var = yaw_var;
    mdl_pitch_var = pitch_var;
    do_mdl_var = true;
    rand_alarm_var = 6;
    inv_chance_var = 3;
    // Sounds
    snd_len_var = 5;
    snd_arr[0,0] = caster_load(main_directory_const+'\SND\MON\stem_01_snd.ogg');
    snd_arr[1,0] = caster_load(main_directory_const+'\SND\MON\stem_02_snd.ogg');
    snd_arr[2,0] = caster_load(main_directory_const+'\SND\MON\stem_03_snd.ogg');
    snd_arr[3,0] = caster_load(main_directory_const+'\SND\MON\stem_04_snd.ogg');
    snd_arr[4,0] = caster_load(main_directory_const+'\SND\MON\stem_05_snd.ogg');
    snd_num_var = 1;
    snd_den_var = 1;
    snd_alarm_min_var = 200;
    snd_alarm_max_var = 400;
    snd_dist_var = 600;
    // Behavior
    if global.stem_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.stem_type_var; }
    switch local.type
    {
        case 6: // Drift Baby
        { boost_var = true; }
        case 0: // Mod
        {
            move_type_var = 0;
            break;
        }
        case 4: // Karamari HD
        {
            dmg_var = 20;
            dmg_alarm_var = 60;
            do_acc_var = false;
            move_type_var = 2;
            spd_base_var = 16/45; // 0.3r5
            turn_rate_var = 0.025;
            snd_alarm_min_var = 300;
            snd_alarm_max_var = 600;
            inv_chance_var = 5;
            tp_dist_max_var = 640/3; // 213.r3
            break;
        }
        case 5: // Old HD
        {
            delay_min_var = 90;
            delay_max_var = 180;
        }
        case 2: // HD
        {
            dmg_var = 20;
            dmg_alarm_var = 60;
            do_acc_var = false;
            move_type_var = 2;
            boost_var = true;
            spd_base_var = 104/225; // 0.46r2
            turn_rate_var = 7/240; // I think?
            snd_alarm_min_var = 300;
            snd_alarm_max_var = 600;
            inv_chance_var = 5;
            tp_dist_max_var = 640/3; // 213.r3
            break;
        }
        case 3: // Karamari
        {
            dmg_var = 20;
            dmg_alarm_var = 60;
            spd_base_var = 0.2;
            snd_alarm_min_var = 300;
            snd_alarm_max_var = 600;
            break;
        }
    }
    // Alarms
    alarm_len_var = 9;
    alarm_arr[8,2] = '';
    // Inherit
    event_inherited();
    // sine
    z_off_time_var=0;
    z_off_mult_var=6;
    z_off_rate_var=360;
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    background_delete(bg_var);
    d3d_model_destroy(mdl_01_var);
    d3d_model_destroy(mdl_02_var);
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    // Position
    event_user(15);
    // Reset Variables
    mdl_yaw_var = yaw_var;
    mdl_pitch_var = pitch_var;
");
// Delay
object_event_add
(argument0,ev_alarm,0,"
    event_inherited();
    set_alarm_scr(8,rand_alarm_var);
");
// Random anim
object_event_add
(argument0,ev_alarm,8,"
    if !irandom(inv_chance_var-1) && image_alpha != 0 { image_alpha = 0; }
    else { image_alpha = choose(1,random_range(0.5,1)); }
    if !irandom(3) { mdl_var = mdl_02_var; }
    else { mdl_var = mdl_01_var; }
    set_alarm_scr(8,rand_alarm_var);
");
// Movement
object_event_add
(argument0,ev_other,ev_user0,"
    // If second face, move faster
    if boost_var && mdl_var == mdl_02_var
    {
        spd_mult_var = random_range(spd_mult_min_var,spd_mult_max_var);
        turn_mult_var = random_range(turn_mult_min_var,turn_mult_max_var);
        acc_mult_var = random_range(acc_mult_min_var,acc_mult_max_var);
    }
    local.yaw = point_direction(x,y,target_x_var,target_y_var);
    local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
    local.spd = spd_base_var*spd_mult_var;
    local.turn = turn_rate_var*turn_mult_var;
    // Type
    switch move_type_var
    {
        case 0: // Mod
        {
            if do_acc_var
            {
                // Tried to add autobrake support, but it's difficult without Unity source code
                if autobrake_var && target_visible_var && spd_var > autobrake_spd_var
                && (target_dist_var <= autobrake_dist_var || autobrake_dist_var <= 0) 
                {
                    if autobrake_dir_var > 0
                    {
                        if abs(deg_diff_scr(local.yaw,yaw_var)) > autobrake_dir_var
                        { local.spd = autobrake_spd_var; }
                    }
                    else { local.spd = autobrake_spd_var; }
                }
                acc_scr(global.delta_time_var,acc_var*acc_mult_var,frick_var*acc_mult_var,local.yaw,local.spd);
            }
            else { set_motion_scr(local.spd,true,local.yaw,true); }
            mdl_yaw_var = yaw_var;
            mdl_pitch_var = pitch_var;
            break;
        }
        case 1: // OG
        {
            // Turning
            local.yawdiff = deg_diff_scr(local.yaw,mdl_yaw_var);
            local.pitchdiff = deg_diff_scr(local.pitch,mdl_pitch_var);
            mdl_yaw_var += sign(local.yawdiff)*min(abs(local.yawdiff),turn_rate_var*global.delta_time_var);
            mdl_pitch_var += sign(local.pitchdiff)*min(abs(local.pitchdiff),turn_rate_var*global.delta_time_var); 
            // Movement
            if target_dist_var < 4 { local.newspd = 0; }
            else if target_dist_var < 16 { local.newspd = spd_var-frick_var; }
            else { local.newspd = spd_var+acc_var; }
            local.spd = median(0,local.spd,local.newspd);
            set_motion_3d_scr(local.spd,true,local.yaw,true,local.pitch,true);
            break;
        }
        case 2: // HD
        {
            // Turning
            local.yawdiff = deg_diff_scr(local.yaw,yaw_var);
            local.pitchdiff = deg_diff_scr(local.pitch,pitch_var);
            if abs(local.yawdiff) > turn_min_var || abs(local.pitchdiff) > turn_min_var
            {
                local.newyaw = yaw_var+(local.yawdiff*local.turn*global.delta_time_var);
                local.newpitch = pitch_var+(local.pitchdiff*local.turn*global.delta_time_var);
                set_motion_3d_scr(0,true,local.newyaw,true,local.newpitch,true);
            }
            // Movement
            else { set_motion_3d_scr(local.spd,true); }
            mdl_yaw_var = yaw_var;
            mdl_pitch_var = pitch_var;
            break;
        }
        default:
        {
            event_inherited();
            mdl_yaw_var = yaw_var;
            mdl_pitch_var = pitch_var;
            break;
        }
    }
    spd_mult_var = 1;
    turn_mult_var = 1;
    acc_mult_var = 1;
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    z_off_time_var = (z_off_time_var+global.delta_time_var) mod z_off_rate_var;
    z_off_var = sin(2*z_off_time_var*pi/z_off_rate_var)*z_off_mult_var;
    if !irandom(3)
    {
        x_off_var = random_range(-3,3);
        y_off_var = random_range(-3,3);
        z_off_var += random_range(-3,3);
    }
    else
    {
        x_off_var = 0;
        y_off_var = 0;
    }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if on_var || visible_var
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        d3d_transform_add_rotation_y(mdl_pitch_var);
        d3d_transform_add_rotation_z(mdl_yaw_var);
        d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
        d3d_model_draw(mdl_var,0,0,0,tex_var);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
");
// Teleport
object_event_add
(argument0,ev_other,ev_user15,"
    local.dir = random(360);
    local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
    x = target_x_var+lengthdir_x(local.dist,local.dir);
    y = target_y_var+lengthdir_x(local.dist,local.dir);
");