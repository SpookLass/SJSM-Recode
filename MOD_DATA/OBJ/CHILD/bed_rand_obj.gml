// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,bed_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    if frac_chance_scr(3,4)
    {
        event_inherited();
        if frac_chance_scr(1,2)
        {
            local.post = instance_create(x,y,bed_post_obj);
            local.post.z = z;
            local.post.direction = direction;
        }
    }
    else { instance_destroy(); }
');