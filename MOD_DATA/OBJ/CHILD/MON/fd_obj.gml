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
    name_var = 'Food Demon';
    type_var = 0;
    spd_base_var = 0.8;
    spr_spd_var = 0.25;
    dur_var = irandom_range(15,25);
    delay_var = 120;
    dmg_var = 45;
    dmg_alarm_var = 120;
    w_var = 15;
    h_var = 19.3;
    z_off_var = 7;
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
    // Seen
    do_seen_var = true;
    seen_yaw_var = 5.856;
    seen_pitch_var = 5.856;
    seen_dist_var = 120;
    seen_spd_mult_var = 2;
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
    // Behavior
    if global.fd_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.fd_type_var; }
    switch local.type
    {
        case 0:
        {
            dmg_var = 30;
            break;
        }
        case 2:
        {
            do_seen_var = false;
            hide_trig_var = false;
            break;
        }
    }
    event_inherited();
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
");
// Room Start
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
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
    if seen_var == 1 && target_dist_var < seen_dist_var
    {
        spd_mult_var = seen_spd_mult_var;
        spr_id_var = irandom(sprite_get_number(spr_var)-1);
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