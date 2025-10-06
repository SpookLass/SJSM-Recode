// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,frame_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    direction = 90;
    event_inherited();
    local.art = instance_create(x,y,art_obj)
    local.art.z = z+1.4;
    local.art.direction = direction;
");