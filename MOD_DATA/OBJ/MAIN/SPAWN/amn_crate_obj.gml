// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
globalvar amn_crate_coll;
amn_crate_coll[1] = 12;
amn_crate_coll[2] = 32;
amn_crate_coll[3] = 32;
amn_crate_coll[0] = prop_to_coll_scr(2,main_directory_const+"\MDL\RM\amn_crate_coll_mdl.gmmod",12,12,12);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = crate_bg_tex;
    event_inherited();
    solid_var = player_solid_const;
    center_w_var = 12;
    w_var = 12;
    h_var = 12;
    l_var = 12;
    type_var = 2;
    sink_rate_var = 0.01;
    raise_rate_var = grav_const;
    sink_var = false;
    bob_var = true;
    z_off_var = 0;
    z_vel_var = 0;
    // Collisions
    coll_var[0] = -5;
    coll_var[1] = amn_crate_coll[1];
    coll_var[2] = amn_crate_coll[2];
    coll_var[3] = amn_crate_coll[3];
');
// Sinking!
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if instance_exists(water_obj) && sink_var
    {
        local.bool = false;
        with player_obj
        {
            if do_coll_var && on_floor_var && !dead_var && on_var
            {
                if box_coll_scr
                (
                    x,y,z,coll_var[2],coll_var[2],coll_var[1],
                    other.x,other.y,other.z,other.coll_var[2],other.coll_var[3],other.coll_var[1]+step_h_var
                )
                { local.bool = true; break; }
            }
        }
        if bob_var
        {
            zstart = water_obj.z-10;
            if z_off_var > 0 { z_vel_var -= raise_rate_var*global.delta_time_var; }
            else if local.bool { z_vel_var = 0; z_off_var -= sink_rate_var*global.delta_time_var; }
            else if z_off_var < 0
            {
                if z_vel_var < 0
                {
                    z_off_var = 0;
                    z_vel_var = 0;
                }
                else { z_vel_var += raise_rate_var*global.delta_time_var; }
            }
            if z_vel_var != 0 { z_off_var += z_vel_var; }
            z = zstart+z_off_var;
        }
        else
        {
            if z > zstart { z_spd_var -= raise_rate_var*global.delta_time_var; }
            else if local.bool { z_spd_var = 0; z -= sink_rate_var*global.delta_time_var; }
            else if z < zstart
            {
                if z_spd_var < 0
                {
                    z = zstart;
                    z_spd_var = 0;
                }
                else { z_spd_var += raise_rate_var*global.delta_time_var; }
            }
        }
    }
');