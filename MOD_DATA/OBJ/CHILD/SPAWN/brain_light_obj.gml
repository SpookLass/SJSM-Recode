// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,lab_light_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    light_per_var = sqr(random(1));
    event_user(0);
    /*alarm_len_var = 3;
    alarm_ini_scr();
    set_alarm_scr(0,irandom_range(light_alarm_min_var,light_alarm_max_var));*/
    light_var = random(1);
    inst_var = noone;
    snd_var = noone;
    if instance_exists(load_par_obj)
    {
        inst_var = fmod_snd_3d_loop_scr(load_par_obj.snd_arr_var[1,0],x,y,z);
        snd_var = load_par_obj.snd_arr_var[2,0];
    }
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    event_user(1);
');
// Room End
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(1);
');
// Sound Stop
object_event_add
(argument0,ev_other,ev_user1,'
    fmod_inst_stop_scr(inst_var);
');
// Calculate Brightness
object_event_add
(argument0,ev_other,ev_user0,'
    light_dist_var = 48;//lerp_scr(32,64,light_per_var);
    light_min_var = -1; // lerp_scr(-1,-1,light_per_var);
    light_max_var = lerp_scr(0.6,1.2,light_per_var);
    light_rate_min_var = -0.5; // lerp_scr(-0.5,-0.5,light_per_var);
    light_rate_max_var = 1; // lerp_scr(1,1,light_per_var);
    /*
    light_blink_alarm_min_var = lerp_scr(3,1,light_per_var);
    light_blink_alarm_max_var = lerp_scr(6,2,light_per_var);
    light_fade_alarm_min_var = lerp_scr(6,30,light_per_var);
    light_fade_alarm_max_var = lerp_scr(15,45,light_per_var);
    light_alarm_min_var = lerp_scr(30,15,light_per_var);
    light_alarm_max_var = lerp_scr(60,30,light_per_var);
    light_min_var = lerp_scr(0,0.7,light_per_var);
    light_max_var = lerp_scr(0.3,1,light_per_var);
    image_alpha = light_min_var;
    */
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    // Weird
    light_var = light_var+(global.delta_time_var*random_range(light_rate_min_var,light_rate_max_var)/60);
    if light_var > light_max_var
    {
        if snd_var != noone { fmod_snd_3d_play_scr(snd_var,x,y,z); }
        light_var = random(light_min_var);
    }
    image_alpha = median(light_var,0,1);
    /*if alarm_arr[1,0] > 0 { image_alpha = lerp_scr(light_max_var,light_min_var,alarm_arr[1,0]/alarm_arr[1,1]); }*/
    if instance_exists(color_par_obj)
    {
        with par_3d_obj
        {
            if color_var > 0 && color_var != 3
            {
                local.dist = point_distance(x,y,other.x,other.y);//point_distance_3d_scr(x,y,z,other.x,other.y,other.z);
                if local.dist < other.light_dist_var
                { image_blend = merge_color(color_par_obj.image_blend,c_white,other.image_alpha*(1-(local.dist/other.light_dist_var))); }
            }
        }
    }
    if inst_var != noone { fmod_inst_set_vol_scr(inst_var,image_alpha); }
');
/*
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    if snd_var != noone { fmod_snd_3d_play_scr(snd_var,x,y,z); }
    image_alpha = light_max_var;
    set_alarm_scr(1,irandom_range(light_fade_alarm_min_var,light_fade_alarm_max_var));
    set_alarm_scr(0,irandom_range(light_alarm_min_var,light_alarm_max_var));
');
// Fade Alarm
object_event_add
(argument0,ev_alarm,1,'
    if frac_chance_scr(1,2) && !global.reduce_flash_var
    { image_alpha = 0; set_alarm_scr(2,irandom_range(light_blink_alarm_min_var,light_blink_alarm_max_var)); }
    else { image_alpha = light_min_var; }
');
// Blink Alarm
object_event_add
(argument0,ev_alarm,2,'
    image_alpha = light_min_var;
');
*/