// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
globalvar save_cross_coll;
save_cross_coll[1] = 9.5;
save_cross_coll[2] = 12;
// Collision
save_cross_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_block_scr(-0.5,-1,8,0.5,1,0,true,6);
p3dc_add_block_scr(-0.5,-3,6,0.5,-1,4,true,6);
p3dc_add_block_scr(-0.5,1,6,0.5,3,4,true,6);
p3dc_end_mdl_scr();
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = save_cross_01_bg_tex;
    event_inherited();
    solid_var = true;
    direction = 270;
    z += 9.5;
    type_var = 7;
    w_var = 2;
    l_var = 1;
    h_var = 8;
    close_var = false;
    tex_w_var = 1;
    tex_h_var = 1;
    // Front
    store_tex_02_var = save_cross_02_bg_tex;
    tex_02_var = store_tex_02_var;
    // Collisions
    coll_var[0] = save_cross_coll[0];
    coll_var[1] = save_cross_coll[1];
    coll_var[2] = save_cross_coll[2];
    coll_var[3] = 1;
    // Trigger
    ini_open(global.lang_var);
    str_var = ini_read_string("UI","save","UI_save");
    str_look_var = ini_read_string("UI","save_look","UI_save_look");
    ini_close();
    trig_var = instance_create(x,y,interact_trig_obj);
    trig_var.par_var = id;
    trig_var.str_var = str_look_var;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    // Transformation
    d3d_transform_set_identity();
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    // Reflection handling
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var,0,0); break; }
            case 1: { d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var,0); break; }
            case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var); break; }
        }
    }
    // Draw
    draw_set_alpha(image_alpha);
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Draw
    local.width = w_var/2;
    local.length = l_var/2;
    local.tex_height = tex_h_var*sign(h_var);
    d3d_draw_wall(-local.width,-local.length,h_var,local.width,-local.length,0,tex_var,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,local.length,h_var,local.width,local.length,0,tex_var,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,-local.length,h_var,-local.width,local.length,0,tex_var,tex_l_var,local.tex_height);
    d3d_draw_wall(local.width,-local.length,h_var,local.width,local.length,0,tex_02_var,tex_l_var,local.tex_height);
    d3d_draw_floor(-local.width,-local.length,0,local.width,local.length,0,tex_var,tex_w_var,tex_l_var);
    d3d_draw_floor(-local.width,-local.length,h_var,local.width,local.length,h_var,tex_var,tex_w_var,tex_l_var);

    d3d_draw_block(-local.width,-local.length-2,6,local.width,-local.length,4,tex_var,1,1);
    d3d_draw_block(-local.width,local.length,6,local.width,local.length+2,4,tex_var,1,1);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');
// Trigger Event
object_event_add
(argument0,ev_other,ev_user0,'
    trig_var.on_var = false;
    with player_obj
    {
        hp_var = hp_max_var;
        if dead_var && !global.permadeath_var
        {
            // Revive
            dead_var = false;
            do_coll_var = true;
            grav_var = grav_const;
            hp_var = hp_max_var;
            possess_var = false;
            // Respawn
            x = global.spawn_arr[0,0];
            y = global.spawn_arr[0,1];
            z = global.spawn_arr[0,2];
            eye_yaw_var = global.spawn_arr[0,3];
            eye_pitch_var = 0;
            // Motion
            set_motion_3d_scr(0,true);
        }
    }
    save_game_scr();
    with instance_create(0,0,fade_eff_obj)
    {
        par_var = other.id;
        image_blend = c_white;
        cam_id_var = -1;
        set_alarm_scr(0,20);
    }
    with instance_create(0,0,txt_obj)
    {
        cam_id_var = -1;
        par_var = other.id;
        str_var = other.str_var;
    }
    fmod_snd_play_scr(deny_snd);
    store_tex_02_var = save_cross_03_bg_tex;
    tex_02_var = store_tex_02_var;
');