// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
global.phone_coll[1] = 1.5;
global.phone_coll[2] = 6;
global.phone_coll[3] = 6;
global.phone_coll[0] = prop_to_coll_scr(7,'',global.phone_coll[2],global.phone_coll[3],global.phone_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = machine_02_bg_tex;
    event_inherited();
    type_var = 7;
    solid_var = 1;
    z += 9.5;
    store_tex_02_var = phone_bg_tex;
    tex_02_var = store_tex_02_var;
    w_var = 6;
    h_var = 1.5;
    l_var = 6;
    // Collision
    coll_var[0] = global.phone_coll[0]
    coll_var[1] = global.phone_coll[1]
    coll_var[2] = global.phone_coll[2]
    coll_var[3] = global.phone_coll[3]
    // Alarm
    alarm_len_var = 1;
    alarm_ini_scr();
    alarm_var = 280;
    // Sounds
    snd_len_var = 8;
    snd_var[0] = phone_01_snd;
    snd_var[1] = phone_02_snd;
    snd_var[2] = phone_03_snd;
    snd_var[3] = phone_04_snd;
    snd_var[4] = phone_05_snd;
    snd_var[5] = phone_06_snd;
    snd_var[6] = phone_07_snd;
    snd_var[7] = phone_08_snd;
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    fmod_snd_3d_play_scr(snd_var[irandom(snd_len_var-1)],x,y,z,false);
    set_alarm_scr(0,alarm_var);
');
// User 0
object_event_add
(argument0,ev_other,ev_user0,'
    fmod_snd_3d_play_scr(phone_ring_snd,x,y,z,false);
    set_alarm_scr(0,360);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if tex_var == -1 { local.tex = wall_bg_tex; } 
    else { local.tex = tex_var; }
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
    if color_var == 2
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Prop types
    local.width = w_var/2;
    local.length = l_var/2;
    local.tex_height = tex_h_var*sign(h_var);
    d3d_draw_wall(-local.width,-local.length,h_var,local.width,-local.length,0,local.tex,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,local.length,h_var,local.width,local.length,0,local.tex,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,-local.length,h_var,-local.width,local.length,0,local.tex,tex_l_var,local.tex_height);
    d3d_draw_wall(local.width,-local.length,h_var,local.width,local.length,0,local.tex,tex_l_var,local.tex_height);
    d3d_draw_floor(-local.width,-local.length,0,local.width,local.length,0,local.tex,tex_w_var,tex_l_var);
    d3d_draw_floor(-local.width,-local.length,h_var,local.width,local.length,h_var,tex_02_var,tex_w_var,tex_l_var);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');