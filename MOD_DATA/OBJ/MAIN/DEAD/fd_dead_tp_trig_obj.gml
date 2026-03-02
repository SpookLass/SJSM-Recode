object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    coll_var[1] = 32;
    coll_var[2] = 32;
    swap_var = false;
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    with tp_origin_obj
    {
        if id_var == other.id_var || id_var == -1
        { other.origin_var = id; break; }
    }
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    // Praying this works
    local.dothing = false;
    with player_obj
    {
        local.dir = deg_diff_scr(other.direction,point_direction(other.x,other.y,x,y));
        if box_coll_scr(x,y,z,coll_var[2],coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[2],other.coll_var[1])
        {
            local.dist = point_distance(x,y,other.x,other.y);
            x = other.origin_var.x+lengthdir_x(local.dist,other.origin_var.direction-local.dir);
            y = other.origin_var.y+lengthdir_y(local.dist,other.origin_var.direction-local.dir);
            eye_yaw_var += other.origin_var.direction-other.direction;
            set_motion_scr(0,false,yaw_var+other.origin_var.direction-other.direction,true);
            local.dothing = true;
        }
    }
    if local.dothing && swap_var
    {
        with fd_dead_wall_obj
        {
            solid_var = !solid_var;
            visible = !visible;
        }
    }
');