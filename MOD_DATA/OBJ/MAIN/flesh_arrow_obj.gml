// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    on_var = false;
    visible = false;
    // Variables
    snap_var = 1; // Snap to floor
    event_inherited();
    solid_var = false;
    type_var = 4; // Floor
    w_var = 44;
    l_var = 18;
    dist_var = 4;
    // Base
    w_02_var = 16;
    l_02_var = 16;
    dist_02_var = 1;
    // Special
    turn_rate_var = 1;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var && turn_rate_var > 0
    { direction = turn_scr(direction,target_dir_var,turn_rate_var*global.delta_time_var); }
');
// Calculate Path
object_event_add
(argument0,ev_other,ev_user0,'
    target_dir_var = point_direction(x,y,global.spawn_arr[1,0],global.spawn_arr[1,1]);
    with player_obj
    {
        if path_exists(path_var) && clear_time_var > 0
        {
            local.bestdist = -1;
            for (local.i=0; local.i<path_get_number(path_var); local.i+=1;)
            {
                local.xtmp = path_get_point_x(path_var,local.i);
                local.ytmp = path_get_point_y(path_var,local.i);
                local.dist = point_distance(other.x,other.y,local.xtmp,local.ytmp);
                if local.dist < local.bestdist || local.bestdist == -1
                {
                    local.bestdist = local.dist;
                    other.target_dir_var = point_direction
                    (
                        local.xtmp,local.ytmp,
                        path_get_point_x(path_var,local.i+8),path_get_point_y(path_var,local.i+8)
                    );
                }
            }
            break;
        }
    }
    if turn_rate_var <= 0 { direction = target_dir_var; }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if on_var
    {
        draw_set_alpha(image_alpha);
        if color_var == 2
        { draw_set_color(color_mult_scr(image_blend,tone_var)); }
        else { draw_set_color(image_blend); }
        d3d_transform_set_identity();
        d3d_transform_add_translation(x,y,z);
        d3d_draw_floor(-w_02_var/2,-l_02_var/2,dist_02_var,w_02_var/2,l_02_var/2,dist_02_var,tex_02_var,tex_w_02_var,tex_h_02_var);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        // I think this is the right order
        event_inherited();
    }
');