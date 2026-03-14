object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,'
    if global.player_len_var > 1
    {
        with pt_note_obj { event_user(4); }
        with howard_obj { on_var = true; }
        instance_destroy();
        exit;
    }
    event_inherited();
    direction = 90;
    note_var = false;
    note_fail_var = 0;
    note_num_var = 1;
    note_den_var = 3;
    howard_var = false;
    howard_fail_var = 0;
    howard_num_var = 1;
    howard_den_var = 5;
    // Type
    switch global.howard_type_var
    {
        case 2:
        {
            note_den_var = 1;
            break;
        }
    }
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    local.dothing = false;
    with player_obj
    {
        if !dead_var && !in_door_var
        {
            local.dir = deg_diff_scr(other.direction,point_direction(other.x,other.y,x,y));
            if abs(local.dir) <= 90
            {
                local.dist = point_distance(x,y,other.x,other.y);
                x = tp_origin_obj.x+lengthdir_x(local.dist,tp_origin_obj.direction-local.dir);
                y = tp_origin_obj.y+lengthdir_y(local.dist,tp_origin_obj.direction-local.dir);
                eye_yaw_var += tp_origin_obj.direction-other.direction;
                set_motion_scr(0,false,yaw_var+tp_origin_obj.direction-other.direction,true);
                local.dothing = true;
            }
        }
    }
    if local.dothing
    {
        if !note_var
        {
            if frac_chance_scr(note_num_var,note_den_var-note_fail_var)
            {
                with pt_note_obj { event_user(4); }
                note_var = true;
            }
            else { note_fail_var += 1; }
        }
        if !howard_var
        {
            if frac_chance_scr(howard_num_var,howard_den_var-howard_fail_var)
            {
                with howard_obj { on_var = true; }
                howard_var = true;
            }
            else { howard_fail_var += 1; }
        }
        with pt_door_trig_obj
        { if !prog_press_var { event_user(5); }}
    }
');