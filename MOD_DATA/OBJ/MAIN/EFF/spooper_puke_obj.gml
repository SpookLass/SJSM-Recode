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
    // Alarm
    alarm_len_var = 2;
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
                    event_perform(ev_other,ev_user0);
                }
                else
                {
                    hp_var = 0;
                    dead_var = true;
                    do_coll_var = false;
                    grav_var = false;
                }
            }
            if !dead_var { local.dead = false; }
        }
        fmod_snd_play_scr(snd_var);
        if false//local.dead
        {
            global.dead_mon_var = par_var.object_index;
            instance_destroy();
            room_goto_scr(par_var.dead_rm_var);
            exit;
        }
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
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_background_stretched_ext(bg_var,0,0,view_wview[view_current],view_hview[view_current],image_blend,image_alpha);
        d3d_set_hidden(true);
    }
');