// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,mad_arrow_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    on_var = false;
    player_var = false;
    inst_var = noone;
');
// Room end event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_inherited();
    if on_var { fmod_inst_stop_scr(inst_var); }
');
// Room start event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    if on_var { event_user(0); }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var { event_inherited(); }
');
// Calculate Path
object_event_add
(argument0,ev_other,ev_user0,'
    local.unlock = max(0,global.unlock_var);
    target_dir_var = point_direction(x,y,global.spawn_arr[local.unlock,0],global.spawn_arr[local.unlock,1]);
    with player_obj
    {
        if on_var && !dead_var
        {
            if path_exists(path_var) && clear_time_var > 0
            {
                local.bestdist = -1;
                for (local.i=0; local.i<path_get_number(path_var); local.i+=1;)
                {
                    local.xtmp = path_get_point_x(path_var,local.i);
                    local.ytmp = path_get_point_y(path_var,local.i);
                    local.dist = point_distance(other.x,other.y,local.xtmp,local.ytmp);
                    if local.dist < local.bestdist || local.bestdist == -1
                    {
                        local.bestdist = local.dist;
                        other.target_dir_var = point_direction
                        (
                            local.xtmp,local.ytmp,
                            path_get_point_x(path_var,local.i+8),path_get_point_y(path_var,local.i+8)
                        );
                    }
                }
                break;
            }
        }
    }
    if turn_rate_var <= 0 { direction = target_dir_var; }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if on_var { event_inherited(); }
');