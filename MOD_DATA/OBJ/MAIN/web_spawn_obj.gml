// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    web_min_var = 1;
    web_max_var = 3;
    web_num_var = 1;
    web_den_var = 3;
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    with ceil_par_obj
    {
        local.ceil = id;
        if frac_chance_scr(other.web_num_var,other.web_den_var)
        {
            local.webs = irandom_range(other.web_min_var,other.web_max_var);
            for (local.i=0; local.i<local.webs; local.i+=1;)
            {
                local.xtmp = x+random_range(-w_var*0.5,w_var*0.5);
                local.ytmp = y+random_range(-h_var*0.5,h_var*0.5);
                with instance_create(local.xtmp,local.ytmp,web_obj)
                {
                    direction = random(360);
                    z = local.ceil.z;
                }
            }
        }
    }
');