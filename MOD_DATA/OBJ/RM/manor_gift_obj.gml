// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create event
object_event_add
(argument0,ev_create,0,'
    par_var = '+string(argument2)+'
    store_tex_var = '+string(argument2.bg_arr_var[argument3,4])+'
    store_tex_02_var = '+string(argument2.bg_arr_var[argument6,4])+'
    store_tex_03_var = '+string(argument2.bg_arr_var[argument7,4])+'
    store_tex_04_var = '+string(argument2.bg_arr_var[argument8,4])+'
    state_tex_var[0] = store_tex_var;
    state_tex_var[1] = '+string(argument2.bg_arr_var[argument4,4])+'
    state_tex_var[2] = '+string(argument2.bg_arr_var[argument5,4])+'
    snd_var[0] = '+string(argument2.snd_arr_var[argument9,0])+'
    snd_var[1] = '+string(argument2.snd_arr_var[argument10,0])+'
    snd_var[2] = '+string(argument2.snd_arr_var[argument11,0])+'
    event_inherited();
    tex_02_var = store_tex_02_var;
    tex_03_var = store_tex_03_var;
    tex_04_var = store_tex_04_var;
    type_var = 2;
    w_var = 10;
    h_var = 10;
    l_var = 10;
    seen_yaw_var = 3.434; // 3.r43
    seen_pitch_var = 3.434;
    solid_var = true;
    js_var = false;
    // Collisions
    coll_var[0] = manor_gift_coll[0];
    coll_var[1] = manor_gift_coll[1];
    coll_var[2] = manor_gift_coll[2];
    coll_var[3] = manor_gift_coll[3];
    // Trigger
    ini_open("lang_"+global.lang_var+".ini");
    str_var = ini_read_string("UI","open","UI_open");
    ini_close();
    trig_var = instance_create(x,y,interact_trig_obj);
    trig_var.weapon_var = true;
    trig_var.par_var = id;
    trig_var.str_var = str_var;
    trig_var.on_var = false;
    // State
    state_len_var = 3;
    state_var = 0;
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    // Create Jumpscares
    for (local.i=0; local.i<global.js_mark_len_var; local.i+=1;)
    {
        if !global.js_mark_arr[local.i,5]
        {
            local.left = global.js_mark_arr[local.i,4];
            if local.left < 0 { local.left = irandom(1); }
            with instance_create(global.js_mark_arr[local.i,0],global.js_mark_arr[local.i,1],multi_js_obj)
            {
                z += global.js_mark_arr[local.i,2];
                base_dir_var += global.js_mark_arr[local.i,3];
                direction += global.js_mark_arr[local.i,3];
                left_var = local.left;
                if left_var { event_user(2); }
                trig_var = other.id;
                solid_var = false; // Workaround
                freeze_var = false;
            }
            global.js_mark_arr[local.i,5] = true;
        }
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if js_var
    {
        local.seen = false;
        local.player = noone;
        with player_obj
        {
            local.seen = seen_scr(other.seen_yaw_var,other.seen_pitch_var,-1,eye_yaw_var,eye_pitch_var,x,y,z+eye_h_var,0,false,coll_var[1],coll_var[2],spawn_arr[0,0],spawn_arr[0,1],spawn_arr[0,2]) > 0;
            if local.seen
            {
                local.player = id;
                break;
            }
        }
        if local.seen
        {
            js_var = false;
            with js_obj
            {
                solid_var = true;
                player_var = local.player;
                if frac_chance_scr(1,8) { set_alarm_scr(1,240); }
                else { set_alarm_scr(1,irandom_range(1,60)); }
            }
        }
    }
');
// Trigger Event
object_event_add
(argument0,ev_other,ev_user0,'
    state_var += 1;
    if fmod_snd_is_3d_scr(snd_var[state_var])
    { fmod_snd_3d_play_scr(snd_var[state_var],x,y,z+(h_var/2)); }
    else { fmod_snd_play_scr(snd_var[state_var]); }
    store_tex_var = state_tex_var[state_var];
    tex_var = store_tex_var;
    if state_var == state_len_var-1
    {
        trig_var.on_var = false;
        js_var = true;
    }
');
// On
object_event_add
(argument0,ev_other,ev_user1,'
    visible = true;
    if fmod_snd_is_3d_scr(snd_var[0])
    { fmod_snd_3d_play_scr(snd_var[0],x,y,z+(h_var/2)); }
    else { fmod_snd_play_scr(snd_var[0]); }
    trig_var.on_var = true;
    with instance_create(x,y,appear_eff_obj)
    { z = other.z; }
');
// Axe Trigger Event
object_event_add
(argument0,ev_other,ev_user4,'
    state_var = state_len_var-1;
    if fmod_snd_is_3d_scr(snd_var[2])
    { fmod_snd_3d_play_scr(snd_var[2],x,y,z+(h_var/2)); }
    else { fmod_snd_play_scr(snd_var[2]); }
    store_tex_var = state_tex_var[2];
    tex_var = store_tex_var;
    trig_var.on_var = false;
    js_var = true;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if tex_var == -1 { local.tex = wall_bg_tex; } 
    else { local.tex = tex_var; }
    // Transform
    d3d_transform_set_identity();
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
    // Calculations
    local.height = h_var*0.81640625;
    local.width = w_var*0.5;
    local.length = l_var*0.5;
    local.width2 = local.width-0.5;
    local.length2 = local.length-0.5;
    // Inner
    d3d_draw_floor(-local.width2,local.width,local.height,-local.width,-local.width,local.height,tex_03_var,0.1,0.1);
    d3d_draw_floor(local.width,local.width,local.height,local.width2,-local.width,local.height,tex_03_var,0.1,0.1);
    d3d_draw_floor(local.width2,-local.width2,local.height,-local.width2,-local.width,local.height,tex_03_var,0.1,0.1);
    d3d_draw_floor(local.width2,local.width,local.height,-local.width2,local.width2,local.height,tex_03_var,0.1,0.1);
    d3d_draw_floor(local.width2,local.width2,1,-local.width2,-local.width2,1,tex_03_var,1,1);
    d3d_draw_wall(local.width2,-local.width2,local.height,-local.width2,-local.width2,1,tex_03_var,1,0.5);
    d3d_draw_wall(-local.width2,local.width2,local.height,local.width2,local.width2,1,tex_03_var,1,0.5);
    d3d_draw_wall(local.width2,-local.width2,local.height,local.width2,local.width2,1,tex_04_var,1,1);
    d3d_draw_wall(-local.width2,local.width2,local.height,-local.width2,-local.width2,1,tex_03_var,1,0.5);
    // Outer
    d3d_draw_wall(-local.width,-local.length,h_var,local.width,-local.length,0,local.tex,1,1);
    d3d_draw_wall(local.width,local.length,h_var,-local.width,local.length,0,local.tex,1,1);
    d3d_draw_wall(local.width,local.length,h_var,local.width,-local.length,0,local.tex,1,1);
    d3d_draw_wall(-local.width,-local.length,h_var,-local.width,local.length,0,local.tex,1,1);
    if state_var < state_len_var-1 { d3d_draw_floor(5,5,10,-5,-5,10,tex_02_var,1,1); }
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');