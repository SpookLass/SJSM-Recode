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
(argument0,ev_create,1,"
    ini_open(global.lang_var);
    switch global.name_var
    {
        case name_og_const:
        case name_hd_const:
        case name_fanon_const:
        {
            name_var = ini_read_string('NAME','fd','NAME_fd');
            break;
        }
        case name_num_og_const:
        case name_num_hd_const:
        {
            name_var = ini_read_string('NAME','fd_num','NAME_fd_num');
            break;
        }
    }
    ini_close();
    type_var = 0;
    spd_base_var = 0.8;
    dur_var = irandom_range(15,25);
    delay_var = 120;
    dmg_var = 45;
    dmg_alarm_var = 120;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.spr_var = spr_var;
            other.eff_spr_01_var = eff_spr_01_var;
            other.eff_spr_02_var = eff_spr_02_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS9_01_spr.png',12,false,false,0,0);
        eff_spr_01_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS9_02_spr.png',3,0,0,0,0);
        eff_spr_02_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS9_03_spr.png',19,0,0,0,0);
    }
    // Sounds
    snd_len_var = 4;
    snd_arr[0,0] = caster_load(main_directory_const+'\SND\MON\ringu_01_snd.ogg');
    snd_arr[1,0] = caster_load(main_directory_const+'\SND\MON\ringu_02_snd.ogg');
    snd_arr[2,0] = caster_load(main_directory_const+'\SND\MON\ringu_03_snd.ogg');
    snd_arr[3,0] = caster_load(main_directory_const+'\SND\MON\ringu_04_snd.ogg');
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_var = 600;
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
    h_var = h_var;
    z_off_var = z_off_var;
    flame_z_off_var = flame_z_off_base_var;
    // Seen
    do_seen_var = true;
    seen_yaw_var = 5.856;
    seen_dist_var = 120;
    seen_spd_mult_var = 2;
    spr_spd_seen_var = 1;
    spr_spd_base_var = 0.25;
    spr_spd_var = spr_spd_base_var;
    // Door vanish
    hide_alarm_min_var = 160;
    hide_alarm_max_var = 320;
    hide_chance_var = 2;
    hide_trig_var = true;
    hide_per_var = true;
    alarm_len_var = 9;
    alarm_arr[8,2] = '';
    // Effect
    eff_dist_var = 32;
    eff_chance_var = 5;
    // Flame
    flame_var = false;
    flame_spr_var = torch_spr;
    flame_spr_spd_var = 0.25;
    flame_h_var = 4.8;
    flame_w_var = 3;
    flame_z_off_var = 19.2; // Gone Rouge
    flame_off_var = 105/330; // Maybe 90/330
    flame_tex_var = sprite_get_texture(flame_spr_var,0);
    flame_alpha_var = 1;
    flame_color_var = c_white;
    // Behavior
    if global.fd_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.fd_type_var; }
    switch local.type
    {
        case 0:
        {
            seen_pitch_var = 5.856;
            flame_var = true;
            dmg_var = 30;
            hurt_spd_var = 1;
            hurt_alarm_var = 18;
            hurt_tp_var = 2;
            stun_var = true;
            break;
        }
        case 2: // HD
        {
            flame_var = true;
            spd_base_var = 8/9; // 0.r8
            do_seen_var = false;
            hide_trig_var = false;
            hide_alarm_min_var = 156;
            hide_alarm_max_var = 318;
            delay_min_var = 90;
            delay_max_var = 180;
            dmg_alarm_var = 180;
            violence_var = 2;
            hurt_spd_var = 1;
            hurt_alarm_var = 18;
            hurt_tp_var = 2;
            stun_var = true;
            break;
        }
    }
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    if instance_number(object_index) <= 1
    {
        sprite_delete(spr_var);
        sprite_delete(eff_spr_01_var);
        sprite_delete(eff_spr_02_var);
    }
    with spr_flash_eff_obj
    { if par_var == other.id { instance_destroy(); }}
