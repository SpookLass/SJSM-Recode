// Builtin Variables
object_set_depth(argument0,98);
object_set_mask(argument0,noone);
object_set_parent(argument0,skybox_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    side_tex_var = sky_01_bg_tex;
    bottom_tex_var = sky_02_bg_tex;
    top_tex_var = sky_02_bg_tex;
    dist_var = 16;
    inst_var = fmod_snd_loop_scr(rain_snd);
    // Lightning
    light_per_var = 0;
    light_fade_min_var = 9;
    light_fade_max_var = 18;
    light_alarm_min_var = 60;
    light_alarm_max_var = 240;
    light_delay_min_var = 20;
    light_delay_max_var = 60;
    light_num_var = 1;
    light_den_var = 3;
    light_double_num_var = 1;
    light_double_den_var = 4;
    // Alarm
    alarm_len_var = 4;
    alarm_ini_scr();
    set_alarm_scr(0,irandom_range(light_alarm_min_var,light_alarm_max_var));
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    fmod_inst_stop_scr(inst_var);
');
// Room End
object_event_add
(argument0,ev_other,ev_room_end,'
    fmod_inst_stop_scr(inst_var);
    event_inherited();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if alarm_arr[3,0] > 0
    { light_per_var = median(0,1,alarm_arr[3,0]/alarm_arr[3,1]); }
');
// Lightning Alarm
object_event_add
(argument0,ev_alarm,0,'
    if frac_chance_scr(light_num_var,light_den_var)
    { set_alarm_scr(1,irandom_range(light_delay_min_var,light_delay_max_var)); }
    else if frac_chance_scr(light_double_num_var,light_double_den_var)
    { set_alarm_scr(2,irandom_range(light_delay_min_var,light_delay_max_var)); }
    set_alarm_scr(0,irandom_range(light_alarm_min_var,light_alarm_max_var))
');
// Lightning 01 Alarm
object_event_add
(argument0,ev_alarm,1,'
    light_per_var = 1;
    fmod_snd_play_scr(choose(lightning_01_snd,lightning_02_snd,lightning_03_snd,lightning_04_snd));
    local.per = random(1);
    set_alarm_scr(3,round(lerp_scr(light_fade_min_var,light_fade_max_var,local.per)));
    // Shake?
    with player_obj
    {
        if on_var && !dead_var && !in_door_var
        {
            local.player = id;
            switch (global.shake_type_var)
            {
                case shake_classic_const:
                {
                    with instance_create(0,0,shake_eff_obj)
                    {
                        player_var = local.player;
                        mult_var = local.player.shake_pos_base_var*local.per;
                        type_var = 0; // Constant
                    }
                    break;
                }
                case shake_modern_const:
                {
                    with instance_create(0,0,shake_eff_obj)
                    {
                        player_var = local.player;
                        mult_var = local.player.shake_angle_base_var*local.per;
                        type_var = 1; // Fade out
                    }
                    break;
                }
            }
        }
    }
');
// Lightning 02 Alarm
object_event_add
(argument0,ev_alarm,2,'
    event_perform(ev_alarm,1);
    set_alarm_scr(1,alarm_arr[3,1]+light_delay_min_var);
');
// Lightning Fade Alarm
object_event_add
(argument0,ev_alarm,3,'
    light_per_var = 0;
');
// Draw Event
object_event_add
(argument0,ev_other,ev_user0,'
    event_inherited();
    if light_per_var > 0
    {
        local.dist = dist_var-1;
        draw_set_alpha(light_per_var);
        d3d_draw_block(-local.dist,-local.dist,-local.dist,local.dist,local.dist,local.dist,white_bg_tex,1,1);
        draw_set_alpha(1);
    }
');