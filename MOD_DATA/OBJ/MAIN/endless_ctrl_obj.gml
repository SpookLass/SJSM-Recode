/*
1830 frames total
305 cycles
END_var
    +0.0002 every cycle
    0.061 max
    0.0002, 0.0004, 0.0006, 0.0008
Wall Y
    +END_var every cycle
    9.r3 max
    0.0002, 0.0006, 0.0012, 0.002
Taker
    88 to 248 pixels from player
    y = x(0.5+1x/60) where x is frames and y is pixels
    ~59.19569 to ~107.9024 frames
*/
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    time_var = 1830; // In frames
    taker_dist_var = 128;
    dist_var = 160;
    direction = 0;
    prog_var = 0;
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    // Praying this works
    local.dx = cos(degtorad(direction));
    local.dy = -sin(degtorad(direction));
    local.bestspd = 0;
    with player_obj
    {
        if on_var && !dead_var && !in_door_var
        {
            if abs(deg_diff_scr(other.direction,point_direction(other.x,other.y,x,y))) <= 90
            {
                local.spd = (x_spd_var*local.dx)+(y_spd_var*local.dy)
                if local.spd > local.bestspd { local.bestspd = local.spd;}
                if ((x-other.x)*local.dx) + ((y-other.y)*local.dy) > other.dist_var
                {
                    x -= local.dx*other.dist_var;
                    y -= local.dy*other.dist_var;
                }
            }
        }
    }
    // Calculate progess
    prog_var += local.bestspd*global.delta_time_var;
    local.per = prog_var/time_var;
    // 0.0001 x 305
    local.wall_off_var = 0.0305*local.per*((local.per*305)+1); // Triangular numbers are fun!!!
    with endless_wall_obj
    {
        x = xstart+lengthdir_x(local.wall_off_var,yaw_var);
        y = ystart+lengthdir_y(local.wall_off_var,yaw_var);
    }
    with endless_torch_obj { dist_var = lerp_scr(dist_min_var,dist_max_var,local.per); }
    // Taker!
    if prog_var >= time_var
    {
        local.x2 = player_obj.x+lengthdir_x(taker_dist_var,direction);
        local.y2 = player_obj.y+lengthdir_y(taker_dist_var,direction);
        local.z2 = player_obj.z;
        with instance_create(local.x2+lengthdir_x(32,direction+90),local.y2+lengthdir_y(32,direction+90),endless_taker_obj)
        {
            z = local.z2;
            zstart = local.z2;
            x2_var = local.x2;
            y2_var = local.y2;
            z2_var = local.z2;
        }
        instance_destroy();
    }
');