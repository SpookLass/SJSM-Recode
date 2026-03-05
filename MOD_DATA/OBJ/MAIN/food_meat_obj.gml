// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
globalvar food_meat_coll;
food_meat_coll[1] = -30;
food_meat_coll[2] = 15;
food_meat_coll[0] = prop_to_coll_scr(5,"",food_meat_coll[2],0,food_meat_coll[1],true,8);
// Prop collisions
globalvar food_meat_chase_coll;
food_meat_chase_coll[1] = -30;
food_meat_chase_coll[2] = 8;
food_meat_chase_coll[0] = prop_to_coll_scr(5,"",food_meat_chase_coll[2],0,food_meat_chase_coll[1],true,8);
// Create event
object_event_add
(argument0,ev_create,0,'
    snap_var = 2; // Snap to ceiling
    event_inherited();
    solid_var = true;
    type_var = 5;
    w_var = 15;
    h_var = -30; // Hang down
    // Collisions
    coll_var[0] = food_meat_coll[0];
    coll_var[1] = food_meat_coll[1];
    coll_var[2] = food_meat_coll[2];
    coll_var[3] = food_meat_coll[2];
    // Axe
    weapon_var = true;
    alarm_len_var = 1;
    alarm_ini_scr();
    alarm_var = 60;
    angle_max_var = -10;
    angle_var = 0;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if tex_var == -1 { local.tex = wall_bg_tex; } 
    else { local.tex = tex_var; }
    d3d_transform_set_identity();
    // Check if billboard
    // Reflection handling (more complex for billboarded sprites)
    local.xtmp = x;
    local.ytmp = y;
    local.ztmp = z;
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { local.xtmp = global.reflect_pos_var-local.xtmp; d3d_transform_add_scaling(-1,1,1); break; }
            case 1: { local.ytmp = global.reflect_pos_var-local.ytmp; d3d_transform_add_scaling(1,-1,1); break; }
            case 2: { local.ztmp = global.reflect_pos_var-local.ztmp; d3d_transform_add_scaling(1,1,-1); break; }
        }
    }
    // Transformations
    d3d_transform_add_rotation_y(angle_var);
    d3d_transform_add_rotation_z(point_direction(local.xtmp,local.ytmp,global.cam_x_var[view_current],global.cam_y_var[view_current]));
    d3d_transform_add_translation(local.xtmp,local.ytmp,local.ztmp);
    draw_set_alpha(image_alpha);
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Prop types
    d3d_draw_wall(0,w_var/2,h_var,0,-w_var/2,0,local.tex,tex_w_var,tex_h_var*sign(h_var));
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');
// Weapon
object_event_add
(argument0,ev_other,ev_user4,'
    if solid_var
    {
        solid_var = false;
        set_alarm_scr(0,alarm_var);
        fmod_snd_play_scr(choose(axe_01_snd,axe_02_snd,axe_03_snd));
    }
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    if !solid_var && alarm_arr[0,0] > 0
    { angle_var = angle_max_var*sin(pi*alarm_arr[0,0]/alarm_arr[0,1]); }
');
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    solid_var = true;
    angle_var = 0;
');