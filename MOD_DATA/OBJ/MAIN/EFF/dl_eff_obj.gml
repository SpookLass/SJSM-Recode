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
    spr_var = static_01_spr;
    anim_var = !global.reduce_flash_var;
    spr_spd_var = 0.25;
    // Random
    alpha_min_var = 0.2;
    alpha_max_var = 0.6;
    scale_min_var = 1;
    scale_max_var = 6;
    scale_big_var = 100;
    scale_bigger_var = 1000;
    rand_chance_var = 2;
    scale_big_chance_var = 6;
    scale_bigger_chance_var = 8;
    rand_rate_var = 30;
    // Remodeled
    slender_var = false;
    // Set
    image_alpha = random_range(alpha_min_var,alpha_max_var);
    image_xscale = 1;
    image_yscale = random_range(scale_min_var,scale_max_var);
    // Alarm
    alarm_len_var = 1;
    set_alarm_scr(0,rand_rate_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if slender_var
    {
        image_alpha = 0;
        with dl_obj { if slender_var { other.image_alpha = max(slender_alpha_var,other.image_alpha); }}
    }
    if anim_var
    { spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var); }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    if frac_chance_scr(1,rand_chance_var) && !slender_var
    { image_alpha = random_range(alpha_min_var,alpha_max_var); }
    if frac_chance_scr(1,scale_bigger_chance_var) { image_yscale = scale_bigger_var; }
    else if frac_chance_scr(1,scale_big_chance_var) { image_yscale = scale_big_var; }
    else if frac_chance_scr(1,rand_chance_var) { image_yscale = random_range(scale_min_var,scale_max_var); }
    set_alarm_scr(0,rand_rate_var);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    // Calculate Scale
    if view_wview[view_current] >= view_hview[view_current]
    { local.scale = view_hview[view_current]/720; }
    else { local.scale = view_wview[view_current]/1280; }
    // Draw
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_sprite_tiled_ext
    (
        spr_var,floor(spr_id_var),0,0,
        image_xscale*local.scale,image_yscale*local.scale,
        image_blend,image_alpha
    );
    d3d_set_hidden(true);
');