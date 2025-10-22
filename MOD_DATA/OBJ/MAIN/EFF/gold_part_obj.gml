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
    w_var = 3;
    l_var = 3;
    h_var = 3;
    part_len_var = 8;
    part_delay_var = 15;
    part_time_var = 90;
    part_frick_var = 0.002;
    part_turn_var = 2;
    alarm_len_var = 1;
    set_alarm_scr(0,part_delay_var);
    image_blend = make_color_rgb(224,208,142);
");
// Alarm 0
object_event_add
(argument0,ev_alarm,0,"
    if torch_var.on_var
    {
        local.part = part_add_scr
        (
            x+random(w_var)-(w_var/2),
            y+random(l_var)-(l_var/2),
            z+random(h_var)-(h_var/2),
            0.2,random(360),random_range(-90,90),
            1+random(0.5),1+random(0.5),85+random(10),
            image_blend,image_alpha,
            false,flare_bg_tex,
            0,0,
            part_time_var
        );
        if local.part > 0
        {
            // Yaw add direction
            part_arr[local.part,18] = random_range(-part_turn_var,part_turn_var);
            // Pitch add direction
            part_arr[local.part,19] = random_range(-part_turn_var,part_turn_var);
            // Roll add direction
            part_arr[local.part,20] = random_range(-1,1);
        }
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
            if abs(part_arr[local.i,4]) > 0 { part_arr[local.i,4] = max(0,part_arr[local.i,4]-(part_frick_var*global.delta_time_var)); }
            if part_arr[local.i,17] != 0 
            {
                local.percent = part_arr[local.i,17]/part_time_var;
                part_arr[local.i,11] = local.percent;
                part_arr[local.i,5] += part_arr[local.i,18]*global.delta_time_var*local.percent;
                part_arr[local.i,6] += part_arr[local.i,19]*global.delta_time_var*local.percent;
                part_arr[local.i,9] += part_arr[local.i,20]*global.delta_time_var*local.percent;
            }
        }
    }
    event_inherited();
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if global.fog_dark_var
    {
        d3d_set_fog(false,c_black,0,0);
        event_inherited();
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    }
    else { event_inherited(); }
");