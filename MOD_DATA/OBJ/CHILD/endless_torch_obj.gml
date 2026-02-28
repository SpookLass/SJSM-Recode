// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,torch_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    direction = 270;
    event_inherited();
    dist_min_var = 652;
    dist_max_var = 957;
    dist_var = dist_min_var;
    // Light Wall
    with instance_create(x,y,light_wall_par_obj)
    {
        z = other.z;
        gold_var = other.gold_var;
        if gold_var { color_var = false; }
        par_var = other.id;
        direction = mod_scr(other.direction+90,180);
        other.light_wall_var = id;
    }
    // Light Floor
    with instance_create(x+lengthdir_x(-16,direction+90),y+lengthdir_y(-16,direction+90),light_floor_par_obj)
    {
        z = other.z;
        gold_var = other.gold_var;
        if gold_var { color_var = false; }
        par_var = other.id;
        other.light_floor_var = id;
    }
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    local.dx = cos(degtorad(direction));
    local.dy = -sin(degtorad(direction));
    x = xstart+((player_obj.x+dist_var-xstart)*local.dy);
    y = ystart+((player_obj.y+dist_var-ystart)*local.dx);
    // Light
    light_var.x = x+lengthdir_x(-1.5,direction+90);
    light_var.y = y+lengthdir_y(-1.5,direction+90);
    // Light Wall
    light_wall_var.x = x;
    light_wall_var.y = y;
    // Light Floor
    light_floor_var.x = x+lengthdir_x(-16,direction+90);
    light_floor_var.y = y+lengthdir_y(-16,direction+90);
');