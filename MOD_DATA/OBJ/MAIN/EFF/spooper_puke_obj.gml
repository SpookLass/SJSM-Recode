// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    image_alpha = 0;
    unheal_var = false;
    // Alarm
    alarm_len_var = 3;
    alarm_ini_scr();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if alarm_arr[2,0] > 0
    { image_alpha = alarm_arr[2,0]/alarm_arr[2,1]; }
    else { image_alpha = 0; }
    if player_var.dead_var { instance_destroy(); }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    if !player_var.dead_var
    {
        local.dead = true;
        with player_obj
        {
            if id == other.player_var && !dead_var && !hurt_var && !in_door_var && !invuln_var && on_var
            {
                if hp_var > other.dmg_var
                {
                    hp_var -= other.dmg_var;
                    hurt_var = true;
                    set_alarm_scr(0,other.alarm_02_var);
                    hurt_target_var = other.id;
                    event_user(0);
                    local.player = id;
                    if hp_var < hp_max_var && other.unheal_var
                    { unheal_var += other.dmg_var; }
                }
                else
                {
                    hp_var = 0;
                    dead_var = true;
                    do_coll_var = false;
                    do_stam_var = false;
                    // Revive
                    if other.possess_var
                    {
                        local.dead = false;
                        local.player = id;
                        other.par_var.possess_var = false;
                        with global.player_arr[other.par_var.player_id_var]
                        {
                            // Revive
                            possess_var = false;
                            dead_var = false;
                            do_coll_var = true;
                            do_stam_var = true;
                            hp_var = hp_max_var;
                            // Become other player
                            x = local.player.x;
                            y = local.player.y;
                            z = local.player.z;
                            eye_yaw_var = local.player.eye_yaw_var;
                            eye_pitch_var = local.player.eye_pitch_var;
                            // Iframes
                            hurt_var = true;
                            set_alarm_scr(0,revive_alarm_var);
                        }
                    }
                }
            }
            if !dead_var { local.dead = false; }
        }
        if local.dead && !global.debug_var && !possess_var
        {
            global.dead_mon_var = par_var.object_index;
            global.menu_player_var = local.player.player_id_var;
            if global.permadeath_var { delete_save_scr(global.save_name_var); }
            rm_goto_menu_scr(par_var.dead_rm_var,true);
            exit;
        }
        fmod_snd_play_scr(snd_var);
        instance_create(player_var.x,player_var.y,blood_sm_obj);
        if !irandom(1)
        {
            with instance_create(player_var.x,player_var.y,spooper_fetus_obj)
            {
                par_var = other.par_var;
                store_tex_var = other.fetus_tex_var;
                tex_var = store_tex_var;
            }
        }
        with instance_create(0,0,player_freeze_obj)
        {
            spd_mult_var = other.slow_var
            player_var = other.player_var;
            set_alarm_scr(0,other.alarm_02_var);
        }
        player_var.eye_h_var -= 45/7;
        set_alarm_scr(1,alarm_02_var);
        set_alarm_scr(2,alarm_03_var);
    }
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    instance_destroy();
');
// Alarm 2 Event
object_event_add
(argument0,ev_alarm,2,'
    image_alpha = 0;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_background_stretched_ext(bg_var,0,0,view_wview[view_current],view_hview[view_current],image_blend,image_alpha);
        d3d_set_hidden(true);
    }
');