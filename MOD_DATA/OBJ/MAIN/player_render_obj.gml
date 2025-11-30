// Builtin Variables
object_set_depth(argument0,-4);
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
    image_alpha = 0.5;
    str_color_var = c_dkgray;
    reflect_var = true;
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    surface_free(surf_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if spooky_var
    {
        spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
        tex_01_var = sprite_get_texture(spr_var,floor(spr_id_var));
    }
    visible = (par_var.on_var && !par_var.possess_var);
');
// Initialize
object_event_add
(argument0,ev_other,ev_user0,'
    image_blend = global.player_color_var[player_id_var];
    if global.player_spr_var[player_id_var]
    {
        switch global.player_spr_id_var[player_id_var]
        {
            case 0: { spr_var = player_01_spr; break; }
            case 1: { spr_var = player_02_spr; break; }
            case 2: { spr_var = player_03_spr; break; }
        }
        spr_spd_var = 0.1;
        h_01_var = 20;
        w_01_var = 7.5;
    }
    else
    {
        tex_01_var = sprite_get_texture(ghost_spr,global.player_spr_id_var[player_id_var]);
        w_01_var = 10;
        tint_var = true;
    }
    str_var = global.player_name_var[player_id_var];
    surf_var = surface_create(string_width(str_var)+4,string_height(str_var)+4);
    w_02_var = (string_width(str_var)+4)/24;
    h_02_var = (string_height(str_var)+4)/24;
    event_user(1);
    tex_02_var = surface_get_texture(surf_var);
');
// Redraw Surface
object_event_add
(argument0,ev_other,ev_user1,'
    surface_set_target(surf_var);
    draw_clear_alpha(c_black,0);
    d3d_set_projection_ortho(0,0,string_width(str_var)+4,string_height(str_var)+4,0);
    d3d_set_hidden(false); d3d_set_fog(false,c_black,0,0); draw_set_color(str_color_var);
    draw_text(0,4,str_var);
    draw_text(2,2,str_var);
    draw_set_color(c_white);
    draw_text(4,0,str_var);
    d3d_set_hidden(true); d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    surface_reset_target();
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if (view_current != par_var.cam_id_var || global.reflect_var) && (!par_var.dead_var || global.cam_type_var[view_current] == cam_dead_const)
    {
        // Color types
        if tint_var { d3d_set_fog(true,image_blend,0,0); }
        else { draw_set_color(image_blend); }
        // Visible to ghosts
        if global.cam_type_var[view_current] != cam_alive_const { d3d_set_hidden(false); }
        // Draw
        draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        // Reflection handling (more complex for billboarded sprites)
        local.xtmp = par_var.x;
        local.ytmp = par_var.y;
        local.ztmp = par_var.z;
        if global.reflect_var
        {
            switch (global.reflect_axis_var)
            {
                case 0: { local.xtmp = global.reflect_pos_var-local.xtmp; d3d_transform_add_scaling(-1,1,1); break; }
                case 1: { local.ytmp = global.reflect_pos_var-local.ytmp; d3d_transform_add_scaling(1,-1,1); break; }
                case 2: { local.ztmp = global.reflect_pos_var-local.ztmp; d3d_transform_add_scaling(1,1,-1); break; }
            }
        }
        // Draw
        d3d_transform_add_rotation_z(point_direction(local.xtmp,local.ytmp,global.cam_x_var[view_current],global.cam_y_var[view_current]));
        d3d_transform_add_translation(local.xtmp,local.ytmp,local.ztmp);
        d3d_draw_wall(0,w_01_var/2,par_var.coll_var[1]+2,0,-w_01_var/2,0,tex_01_var,1,1);
        // Reset
        if tint_var { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
        draw_set_color(image_blend); draw_set_alpha(1);
        // Name Tag
        if !global.reflect_var // Dont even bother, no point
        {
            d3d_transform_set_identity();
            local.ztmp2 = par_var.z+par_var.coll_var[1]+(h_02_var/2)+2;
            d3d_transform_add_rotation_y(point_direction_3d_scr(local.xtmp,local.ytmp,local.ztmp2,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]));
            d3d_transform_add_rotation_z(point_direction(local.xtmp,local.ytmp,global.cam_x_var[view_current],global.cam_y_var[view_current]));
            d3d_transform_add_translation(local.xtmp,local.ytmp,local.ztmp2);
            d3d_draw_wall(0,w_02_var/2,h_02_var/2,0,-w_02_var/2,-h_02_var/2,tex_02_var,1,1);
        }
        // Reset 2
        d3d_transform_set_identity();
        draw_set_color(c_white);
        if global.cam_type_var[view_current] != cam_alive_const { d3d_set_hidden(true); }
    }
');