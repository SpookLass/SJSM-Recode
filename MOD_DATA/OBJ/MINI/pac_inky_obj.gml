// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,pac_control_obj.pac_ghost_obj_var);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    image_blend = make_color_rgb(101,255,255);
');
// Chase target event
object_event_add
(argument0,ev_other,ev_user1,'
    event_inherited();
    if target_var != noone
    {
        target_x_var = mod_scr(target_x_var+lengthdir_x(2,target_var.dir_var*90),ds_grid_width(par_var.map_grid_var));
        target_y_var = mod_scr(target_y_var+lengthdir_y(2,target_var.dir_var*90),ds_grid_height(par_var.map_grid_var));
        if instance_exists(par_var.pac_blinky_obj_var)
        {
            local.ghost = par_var.pac_blinky_obj_var;
            local.bestdist = point_distance(target_x_var,target_y_var,local.ghost.x,local.ghost.y);
        }
        else
        {
            local.ghost = noone; local.bestdist = 0;
            with par_var.pac_ghost_obj_var
            {
                if on_var && id != other.id
                {
                    local.dist = point_distance(x,y,other.target_x_var,other.target_y_var);
                    if local.ghost == noone || local.dist < local.bestdist
                    {
                        local.ghost = id;
                        local.bestdist = local.dist;
                    }
                }
            }
        }
        local.dir = point_direction(local.ghost.x,local.ghost.y,target_x_var,target_y_var);
        target_x_var = median(target_x_var+lengthdir_x(local.bestdist,local.dir),ds_grid_width(par_var.map_grid_var),0);
        target_y_var = median(target_y_var+lengthdir_y(local.bestdist,local.dir),ds_grid_height(par_var.map_grid_var),0);
    }
');