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
    switch global.name_var
    {
        case name_og_const:
        case name_hd_const:
        case name_num_og_const:
        case name_fanon_const:
        {
            name_var = ini_read_string("NAME","brain","NAME_brain");
            break;
        }
        case name_num_hd_const:
        {
            name_var = ini_read_string("NAME","brain_num","NAME_brain_num");
            break;
        }
    }
    loop_snd_var[2] = string_replace(ini_read_string("SUB","brain","SUB_brain"),"@n",name_var);
    ini_close();
    type_var = 0;
    spd_base_var = 0.8;
    tex_var = brain_bg_tex;
    dur_var = 1;
    delay_var = 180;
    dmg_var = 99999;
    dmg_alarm_var = 180;
    w_var = 10;
    h_var = 10;
    spd_var = 8/9;
    target_spd_mult_var = 0.3;
    // Sounds
    do_snd_var = true;
    loop_snd_var[0] = true;
    loop_snd_dist_max_var = 600;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.loop_snd_var[1] = loop_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        loop_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\brain_loop_snd.wav",true);
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\brain_mus_snd.mp3");
    }
    if global.main_type_var != 2 && global.mode_var != 0
    {
        mus_prio_var = theme_mus_prio_const;
        dur_var = irandom_range(10,15);
        spd_var = 8/15; // Old HD
        target_spd_mult_var = 0.6;
        smart_var = true;
        eff_var = true;
        dmg_var = 60;
        // Silhouette
        sil_var = true;
        sil_type_var = 1; // Pure color
        sil_color_var = make_color_rgb(159,196,156);
        sil_alpha_var = 0.6;
        sil_dist_var = 0.1;
    }
    // sine
    z_off_time_var=0;
    z_off_mult_var=2;
    z_off_rate_var=480;
    z_off_base_var=5;
    z_off_var = z_off_base_var;
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    with brain_eff_obj { if par_var == other.id { instance_destroy(); }}
    if instance_number(object_index) <= 1
    {
        fmod_snd_free_scr(loop_snd_var[1]);
        fmod_snd_free_scr(mus_snd_var);
    }
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    if eff_var && !instance_exists(brain_eff_obj)
    {
        with instance_create(0,0,brain_eff_obj)
        {
            par_var = other.id;
        }
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if instance_number(mon_par_obj) < 2
    {
        with (player_obj)
        {
            if spd_mult_var > other.target_spd_mult_var
            { spd_mult_var = other.target_spd_mult_var; }
        }
    }
    event_inherited();
');
// Animation event
object_event_add
(argument0,ev_other,ev_user1,'
    z_off_time_var = (z_off_time_var+global.delta_time_var) mod z_off_rate_var;
    z_off_var = z_off_base_var+(sin(2*z_off_time_var*pi/z_off_rate_var)*z_off_mult_var);
');
// Target Event
object_event_add
(argument0,ev_other,ev_user6,'
    event_inherited();
    if smart_var && instance_exists(target_var) && spd_var > 0 && target_var.spd_var > 0
    {
        local.time = target_dist_var/spd_var;
        local.raydist = check_ray_scr(target_x_var,target_y_var,target_z_var,target_var.x_spd_var,target_var.y_spd_var,target_var.z_spd_var)-(target_var.coll_var[1]/2);
        local.dist = min(local.time*target_var.spd_var,local.raydist);
        target_x_var += lengthdir_x(lengthdir_x(local.dist,target_var.yaw_var),target_var.pitch_var);
        target_y_var += lengthdir_x(lengthdir_y(local.dist,target_var.yaw_var),target_var.pitch_var);
        target_z_var -= lengthdir_y(local.dist,target_var.pitch_var);
    }
');