// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
state_var
    0 - Start
    1 - Scatter
    2 - Chase
    3 - Leave House
    4 - Scared
    5 - Eaten
*/
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    par_var = pac_control_obj;
    base_spr_var = par_var.ghost_spr_var;
    eye_spr_var = par_var.eye_spr_var;
    scare_base_spr_var = par_var.ghost_spr_var;
    scare_eye_spr_var = par_var.scare_spr_var;
    move_alarm_var = par_var.move_alarm_var;
    scare_color_var = par_var.scare_color_var;
    scare_alarm_var = par_var.scare_alarm_var;
    snd_var = par_var.ghost_snd_var;
    inst_var = fmod_snd_loop_scr(snd_var);
    path_var = par_var.path_var;
    move_var = false;
    player_id_var = -1;
    spr_id_var = 0;
    id_var = 0;
    dir_var = 1;
    x_prev_var = x;
    y_prev_var = y;
    target_var = noone;
    target_x_var = x;
    target_y_var = y;
    target_rand_var = false;
    smart_var = false;
    smart_point_var = 2;
    smart_180_var = false;
    state_var = 3;
    alarm_len_var = 2;
    alarm_ini_scr();
    // Sound
    snd_dist_min_var = 4;
    snd_dist_max_var = 16;
    fmod_inst_set_vol_scr(inst_var,0);
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    fmod_inst_stop_scr(inst_var);
');
// Move Alarm
object_event_add
(argument0,ev_alarm,0,'
    move_var = false;
    set_alarm_scr(0,move_alarm_var);
');
// Scared Alarm
object_event_add
(argument0,ev_alarm,1,'
    dir_var = mod_scr(dir_var+2,4);
    state_var = par_var.state_var;
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if !move_var
    {
        local.move = 1;
        if global.delta_time_var > move_alarm_var
        { local.move = round(global.delta_time_var/move_alarm_var); }
        if player_id_var > -1
        {
            local.leftright = ceil(input_y_scr(player_id_var));
            local.updown = ceil(input_x_scr(player_id_var));
        }
        event_user(0);
        for (local.i=0; local.i<local.move; local.i+=1;)
        {
            local.coll = noone;
            if player_id_var >= 0
            {
                // Check Side
                if local.leftright != 0
                {
                    local.xtmp = mod_scr(x+local.leftright,ds_grid_width(par_var.map_grid_var));
                    local.coll = ds_grid_get(par_var.map_grid_var,local.xtmp,y);
                    if local.coll == 0 || local.coll > 2
                    {
                        dir_var = round(2*arctan2(0,local.leftright)/pi);
                        x_prev_var = local.xtmp-local.leftright;
                        x = local.xtmp;
                        // Delay
                            if local.move == 1
                            {
                                move_var = false;
                                set_alarm_scr(0,move_alarm_var);
                            }
                    }
                }
                // Check top and bottom
                if local.updown != 0 && (local.coll == noone || local.coll == 1 || local.coll == 2)
                {
                    local.ytmp = mod_scr(y+local.updown,ds_grid_height(par_var.map_grid_var));
                    local.coll = ds_grid_get(par_var.map_grid_var,x,local.ytmp);
                    if local.coll == 0 || local.coll > 2
                    {
                        dir_var = round(2*arctan2(local.updown,0)/pi);
                        y_prev_var = local.ytmp-local.updown;
                        y = local.ytmp;
                        // Delay
                            if local.move == 1
                            {
                                move_var = false;
                                set_alarm_scr(0,move_alarm_var);
                            }
                    }
                }
            }
            else if state_var != 0
            {
                // Smart
                local.targetfound = false;
                local.targetdir = noone;
                local.maxturn = 1;
                if smart_var && !target_rand_var
                {
                    if smart_180_var { local.maxturn = 2; }
                    mp_grid_path(par_var.map_mp_grid_var,path_var,x,y,round(target_x_var),round(target_y_var),false);
                    local.targetdir = mod_scr(round(point_direction
                    (
                        path_get_point_x(path_var,0),
                        path_get_point_y(path_var,0),
                        path_get_point_x(path_var,smart_point_var),
                        path_get_point_y(path_var,smart_point_var)
                    )/90),4);
                }
                local.turn = 0; local.bestturn = noone; local.bestdist = 0;
                for (local.j=-1; local.j<=local.maxturn; local.j+=1;)
                {
                    local.dir = mod_scr(dir_var+local.j,4);
                    local.xtmp = mod_scr(x+lengthdir_x(1,local.dir*90),ds_grid_width(par_var.map_grid_var));
                    local.ytmp = mod_scr(y+lengthdir_y(1,local.dir*90),ds_grid_height(par_var.map_grid_var));
                    local.coll = ds_grid_get(par_var.map_grid_var,local.xtmp,local.ytmp);
                    if local.coll != 1 && (local.coll != 2 || state_var == 3 || state_var == 5)
                    {
                        local.dist = point_distance(target_x_var,target_y_var,local.xtmp,local.ytmp);
                        if !target_rand_var && !local.targetfound
                        {
                            local.bool = (local.bestturn == noone || local.dist < local.bestdist);
                            if local.targetdir != noone
                            {
                                local.targetfound = (local.dir == local.targetdir);
                                if local.targetfound { local.bool = true; }
                            }
                            if local.bool { local.bestturn = local.turn; local.bestdist = local.dist; }
                        }
                        local.turn_arr[local.turn,0] = local.dir;
                        local.turn_arr[local.turn,1] = local.xtmp;
                        local.turn_arr[local.turn,2] = local.ytmp;
                        local.turn_arr[local.turn,3] = local.dist;
                        local.turn_arr[local.turn,4] = local.coll; // Sure why not
                        local.turn += 1;
                    }
                }
                if local.turn == 0
                {
                    dir_var = mod_scr(dir_var+2,4);
                    local.xtmp = mod_scr(x+lengthdir_x(1,dir_var*90),ds_grid_width(par_var.map_grid_var));
                    local.ytmp = mod_scr(y+lengthdir_y(1,dir_var*90),ds_grid_height(par_var.map_grid_var));
                    local.coll = ds_grid_get(par_var.map_grid_var,local.xtmp,local.ytmp);
                    if local.coll != 1 && (local.coll != 2 || state_var == 3 || state_var == 5)
                    {
                        // Move
                            x_prev_var = local.xtmp-lengthdir_x(1,dir_var*90);
                            y_prev_var = local.ytmp-lengthdir_y(1,dir_var*90);
                            x = local.xtmp;
                            y = local.ytmp;
                        // Delay
                            if local.move == 1
                            {
                                move_var = true;
                                set_alarm_scr(0,move_alarm_var);
                            }
                    }
                }
                else
                {
                    if target_rand_var { local.bestturn = irandom(local.turn-1); }
                    dir_var = local.turn_arr[local.bestturn,0];
                    // Move
                        x_prev_var = local.turn_arr[local.bestturn,1]-lengthdir_x(1,dir_var*90);
                        y_prev_var = local.turn_arr[local.bestturn,2]-lengthdir_y(1,dir_var*90);
                        x = local.turn_arr[local.bestturn,1];
                        y = local.turn_arr[local.bestturn,2];
                    // Delay
                        if local.move == 1
                        {
                            move_var = true;
                            set_alarm_scr(0,move_alarm_var);
                        }
                }
            }
        }
    }
    // Sound
    local.bestpac = noone; local.bestdist = 0;
    with pac_obj
    {
        if on_var && !dead_var
        {
            local.dist = point_distance(x,y,other.x,other.y);
            if local.bestpac == noone || local.dist < local.bestdist
            {
                local.bestpac = id;
                local.bestdist = local.dist;
            }
        }
    }
    if local.bestpac != noone
    { fmod_inst_set_vol_scr(inst_var,anti_lerp_scr(snd_dist_max_var,snd_dist_min_var,local.bestdist)); }
    else { fmod_inst_set_vol_scr(inst_var,0); }
');
// Target event
object_event_add
(argument0,ev_other,ev_user0,'
    target_var = noone;
    target_rand_var = false;
    local.index = id_var*2;
    switch state_var
    {
        case 5: // Eaten
        {
            target_x_var = par_var.map_ghost_var[par_var.map_var,local.index];
            target_y_var = par_var.map_ghost_var[par_var.map_var,local.index+1];
            if x != target_x_var || y != target_y_var { break; }
            state_var = 3;
        }
        case 3: // Leave House
        {
            target_x_var = par_var.map_exit_var[par_var.map_var,0];
            target_y_var = par_var.map_exit_var[par_var.map_var,1];
            if x != target_x_var || y != target_y_var { break; }
            state_var = par_var.state_var;
        }
        case 1: // Scatter
        { event_user(2); break; }
        case 2: // Chase
        { event_user(1); break; }
        case 0: // Start (Forgot what this does)
        case 4: // Scared
        { target_rand_var = true; break; }
    }
');
// Chase target event
object_event_add
(argument0,ev_other,ev_user1,'
    target_var = noone; target_dist_var = 0;
    with pac_obj
    {
        if on_var && !dead_var
        {
            local.dist = point_distance(x,y,other.x,other.y);
            if other.target_var == noone || local.dist < other.target_dist_var
            {
                other.target_var = id;
                other.target_dist_var = local.dist;
            }
        }
    }
    if target_var != noone
    {
        target_x_var = target_var.x;
        target_y_var = target_var.y;
    }
    else { target_rand_var = true; }
');
// Scatter target event
object_event_add
(argument0,ev_other,ev_user2,'
    local.index = id_var*2;
    target_x_var = par_var.map_scatter_var[par_var.map_var,local.index];
    target_y_var = par_var.map_scatter_var[par_var.map_var,local.index+1];
');