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
    solid_var = false;
    flesh_var = false;
    // For grid (I dont really know how wide it is)
    w_var = 8;
    l_var = w_var;
    // Collisions
    coll_var[0] = global.mon_coll[0];
    coll_var[1] = global.mon_coll[1];
    coll_var[2] = global.mon_coll[2];
    // Special
    turn_rate_var = 1/6;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    local.player = noone;
    // Turn
    local.bestdist = -1;
    local.seen = false;
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
            if !local.seen
            {
                if seen_scr
                (
                    other.seen_yaw_var,other.seen_pitch_var,other.seen_dist_var,
                    eye_yaw_var,eye_pitch_var,
                    x,y,z+eye_h_var,
                    false,false,
                    other.coll_var[1],other.coll_var[2],
                    other.x,other.y,other.z
                ) > 0
                { local.seen = true; }
            }
        }
    }
    if local.seen { instance_destroy(); exit; }
    if instance_exists(local.player)
    {
        // Turning
        local.diff = deg_diff_scr(point_direction(x,y,local.player.x,local.player.y),direction+180);
        direction += sign(local.diff)*min(abs(local.diff),turn_rate_var*global.delta_time_var);
    }
');