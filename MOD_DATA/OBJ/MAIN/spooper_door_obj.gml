// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
// global.spooper_coll[0] = prop_to_coll_scr(0,main_directory_const+"\MDL\MON\spooper_mdl.gmmod");
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    solid_var = true;
    flesh_var = false;
    // For grid (I dont really know how wide it is)
    w_var = 8;
    l_var = w_var;
    // Collisions
    coll_var[0] = global.mon_coll[0];
    coll_var[1] = global.mon_coll[1];
    coll_var[2] = global.mon_coll[2];
    coll_var[3] = global.mon_coll[2];
    // Special
    weapon_var = true;
    turn_rate_var = 1/6;
');
// Weapon Event
object_event_add
(argument0,ev_other,ev_user4,'
    // Effects
    fmod_snd_play_scr(choose(axe_hit_01_snd,axe_hit_02_snd));
    if !global.reduce_flash_var
    {
        with instance_create(0,0,flash_eff_obj)
        {
            image_blend = c_red; 
            set_alarm_scr(0,6);
            cam_id_var = other.hurt_target_var.cam_id_var;
        }
    }
    with player_obj
    {
        if on_var && !dead_var && !in_door_var
        {
            local.player = id;
            switch (global.shake_type_var)
            {
                case shake_classic_const:
                {
                    with instance_create(0,0,shake_eff_obj)
                    {
                        player_var = local.player;
                        mult_var = local.player.shake_pos_base_var;
                        type_var = 0; // Constant
                    }
                    break;
                }
                case shake_modern_const:
                {
                    with instance_create(0,0,shake_eff_obj)
                    {
                        player_var = local.player;
                        mult_var = local.player.shake_angle_base_var;
                        type_var = 1; // Fade out
                    }
                    break;
                }
            }
        }
    }
    // Function
    with par_var
    {
        hp_var -= 1;
        if hp_var <= 0
        { event_user(15); }
    }
    with door_trig_obj { if lock_var == 2 { lock_var = false; }}
    with object_index { instance_destroy(); }
    
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    local.player = noone;
    // Teleport
    local.spawns = max(global.spawn_len_var,global.spawn_len_extra_var);
    if tp_var && local.spawns > 1
    {
        local.bestdist = -1;
        local.bestspawn = -1;
        for (local.i=1; local.i<local.spawns; local.i+=1;)
        {
            if global.spawn_arr[local.i,4].lock_var == 2
            {
                with player_obj
                {
                    if on_var && !dead_var && !in_door_var
                    {
                        local.dist = point_distance_3d_scr(x,y,z,global.spawn_arr[local.i,0],global.spawn_arr[local.i,1],global.spawn_arr[local.i,2]);
                        if local.bestdist == -1 || local.dist < local.bestdist
                        {
                            local.bestdist = local.dist;
                            local.bestspawn = local.i;
                            local.player = id;
                        }
                    }
                }
            }
        }
        if local.bestspawn != -1 && local.bestspawn != spawn_var
        {
            spawn_var = local.bestspawn;
            x = global.spawn_arr[spawn_var,0]-lengthdir_x(8,global.spawn_arr[spawn_var,3]);
            y = global.spawn_arr[spawn_var,1]-lengthdir_y(8,global.spawn_arr[spawn_var,3]);
            z = global.spawn_arr[spawn_var,2];
            direction = global.spawn_arr[spawn_var,3]+180;
        }
    }
    // Turn
    if local.player == noone
    {
        local.bestdist = -1;
        with player_obj
        {
            if on_var && !dead_var && !in_door_var
            {
                local.dist = point_distance_3d_scr(x,y,z,other.x,other.y,other.z);
                if local.bestdist == -1 || local.dist < local.bestdist
                {
                    local.bestdist = local.dist;
                    local.player = id;
                }
            }
        }
    }
    if instance_exists(local.player)
    {
        // Turning
        local.diff = deg_diff_scr(point_direction(x,y,local.player.x,local.player.y),direction+180);
        direction += sign(local.diff)*min(abs(local.diff),turn_rate_var*global.delta_time_var);
    }
');