// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,kidna_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,'
    // Sounds
    snd_len_var = 5;
    snd_num_var = 7;
    snd_den_var = 8;
    snd_alarm_min_var = 60;
    snd_alarm_max_var = 80;
    snd_dist_min_var = 0;
    snd_dist_max_var = 512;
    hurt_snd_var = 4;
    // Language
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("husk",global.name_var);
    local.sub = string_replace(ini_read_string("SUB","husk","SUB_husk"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    hurt_snd_var[2] = string_replace(ini_read_string("SUB","doll_hurt","SUB_doll_hurt"),"@n",name_var); hurt_snd_var[3] = false;
    ini_close();
    // Variables
    type_var = 1;
    spd_base_var = random_range(0.15,0.2);
    spr_spd_var = spd_base_var/1.45;
    delay_var = 0;
    dmg_var = 15;
    dmg_alarm_var = 30;
    blood_spr_var = blood_kh_spr;
    local.width = random(1);
    local.height = random(1);
    w_var = lerp_scr(9.5,10.5,local.width);
    h_var = lerp_scr(15.75,19.25,local.height);
    blob_w_var = lerp_scr(0.91,1.43,local.width);
    blob_h_var = lerp_scr(13/11,13/7,local.height);
    eye_h_var = h_var*11/15; // x0.7r3
    dead_var = false;
    spawn_attempt_var = 30;
    spawn_dist_var = 24;
    dead_rm_var = husk_dead_rm;
    // Attack
    atk_type_var = 3; // Stop moving while delay
    atk_dist_var = 8.5;
    atk_range_var = 20;
    atk_delay_var = 12;
    atk_end_delay_var = 30;
    // Hurt
    hp_var = irandom_range(2,7);
    do_hurt_var = 2;
    hurt_alarm_base_var = 30;
    hurt_alarm_var = hurt_alarm_base_var;
    hurt_dist_base_var = 5;
    hurt_dist_var = hurt_dist_base_var;
    hurt_hp_base_var = 1;
    hurt_hp_var = hurt_hp_base_var;
    hurt_die_var = 2;
    stun_var = true;
    hurt_down_var = true;
    // Blob
    blob_var = false;
    blob_hurt_var = true;
    blob_hurt_hp_var = 3;
    blob_hurt_dist_var = 5;
    blob_hurt_alarm_var = 0;
    trig_w_var = 16;
    trig_h_var = 0.5/pixel_meter_rate_const;
    direction = random(360);
    // Shadow
    shadow_z_var = 0.3;
    shadow_w_var = 10;
    // Dead
    dead_alarm_var = 18; // I think, could be 21
    revive_var = false;
    // Alarm JUST for becoming not red
    alarm_len_var = 9;
    alarm_ini_scr();
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    if persistent
    {
        event_user(15);
        if revive_var && dead_var == 1
        {
            // Enable behavior
            visible_var = false;
            dead_var = false;
            stun_var = true;
            // Restore hurt
            hurt_snd_var = 4;
            hurt_dist_var = hurt_dist_base_var;
            hurt_alarm_var = hurt_alarm_base_var;
            // Undo animation
            spr_var = main_spr_var;
            spr_id_var = 0;
            tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
            anim_type_var = 0; // Normal
        }
        if heal_var { hp_var = hp_max_var; }
    }
    
    event_user(14);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if blob_var == 2
    {
        local.burst = false;
        with player_obj
        {
            if !dead_var && !hurt_var && !in_door_var && !invuln_var && on_var
            {
                if box_coll_scr(x,y,z,coll_var[2],coll_var[2],coll_var[1],other.x,other.y,other.z,other.trig_w_var,other.trig_w_var,other.trig_h_var)
                { local.burst = true; local.player = id; break; }
            }
        }
        if local.burst
        {
            fmod_snd_play_scr(claw_snd);
            blob_var = false;
            event_user(14);
            if !global.reduce_flash_var
            {
                with instance_create(0,0,fade_eff_obj)
                {
                    image_blend = c_yellow;
                    cam_id_var = local.player.cam_id_var;
                    set_alarm_scr(0,12);
                }
            }
        }
    }
');
// Hurt Alarm
object_event_add
(argument0,ev_alarm,3,'
    event_inherited();
    if dead_var
    {
        spr_id_var = sprite_get_number(spr_var)-1;
        tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    }
');
// Red Alarm
object_event_add
(argument0,ev_alarm,8,'
    tone_var = c_white;
');
// Hurt Event
object_event_add
(argument0,ev_other,ev_user4,'
    if !enter_var
    {
        event_inherited();
        if dead_var
        {
            spr_id_var = sprite_get_number(spr_var)-2;
            tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
        }
        else if !blob_var
        {
            tex_var = background_get_texture(hurt_bg_var);
            tone_var = c_red;
            set_alarm_scr(8,3);
        }
    }
');
// Die event
object_event_add
(argument0,ev_other,ev_user11,'
    if !hurt_down_var
    {
        persistent = false;
        tone_var = c_white;
        // Play sound
        if fmod_inst_is_play_scr(inst_var)
        { fmod_inst_stop_scr(inst_var); }
        fmod_snd_play_scr(claw_snd);
        // Disable behavior
        visible_var = true;
        dead_var = 2;
        move_var = false;
        atk_var = false;
        stun_var = false;
        set_motion_scr(0,true);
        reset_alarm_scr();
        // Dont hit
        do_hurt_var = false;
        hurt_die_var = false;
        hurt_hp_var = 0;
        // Play animation
        spr_var = dead_spr_var;
        spr_id_var = 0;
        tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
        anim_type_var = 1; // End on last
        set_alarm_scr(5,dead_alarm_var);
        with instance_create(x,y,doll_blood_obj)
        {
            par_var = other.id;
            store_tex_var = other.doll_blood_tex_var;
            tex_var = store_tex_var;
        }
    }
    else if dead_var
    {
        if revive_var
        { persistent = false; }
        do_hurt_var = true;
        hurt_hp_var = 0;
        hurt_die_var = false;
        dead_var = 2;
        with instance_create(x,y,doll_blood_obj)
        {
            par_var = other.id;
            store_tex_var = other.doll_blood_tex_var;
            tex_var = store_tex_var;
        }
        // Play sound
        if fmod_inst_is_play_scr(inst_var)
        { fmod_inst_stop_scr(inst_var); }
        fmod_snd_play_scr(claw_snd);
    }
    else
    {
        if !revive_var
        { persistent = false; }
        tone_var = c_white;
        // Disable behavior
        visible_var = true;
        dead_var = true;
        move_var = false;
        atk_var = false;
        stun_var = false;
        set_motion_scr(0,true);
        reset_alarm_scr();
        // Hit em while theyre down
        hp_max_var = irandom_range(2,5);
        hp_var = hp_max_var;
        hurt_snd_var = 2;
        hurt_var = false;
        hurt_dist_var = 0;
        hurt_alarm_var = 3;
        // Play sound
        if fmod_inst_is_play_scr(inst_var)
        { fmod_inst_stop_scr(inst_var); }
        fmod_snd_play_scr(claw_snd);
        // Play animation
        spr_var = dead_spr_var;
        spr_id_var = 0;
        tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
        anim_type_var = 1; // End on last
        set_alarm_scr(5,dead_alarm_var);
    }
');
// Blob Event
object_event_add
(argument0,ev_other,ev_user14,'
    if blob_var
    {
        move_var = false;
        anim_var = false;
        atk_var = false;
        do_hurt_var = blob_hurt_var;
        hurt_dist_var = blob_hurt_dist_var;
        hurt_alarm_var = blob_hurt_alarm_var;
        set_alarm_scr(6,-1);
        if blob_var == 2 { hurt_hp_var = hurt_hp_base_var; }
        else { hurt_hp_var = blob_hurt_hp_var; }
    }
    else
    {
        move_var = true;
        anim_var = true;
        atk_var = true;
        do_hurt_var = 2;
        hurt_dist_var = hurt_dist_base_var;
        hurt_alarm_var = hurt_alarm_base_var;
        hurt_hp_var = hurt_hp_base_var;
        if do_snd_var
        {
            if snd_len_var > 0
            { set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_max_var)); }
        }
    }
');
// Spawn Event
object_event_add
(argument0,ev_other,ev_user15,'
    // Spawn
    on_var = false;
    for (local.i=0; local.i<spawn_attempt_var; local.i+=1;)
    {
        local.flr = instance_find(floor_par_obj,irandom(instance_number(floor_par_obj)-1));
        local.xtmp = local.flr.x;//+random_range(-local.flr.w_var/2,local.flr.w_var/2);
        local.ytmp = local.flr.y;//+random_range(-local.flr.h_var/2,local.flr.h_var/2);
        local.ztmp = local.flr.z;
        if spawn_dist_var > 0
        {
            local.bestdist = -1;
            with player_obj
            {
                if on_var && !dead_var && !in_door_var
                {
                    local.dist = point_distance_3d_scr(local.xtmp,local.ytmp,local.ztmp,x,y,z);
                    if local.dist < local.bestdist || local.bestdist == -1 { local.bestdist = local.dist; }
                }
            }
            local.bool = local.bestdist >= spawn_dist_var;
        }
        else { local.bool = true; }
        if local.bool
        {
            if !check_coll_scr(0,0,0,0,local.xtmp,local.ytmp,local.ztmp)
            {
                x = local.xtmp;
                y = local.ytmp;
                z = local.ztmp;
                on_var = true;
                break;
            }
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if (on_var || visible_var)
    {
        if blob_var
        {
            if (!possess_var || cam_id_var != view_current || global.reflect_var)
            {
                draw_set_color(color_mult_scr(image_blend,tone_var)); draw_set_alpha(image_alpha);
                d3d_transform_set_identity();
                // Transforms
                d3d_transform_add_scaling(blob_w_var,blob_w_var,blob_h_var);
                d3d_transform_add_rotation_y(direction);
                d3d_transform_add_translation(x,y,z);
                // Draw
                d3d_model_draw(mdl_var,0,0,0,mdl_tex_var);
                // Reset
                d3d_transform_set_identity();
                draw_set_color(c_white); draw_set_alpha(1);
            }
        }
        else if !global.reflect_var
        {
            draw_set_alpha(image_alpha); d3d_transform_set_identity();
            d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+shadow_z_var);
            // Draw
            d3d_draw_floor(-shadow_w_var/2,-shadow_w_var/2,0,shadow_w_var/2,shadow_w_var/2,0,shadow_tex_var,1,1);
            draw_set_alpha(1); d3d_transform_set_identity();
            // Inherit
            event_inherited();
        }
    }
');