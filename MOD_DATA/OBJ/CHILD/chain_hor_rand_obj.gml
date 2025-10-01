// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,chain_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    direction = 90;
    event_inherited();
    local.weird = !irandom(2);
    local.dist = random_range(-12,12);
    if local.weird { local.dist -= 6.3; }
    x += lengthdir_x(local.dist,direction-90);
    y += lengthdir_y(local.dist,direction-90);
    if local.weird
    {
        local.chain = instance_create
        (
            x+lengthdir_x(6,direction-90),
            y+lengthdir_y(6,direction-90),
            chain_obj
        );
        local.chain.direction = direction;
        local.chain.z = z;
    }
");