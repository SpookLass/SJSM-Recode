object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_var);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    with maze_origin_obj
    {
        if id_var == other.id_var || id_var == -1
        { other.origin_var = id; break; }
    }
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    // Praying this works
    with player_obj
    {
        local.dir = deg_diff_scr(other.direction,point_direction(other.x,other.y,x,y));
        if abs(local.dir) <= 90
        {
            local.dist = point_distance(x,y,other.x,other.y);
            x = other.origin_var.x+lengthdir_x(local.dist,other.origin_var.direction-local.dir);
            y = other.origin_var.y+lengthdir_y(local.dist,other.origin_var.direction-local.dir);
            eye_yaw_var += other.origin_var.direction-other.direction;
            set_motion_scr(0,false,yaw_var+other.origin_var.direction-other.direction,true);
            local.dothing = true;
        }
    }
    if local.dothing
    {
        with maze_control_obj
        {
            id_var = other.id_var;
            event_user(0);
        }
    }
    
');