// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,enemy_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,"
    // Render
    spr_var = taker_spr;
    spr_id_var = 0;
    spr_spd_var = 1/6;
    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    w_var = 6;
    h_var = 12;
    z_off_var = 10;
    // Damage
    dmg_var = 60;
    dmg_alarm_var = 120;
    // Movement
    spd_var = 0.8;
    delay_var = 600;
    // Alarms
    alarm_len_var = 1;
    // Collision
    coll_var[0] = global.mon_coll[0];
    coll_var[1] = global.mon_coll[1];
    coll_var[2] = global.mon_coll[2];
    // Behavior
    switch global.taker_type_var
    {
        case 0: // Recode
        {
            dmg_var = 999;
            delay_var = 60;
            break;
        }
        case 2: // HD
        {
            dmg_var = 120;
            dmg_alarm_var = 45;
            spd_var = 1.6;
            break;
        }
        case 3: // DH
        {
            // Eventually sprite if we have it
            dmg_var = 999;
            spd_var = 2;
            w_var = 10;
            h_var = 18.5;
            z_off_var = 0;
            break;
        }
    }
    // Start
    set_alarm_scr(0,delay_var);
    yaw_var = global.spawn_arr[0,3];
    x = global.spawn_arr[0,0]-lengthdir_x(32,yaw_var);
    y = global.spawn_arr[0,1]-lengthdir_y(32,yaw_var);
    z = global.spawn_arr[0,2];
");
// Step Event
object_event_add
(argument0,ev_alarm,0,"
    on_var = true;
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if instance_exists(target_var) && !target_var.dead_var && target_var.on_var
    {
        if on_var
        {
            // Move
            local.yaw = point_direction(x,y,target_var.x,target_var.y);
            local.pitch = point_direction_3d_scr(x,y,z,target_var.x,target_var.y,target_var.z);
            set_motion_3d_scr(spd_var,true,local.yaw,true,local.pitch,true);
            // Animate
            spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
            tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
            // Attack
            local.dead = true;
            with player_obj
            {
                if id == other.target_var && !dead_var && !hurt_var && !in_door_var && !invuln_var && on_var
                {
                    // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
                    if cyl_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[1])
                    {
                        if hp_var > other.dmg_var
                        {
                            hp_var -= other.dmg_var;
                            if other.dmg_alarm_var
                            {
                                hurt_var = true;
                                set_alarm_scr(0,other.dmg_alarm_var);
                            }
                            hurt_target_var = other.id;
                            event_perform(ev_other,ev_user0);
                        }
                        else
                        {
                            hp_var = 0;
                            dead_var = true;
                            do_coll_var = false;
                            grav_var = false;
                        }
                        local.success = true;
                    }
                }
                if !dead_var { local.dead = false; }
            }
            if local.success
            {
                if false//local.dead
                {
                    global.dead_mon_var = object_index;
                    instance_destroy();
                    room_goto(dead_rm_var);
                }
                else { event_perform(ev_other,ev_user3); }
            }
            event_inherited();
        }
    }
    else { instance_destroy(); }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if (on_var || visible_var) && (cam_id_var == view_current || cam_id_var < 0)
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
        d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
        d3d_draw_wall(0,w_var/2,h_var,0,-w_var/2,0,tex_var,1,1);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
");