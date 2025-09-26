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
    spd_base_var = 0.6;
    spr_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS_01_spr.png',5,false,false,0,0);
    spr_spd_var = 1/6;
    dur_var = irandom_range(10,20);
    delay_var = 160;
    dmg_var = 45;
    dmg_alarm_var = 120;
    w_var = 10;
    h_var = 20;
    z_off_var = 2;
    // Sounds
    snd_len_var = 4;
    snd_arr[0,0] = caster_load(main_directory_const+'\SND\MON\gel_01_snd.ogg');
    snd_arr[1,0] = caster_load(main_directory_const+'\SND\MON\gel_02_snd.ogg');
    snd_arr[2,0] = caster_load(main_directory_const+'\SND\MON\gel_03_snd.ogg');
    snd_arr[3,0] = caster_load(main_directory_const+'\SND\MON\gel_04_snd.ogg');
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_var = 600;
    // Coward
    coward_var = true;
    coward_spd_mult_var = 4/3; // 1.r3x
    // Slime
    slime_var = true;
    do_slime_spawn_var = false;
    slime_alarm_var = 60;
    slime_bg_var = background_add(main_directory_const+'\BG\MON\gel_puddle_bg.png',false,false);
    slime_tex_var = background_get_texture(slime_bg_var);
    slime_anim_var = 0;
    slime_angle_var = random(360);
    slime_z_off_var = 0.15;
    slime_alpha_var = 0.8;
    slime_w_base_var = 28;
    slime_spawn_spd_mult_var = 1;
    slime_spd_mult_var = 2/3; // 0.r6x
    h_base_var = 20;
    z_off_base_var = 2;
    z_off_start_var = -h_base_var;
    // Behavior
    switch global.gel_type_var
    {
        case 0:
        {
            type_var = 2;
            dmg_var = 40;
            z_off_start_var = 0;
            slime_anim_var = 2;
            slime_spd_mult_var = 0.6;
            // Move slower dangit
            slime_spawn_spd_mult_var = 8/15; // 0.5r3 for accuracy
            delay_var = 0;
            // Bools
            coward_var = false;
            do_slime_spawn_var = true;
            break;
        }
        case 2: // HD
        {
            type_var = 2;
            spd_base_var = 8/9; // 0.r8
            dur_var = irandom_range(10,15);
            dmg_alarm_var = 180;
            delay_min_var = 60;
            delay_max_var = 180;
            slime_spd_mult_var = 0.3;
            // Attack (I Hope)
            atk_delay_var = 30;
            atk_range_var = 32; // 16 radius
            atk_dist_var = 15;
            // Sound
            snd_alarm_min_var = 90;
            snd_alarm_max_var = 240;
            snd_den_var = 1;
            // Bools
            coward_var = false;
            do_slime_spawn_var = true;
            break;
        }
    }
    alarm_len_var = 9;
    alarm_arr[8,2] = '';
    event_inherited();
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    if do_slime_spawn_var
    {
        slime_spawn_var = 2;
        if slime_anim_var > 0
        { h_var = 0; }
        z_off_var = z_off_start_var;
        slime_w_var = slime_w_base_var;
        slime_angle_var = random(360);
    }
    if slime_var
    {
        for (local.i=0; local.i<global.mark_len_var; local.i+=1;)
        {
            if !irandom(2)
            {
                with instance_create(global.mark_arr[local.i,0],global.mark_arr[local.i,1],slime_obj)
                {
                    tex_var = other.slime_tex_var;
                    image_alpha = other.slime_alpha_var;
                    w_var = other.slime_w_base_var;
                    z_off_var = other.slime_z_off_var;
                    spd_mult_var = other.slime_spd_mult_var;
                    z = global.mark_arr[local.i,2];
                }
            }
        }
    }
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    sprite_delete(spr_var);
");
// Slime alarm
object_event_add
(argument0,ev_alarm,8,"
    slime_spawn_var = false;
    h_var = h_base_var;
    z_off_var = z_off_base_var;
    slime_w_var = 0;
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    event_inherited();
    switch slime_spawn_var
    {
        case 1:
        {
            local.per = alarm_arr[8,0]/alarm_arr[8,1];
            if slime_anim_var > 0
            {
                h_var = h_base_var*(1-local.per);
                if slime_anim_var == 2
                { z_off_start_var = -h_var; }
            }
            z_off_var = lerp_scr(z_off_base_var,z_off_start_var,local.per);
            slime_w_var = slime_w_base_var*local.per;
            break;
        }
        case 2:
        {
            if slime_spawn_spd_mult_var != 1 { spd_mult_var *= slime_spawn_spd_mult_var; }
            break;
        }
    }
    
");
// Movement
object_event_add
(argument0,ev_other,ev_user0,"
    if enter_var && do_slime_spawn_var && target_dist_var <= spd_base_var*spd_mult_var
    {
        x = target_x_var;
        y = target_y_var;
        z = target_z_var;
        do_coll_var = true;
        enter_var = false;
        slime_spawn_var = 1;
        move_var = false;
        set_alarm_scr(8,slime_alarm_var);
        set_alarm_scr(1,slime_alarm_var);
        set_motion_scr(0,true);
        exit;
    }
    event_inherited();
");
// Draw
object_event_add
(argument0,ev_draw,0,"
    event_inherited();
    if slime_spawn_var > 0
    {
        draw_set_color(image_blend); draw_set_alpha(slime_alpha_var);
        d3d_transform_set_identity();
        d3d_transform_set_rotation_z(slime_angle_var);
        d3d_transform_add_translation(x,y,z+slime_z_off_var);
        local.radius = slime_w_var/2;
        d3d_draw_floor(-local.radius,-local.radius,0,local.radius,local.radius,0,slime_tex_var,1,1);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
")