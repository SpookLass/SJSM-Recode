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
    // Animate
    spr_spd_var = 0.01;
    spr_id_var = 0;
    rand_rate_var = 30;
    state_var = !irandom(1);
    // Scale
    image_xscale = 1;
    image_yscale = random_range(1,1.5);
    // Alpha
    alpha_min_var = 0;
    alpha_max_var = 0.7;
    alpha_rate_var = 1/12; // 0.08r3
    image_alpha = random_range(alpha_min_var,alpha_max_var);
    // Strobe
    strobe_var = !global.reduce_flash_var;
    strobe_rate_var = 15;
    strobe_chance_var = 3;
    // Alarm
    alarm_len_var = 2;
    alarm_ini_scr();
    // Start
    if strobe_var { set_alarm_scr(1,strobe_rate_var); }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
    if state_var { image_alpha += alpha_rate_var; }
    else { image_alpha -= alpha_rate_var; }
    if image_alpha <= alpha_min_var || image_alpha >= alpha_max_var
    {
        image_alpha = median(alpha_min_var,alpha_max_var,image_alpha);
        // state_var = !state_var;
    }
');
// Alarm 0 Event (Random)
object_event_add
(argument0,ev_alarm,0,'
    if !irandom(1) { image_yscale = random_range(1,1.5); }
    else { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
    if !irandom(2) { state_var = !state_var; }
    set_alarm_scr(0,rand_rate_var);
');
// Alarm 1 Event (Strobe)
object_event_add
(argument0,ev_alarm,1,'
    if strobe_var
    {
        if frac_chance_scr(1,strobe_chance_var)
        {
            with instance_create(0,0,flash_eff_obj)
            {
                image_blend = c_black;
                set_alarm_scr(0,irandom_range(2,5));
                cam_id_var = -1;
            }
        }
        set_alarm_scr(1,strobe_rate_var);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_sprite_stretched_ext
        (
            spr_var,floor(spr_id_var),
            -view_wview[view_current]*((image_xscale-1)/2),
            -view_hview[view_current]*((image_yscale-1)/2),
            view_wview[view_current]*image_xscale,
            view_hview[view_current]*image_yscale,
            image_blend,image_alpha
        );
        d3d_set_hidden(true);
    }
');