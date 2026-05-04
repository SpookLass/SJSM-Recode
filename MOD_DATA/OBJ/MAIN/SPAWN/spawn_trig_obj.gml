object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    local.dothing = false;
    with player_obj
    {
        if on_var && !dead_var && !in_door_var
        {
            if abs(deg_diff_scr(other.direction,point_direction(other.x,other.y,x,y))) <= 90
            { local.dothing = true; break; }
        }
    }
    if local.dothing
    {
        event_user(0);
        instance_destroy();
    }
');