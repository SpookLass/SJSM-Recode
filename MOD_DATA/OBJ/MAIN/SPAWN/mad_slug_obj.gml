// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
globalvar mad_slug_coll;
mad_slug_coll[1] = 2;
mad_slug_coll[2] = 10; // 35.625
mad_slug_coll[3] = 35.625; 
mad_slug_coll[0] = prop_to_coll_scr(5,"",mad_slug_coll[2],mad_slug_coll[3],mad_slug_coll[1],true,8);
// Create event
object_event_add
(argument0,ev_create,0,'
    snap_var = 1; // Snap to floor
    if instance_exists(load_par_obj)
    {
        spr_var = load_par_obj.spr_arr_var[2,0];
        store_tex_var = sprite_get_texture(spr_var,0);
    }
    event_inherited();
    solid_var = false;
    type_var = 4; // Floor
    w_var = 35.625; // 40
    l_var = 10; // 40
    radius_var = 0.5*w_var/pi;
    dist_var = 0.2;
    flesh_var = false;
    step_var = 16;
    close_var = false;
    // Collisions
    grav_var = grav_const;
    do_coll_var = true;
    on_floor_var = true;
    coll_var[0] = mad_slug_coll[0];
    coll_var[1] = mad_slug_coll[1];
    coll_var[2] = mad_slug_coll[2];
    coll_var[3] = mad_slug_coll[3];
    // Animate
    spr_id_var = 0;
    set_motion_scr(random_range(0.3,0.02),true,choose(90,270),true)
    spr_spd_var = spd_var*0.625; // 0.1
    // FLIP
    alarm_len_var = 2;
    alarm_ini_scr();
    do_flip_var = frac_chance_scr(1,9);
    flip_var = false;
    flip_pitch_var = 0;
    flip_alarm_min_var = 6.4/spr_spd_var;
    flip_alarm_max_var = 12.8/spr_spd_var;
    flip_num_var = 1;
    flip_den_var = 3;
    flip_spd_var = 0.8;
    flip_time_var = (z_spd_var+sqrt(max(0,sqr(z_spd_var)+(2*z*grav_var))))/grav_var;
    if do_flip_var { set_alarm_scr(0,irandom_range(flip_alarm_min_var,flip_alarm_max_var)); }
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if flip_var
    {
        local.per = 1-(alarm_arr[1,0]/alarm_arr[1,1]);
        spr_id_var = lerp_scr(-3,3,local.per);
        flip_pitch_var = 360*local.per;
    }
    else { spr_id_var += (spr_spd_var*global.delta_time_var); }
    spr_id_var = mod_scr(spr_id_var,sprite_get_number(spr_var));
    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
');
// Step end event
object_event_add
(argument0,ev_step,ev_step_end,'
    event_inherited();
    if did_coll_var && !flip_var { set_motion_scr(0,false,yaw_var+180,true); }
    if do_flip_var && on_floor_var { flip_var = false; }
    direction = yaw_var;
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    if do_flip_var
    {
        if on_floor_var && frac_chance_scr(flip_num_var,flip_den_var)
        {
            flip_var = true;
            z_spd_var = flip_spd_var;
            on_floor_var = false;
            z += grav_var;
            local.time = (z_spd_var+sqrt(max(0,sqr(z_spd_var)+(2*z*grav_var))))/grav_var;
            set_alarm_scr(1,local.time);
        }
        else { set_alarm_scr(0,irandom_range(flip_alarm_min_var,flip_alarm_max_var)); }
    }
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    spr_id_var = 3;
    flip_var = false;
    flip_pitch_var = 0;
    set_alarm_scr(0,irandom_range(flip_alarm_min_var,flip_alarm_max_var));
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if flip_var
    {
        // Check if billboard
        d3d_transform_set_rotation_x(90);
        d3d_transform_add_rotation_y(flip_pitch_var-90);
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
        // Prop types
        local.length = l_var/2;
        d3d_draw_cylinder(-radius_var,-radius_var,local.length,radius_var,radius_var,-local.length,tex_var,1,1,close_var,step_var);
        // Reset
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
    else { event_inherited(); }
');