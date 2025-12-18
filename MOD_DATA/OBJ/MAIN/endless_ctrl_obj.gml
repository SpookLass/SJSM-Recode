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
*/
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_var);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    dist_var = 160;
    direction = 0;
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
    // Calculate progess
    prog_var += local.bestspd*global.delta_time_var/6;
    local.per = prog_var/305;
    local.wall_off_var = 0.0001*prog_var*(prog_var+1); // Triangular numbers are fun!!!
    with endless_wall_obj
    {
        x = xstart+lengthdir_x(local.wall_off_var,yaw_var);
        y = ystart+lengthdir_y(local.wall_off_var,yaw_var);
    }
    with endless_torch_obj { dist_var = lerp_scr(dist_min_var,dist_max_var,local.per); }
');