// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,enemy_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // Translations
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("howard",global.name_var);
    sub_var[0] = string_replace(ini_read_string("SUB","howard","SUB_howard"),"@n",name_var); sub_var[1] = false;
    ini_close();
    // Variables
    do_possess_var = false;
    event_inherited();
    // Render
    tex_var = howard_bg_tex;
    w_var = 6.375; // 8.5
    h_var = 25.5; // 34
    x_off_var = 0;
    y_off_var = 0;
    z_off_var = 0;
    // Movement
    spd_var = 3.75; // 5
    dist_var = 108; // 144
    // Collision
    coll_var[0] = global.mon_coll[0];
    coll_var[1] = global.mon_coll[1];
    coll_var[2] = global.mon_coll[2];
    // Target
    target_var = noone;
    target_dist_var = 0;
    target_x_var = x;
    target_y_var = y;
    target_z_var = z;
    // Start
    on_var = false;
    active_var = false;
    // Sound
    inst_var = noone;
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\stab_11_snd.wav",false);
    load_var = true;
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// Unload
object_event_add
(argument0,ev_other,ev_user0,'
    if load_var
    {
        fmod_snd_free_scr(snd_var);
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var
    {
        if !active_var
        {
            local.active = false;
            with player_obj
            {
                local.dist = point_distance_3d_scr(other.x,other.y,other.z,x,y,z);
                if on_var && !in_door_var && !dead_var && local.dist < other.dist_var
                {
                    other.target_var = id;
                    other.target_x_var = x;
                    other.target_y_var = y;
                    other.target_z_var = z;
                    other.target_dist_var = local.dist;
                    local.active = true;
                    break;
                }
            }
            if local.active
            {
                inst_var = fmod_snd_play_scr(snd_var); 
                local.yaw = point_direction(x,y,target_var.x,target_var.y);
                local.pitch = point_direction_3d_scr(x,y,z,target_var.x,target_var.y,target_var.z);
                set_motion_3d_scr(spd_var,true,local.yaw,true,local.pitch,true);
                active_var = true;
            }
        }
        else
        {
            target_var = noone;
            target_dist_var = 0;
            target_x_var = x;
            target_y_var = y;
            target_z_var = z;
            local.active = false;
            with player_obj
            {
                if on_var && !in_door_var && !dead_var
                {
                    local.dist = point_distance_3d_scr(other.x,other.y,other.z,x,y,z);
                    if !invuln_var && cyl_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[1])
                    {
                        other.target_var = id;
                        local.active = true;
                        break;
                    }
                    else if other.target_var == noone || local.dist < other.target_dist_var
                    {
                        other.target_var = id;
                        other.target_x_var = x;
                        other.target_y_var = y;
                        other.target_z_var = z;
                        other.target_dist_var = local.dist;
                    }
                }
            }
            if local.active
            {
                // fmod_inst_stop_scr(inst_var);
                with instance_create(0,0,fade_eff_obj)
                {
                    set_alarm_scr(0,500);
                    cam_id_var = other.target_var.cam_id_var;
                }
                on_var = false;
                set_motion_scr(0,true);
                exit;
            }
            if target_dist_var > spd_var
            {
                // Move
                local.yaw = point_direction(x,y,target_x_var,target_y_var);
                local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
                set_motion_3d_scr(spd_var,true,local.yaw,true,local.pitch,true);
            }
            else
            {
                x = target_x_var;
                y = target_y_var;
                z = target_z_var;
                set_motion_3d_scr(0,true);
            }
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if on_var
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
        d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
        d3d_draw_wall(0,w_var/2,h_var,0,-w_var/2,0,tex_var,1,1);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
');