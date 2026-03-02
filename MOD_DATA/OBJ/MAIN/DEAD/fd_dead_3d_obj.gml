// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    reflect_var = true;
    event_inherited();
    dist_var = 80;
    rm_var = fd_dead_rm;
    // Draw
    w_var = 15;
    h_var = 19.3;
    x_off_var = 0;
    y_off_var = 0;
    z_off_var = 7;
    spr_var = load_par_obj.spr_arr_var[0,0];
    spr_id_var = 0;
    spr_spd_var = 0.25;
    tex_var = sprite_get_texture(spr_var,spr_id_var);
    // Flame
    flame_var = false;
    flame_spr_var = torch_spr;
    flame_spr_id_var = 0;
    flame_spr_spd_var = 0.25;
    flame_tex_var = sprite_get_texture(flame_spr_var,flame_spr_id_var);
    flame_h_var = 4.8;
    flame_w_var = 3;
    flame_z_off_var = 19.2;
    flame_off_var = 105/330; // Maybe 90/330
    flame_alpha_var = 1;
    flame_color_var = c_white;
    // Behavior
    if global.fd_type_var == -1 { local.type = irandom(4); }
    else { local.type = global.fd_type_var; }
    switch local.type
    {
        case 0:
        case 2:
        case 4:
        {
            flame_var = true;
            break;
        }
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    // Animate
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    if flame_var
    {
        flame_spr_id_var = (flame_spr_id_var+(flame_spr_spd_var*global.delta_time_var)) mod sprite_get_number(flame_spr_var);
        flame_tex_var = sprite_get_texture(flame_spr_var,floor(flame_spr_id_var));
    }
    // Die
    local.active = false;
    with player_obj { if point_distance_3d_scr(x,y,z,other.x,other.y,other.z) < other.dist_var { local.active = true; }}
    if local.active || global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    {
        with load_par_obj { instance_destroy(); }
        rm_goto_menu_scr(rm_var,true);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_transform_set_identity();
    // Get position
    local.xtmp = x+x_off_var;
    local.ytmp = y+y_off_var;
    local.ztmp = z+z_off_var;
    // Reflection handling (more complex for billboarded sprites)
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { local.xtmp = global.reflect_pos_var-local.xtmp; d3d_transform_add_scaling(-1,1,1); break; }
            case 1: { local.ytmp = global.reflect_pos_var-local.ytmp; d3d_transform_add_scaling(1,-1,1); break; }
            case 2: { local.ztmp = global.reflect_pos_var-local.ztmp; d3d_transform_add_scaling(1,1,-1); break; }
        }
    }
    d3d_transform_add_rotation_z(point_direction(local.xtmp,local.ytmp,global.cam_x_var[view_current],global.cam_y_var[view_current]));
    d3d_transform_add_translation(local.xtmp,local.ytmp,local.ztmp);
    // Draw
    d3d_draw_wall(0,w_var/2,h_var,0,-w_var/2,0,tex_var,1,1);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
    // Flame
    if flame_var
    {
        // Reflection handling (more complex for billboarded sprites)
        local.xtmp = x;
        local.ytmp = y;
        local.ztmp = z+z_off_var+flame_z_off_var;
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
        d3d_transform_add_rotation_y(point_direction_3d_scr(local.xtmp,local.ytmp,local.ztmp,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]));
        d3d_transform_add_rotation_z(point_direction(local.xtmp,local.ytmp,global.cam_x_var[view_current],global.cam_y_var[view_current]));
        d3d_transform_add_translation(local.xtmp,local.ytmp,local.ztmp);
        // Draw
        draw_set_color(flame_color_var); draw_set_alpha(flame_alpha_var);
        if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
        d3d_draw_wall(0,(flame_w_var/2)+flame_off_var,flame_h_var/2,0,(-flame_w_var/2)+flame_off_var,-flame_h_var/2,flame_tex_var,1,1);
        // Reset
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        if global.fog_dark_var 
        { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
    }
');