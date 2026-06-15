// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,kidna_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,'
    do_possess_var = false;
    do_snd_var = false;
    reflect_var = true;
    spawn_var = 0;
    type_var = 0;
    // Render
    spr_var = taker_spr;
    spr_spd_var = 1/6;
    w_var = 6;
    h_var = 12;
    z_off_var = 10;
    sil_var = false;
    // Damage
    dmg_var = 60;
    dmg_alarm_var = 120;
    dead_rm_var = taker_dead_rm;
    atk_range_var = 48;
    // Movement
    spd_base_var = 0.8;
    delay_var = 600;
    // Behavior
    if global.taker_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.taker_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            dmg_var = 999;
            delay_var = 60;
            dead_rm_var = taker_dead_3d_rm;
            atk_range_var = global.mon_coll[2];
            sil_var = true;
            sil_type_var = 1; // Pure color
            sil_color_var = make_color_rgb(159,0,0);
            sil_alpha_var = 0.2;
            sil_dist_var = 0.1;
            break;
        }
        case 2: // HD
        {
            dmg_var = 120;
            dmg_alarm_var = 45;
            spd_var = 1.6;
            dead_rm_var = taker_dead_3d_rm;
            break;
        }
        case 3: // DH
        {
            if global.dh_var
            {
                spr_var = taker_dh_spr;
                w_var = 10;
                h_var = 18.5;
                z_off_var = 0;
                spr_spd_var = 0.5;
            }
            atk_range_var = 6;
            dmg_var = 999;
            spd_var = 2;
            break;
        }
    }
    // Music
    with instance_create(0,0,mus_par_obj)
    {
        par_var = other.id;
        prio_var = mb_mus_prio_const;
        snd_var = taker_mus_snd;
    }
    with mus_control_obj { event_user(0); }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    event_user(15);
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(15);
');
// Unload
object_event_add
(argument0,ev_other,ev_user15,'
    with mus_par_obj { if par_var == other.id { instance_destroy(); }}
    with mus_control_obj { event_user(0); }
');
// Attack Event
object_event_add
(argument0,ev_other,ev_user2,'
    if target_possess_var
    {
        with target_var
        {
            if on_var && possess_var
            {
                if cyl_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.atk_range_var,other.coll_var[1])
                {
                    local.mon = id;
                    with global.player_arr[player_id_var] // Add possession ban
                    {
                        possess_var = false;
                        x = local.mon.x;
                        y = local.mon.y;
                        z = local.mon.z;
                        eye_yaw_var = local.mon.eye_yaw_var;
                        eye_pitch_var = local.mon.eye_pitch_var;
                        possess_delay_var = possess_delay_max_var;
                    }
                    possess_var = false;
                }
            }
        }
    }
    else
    {
        local.dead = (dmg_min_var <= 0);
        local.success = false;
        if possess_var { local.possesser = global.player_arr[player_id_var]; }
        else { local.possesser = noone; }
        with player_obj
        {
            if id == other.target_var
            {
                if atk_player_scr
                (
                    id,other.id, // Player & Monster
                    other.dmg_var,other.dmg_alarm_var,other.dmg_min_var, // Damage
                    true,other.atk_range_var, // Collisions
                    !other.dmg_unbalance_var,other.dmg_eff_var, // Effects
                    other.possess_var,local.possesser, // Possess
                    other.dmg_stam_var // Stamina?
                )
                {
                    other.atk_target_var = id;
                    local.success = true;
                }
            }
            if !dead_var { local.dead = false; }
        }
        if local.success
        {
            if local.dead && !global.debug_var && !possess_var
            { kill_scr(atk_target_var,object_index,dead_rm_var,kill_var); }
            else { event_user(3); }
        }
    }
');
// Target Event
object_event_add
(argument0,ev_other,ev_user6,'
    if on_var
    {
        if !instance_exists(target_var) { instance_destroy(); exit; }
        if !target_var.on_var { instance_destroy(); exit; }
        if target_possess_var { if !target_var.possess_var { instance_destroy(); exit; }}
        else { if target_var.dead_var { instance_destroy(); exit; }}
        target_x_var = target_var.x;
        target_y_var = target_var.y;
        target_z_var = target_var.z;
        target_dist_var = point_distance_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if cam_id_var == view_current || cam_id_var < 0
    { event_inherited(); }
');