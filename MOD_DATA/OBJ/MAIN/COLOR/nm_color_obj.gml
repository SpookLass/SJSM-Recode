// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,color_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    image_blend = c_white;
    light_color_var = c_white;
    event_inherited();
    light_var = 0;
    light_rate_var = 0.05;
    dist_min_var = 0;
    dist_max_var = 64;
    enemy_dist_min_var = 0;
    enemy_dist_max_var = 256;
');
// Main
object_event_add
(argument0,ev_other,ev_user0,'
    with par_3d_obj
    {
        if variable_local_exists("color_var")
        {
            if color_var == 1 || (color_var && global.color_var != 1)
            { image_blend = c_white; }
        }
    }
    with axe_obj
    {
        if variable_local_exists("color_var")
        {
            if color_var == 1 || (color_var && global.color_var != 1)
            { image_blend = c_white; }
        }
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if light_var > 0 { light_var = median(0,1,light_var-(light_rate_var*global.delta_time_var)); }
');
// Draw event
object_event_add
(argument0,ev_draw,0,'
    with par_3d_obj
    {
        if variable_local_exists("color_var")
        {
            if color_var == 1 || (color_var && global.color_var != 1)
            {
                if object_is_ancestor(object_index,enemy_par_obj)
                {
                    local.distmin = other.enemy_dist_min_var;
                    local.distmax = other.enemy_dist_max_var;
                }
                else
                {
                    local.distmin = other.dist_min_var;
                    local.distmax = other.dist_max_var;
                }
                local.per = anti_lerp_scr(local.distmax,local.distmin,(1-other.light_var)*point_distance(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
                local.color = make_color_hsv(0,0,local.per*255);
                if color_var == 3 { image_blend = light_color_scr(local.color); }
                else { image_blend = local.color; }
            }
        }
    }
');