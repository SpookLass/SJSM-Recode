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
(argument0,ev_create,0,"
    //Defaults
    cam_id_var = -1;
    image_alpha = 0.5;
    // Alarm
    alarm_len_var = 1;
    set_alarm_scr(0,irandom_range(6,30));
    // Old
    old_var = true;
    top_off_var = random(20);
    bottom_off_var = random(20);
    // New
    sine_rate_var = 120;
    sine_base_var = 1;
    sine_mult_var = 1;
");
// Step
object_event_add
(argument0,ev_step,ev_step_normal,"
    if old_var
    { image_alpha = random_range(0.5,1); }
    else
    {
        sine_time_var = (sine_time_var+global.delta_time_var) mod sine_rate_var;
        scale_var = sine_base_var+(sine_mult_var*(sin(2*sine_time_var*pi/sine_rate_var)+1)/2);
    }
");
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,"
    top_off_var = random(20);
    bottom_off_var = random(20);
    set_alarm_scr(0,irandom_range(6,30));
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if view_current == cam_id_var || cam_id_var == -1
    {
        d3d_set_projection_ortho
        (
            view_xview[view_current],
            view_yview[view_current],
            view_xview[view_current]+view_wview[view_current],
            view_yview[view_current]+view_hview[view_current],
            0
        );
        d3d_set_hidden(false);
        if old_var
        {
            draw_background_stretched_ext
            (
                bg_var,
                view_xview[view_current],
                view_yview[view_current]-top_off_var,
                view_wview[view_current],
                view_hview[view_current]+top_off_var+bottom_off_var,
                image_blend,image_alpha
            );
        }
        else
        {
            draw_background_stretched_ext
            (
                bg_var,
                view_xview[view_current],
                view_yview[view_current],
                view_wview[view_current],
                view_hview[view_current],
                image_blend,image_alpha
            );
            draw_background_stretched_ext
            (
                bg_var,
                view_xview[view_current]-(view_wview[view_current]*((scale_var-1)/2)),
                view_yview[view_current]-(view_hview[view_current]*((scale_var-1)/2)),
                view_wview[view_current]*scale_var,
                view_hview[view_current]*scale_var,
                image_blend,image_alpha
            );
        }
        d3d_set_hidden(true);
    }
");