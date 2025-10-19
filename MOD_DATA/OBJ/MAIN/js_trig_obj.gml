// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create event
object_event_add
(argument0,ev_create,0,"
    // Collision
    coll_var[0] = global.js_trig_coll[0];
    coll_var[1] = global.js_trig_coll[1];
    coll_var[2] = global.js_trig_coll[2];
    coll_var[3] = global.js_trig_coll[3];
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    local.active = false;
    with player_obj
    {
        local.player = id;
        // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
        if box_coll_scr(x,y,z,coll_var[2],coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[3],other.coll_var[1])
        { local.active = true; }
    }
    if local.active
    {
        with par_var { event_user(1); }
        instance_destroy();
    }
");