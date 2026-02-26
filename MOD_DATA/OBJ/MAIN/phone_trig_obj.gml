// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Phone trigger
global.phone_trig_coll[1] = 32;
global.phone_trig_coll[2] = 32;
global.phone_trig_coll[3] = 96;
local.radius_z = global.phone_trig_coll[1]/2;
local.radius_x = global.phone_trig_coll[2]/2;
local.radius_y = global.phone_trig_coll[3]/2;
global.phone_trig_coll[0] = p3dc_begin_mdl_scr();
p3dc_add_block_scr(-local.radius_x,-local.radius_y,-local.radius_z,local.radius_x,local.radius_y,local.radius_z);
p3dc_end_mdl_scr();
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Collision
    coll_var[0] = global.phone_trig_coll[0];
    coll_var[1] = global.phone_trig_coll[1];
    coll_var[2] = global.phone_trig_coll[2];
    coll_var[3] = global.phone_trig_coll[3];
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if !global.pause_var
    {
        local.active = false;
        with player_obj
        {
            if on_var && !in_door_var && !dead_var
            {
                // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
                if box_coll_scr(x,y,z,coll_var[2],coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[3],other.coll_var[1])
                { local.active = true; break; }
            }
        }
        if local.active
        {
            with phone_obj
            { event_user(0); }
            instance_destroy();
        }
    }
');