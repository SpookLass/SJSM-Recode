// Builtin Variables
object_set_depth(argument0,-98);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,"
    power_var = 1;
    type_var = 0;
    stam_start_var = 10;
    stam_end_var = 10;
    spr_spd_var = 0;
    spr_spd_raise_var = 0.5;
    spr_spd_swing_var = 0.25;
    spr_raise_var = axe_raise_spr;
    spr_swing_var = axe_swing_spr;
    spr_var = spr_raise_var;
    color_var = true;
    coll_var[0] = global.axe_coll[0];
    coll_var[1] = global.axe_coll[1];
    coll_var[2] = global.axe_coll[2];
    coll_var[3] = global.axe_coll[3];
");
object_event_add
(argument0,ev_step,ev_step_normal,'
    spr_id_var += spr_spd_var*global.delta_time_var;
    switch state_var
    {
        case 0:
        {
            if mouse_check_button_pressed(mb_left) && (par_var.stam_var > stam_start_var || stam_start_var <= 0 || !par_var.do_stam_var)
            {
                visible = true;
                state_var = 1;
                spr_var = spr_raise_var
                spr_id_var = 0;
                spr_spd_var = spr_spd_raise_var;
                if par_var.do_stam_var
                { par_var.stam_var -= stam_start_var; }
            }
            else { break; }
        }
        case 1:
        {
            if spr_id_var >= sprite_get_number(spr_var) || !mouse_check_button(mb_left)
            {
                spr_id_var = sprite_get_number(spr_var) - 1;
                spr_spd_var = 0;
                state_var = 2;
            }
            else { break; }
        }
        case 2:
        {
            if !mouse_check_button(mb_left)
            {
                // Do the attack thing!
                spr_id_var = 0;
                spr_var = spr_swing_var;
                spr_spd_var = spr_spd_swing_var;
                state_var = 3;
                if par_var.do_stam_var
                { par_var.stam_var -= stam_end_var; }
                local.player = par_var;
                local.xtmp = par_var.x;
                local.ytmp = par_var.y;
                local.ztmp = par_var.z+par_var.eye_h_var;
                local.dist = (coll_var[2]-coll_var[3])/2;
                local.xvel = lengthdir_x(lengthdir_x(local.dist,par_var.eye_yaw_var),par_var.eye_pitch_var);
                local.yvel = lengthdir_x(lengthdir_y(local.dist,par_var.eye_yaw_var),par_var.eye_pitch_var);
                local.zvel = -lengthdir_y(local.dist,par_var.eye_pitch_var);
                local.ydir = degtorad(par_var.eye_pitch_var);
                local.zdir = degtorad(par_var.eye_yaw_var);
                p3dc_set_modrot_scr(0,local.ydir,local.zdir);
                with enemy_par_obj
                {
                    if on_var && do_hurt_var && !hurt_var && !enter_var
                    {
                        // p3dc_ray_scr(coll_var[0],x,y,z,local.xtmp,local.ytmp,local.ztmp,local.xvel,local.yvel,local.zvel)
                        if p3dc_check_rot_scr(coll_var[0],x,y,z,other.coll_var[0],local.xtmp+local.xvel,local.ytmp+local.yvel,local.ztmp+local.zvel,0,0,0,0,local.ydir,local.zdir)
                        {
                            hurt_weapon_var = other.id;
                            hurt_target_var = local.player;
                            hurt_power_var = other.power_var;
                            hurt_type_var = other.type_var;
                            event_user(4);
                        }
                    }
                }
                with prop_par_obj
                {
                    if weapon_var
                    {
                        // p3dc_ray_scr(coll_var[0],x,y,z,local.xtmp,local.ytmp,local.ztmp,local.xvel,local.yvel,local.zvel)
                        if p3dc_check_rot_scr(coll_var[0],x,y,z,other.coll_var[0],local.xtmp+local.xvel,local.ytmp+local.yvel,local.ztmp+local.zvel,0,0,degtorad(direction),0,local.ydir,local.zdir)
                        {
                            hurt_weapon_var = other.id;
                            hurt_target_var = local.player;
                            hurt_power_var = other.power_var;
                            hurt_type_var = other.type_var;
                            event_user(4);
                        }
                    }
                }
            }
            break;
        }
        case 3:
        {
            if spr_id_var >= sprite_get_number(spr_var)
            {
                spr_id_var = sprite_get_number(spr_var) - 1;
                spr_spd_var = 0;
                visible = false;
                state_var = 0;
            }
            break;
        }
    }
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,"
    if view_wview[par_var.cam_id_var] >= view_hview[par_var.cam_id_var]
    { scale_var = view_hview[par_var.cam_id_var]/720; }
    else { scale_var = view_wview[par_var.cam_id_var]/1280; }
    w_var = sprite_get_width(spr_raise_var)*2*scale_var;
    h_var = sprite_get_height(spr_raise_var)*2*scale_var;
    right_var = max((view_wview[par_var.cam_id_var]/2)-(w_var/3),view_wview[par_var.cam_id_var]-w_var);
    bottom_var = view_hview[par_var.cam_id_var]-h_var;
    if !color_var || !instance_exists(color_par_obj) || global.color_var == 1
    { image_blend = c_white; }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if view_current == par_var.cam_id_var 
    {
        d3d_set_projection_ortho
        (
            view_xview[view_current],
            view_yview[view_current],
            view_xview[view_current]+view_wview[view_current],
            view_yview[view_current]+view_hview[view_current],
            0
        );
        d3d_set_hidden(false);
        draw_sprite_stretched_ext(spr_var,floor(spr_id_var),right_var,bottom_var,w_var,h_var,image_blend,image_alpha);
        d3d_set_hidden(true);
    }
");