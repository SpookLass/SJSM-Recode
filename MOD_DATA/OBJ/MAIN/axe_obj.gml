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
(argument0,ev_create,0,'
    event_inherited();
    power_var = 1;
    type_var = 0;
    stam_start_var = 0;
    stam_end_var = 20;
    check_stam_var = false;
    good_var = true;
    state_var = false;
    image_xscale = 960;
    image_yscale = 680;
    spr_spd_var = 0;
    spr_spd_raise_var = 0.5;
    spr_spd_swing_var = 0.25;
    spr_raise_var = axe_raise_spr;
    spr_swing_var = axe_swing_spr;
    spr_var = spr_raise_var;
    spr_id_var = 0;
    color_var = 2;
    coll_var[0] = global.axe_coll[0];
    coll_var[1] = global.axe_coll[1];
    coll_var[2] = global.axe_coll[2];
    coll_var[3] = global.axe_coll[3];
    if global.axe_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.axe_type_var; }
    switch local.type
    {
        case 0:
        {
            stam_start_var = 10;
            stam_end_var = 10;
            break;
        }
        case 2:
        {
            check_stam_var = true;
            good_var = false;
            spr_spd_raise_var = 30/69; // 13.8 frames
            spr_spd_swing_var = 1; // 6 frames
            break;
        }
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if par_var.on_var && !par_var.dead_var && !global.pause_var
    {
        spr_id_var += spr_spd_var*global.delta_time_var;
        switch state_var
        {
            case 0:
            {
                if global.input_press_arr[attack_input_const,par_var.player_id_var]
                && (par_var.stam_var > stam_start_var || stam_start_var <= 0 || !par_var.do_stam_var || !check_stam_var)
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
                if spr_id_var >= sprite_get_number(spr_var) || (!global.input_arr[attack_input_const,par_var.player_id_var] && good_var)
                {
                    spr_id_var = sprite_get_number(spr_var) - 1;
                    spr_spd_var = 0;
                    state_var = 2;
                }
                else { break; }
            }
            case 2:
            {
                if !global.input_arr[attack_input_const,par_var.player_id_var]
                {
                    // Do the attack thing!
                    fmod_snd_play_scr(choose(swing_01_snd,swing_02_snd,swing_03_snd,swing_04_snd));
                    spr_id_var = 0;
                    spr_var = spr_swing_var;
                    spr_spd_var = spr_spd_swing_var;
                    state_var = 3;
                    if par_var.do_stam_var
                    { par_var.stam_var -= stam_end_var; }
                    local.collided = false;
                    local.ding = false;
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
                        if on_var && do_hurt_var && !hurt_var// && !enter_var
                        {
                            // p3dc_ray_scr(coll_var[0],x,y,z,local.xtmp,local.ytmp,local.ztmp,local.xvel,local.yvel,local.zvel)
                            if p3dc_check_rot_scr(coll_var[0],x,y,z,other.coll_var[0],local.xtmp+local.xvel,local.ytmp+local.yvel,local.ztmp+local.zvel,0,0,0,0,local.ydir,local.zdir)
                            {
                                local.collided = true;
                                hurt_weapon_var = other.id;
                                hurt_target_var = local.player;
                                hurt_power_var = other.power_var;
                                hurt_type_var = other.type_var;
                                event_user(4);
                            }
                        }
                    }
                    with interact_trig_obj
                    {
                        if weapon_var && on_var
                        {
                            if p3dc_check_rot_scr(coll_var[0],x,y,z,other.coll_var[0],local.xtmp+local.xvel,local.ytmp+local.yvel,local.ztmp+local.zvel,0,0,0,0,local.ydir,local.zdir)
                            {
                                local.collided = true;
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
                                local.collided = true;
                                hurt_weapon_var = other.id;
                                hurt_target_var = local.player;
                                hurt_power_var = other.power_var;
                                hurt_type_var = other.type_var;
                                event_user(4);
                            }
                        }
                        else if solid_var && !local.collided
                        {
                            if p3dc_check_rot_scr(coll_var[0],x,y,z,other.coll_var[0],local.xtmp+local.xvel,local.ytmp+local.yvel,local.ztmp+local.zvel,0,0,degtorad(direction),0,local.ydir,local.zdir)
                            { local.collided = true; local.ding = true; }
                        }
                    }
                    if !local.collided
                    {
                        if p3dc_check_rot_scr(global.room_coll,0,0,0,coll_var[0],local.xtmp+local.xvel,local.ytmp+local.yvel,local.ztmp+local.zvel,0,0,0,0,local.ydir,local.zdir)
                        { local.collided = true; local.ding = true; }
                    }
                    if local.ding { fmod_snd_play_scr(choose(axe_01_snd,axe_02_snd,axe_03_snd)); }
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
    }
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_end,'
    event_inherited();
    if color_var
    { image_blend = c_white; }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == par_var.cam_id_var && !par_var.dead_var && par_var.on_var
    {
        // Scale
        local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
        local.xscale = image_xscale*local.viewscale;
        local.yscale = image_yscale*local.viewscale;
        local.right = max((view_wview[view_current]/2)-(local.xscale/3),view_wview[view_current]-local.xscale);
        local.bottom = view_hview[view_current]-local.yscale;
        // Draw
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_sprite_stretched_ext(spr_var,floor(spr_id_var),local.right,local.bottom,local.xscale,local.yscale,image_blend,image_alpha);
        d3d_set_hidden(true);
    }
');