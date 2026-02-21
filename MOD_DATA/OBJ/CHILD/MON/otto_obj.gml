// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,'
    // Sounds
    snd_len_var = 4;
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 300;
    snd_alarm_max_var = 480;
    snd_dist_min_var = 0;
    snd_dist_max_var = 600;
    wake_snd_var[0] = true;
    // Translations
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("otto",global.name_var);
    local.sub = string_replace(ini_read_string("SUB","otto","SUB_otto"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    wake_snd_var[2] = local.sub; wake_snd_var[3] = false;
    ini_close();
    // Variables
    type_var = 1;
    spd_base_var = 1/6; // 0.1r6
    spr_spd_var = 1/6;
    spr_prog_var = 1;
    dur_var = 20;
    delay_var = -64;
    dmg_var = 10;
    dmg_alarm_var = 30;
    atk_stun_var = 30;
    w_var = 11;
    h_var = 24;
    spr_num_var = 4;
    anim_type_var = 4;
    sil_dist_var = -0.1;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
            other.eye_spr_var = eye_spr_var;
            other.wake_snd_var[1] = wake_snd_var[1];
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS26_01_spr.png",3,false,false,0,0);
        eye_spr_var = execute_file(main_directory_const+"\SPR\MON\otto_eye_spr.gml",main_directory_const+"\SPR\MON\otto_eye_spr.png");
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\otto_mus_test_snd.wav");
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        fmod_snd_set_loop_point_scr(mus_snd_var,0.0234541577825,0.977967306326);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\otto_01_snd.wav",global.wake_3d_var);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\otto_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\otto_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\otto_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\otto_04_snd.wav",true);
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    }
    eye_tex_var = sprite_get_texture(eye_spr_var,0);
    // Behavior
    if global.otto_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.otto_type_var; }
    local.set = false;
    switch local.type
    {
        case 0:
        {
            griddy_var = frac_chance_scr(1,1987);
            mus_prio_var = mon_mus_prio_const;
            eye_var = true;
            break;
        }
        case 3: // Old HD
        {
            dmg_var = 60;
            delay_min_var = 90;
            delay_max_var = 180;
            local.set = true;
        }
        case 2: // HD
        {
            if !local.set
            {
                dmg_var = 15;
                delay_min_var = 120;
                delay_max_var = 240;
            }
            eye_var = true;
            spr_spd_var = 1/15;
            spd_base_var = 28/45; // 0.6r2
            do_acc_var = true;
            dmg_alarm_var = 180;
            atk_stun_var = 0;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            break;
        }
    }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    if global.color_var < 2 && instance_exists(color_par_obj)
    { eye_color_var = color_par_obj.light_color_var; }
    else { eye_color_var = c_white; }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(spr_var);
        sprite_delete(eye_spr_var);
        fmod_snd_free_scr(mus_snd_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        fmod_snd_free_scr(wake_snd_var[1]);
    }
');
// Animation
object_event_add
(argument0,ev_other,ev_user1,'
    if anim_type_var == 4
    {
        spr_prog_var = (spr_prog_var+(spr_spd_var*global.delta_time_var)) mod spr_num_var;
        switch floor(spr_prog_var)
        {
            case 1: { spr_id_var = 1; break; }
            case 3: { spr_id_var = 2; break; }
            default: { spr_id_var = 0; break; }
        }
    }
    event_inherited();
    eye_tex_var = sprite_get_texture(eye_spr_var,floor(spr_id_var));
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    if atk_stun_var > 0
    {
        set_motion_scr(0,true,yaw_var,false);
        move_var = false;
        anim_var = false;
        atk_var = false;
        set_alarm_scr(1,atk_stun_var);
        set_alarm_scr(2,atk_stun_var);
        set_alarm_scr(4,atk_stun_var);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    event_inherited();
    if eye_var && (on_var || visible_var) && (!possess_var || cam_id_var != view_current || global.reflect_var)
    {
        // Set variables
        draw_set_color(eye_color_var); draw_set_alpha(image_alpha);
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
        // Eyes
        if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
        d3d_draw_wall(sil_dist_var,w_var/2,h_var,sil_dist_var,-w_var/2,0,eye_tex_var,1,1);
        if global.fog_dark_var
        { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
        // Reset
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
');