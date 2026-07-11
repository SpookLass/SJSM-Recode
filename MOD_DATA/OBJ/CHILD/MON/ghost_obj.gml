// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,kidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,'
    snd_len_var = 4;
    // Translations
    ini_open("lang_"+global.lang_var+".ini");
    name_var = translate_mon_str_scr("ghost",global.name_var);
    local.sub = string_replace(ini_read_string("SUB","ghost","SUB_ghost"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1;)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    ini_close();
    // Stuff
    dmg_var = 20;
    dmg_alarm_var = 30;
    atk_alarm_var = 180;
    spr_spd_var = 1;
    do_move_var = false;
    type_var = 0;
    vanish_var = true;
    w_var = 10;
    h_var = 20;
    eye_h_var = 114/7;
    snd_h_var = eye_h_var;
    atk_range_var = 16;
    alpha_min_var = 0.1;
    alpha_max_var = 0.5;
    seen_yaw_var = 15;
    seen_pitch_var = 15;
    delay_var = 0;
    spawn_var = -1;
    // Behavior
    if global.ringu_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.ringu_type_var; }
    switch local.type
    {
        case 0:
        {
            atk_range_var = global.mon_coll[2];
            break;
        }
        case 3:
        case 2:
        {
            atk_range_var = 25.6;
            do_seen_var = true;
            vanish_var = false;
            break;
        }
    }
    // Assets
    tex_var = sprite_get_texture(ghost_spr,irandom(sprite_get_number(ghost_spr)-1));
    if instance_exists(load_par_obj)
    {
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { snd_arr[local.i,0] = load_par_obj.snd_arr_var[local.i,0]; }
    }
');
// Animation
object_event_add
(argument0,ev_other,ev_user1,'
    spr_prog_var -= spr_spd_var*global.delta_time_var;
    if spr_prog_var <= 0
    {
        spr_prog_var = 1;
        image_alpha = random_range(alpha_min_var,alpha_max_var);
        if do_seen_var { image_alpha *= 1-seen_per_var; }
    }
');
// Attack success event
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    // Sound
    local.snd = irandom(snd_len_var-1);
    inst_var = fmod_snd_3d_play_scr(snd_arr[local.snd,0],x,y,z+snd_h_var);
    if global.pitch_bend_var { fmod_inst_set_pitch_scr(inst_var,random_range(0.95,1.05)); }
    sub_var[0] = snd_arr[local.snd,1];
    sub_var[1] = snd_arr[local.snd,2];
    // Disable (if not HD)
    if vanish_var { on_var = false; }
');