// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    on_var = false;
    // Alarms
    alarm_len_var = 2;
    alarm_ini_scr();
    alarm_min_var = 160;
    alarm_max_var = 420;
    rand_alarm_min_var = 30;
    rand_alarm_max_var = 90;
    set_alarm_scr(0,irandom_range(alarm_min_var,alarm_max_var));
    per_var = false;
    // Scale
    scale_time_var = 0;
    scale_base_var = 0.875;
    scale_mult_var = 1.25;
    scale_rate_var = 50;
    scale_var = scale_base_var;
    // Surface
    surf_var = surface_create(256,256);
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    surface_reset_target();
    tex_var = surface_get_texture(surf_var);
    // Path
    path_var = path_add();
    path_set_kind(path_var,1); // Smooth
    path_set_closed(path_var,true);
    path_set_precision(path_var,4);
    path_add_point(path_var,0,0,100);
    path_add_point(path_var,-80,-80,100);
    path_add_point(path_var,-176,16,100);
    path_add_point(path_var,-208,176,100);
    path_add_point(path_var,16,176,100);
    path_add_point(path_var,80,16,100);
    path_add_point(path_var,240,-48,100);
    path_add_point(path_var,112,-208,100);
    path_start(path_var,10*global.delta_time_var,1,true);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    surface_free(surf_var);
    path_delete(path_var);
    with floor_par_obj { tex_var = store_tex_var; }
    with ceil_par_obj { tex_var = store_tex_var; }
    with wall_par_obj { tex_var = store_tex_var; }
    with prop_par_obj { tex_var = store_tex_var; }
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    if !per_var { on_var = false; }
    else if on_var
    {
        spr_id_var = irandom(sprite_get_number(spr_var)-1);
        set_alarm_scr(1,irandom_range(rand_alarm_min_var,rand_alarm_max_var));
        with floor_par_obj { tex_var = other.tex_var; }
        with ceil_par_obj { tex_var = other.tex_var; }
        with wall_par_obj { tex_var = other.tex_var; }
        with prop_par_obj
        {
            if flesh_var && (other.door_var || flesh_var == 1)
            { tex_var = other.tex_var; }
        }
    }
    if alarm_arr[0,0] <= 0
    { set_alarm_scr(0,irandom_range(alarm_min_var,alarm_max_var)); }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    if frac_chance_scr(1,2)
    {
        on_var = !on_var;
        if on_var
        {
            spr_id_var = irandom(sprite_get_number(spr_var)-1);
            set_alarm_scr(1,irandom_range(rand_alarm_min_var,rand_alarm_max_var));
            with floor_par_obj { tex_var = other.tex_var; }
            with ceil_par_obj { tex_var = other.tex_var; }
            with wall_par_obj { tex_var = other.tex_var; }
            with prop_par_obj
            {
                if flesh_var && (other.door_var || flesh_var == 1)
                { tex_var = other.tex_var; }
            }
        }
        else
        {
            set_alarm_scr(1,-1);
            path_speed = 0;
            with floor_par_obj { tex_var = store_tex_var; }
            with ceil_par_obj { tex_var = store_tex_var; }
            with wall_par_obj { tex_var = store_tex_var; }
            with prop_par_obj
            {
                if flesh_var && (other.door_var || flesh_var == 1)
                { tex_var = store_tex_var; }
            }
        }
    }
    set_alarm_scr(0,irandom_range(alarm_min_var,alarm_max_var));
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    if on_var
    {
        spr_id_var = irandom(sprite_get_number(spr_var)-1);
        set_alarm_scr(1,irandom_range(rand_alarm_min_var,rand_alarm_max_var));
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var
    {
        scale_time_var = (scale_time_var+global.delta_time_var) mod scale_rate_var;
        scale_var = scale_base_var+(sin(2*scale_time_var*pi/scale_rate_var)*scale_mult_var/2);
        path_speed = 10*global.delta_time_var;
        // Draw Surface
        surface_set_target(surf_var);
        draw_clear_alpha(c_black,0);
        d3d_set_projection_ortho(0,0,256,256,0);
        d3d_set_hidden(false);
        d3d_set_fog(false,c_black,0,0);
        draw_sprite_tiled_ext(spr_var,spr_id_var,x,y,256/sprite_get_width(spr_var),scale_var*256/sprite_get_height(spr_var),c_white,1);
        d3d_set_hidden(true);
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
        surface_reset_target();
    }
');