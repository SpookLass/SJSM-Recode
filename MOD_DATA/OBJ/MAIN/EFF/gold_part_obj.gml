// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,part_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,"
    z = 21.2;
    part_len_var = 8;
    part_delay_var = 15;
    part_time_var = 90;
    part_frick_var = 0.001;
    alarm_len_var = 1;
    alarm_arr[0,2] = '';
    set_alarm_scr(0,part_delay_var);
    image_blend = make_color_rgb(224,208,142);
");
// Alarm 0
object_event_add
(argument0,ev_alarm,0,"
    if torch_var.on_var
    {
        part_add_scr
        (
            x+random(3)-1.5,
            y+random(3)-1.5,
            z+random(3)-1.5,
            0.1,random(360),random_range(-90,90),
            1+random(0.5),1+random(0.5),85+random(10),
            image_blend,image_alpha,
            false,flare_bg_tex,
            0,0,
            part_time_var
        );
    }
    set_alarm_scr(0,part_delay_var);
");
// Step
object_event_add
(argument0,ev_step,ev_step_normal,"
    for (local.i=0; local.i<part_len_var; local.i+=1;)
    {
        if part_arr[local.i,0]
        {
            if abs(part_arr[local.i,4]) > 0 { part_arr[local.i,4] = max(0,part_arr[local.i,4]-part_frick_var); }
            if part_arr[local.i,17] != 0 
            { part_arr[local.i,11] = part_arr[local.i,17]/part_time_var; }
        }
    }
    event_inherited();
");
// Draw
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    d3d_set_fog(false,c_black,0,0);
    event_inherited();
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
")