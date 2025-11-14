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
    if spooky_var
    {
        spr_var = choose(player_01_spr,player_02_spr,player_03_spr);
        spr_spd_var = 0.1;
        h_var = 20;
        w_var = 7.5;
    }
    else
    {
        tex_var = sprite_get_texture(ghost_spr,irandom(sprite_get_number(ghost_spr)-1));
        w_var = 10;
        tint_var = true;
    }
    image_alpha = 0.5;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if spooky_var
    {
        spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
        tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    }
    visible_var = (par_var.on_var && !par_var.possess_var);
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if view_current != par_var.cam_id_var
    {
        if tint_var { d3d_set_fog(true,image_blend,0,0); }
        else { draw_set_color(image_blend); }
        draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        d3d_transform_add_rotation_z(point_direction(par_var.x,par_var.y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
        d3d_transform_add_translation(par_var.x,par_var.y,par_var.z);
        d3d_draw_wall(0,w_var/2,par_var.coll_var[1]+2,0,-w_var/2,0,tex_var,1,1);
        d3d_transform_set_identity();
        if tint_var { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
        else { draw_set_color(c_white); }
        draw_set_alpha(1);
    }
');