");
// Room Start
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    w_var = w_base_var;
    h_var = h_base_var;
    z_off_var = z_off_base_var;
    flame_z_off_var = flame_z_off_base_var;
    spr_spd_var = spr_spd_base_var;
    anim_type_var = 0;
    if global.color_var < 2 && instance_exists(color_par_obj)
    { flame_color_var = color_par_obj.light_color_var; }
    else { flame_color_var = c_white; }
    if hide_per_var
    {
        with door_obj { visible = !other.hide_var; }
        if hide_trig_var
        {
            with door_trig_obj 
            {
                if do_txt_var >= 0
                { do_txt_var = !other.hide_var; }
            }
        }
    }
    else { hide_var = false; }
");
// Delay
object_event_add
(argument0,ev_alarm,0,"
    event_inherited();
    event_perform(ev_alarm,8);
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if hurt_var
    {
        if hurt_spd_var != 1 { spd_mult_var *= hurt_spd_var; }
        if alarm_arr[3,0] > 0 && hurt_tp_var == 2
        {
            local.per = alarm_arr[3,0]/alarm_arr[3,1]
            w_var = lerp_scr(0,w_base_var,local.per);
            h_var = lerp_scr(h_base_var*20,h_base_var,local.per);
            z_off_var = lerp_scr(z_off_base_var-(h_base_var*9.5),z_off_base_var,local.per)
            flame_z_off_var = lerp_scr(flame_z_off_base_var*20,flame_z_off_base_var,local.per)
        }
    }
    if seen_var == 1 && target_dist_var < seen_dist_var
    {
        spd_mult_var *= seen_spd_mult_var;
        spr_spd_var = spr_spd_seen_var;
        anim_type_var = 3;
    }
    else if anim_type_var == 3
    {
        spr_spd_var = spr_spd_base_var;
        anim_type_var = 0;
    }
    event_inherited();
");
// Sound alarm
object_event_add
(argument0,ev_alarm,6,"
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
");
// Door!
object_event_add
(argument0,ev_alarm,8,"
    if frac_chance_scr(hide_chance_var-1,door_chance_var) || hide_var
    {
        hide_var = !hide_var;
        with door_obj { visible = !other.hide_var; }
        if hide_trig_var
        {
            with door_trig_obj 
            {
                if do_txt_var >= 0
                { do_txt_var = !other.hide_var; }
            }
        }
    }
    set_alarm_scr(8,irandom_range(hide_alarm_min_var,hide_alarm_max_var));
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    event_inherited();
    flame_spr_id_var = (flame_spr_id_var+(flame_spr_spd_var*global.delta_time_var)) mod sprite_get_number(flame_spr_var);
    flame_tex_var = sprite_get_texture(flame_spr_var,floor(flame_spr_id_var))
");
// Hurt
object_event_add
(argument0,ev_other,ev_user4,"
    event_inherited();
    if hurt_tp_var == 1 { event_user(15); }
");
// Hurt Alarm
object_event_add
(argument0,ev_alarm,3,"
    if hurt_tp_var == 2
    {
        w_var = w_base_var;
        h_var = h_base_var;
        z_off_var = z_off_base_var;
        flame_z_off_var = flame_z_off_base_var;
        event_user(15);
    }
    event_inherited();
");
// Teleport
object_event_add
(argument0,ev_other,ev_user15,"
    // Originally anywhere in the room (0-1280 x 0-720 y)
    local.dir = random(360);
    local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
    x = target_x_var+lengthdir_x(local.dist,local.dir);
    y = target_y_var+lengthdir_y(local.dist,local.dir);
");
// Draw
object_event_add
(argument0,ev_draw,0,"
    event_inherited();
    if flame_var && (on_var || visible_var)
    {
        if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
        d3d_transform_set_identity();
        d3d_transform_add_rotation_y(point_direction_3d_scr(x,y,z+z_off_var+flame_z_off_var,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]));
        d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
        d3d_transform_add_translation(x,y,z+z_off_var+flame_z_off_var);
        draw_set_color(flame_color_var); draw_set_alpha(flame_alpha_var);
        d3d_draw_wall(0,(flame_w_var/2)+flame_off_var,flame_h_var/2,0,(-flame_w_var/2)+flame_off_var,-flame_h_var/2,flame_tex_var,1,1);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        if global.fog_dark_var 
        { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
    }
")