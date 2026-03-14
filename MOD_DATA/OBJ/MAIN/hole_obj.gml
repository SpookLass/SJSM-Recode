// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    z = instance_nearest(x,y,floor_par_obj).z;
    if instance_exists(ceil_par_obj)
    { h_var = instance_nearest(x,y,ceil_par_obj).z-z; }
    else { h_var = 320; visible = false; }
    z_off_var = h_var-0.05;
    w_var = 20;
    coll_var[1] = h_var;
    coll_var[2] = w_var;
    on_var = true;
    color_var = 2;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var
    {
        local.trigger = false;
        with player_obj
        {
            if on_var && !invuln_var && !dead_var && !in_door_var
            {
                if cyl_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[1])
                { local.trigger = true; }
            }
        }
        if local.trigger
        {
            on_var = false;
            with echidna_obj
            {
                if variable_local_exists("do_hole_var")
                {
                    if do_hole_var && !hole_var && !on_var && frac_chance_scr(hole_spawn_num_var,hole_spawn_den_var)
                    {
                        hole_x_var = other.x;
                        hole_y_var = other.y;
                        hole_z_var = other.z+other.h_var-16;
                        event_user(15);
                        break;
                    }
                }
                
            }
            local.last = true;
            with hole_obj { if on_var { local.last = false; }}
            if local.last
            {
                with echidna_obj
                {
                    if variable_local_exists("do_hole_var")
                    {
                        if do_hole_var && !hole_var && !on_var && door_var
                        {
                            hole_var = true;
                            set_alarm_scr(0,irandom_range(delay_min_var,delay_max_var));
                        }
                    }
                }
            }
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_transform_set_identity();
    d3d_transform_set_rotation_z(direction);
    d3d_transform_add_translation(x,y,z+z_off_var);
    local.radius = w_var/2;
    d3d_draw_floor(-local.radius,-local.radius,0,local.radius,local.radius,0,tex_var,1,1);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');