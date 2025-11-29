// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// This shouldn't be in here, but let me have my fun
// Create Event
object_event_add
(argument0,ev_create,1,'
    ini_open(global.lang_var);
    switch global.name_var
    {
        case name_og_const:
        {
            name_var = ini_read_string("NAME","sc_og","NAME_sc_og");
            break;
        }
        case name_hd_const:
        case name_fanon_const:
        {
            name_var = ini_read_string("NAME","sc_hd","NAME_sc_hd");
            break;
        }
        case name_num_og_const:
        {
            name_var = ini_read_string("NAME","sc_num_og","NAME_sc_num_og");
            break;
        }
        case name_num_hd_const:
        {
            name_var = ini_read_string("NAME","sc_num_hd","NAME_sc_num_hd");
            break;
        }
    }
    loop_snd_var[2] = string_replace(ini_read_string("SUB","sc","SUB_sc"),"@n",name_var);
    ini_close();
    type_var = 0;
    spd_base_var = 0.8;
    spr_spd_var = 1/6;
    dur_var = irandom_range(20,30);
    delay_var = 90;
    dmg_var = 30;
    dmg_alarm_var = 120;
    w_var = 10;
    h_var = 17;
    z_off_var = 5;
    do_anim_var = -1;
    // Sounds
    loop_snd_var[0] = true;
    loop_snd_dist_max_var = 600;
    // Seen
    do_seen_var = true;
    seen_yaw_var = 30;
    seen_pitch_var = 30;
    alpha_rate_var = 0.01;
    // Effects
    fog_type_var = 0;
    fog_color_var = make_color_rgb(72,57,98);
    color_var = -1;
    dark_color_var = make_color_rgb(102,102,102);
    fog_dist_min_var = 96;
    fog_dist_max_var = 200;
    wall_alpha_var = 0.15;
    static_alpha_var = 0.025;
    overlay_alpha_var = 0.5;
    fog_alpha_var = 0.5;
    start_var = 10;
    color_prio_var = 2;
    fog_prio_var = 2;
    // Silhoette
    sil_var = true;
    sil_type_var = 1; // Pure color
    sil_color_var = fog_color_var;
    sil_alpha_var = 0.75;
    sil_dist_var = 0.1;
    // Teleport
    tp_start_alarm_min_var = 120;
    tp_start_alarm_max_var = 240;
    tp_alarm_min_var = 240;
    tp_alarm_max_var = 420;
    tp_delay_var = 30;
    return_alarm_min_var = 45;
    return_alarm_max_var = 45;
    tp_dist_var = 64;
    alarm_len_var = 11;
    // Theme
    mus_prio_var = mon_mus_prio_const;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.bg_var = bg_var;
            other.overlay_bg_var = overlay_bg_var;
            other.fog_bg_var = fog_bg_var;
            other.loop_snd_var[1] = loop_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
    // If no existing assets were found, load them
    if !local.loaded
    {
        bg_var = background_add(kh_directory_const+"\TEX\sprites\HOS_ex4.png",false,false);
        overlay_bg_var = background_add(main_directory_const+"\BG\KH\olga_bg.png",false,false);
        fog_bg_var = background_add(main_directory_const+"\BG\KH\sc_fog_bg.png",false,false);
        loop_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\sc_snd.wav",true);
        fmod_snd_set_max_vol_scr(loop_snd_var[1],0.5);
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\sc_mus_snd.mp3");
        fmod_snd_set_minmax_dist_scr(hurt_snd_var[1],0,snd_dist_max_var);
        fmod_snd_set_group_scr(hurt_snd_var[1],snd_group_mon_const);
    }
    tex_var = background_get_texture(bg_var);
    // Behavior
    if global.sc_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.sc_type_var; }
    switch local.type
    {
        case 0:
        {
            overlay_alpha_var = 0.25;
            fog_alpha_var = 0.25;
            fog_dist_min_var = 128;
            fog_type_var = 1;
            break;
        }
        case 3: // Plus
        {
            tp_delay_var = -1;
            return_alarm_min_var = 24;
            return_alarm_max_var = 42;
            break;
        }
    }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        background_delete(bg_var);
        background_delete(overlay_bg_var);
        background_delete(fog_bg_var);
        fmod_snd_free_scr(mus_snd_var);
        fmod_snd_free_scr(loop_snd_var[1]);
    }
    with kh_fog_obj { if par_var == other.id { instance_destroy(); }}
    with sc_overlay_obj { if par_var == other.id { instance_destroy(); }}
    with kh_overlay_obj { if par_var == other.id { instance_destroy(); }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    local.start = dur_start_var-dur_var;
    if local.start < start_var
    {
        local.per = local.start/start_var;
        on_var = false;
        set_alarm_scr(0,-1);
    }
    else { local.per = 1; }
    image_alpha = 1;
    if !instance_exists(kh_overlay_obj)
    {
        with instance_create(0,0,kh_overlay_obj)
        {
            par_var = other.id;
            overlay_var = true;
            overlay_bg_var = other.overlay_bg_var;
            overlay_alpha_var = overlay_alpha_var*local.per;
            image_alpha = other.static_alpha_var*local.per;
        }
    }
    if !instance_exists(fog_overlay_obj)
    {
        with instance_create(0,0,sc_overlay_obj)
        {
            par_var = other.id;
            bg_var = other.fog_bg_var;
            image_alpha = other.fog_alpha_var*local.per;
        }
    }
    with color_par_obj { if prio_var < other.color_prio_var { instance_destroy(); }}
	if !instance_exists(color_par_obj)
	{
        with instance_create(0,0,color_par_obj)
        {
            prio_var = other.color_prio_var
            image_blend = merge_color(c_white,other.dark_color_var,local.per);
            event_perform(ev_create,0);
        }
    }
    with fog_par_obj { if prio_var < other.fog_prio_var { instance_destroy(); }}
	if !instance_exists(fog_par_obj)
	{
        with instance_create(0,0,kh_fog_obj)
        {
            prio_var = other.fog_prio_var;
            par_var = other.id;
            fog_type_var = other.fog_type_var;
            fog_color_var = c_black;//other.fog_color_var;
            fog_end_var = lerp_scr(other.fog_dist_max_var,other.fog_dist_min_var,local.per);
            image_blend = other.fog_color_var;
            image_alpha = other.wall_alpha_var*local.per;
            event_user(0);
        }
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if on_var
    {
        if is_seen_var == 1 { image_alpha += alpha_rate_var*global.delta_time_var; }
        else if is_seen_var == 0 { image_alpha -= alpha_rate_var*global.delta_time_var; }
        image_alpha = median(0,1,image_alpha);
    }
    else
    {

        local.start = dur_start_var-dur_var;
        if local.start < start_var
        {
            event_user(6);
            if instance_exists(target_var)
            {
                local.trig = instance_nearest(target_x_var,target_y_var,door_trig_obj);
                local.lerp = median(0,1,1-(point_distance_3d_scr(target_x_var,target_y_var,target_z_var,local.trig.x,local.trig.y,local.trig.z)/path_get_length(target_var.path_var)));
                local.per = lerp_scr(local.start/start_var,(local.start+1)/start_var,local.lerp);
                with kh_fog_obj
                {
                    if par_var == other.id
                    { image_alpha = 0.15*local.per; }
                }
                with sc_overlay_obj
                {
                    if par_var == other.id
                    { image_alpha = 0.5*local.per; }
                }
                with kh_overlay_obj
                {
                    if par_var == other.id
                    {
                        overlay_alpha_var = 0.5*local.per;
                        image_alpha = 0.025*local.per;
                    }
                }
            }
        }
        else if tp_var
        {
            event_user(6);
            x = target_x_var+lengthdir_x(lengthdir_x(tp_dist_var,target_var.yaw_var),target_var.pitch_var);
            y = target_y_var+lengthdir_x(lengthdir_y(tp_dist_var,target_var.yaw_var),target_var.pitch_var);
            z = target_z_var-lengthdir_y(tp_dist_var,target_var.pitch_var);
            image_alpha = 1-(alarm_arr[10,0]/alarm_arr[10,1]);
        }
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    event_inherited();
    set_alarm_scr(8,irandom_range(tp_start_alarm_min_var,tp_start_alarm_max_var));
');
// Teleport Alarm
object_event_add
(argument0,ev_alarm,8,'
    if instance_exists(target_var)
    {
        tp_x_var = x;
        tp_y_var = y;
        tp_z_var = z;
        tp_alpha_var = image_alpha;
        if tp_delay_var > 0
        {
            tp_var = true;
            visible_var = true;
            fmod_inst_set_pause_scr(snd_var,true);
            on_var = false;
            set_motion_3d_scr(0,true);
            set_alarm_scr(10,tp_delay_var);
        }
        else { event_perform(ev_alarm,10); }
    }
    else { set_alarm_scr(8,irandom_range(tp_alarm_min_var,tp_alarm_max_var)); }
');
// Return Alarm
object_event_add
(argument0,ev_alarm,9,'
    x = tp_x_var;
    y = tp_y_var;
    z = tp_z_var;
    image_alpha = tp_alpha_var;
    set_alarm_scr(8,irandom_range(tp_alarm_min_var,tp_alarm_max_var));
');
// Teleport Delay
object_event_add
(argument0,ev_alarm,10,'
    if tp_delay_var
    {
        on_var = true;
        fmod_inst_set_pause_scr(snd_var,false);
        tp_var = false;
        visible_var = false;
    }
    event_user(6);
    x = target_x_var+lengthdir_x(lengthdir_x(tp_dist_var,target_var.yaw_var),target_var.pitch_var);
    y = target_y_var+lengthdir_x(lengthdir_y(tp_dist_var,target_var.yaw_var),target_var.pitch_var);
    z = target_z_var-lengthdir_y(tp_dist_var,target_var.pitch_var);
    image_alpha = 1;
    set_alarm_scr(9,irandom_range(return_alarm_min_var,return_alarm_max_var));
');