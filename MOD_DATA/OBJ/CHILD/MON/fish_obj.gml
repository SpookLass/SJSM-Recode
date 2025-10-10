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
    name_var = 'Fish';
    type_var = 1;
    spd_base_var = 17/30; // 0.5r6
    spr_var = sprite_add(main_directory_const+'\SPR\MON\fish_spr.png',9,false,false,0,0);
    spr_spd_var = 1/3; // 0.r3
    dur_var = irandom_range(15,25);
    delay_var = 72;
    dmg_var = 30;
    dmg_alarm_var = 120;
    w_var = 16;
    h_var = 12;
    z_off_var = 4;
    dupe_var = dupe_canon_const;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.spr_var = spr_var;
            other.bod_spr_var = bod_spr_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(main_directory_const+'\SPR\MON\fish_spr.png',9,false,false,0,0);
        bod_spr_var = sprite_add(main_directory_const+'\SPR\MON\fish_bod_spr.png',4,false,false,0,0);
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
    // Body
    bod_len_var = 6;
    bod_taper_var = 3;
    bod_dist_var = 12;
    bod_scale_var = 0.875;
    bod_form_var = false;
    bod_spr_spd_var = 1/6; // 0.1r6
    bod_w_var[0] = 16;
    bod_h_var[0] = 12;
    bod_z_off_var[0] = 4;
    bod_w_var[1] = 16;
    bod_h_var[1] = 12;
    bod_z_off_var[1] = 4;
    bod_w_var[2] = 16;
    bod_h_var[2] = 12;
    bod_z_off_var[2] = 4;
    bod_w_var[3] = 14;
    bod_h_var[3] = 12;
    bod_z_off_var[3] = 3;
    bod_w_var[4] = 12;
    bod_h_var[4] = 12;
    bod_z_off_var[4] = 2;
    bod_w_var[5] = 10;
    bod_h_var[5] = 10;
    bod_z_off_var[5] = 2;
    // Behavior
    if global.fish_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.fish_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            bod_form_var = true;
            break;
        }
        case 3: // Remodeled
        {
            delay_var = 112;
            spd_base_var = 2;
            break;
        }
    }
    if bod_form_var
    {
        for (local.i=0; local.i<bod_len_var; local.i+=1;)
        {
            if local.i >= bod_len_var-bod_taper_var
            {
                bod_w_var[local.i] = bod_w_var[local.i-1]*bod_scale_var;
                bod_h_var[local.i] = bod_h_var[local.i-1]*bod_scale_var;
                bod_z_off_var[local.i] = bod_z_off_var[local.i-1]*bod_scale_var;
            }
            else
            {
                bod_w_var[local.i] = bod_w_var[0];
                bod_h_var[local.i] = bod_h_var[0];
                bod_z_off_var[local.i] = bod_z_off_var[0];
            }
        }
    }
    local.follow = id;
    for (local.i=0; local.i<bod_len_var; local.i+=1;)
    {
        with instance_create(0,0,fish_bod_obj)
        {
            bod_id_var = local.i;
            par_var = other.id;
            follow_var = local.follow;
            dist_var = other.bod_dist_var;
            spr_var = other.bod_spr_var;
            spr_spd_var = other.bod_spr_spd_var;
            tex_var = sprite_get_texture(spr_var,0);
            w_var = other.bod_w_var[local.i];
            h_var = other.bod_h_var[local.i];
            z_off_var = other.bod_z_off_var[local.i];
            local.follow = id;
        }
    }
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    with fish_bod_obj
    {
        if par_var == other.id
        {
            on_var = false;
            x = other.x-lengthdir_x(dist_var*(bod_id_var+1),other.yaw_var);
            y = other.y-lengthdir_y(dist_var*(bod_id_var+1),other.yaw_var);
            z = other.z;
        }
    }
");
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,"
    event_inherited();
    with fish_bod_obj
    {
        if par_var == other.id
        { on_var = true; }
    }
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    if instance_number(object_index) <= 1
    {
        sprite_delete(spr_var);
        sprite_delete(bod_spr_var);
    }
    with fish_bod_obj
    {
        if par_var == other.id
        { instance_destroy(); }
    }
");