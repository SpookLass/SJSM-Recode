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
    name_var = 'Ringu';
    type_var = 0;
    spd_base_var = 0.8;
    spr_spd_var = 1/6;
    dur_var = irandom_range(10,20);
    delay_var = 173;
    dmg_var = 45;
    dmg_alarm_var = 120;
    w_var = 10;
    h_var = 20;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.spr_var = spr_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS3_01_spr.png',6,false,false,0,0);
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
    // Behavior
    if global.ringu_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.ringu_type_var; }
    switch local.type
    {
        case 0:
        {
            dmg_var = 30;
            break;
        }
        case 3: // Old HD
        {
            spd_base_var = 44/45; // 0.9r7
        }
        case 2: // HD
        {
            dur_var = irandom_range(10,15);
            dmg_alarm_var = 180;
            delay_min_var = 90;
            delay_max_var = 180;
            break;
        }
    }
    event_inherited();
    z_off_var = 2;
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    if instance_number(object_index) <= 1
    { sprite_delete(spr_var); }
");