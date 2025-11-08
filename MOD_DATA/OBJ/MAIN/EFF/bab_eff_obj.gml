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
    anim_alarm_min_var = 6;
    anim_alarm_max_var = 15;
    // Alpha
    alpha_min_var = 0.2;
    alpha_max_var = 0.6;
    alpha_alarm_min_var = 6;
    alpha_alarm_max_var = 30;
    image_alpha = random_range(alpha_min_var,alpha_max_var);
    // Alarm
    alarm_len_var = 2;
    set_alarm_scr(0,irandom_range(anim_alarm_min_var,anim_alarm_max_var));
    set_alarm_scr(1,irandom_range(alpha_alarm_min_var,alpha_alarm_max_var));
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    if frac_chance_scr(1,2)
    { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
    set_alarm_scr(0,irandom_range(anim_alarm_min_var,anim_alarm_max_var));
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    if frac_chance_scr(1,2)
    { image_alpha = random_range(alpha_min_var,alpha_max_var); }
    set_alarm_scr(1,irandom_range(alpha_alarm_min_var,alpha_alarm_max_var));
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_sprite_stretched_ext(spr_var,floor(spr_id_var),0,0,view_wview[view_current],view_hview[view_current],image_blend,image_alpha);
    d3d_set_hidden(true);
');