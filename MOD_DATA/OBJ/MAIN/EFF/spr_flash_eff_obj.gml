// Builtin Variables
object_set_depth(argument0,-101);
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
    //Defaults
    fade_var = false;
    cam_id_var = 0;
    // Sound
    do_snd_var = false;
    // Animate
    anim_var = !global.reduce_flash_var;
    spr_spd_var = 1;
    rand_var = true;
    rand_rate_var = 15;
    rand_chance_var = 2;
    // Alarm
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,irandom_range(30,60));
    set_alarm_scr(1,rand_rate_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if anim_var 
    {
        spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
    }
    if fade_var > 0
    {
        image_alpha = alarm_arr[0,0]/alarm_arr[0,1];
        if fade_var == 2 { image_alpha=1-image_alpha; }
    }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    if do_snd_var { fmod_inst_stop_scr(snd_var); }
    instance_destroy();
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    if rand_var
    {
        if frac_chance_scr(1,rand_chance_var)
        { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
        set_alarm_scr(1,rand_rate_var);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const && (view_current == cam_id_var || cam_id_var == -1)
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_sprite_stretched_ext(spr_var,floor(spr_id_var),0,0,view_wview[view_current],view_hview[view_current],image_blend,image_alpha);
        d3d_set_hidden(true);
    }
');