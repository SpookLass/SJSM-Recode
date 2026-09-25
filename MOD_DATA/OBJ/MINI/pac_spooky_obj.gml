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
    base_spr_var = par_var.spooky_spr_var;
    eye_spr_var = par_var.spooky_eye_spr_var;
    scare_base_spr_var = base_spr_var;
    scare_eye_spr_var = eye_spr_var;
    scare_state_var = 2;
    // smart_var = true;
');
// Bootleg Inky lol
object_event_add
(argument0,ev_other,ev_user1,'
    event_inherited();
    if target_var != noone
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
        if local.ghost != noone
        {
            local.dir = point_direction(local.ghost.x,local.ghost.y,target_x_var,target_y_var);
            target_x_var = median(target_x_var+lengthdir_x(local.bestdist,local.dir),ds_grid_width(par_var.map_grid_var),0);
            target_y_var = median(target_y_var+lengthdir_y(local.bestdist,local.dir),ds_grid_height(par_var.map_grid_var),0);
        }
    }
');