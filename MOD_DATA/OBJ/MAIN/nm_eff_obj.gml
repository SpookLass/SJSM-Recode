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
    fake_hp_max_var = 100;
    fake_hp_rate_var = 1/15;
    for (local.i=0; local.i<global.player_len_var; local.i+=1;)
    { fake_hp_var[local.i] = 100; }
    image_blend = c_red;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    for (local.i=0; local.i<global.player_len_var; local.i+=1;)
    {
        if fake_hp_var[local.i] < fake_hp_max_var
        { fake_hp_var[local.i] = median(0,fake_hp_max_var,fake_hp_var[local.i]+(global.delta_time_var*fake_hp_rate_var)); }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const
    {
        local.alpha = 1-(fake_hp_var[view_current]/fake_hp_max_var);
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,1,1,0);
        d3d_set_hidden(false); draw_set_color(image_blend); draw_set_alpha(local.alpha);
        draw_rectangle(0,0,1,1,false);
        draw_set_color(c_white); draw_set_alpha(1); d3d_set_hidden(true);
    }
');