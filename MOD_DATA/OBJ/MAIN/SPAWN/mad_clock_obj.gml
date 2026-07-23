// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
globalvar mad_clock_coll;
mad_clock_coll[1] = 24;
mad_clock_coll[2] = 9;
mad_clock_coll[3] = 9;
mad_clock_coll[0] = prop_to_coll_scr(7,'',mad_clock_coll[2],mad_clock_coll[3],mad_clock_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    {
        spr_var = load_par_obj.spr_arr_var[0,0];
        store_tex_var = sprite_get_texture(spr_var,0);
        store_tex_02_var = background_get_texture(load_par_obj.bg_arr_var[18,0]);
        tex_02_var = store_tex_02_var;
        store_tex_03_var = background_get_texture(load_par_obj.bg_arr_var[29,0]);
        tex_03_var = store_tex_03_var;
        store_tex_04_var = background_get_texture(load_par_obj.bg_arr_var[30,0]);
        tex_04_var = store_tex_04_var;
        store_tex_05_var = background_get_texture(load_par_obj.bg_arr_var[31,0]);
        tex_05_var = store_tex_05_var;
        tick_snd_var = load_par_obj.snd_arr_var[3,0];
        tock_snd_var = load_par_obj.snd_arr_var[4,0];
    }
    event_inherited();
    solid_var = true;
    w_var = 9;
    h_var = 24;
    l_var = 9;
    type_var = 7;
    direction = 180;
    dist_var = 0.1;
    hand_h_var = 19.546875;
    minute_hand_w_var = 2.25;
    minute_hand_h_var = 6;
    hour_hand_w_var = 1.5;
    hour_hand_h_var = 4.5;
    // Collisions
    coll_var[0] = mad_clock_coll[0];
    coll_var[1] = mad_clock_coll[1];
    coll_var[2] = mad_clock_coll[2];
    coll_var[3] = mad_clock_coll[3];
    // Tick Tock
    inst_01_var = noone;
    inst_02_var = noone;
    second_var = 39840;
    time_var = second_var;
    last_time_var = current_time;
    last_second_var = global.clock_second_var; // current_second
    alarm_var = 48; // 48
    real_var = true;
    alarm_len_var = 1;
    alarm_ini_scr();
    if !real_var
    {
        tock_var = false;
        set_alarm_scr(0,60);
    }
    else { tock_var = (last_second_var mod 2); }
');
// Room End event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_inherited();
    fmod_inst_stop_scr(inst_01_var);
    fmod_inst_stop_scr(inst_02_var);
');
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    second_var = mod_scr(second_var+1,43200);
    tock_var = !tock_var;
    if tock_var
    {
        fmod_inst_stop_scr(inst_02_var);
        inst_02_var = fmod_snd_3d_play_scr(tock_snd_var,x,y,z+(h_var*0.8));
        tex_var = sprite_get_texture(spr_var,sprite_get_number(spr_var)-1);
    }
    else
    {
        fmod_inst_stop_scr(inst_01_var);
        inst_01_var = fmod_snd_3d_play_scr(tick_snd_var,x,y,z+(h_var*0.8));
        tex_var = sprite_get_texture(spr_var,0);
    }
    if !real_var { set_alarm_scr(0,alarm_var); }
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if real_var
    {
        switch global.time_type_var
        {
            case 0:
            {
                time_var = current_fulltime*0.001; // global.clock_time_var
                local.per = current_millisecond*0.001; // (current_time-last_time_var), global.clock_millisecond_var
                second_var = current_second; // global.clock_second_var
                break;
            }
            default:
            {
                time_var = mod_scr(global.game_time_var*0.001,43200);
                local.per = (time_var mod 1);
                second_var = mod_scr(floor(time_var),60);
                break;
            }
        }
        if last_second_var != second_var
        {
            last_second_var = second_var;
            tock_var = (last_second_var mod 2);
            if !global.pause_var
            {
                if tock_var
                {
                    fmod_inst_stop_scr(inst_02_var);
                    inst_02_var = fmod_snd_3d_play_scr(tock_snd_var,x,y,z+(h_var*0.8));
                    tex_var = sprite_get_texture(spr_var,sprite_get_number(spr_var)-1);
                }
                else
                {
                    fmod_inst_stop_scr(inst_01_var);
                    inst_01_var = fmod_snd_3d_play_scr(tick_snd_var,x,y,z+(h_var*0.8));
                    tex_var = sprite_get_texture(spr_var,0);
                }
            }
            // last_time_var = current_time;
        }
    }
    else
    {
        if global.pause_var { exit; }
        local.per = 1-(alarm_arr[0,0]/alarm_arr[0,1]);
        time_var = second_var+local.per;
    }
    if tock_var { local.per = 1-local.per; }
    spr_id_var = lerp_scr(0.5,sprite_get_number(spr_var)-0.5,local.per);
    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_transform_set_identity();
    // Check if billboard
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    // Reflection handling
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var*2,0,0); break; }
            case 1: { d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var*2,0); break; }
            case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var*2); break; }
        }
    }
    // Draw
    draw_set_alpha(image_alpha);
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    local.width = w_var*0.5;
    local.length = l_var*0.5;
    local.tex_height = tex_h_var*sign(h_var);
    d3d_draw_wall(local.width,-local.length,h_var,-local.width,-local.length,0,tex_02_var,tex_w_var,local.tex_height);
    d3d_draw_wall(local.width,local.length,h_var,-local.width,local.length,0,tex_02_var,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,local.length,h_var,-local.width,-local.length,0,tex_02_var,tex_l_var,local.tex_height);
    d3d_draw_wall(local.width,local.length,h_var,local.width,-local.length,0,tex_var,tex_l_var,local.tex_height);
    d3d_draw_floor(local.width,local.length,0,-local.width,-local.length,0,tex_03_var,tex_w_var,tex_l_var);
    d3d_draw_floor(local.width,local.length,h_var,-local.width,-local.length,h_var,tex_03_var,tex_w_var,tex_l_var);
    // Hands
    local.minute = time_var*0.1;
    // local.minute += (current_time-last_time_var)*0.0001
    local.length = minute_hand_w_var*0.5;
    local.height = minute_hand_h_var*0.5;
    d3d_transform_set_identity();
    d3d_transform_add_rotation_x(-local.minute);
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z+hand_h_var);
    // Reflection handling
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var*2,0,0); break; }
            case 1: { d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var*2,0); break; }
            case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var*2); break; }
        }
    }
    d3d_draw_wall(local.width+dist_var,local.length,local.height,local.width+dist_var,-local.length,-local.height,tex_05_var,1,1);
    local.hour = time_var/120;
    // local.hour += (current_time-last_time_var)/120000;
    local.length = hour_hand_w_var*0.5;
    local.height = hour_hand_h_var*0.5;
    d3d_transform_set_identity();
    d3d_transform_add_rotation_x(-local.hour);
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z+hand_h_var);
    // Reflection handling
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var*2,0,0); break; }
            case 1: { d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var*2,0); break; }
            case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var*2); break; }
        }
    }
    d3d_draw_wall(local.width+dist_var,local.length,local.height,local.width+dist_var,-local.length,-local.height,tex_04_var,1,1);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');