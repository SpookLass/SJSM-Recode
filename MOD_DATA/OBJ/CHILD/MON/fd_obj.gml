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
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("fd",global.name_var);
    snd_arr[0,1] = ini_read_string("SUB","fd_01","SUB_fd_01"); snd_arr[0,2] = true;
    snd_arr[1,1] = ini_read_string("SUB","fd_02","SUB_fd_02"); snd_arr[1,2] = true;
    snd_arr[2,1] = ini_read_string("SUB","fd_03","SUB_fd_03"); snd_arr[2,2] = true;
    snd_arr[3,1] = ini_read_string("SUB","fd_04","SUB_fd_04"); snd_arr[3,2] = true;
    wake_snd_var[2] = string_replace(ini_read_string("SUB","fd_wake","SUB_fd_wake"),"@n",name_var); wake_snd_var[3] = false;
    hurt_snd_var[2] = string_replace(ini_read_string("SUB","fd_hurt","SUB_fd_hurt"),"@n",name_var); hurt_snd_var[3] = false;
    ini_close();
    // Variables
    type_var = 0;
    spd_base_var = 0.8;
    dur_var = irandom_range(15,25);
    delay_var = 120;
    dmg_var = 45;
    dmg_alarm_var = 120;
    atk_range_var = 48;
    dead_rm_var = fd_dead_load_rm;
    // Sounds
    snd_len_var = 4;
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 240;
    snd_alarm_max_var = 420;
    snd_dist_min_var = 0;
    snd_dist_max_var = 600;
    wake_snd_var[0] = true;
    hurt_snd_var = 4;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Axe
    do_hurt_var = true;
    hurt_alarm_var = 60;
    hurt_spd_var = 5;
    hurt_tp_var = true;
    tp_dist_min_var = 128;
    tp_dist_max_var = 512;
    violence_var = 3;
    w_base_var = 15;
    h_base_var = 19.3;
    z_off_base_var = 7;
    flame_z_off_base_var = 19.2;
    w_var = w_base_var;
    h_var = h_base_var;
    z_off_var = z_off_base_var;
    flame_z_off_var = flame_z_off_base_var;
    tp_door_var = false;
    // Seen
    do_seen_var = true;
    seen_type_var = 1;
    seen_yaw_var = 5.856;
    seen_dist_var = 120;
    do_seen_mult_var = true;
    seen_mult_var = 2;
    unseen_mult_var = 1;
    spr_spd_seen_var = 1;
    spr_spd_base_var = 0.25;
    spr_spd_var = spr_spd_base_var;
    // Door vanish
    door_hide_var = false;
    hide_reset_var = false;
    hide_alarm_min_var = 160;
    hide_alarm_max_var = 320;
    hide_num_var = 1;
    hide_den_var = 2;
    hide_trig_var = true;
    hide_per_var = true;
    alarm_len_var = 9;
    alarm_ini_scr();
    // Effect
    eff_dist_var = 32;
    eff_chance_var = 5;
    // Flame
    flame_var = false;
    flame_spr_id_var = 0;
    flame_spr_var = torch_spr;
    flame_spr_spd_var = 0.25;
    flame_h_var = 4.8;
    flame_w_var = 3;
    flame_off_var = 105/330; // Maybe 90/330
    flame_tex_var = sprite_get_texture(flame_spr_var,0);
    flame_alpha_var = 1;
    flame_color_var = c_white;
    // MEAT
    meat_var = false;
    meat_num_var = 1;
    meat_den_var = 3;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
            other.meat_bg_var = meat_bg_var;
            other.eff_spr_01_var = eff_spr_01_var;
            other.eff_spr_02_var = eff_spr_02_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.hurt_snd_var[1] = hurt_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS9_01_spr.png",12,false,false,0,0);
        meat_bg_var = background_add(vanilla_directory_const+"\TEX\mobile\MB8_26_tex.png",false,false);
        eff_spr_01_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS9_02_spr.png",3,0,0,0,0);
        eff_spr_02_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS9_03_spr.png",19,0,0,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\fd_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\fd_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\fd_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\fd_04_snd.wav",true);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\fd_wake_snd.wav",global.wake_3d_var);
        hurt_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\fd_hurt_snd.wav",true);
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\fd_mus_snd.mp3");
        fmod_snd_set_loop_point_scr(mus_snd_var,0,0.972669769662);
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    }
    meat_tex_var = background_get_texture(meat_bg_var);
    // Behavior
    if global.fd_type_var == -1 { local.type = irandom(4); }
    else { local.type = global.fd_type_var; }
    switch local.type
    {
        case 0:
        {
            hide_reset_var = true;
            seen_pitch_var = 5.856;
            flame_var = true;
            dmg_var = 30;
            hurt_spd_var = 1;
            hurt_alarm_var = 18;
            hurt_tp_var = 2;
            stun_var = true;
            atk_range_var = global.mon_coll[2];
            // Silhouette
            sil_var = true;
            sil_type_var = 1; // Pure color
            sil_color_var = c_orange;
            sil_alpha_var = 0.15;
            sil_dist_var = 0.1;
            break;
        }
        case 4: // HD Hellgate
        { meat_var = true; }
        case 2: // HD
        {
            hide_reset_var = true; // Not certain on this
            flame_var = true;
            spd_base_var = 8/9; // 0.r8
            do_seen_var = false;
            hide_trig_var = false;
            hide_alarm_min_var = 156;
            hide_alarm_max_var = 318;
            delay_min_var = 90;
            delay_max_var = 180;
            do_enter_var = true;
            dmg_alarm_var = 180;
            violence_var = 2;
            hurt_spd_var = 1;
            hurt_alarm_var = 18;
            hurt_tp_var = 2;
            stun_var = true;
            atk_range_var = 64/3; // 21.r3
            tp_door_var = true;
            // Sound
            snd_alarm_min_var = 90;
            snd_alarm_max_var = 240;
            snd_den_var = 1;
            snd_dist_max_var = 500;
            break;
        }
        case 3: // Hellgate
        { meat_var = true; break; }
    }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        fmod_snd_free_scr(mus_snd_var);
        sprite_delete(spr_var);
        background_delete(meat_bg_var);
        sprite_delete(eff_spr_01_var);
        sprite_delete(eff_spr_02_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        fmod_snd_free_scr(wake_snd_var[1]);
        fmod_snd_free_scr(hurt_snd_var[1]);
    }
    with spr_flash_eff_obj
    { if par_var == other.id { instance_destroy(); }}
    with food_meat_obj { if par_var == other.id { instance_destroy(); }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    w_var = w_base_var;
    h_var = h_base_var;
    z_off_var = z_off_base_var;
    flame_z_off_var = flame_z_off_base_var;
    spr_spd_var = spr_spd_base_var;
    anim_type_var = 0;
    if global.color_var == 0
    { flame_color_var = light_color_scr(image_blend); }
    if hide_per_var
    {
        with door_obj { visible = !other.door_hide_var; }
        if hide_trig_var
        {
            with door_trig_obj 
            {
                if do_txt_var >= 0
                { do_txt_var = !other.door_hide_var; }
            }
        }
    }
    else { door_hide_var = false; }
    if meat_var
    {
        for (local.i=0; local.i<global.mark_len_var; local.i+=1;)
        {
            if !global.mark_arr[local.i,3] && frac_chance_scr(meat_num_var,meat_den_var)
            {
                with instance_create(global.mark_arr[local.i,0],global.mark_arr[local.i,1],food_meat_obj)
                {
                    par_var = other.id;
                    store_tex_var = other.meat_tex_var;
                    tex_var = store_tex_var;
                    coll_var[0] = food_meat_chase_coll[0];
                    coll_var[1] = food_meat_chase_coll[1];
                    coll_var[2] = food_meat_chase_coll[2];
                }
                global.mark_arr[local.i,3] = true;
            }
        }
    }
');
// Delay
object_event_add
(argument0,ev_alarm,0,'
    event_inherited();
    event_perform(ev_alarm,8);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var
    {
        if hurt_var
        {
            if hurt_spd_var != 1 && move_var { spd_mult_var *= hurt_spd_var; }
            if alarm_arr[3,0] > 0 && hurt_tp_var == 2
            {
                local.per = alarm_arr[3,0]/alarm_arr[3,1]
                w_var = lerp_scr(0,w_base_var,local.per);
                h_var = lerp_scr(h_base_var*20,h_base_var,local.per);
                z_off_var = lerp_scr(z_off_base_var-(h_base_var*9.5),z_off_base_var,local.per)
                flame_z_off_var = lerp_scr(flame_z_off_base_var*20,flame_z_off_base_var,local.per)
            }
        }
        if seen_var && is_seen_var == 1
        {
            spr_spd_var = spr_spd_seen_var;
            anim_type_var = 3;
        }
        else if anim_type_var == 3
        {
            spr_spd_var = spr_spd_base_var;
            anim_type_var = 0;
        }
    }
    event_inherited();
    spd_mult_var = 1;
');
// Sound alarm
object_event_add
(argument0,ev_alarm,6,'
    event_inherited();
    if instance_exists(target_var) && target_dist_var > eff_dist_var 
    && frac_chance_scr(1,eff_chance_var)
    {
        with instance_create(0,0,spr_flash_eff_obj)
        {
            par_var = other.id;
            if !irandom(2)
            {
                spr_var = other.eff_spr_01_var;
                spr_id_var = irandom(sprite_get_number(spr_var)-1);
                spr_spd_var = 0;
                set_alarm_scr(0,irandom_range(6,15));
            }
            else
            {
                spr_var = other.eff_spr_02_var;
                spr_id_var = irandom(sprite_get_number(spr_var)-1);
                spr_spd_var = 0.25;
                set_alarm_scr(0,irandom_range(15,30));
            }
            fade_var = true;
            rand_rate_var = 6;
            // Set camera to player
            cam_id_var = other.target_var.cam_id_var;
        }
    }
');
// Door!
object_event_add
(argument0,ev_alarm,8,'
    if frac_chance_scr(hide_num_var,hide_den_var) || (door_hide_var && hide_reset_var)
    {
        door_hide_var = !door_hide_var;
        with door_obj { visible = !other.door_hide_var; }
        if hide_trig_var
        {
            with door_trig_obj 
            {
                if do_txt_var >= 0
                { do_txt_var = !other.door_hide_var; }
            }
        }
    }
    set_alarm_scr(8,irandom_range(hide_alarm_min_var,hide_alarm_max_var));
');
// Animation
object_event_add
(argument0,ev_other,ev_user1,'
    event_inherited();
    flame_spr_id_var = (flame_spr_id_var+(flame_spr_spd_var*global.delta_time_var)) mod sprite_get_number(flame_spr_var);
    flame_tex_var = sprite_get_texture(flame_spr_var,floor(flame_spr_id_var))
');
// Hurt
object_event_add
(argument0,ev_other,ev_user4,'
    if !enter_var
    {
        event_inherited();
        if hurt_tp_var == 1 { event_user(15); }
    }
');
// Hurt Alarm
object_event_add
(argument0,ev_alarm,3,'
    if hurt_tp_var == 2
    {
        w_var = w_base_var;
        h_var = h_base_var;
        z_off_var = z_off_base_var;
        flame_z_off_var = flame_z_off_base_var;
        event_user(15);
    }
    event_inherited();
');
// Teleport
object_event_add
(argument0,ev_other,ev_user15,'
    // Originally anywhere in the room (0-1280 x 0-720 y)
    if enter_var
    {
        enter_var = false;
        event_user(6);
    }
    if tp_door_var
    {
        x = global.spawn_arr[0,0];
        y = global.spawn_arr[0,1];
        z = global.spawn_arr[0,2];
    }
    else
    {
        x = target_x_var;
        y = target_y_var;
        z = target_z_var;
    }
    local.dir = random(360);
    local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
    x += lengthdir_x(local.dist,local.dir);
    y += lengthdir_y(local.dist,local.dir);
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    event_inherited();
    if flame_var && (on_var || visible_var)
    {
        d3d_transform_set_identity();
        // Reflection handling (more complex for billboarded sprites)
        local.xtmp = x;
        local.ytmp = y;
        local.ztmp = z+z_off_var+flame_z_off_var;
        if global.reflect_var
        {
            switch (global.reflect_axis_var)
            {
                case 0: { local.xtmp = global.reflect_pos_var-local.xtmp; d3d_transform_add_scaling(-1,1,1); break; }
                case 1: { local.ytmp = global.reflect_pos_var-local.ytmp; d3d_transform_add_scaling(1,-1,1); break; }
                case 2: { local.ztmp = global.reflect_pos_var-local.ztmp; d3d_transform_add_scaling(1,1,-1); break; }
            }
        }
        // Transformations
        d3d_transform_add_rotation_y(point_direction_3d_scr(local.xtmp,local.ytmp,local.ztmp,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]));
        d3d_transform_add_rotation_z(point_direction(local.xtmp,local.ytmp,global.cam_x_var[view_current],global.cam_y_var[view_current]));
        d3d_transform_add_translation(local.xtmp,local.ytmp,local.ztmp);
        // Draw
        draw_set_color(flame_color_var); draw_set_alpha(flame_alpha_var);
        if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
        d3d_draw_wall(0,(flame_w_var/2)+flame_off_var,flame_h_var/2,0,(-flame_w_var/2)+flame_off_var,-flame_h_var/2,flame_tex_var,1,1);
        // Reset
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        if global.fog_dark_var 
        { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
    }
');