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
        case name_num_og_const:
        {
            name_var = ini_read_string('NAME','tiri','NAME_tiri');
            break;
        }
        
        case name_num_hd_const:
        {
            name_var = ini_read_string('NAME','tiri_num','NAME_tiri_num');
            break;
        }
    }
    ini_close();
    type_var = 0;
    spd_base_var = 0.7;
    spr_spd_var = 1/6;
    dur_var = irandom_range(17,25);
    delay_var = 1080/7; // 154.r285714
    dmg_var = 30;
    dmg_alarm_var = 90;
    w_var = 8.6;
    h_var = 22;
    z_off_var = 1;
    // Sounds
    snd_len_var = 4;
    snd_num_var = 1;
    snd_den_var = 3;
    snd_alarm_min_var = 200;
    snd_alarm_max_var = 480;
    snd_dist_var = 700;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.spr_var = spr_var;
            other.bg_overlay_var = bg_overlay_var;
            other.shadow_spr_var = shadow_spr_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS24_01_spr.png',8,false,false,0,0);
        bg_overlay_var = background_add(vanilla_directory_const+'\TEX\sprites\fog2_spr.png',false,false);
        shadow_spr_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS24_02_spr.png',9,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\tiri_01_snd.wav',true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\tiri_02_snd.wav',true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\tiri_03_snd.wav',true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\tiri_04_snd.wav',true);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+'\SND\MON\tiri_wake_snd.wav');
    }
    // Coward
    do_coward_var = true;
    coward_var = false;
    coward_alarm_var = 90;
    alarm_len_var = 9;
    alarm_arr[8,2] = '';
    // Effects
    eff_color_var = make_color_rgb(51,255,255);
    overlay_color_var = eff_color_var;
    overlay_alpha_var = 1;
    do_fog_var = true;
    fog_color_01_var = eff_color_var;
    fog_color_02_var = c_teal;
    // Shadows
    shadow_hp_var = 3;
    shadow_scale_var = 16;
    shadow_num_var = 1;
    shadow_den_var = 2;
    // Behavior
    if global.tiri_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.tiri_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            eff_color_var = make_color_rgb(145,167,255); // 162, 185, 283
            overlay_color_var = c_white; // eff_color_var
            fog_color_01_var = eff_color_var;
            fog_color_02_var = make_color_rgb(76,87,133);
            overlay_alpha_var = 2/3; // 0.r6
            shadow_hp_var = 1;
            do_coward_var = 2;
            shadow_scale_var = 24;
            shadow_num_var = 3;
            shadow_den_var = 5;
            if current_month == 6
            {
                gay_var = irandom_range(1,2);
                eff_color_var = make_color_hsv(138,160,250);
                fog_color_01_var = eff_color_var;
            }
            break;
        }
        case 3: // Old HD
        {
            spd_base_var = 44/45; // 0.9r7
            local.set = true;
        }
        case 2: // HD
        {
            eff_color_var = make_color_rgb(145,167,255); // 162, 185, 283
            overlay_color_var = eff_color_var;
            if !local.set { spd_base_var = 32/45; } // 0.7r1
            do_coward_var = false;
            do_fog_var = false;
            dur_var = irandom_range(8,15);
            dmg_var = 45;
            dmg_alarm_var = 180;
            delay_min_var = 90;
            delay_max_var = 180;
            snd_alarm_min_var = 180;
            snd_den_var = 1;
            shadow_hp_var = 1;
            shadow_scale_var = 24;
            shadow_num_var = 3;
            shadow_den_var = 5;
            // Sound
            snd_alarm_min_var = 180;
            snd_alarm_max_var = 480;
            snd_den_var = 1;
            snd_dist_var = 500;
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
        background_delete(bg_overlay_var);
        sprite_delete(shadow_spr_var);
    }
    with kh_overlay_obj
    { if par_var == other.id { instance_destroy(); }}
    with tiri_shadow_obj
    { if par_var == other.id { instance_destroy(); }}
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    coward_var = false;
    event_inherited();
    // Shadow animals
    for (local.i=0; local.i<global.mark_len_var; local.i+=1;)
    {
        if !global.mark_arr[local.i,3] && frac_chance_scr(shadow_num_var,shadow_den_var)
        {
            local.spr_id = irandom(floor(sprite_get_number(shadow_spr_var)/3)-1)*3;
            with instance_create(global.mark_arr[local.i,0],global.mark_arr[local.i,1],tiri_shadow_obj)
            {
                par_var = other.id;
                store_tex_var = sprite_get_texture(other.shadow_spr_var,local.spr_id);
                store_tex_02_var = sprite_get_texture(other.shadow_spr_var,local.spr_id+1);
                store_tex_03_var = sprite_get_texture(other.shadow_spr_var,local.spr_id+2);
                w_var = other.shadow_scale_var;
                h_var = other.shadow_scale_var;
                tex_var = store_tex_var;
                hp_var = other.shadow_hp_var;
            }
            global.mark_arr[local.i,3] = true;
        }
    }
    // Effects
    if !instance_exists(kh_overlay_obj)
    {
        with instance_create(0,0,kh_overlay_obj) do
        {
            par_var = other.id;
            bg_var = other.bg_overlay_var;
            y_spd_var = 1;
            image_blend = other.overlay_color_var;
            image_alpha = other.overlay_alpha_var;
        }
    }
    // Make sure the room isn't golden
    if !instance_exists(maze_dark_color_obj)
    {
        with (torch_obj) { on_var = false; }
        with (color_par_obj) { instance_destroy(); }
        switch gay_var
        {
            case 1: { instance_create(0,0,trans_color_obj); break; }
            case 2: { instance_create(0,0,transfem_color_obj); break; }
            default:
            {
                with instance_create(0,0,color_par_obj)
                {
                    image_blend = other.eff_color_var;
                    event_perform(ev_create,0);
                }
                break;
            }
        }
        if do_fog_var
        {
            with (fog_par_obj) { instance_destroy(); }
            with instance_create(0,0,fog_par_obj)
            {
                fog_var = true;
                fog_color_var = other.fog_color_01_var;
                fog_start_var = 2;
                fog_end_var = 128;
                fog_dark_var = false;
                event_user(0);
            }
        }
    }
");
// Movement
object_event_add
(argument0,ev_other,ev_user0,"
    if coward_var { spd_mult_var *= -1; }
    event_inherited();
");
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,"
    event_inherited();
    if do_coward_var && coward_alarm_var > 0
    {
        switch do_coward_var
        {
            case 1:
            {
                coward_var = true;
                set_alarm_scr(8,coward_alarm_var);
                break;
            }
            case 2:
            {
                set_motion_3d_scr(0,true);
                move_var = false;
                anim_var = false;
                attack_var = false;
                set_alarm_scr(1,coward_alarm_var);
                set_alarm_scr(2,coward_alarm_var);
                set_alarm_scr(4,coward_alarm_var);
                break;
            }
        }
    }
");
// Coward alarm
object_event_add
(argument0,ev_alarm,8,"
    coward_var = false;
");
// Draw
object_event_add
(argument0,ev_draw,0,"
    if do_fog_var && !global.fog_dark_var && global.fog_var
    {
        d3d_set_fog(global.fog_var,fog_color_02_var,global.fog_start_var,global.fog_end_var);
        event_inherited();
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    }
    else { event_inherited(); }
");