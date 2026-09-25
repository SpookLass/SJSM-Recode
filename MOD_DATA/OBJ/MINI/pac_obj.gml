// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
smart_var
    0 - Completely random
    1 - Actually paths
    2 - Actually paths + smart paths
*/
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    par_var = pac_control_obj;
    spr_var = par_var.pac_spr_var;
    dead_spr_var = par_var.dead_spr_var;
    dead_snd_var = par_var.dead_snd_var;
    nail_spr_var = par_var.nail_spr_var;
    eat_snd_var = par_var.eat_snd_var;
    move_alarm_var = par_var.move_alarm_var;
    dead_alarm_01_var = par_var.dead_alarm_01_var;
    dead_alarm_02_var = par_var.dead_alarm_02_var;
    path_var = par_var.path_var;
    if par_var.classic_var { player_id_var = -1; }
    else { player_id_var = 0; }
    dead_spr_spd_var = 0.1;
    move_var = false;
    dead_var = false;
    spr_id_var = 0;
    dir_var = 0;
    on_var = false;
    x_prev_var = x;
    y_prev_var = y;
    alarm_len_var = 3;
    alarm_ini_scr();
    // CPU
    target_rand_var = true;
    target_x_var = x;
    target_y_var = y;
    target_dist_var = 0;
    target_run_var = false;
    smart_var = false; // true
    smart_point_var = 2;
    smart_180_var = false;
    dist_var = 8;
');
// Move Alarm
object_event_add
(argument0,ev_alarm,0,'
    move_var = false;
    set_alarm_scr(0,move_alarm_var);
');
// Start Alarm
object_event_add
(argument0,ev_alarm,1,'
    on_var = true;
');
// Dead Alarm
object_event_add
(argument0,ev_alarm,2,'
    if dead_var == 1
    {
        fmod_snd_play_scr(claw_snd);
        fmod_snd_play_scr(dead_snd_var);
        dead_var = 2;
        set_alarm_scr(2,par_var.dead_alarm_02_var);
    }
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if dead_var == 2 { spr_id_var = min(spr_id_var+(dead_spr_spd_var*global.delta_time_var),sprite_get_number(dead_spr_var)-1)}
    if !on_var || dead_var { exit; }
    if !move_var
    {
        local.move = 1;
        if global.delta_time_var > move_alarm_var
        { local.move = round(global.delta_time_var/move_alarm_var); }
        if player_id_var >= 0
        {
            local.leftright = ceil(input_y_scr(player_id_var));
            local.updown = ceil(-input_x_scr(player_id_var));
            if local.leftright == 0 && local.updown == 0 { local.move = 0; }
        }
        else { event_user(0); }
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
                            x_prev_var = local.xtmp-local.leftright; // x
                            y_prev_var = y;
                            x = local.xtmp;
                        }
                    }
                // Check top and bottom
                    if local.updown != 0 && (local.coll == noone || local.coll == 1 || local.coll == 2)
                    {
                        local.ytmp = mod_scr(y+local.updown,ds_grid_height(par_var.map_grid_var));
                        local.coll = ds_grid_get(par_var.map_grid_var,x,local.ytmp);
                        if local.coll == 0 || local.coll > 2
                        {
                            dir_var = round(2*arctan2(-local.updown,0)/pi);
                            x_prev_var = x;
                            y_prev_var = local.ytmp-local.updown; // y
                            y = local.ytmp;
                        }
                    }
            }
            else
            {
                // Smart
                local.targetfound = false;
                local.targetdir = noone;
                local.maxturn = 1;
                if smart_var == 2 && !target_rand_var
                {
                    if smart_180_var { local.maxturn = 2; }
                    mp_grid_path(par_var.map_mp_grid_var,path_var,x,y,round(target_x_var),round(target_y_var),false);
                    local.targetdir = round(point_direction
                    (
                        path_get_point_x(path_var,0),
                        path_get_point_y(path_var,0),
                        path_get_point_x(path_var,smart_point_var),
                        path_get_point_y(path_var,smart_point_var)
                    )/90);
                    if target_run_var { local.targetdir += 2; }
                    local.targetdir = mod_scr(local.targetdir,4);
                }
                local.turn = 0; local.bestturn = noone; local.bestdist = 0;
                for (local.j=-1; local.j<=local.maxturn; local.j+=1;)
                {
                    local.dir = mod_scr(dir_var+local.j,4);
                    local.xtmp = mod_scr(x+lengthdir_x(1,local.dir*90),ds_grid_width(par_var.map_grid_var));
                    local.ytmp = mod_scr(y+lengthdir_y(1,local.dir*90),ds_grid_height(par_var.map_grid_var));
                    local.coll = ds_grid_get(par_var.map_grid_var,local.xtmp,local.ytmp);
                    if local.coll == 0 || local.coll > 2
                    {
                        local.dist = point_distance(target_x_var,target_y_var,local.xtmp,local.ytmp);
                        if !target_rand_var && !local.targetfound
                        {
                            local.bool = (local.bestturn == noone);
                            if target_run_var { local.bool = (local.bool || local.dist > local.bestdist); }
                            else { local.bool = (local.bool || local.dist < local.bestdist); }
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
                    if local.coll == 0 || local.coll > 2
                    {
                        // Move
                            x_prev_var = local.xtmp-lengthdir_x(1,dir_var*90);
                            y_prev_var = local.ytmp-lengthdir_y(1,dir_var*90);
                            x = local.xtmp;
                            y = local.ytmp;
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
                        local.coll = local.turn_arr[local.bestturn,4];
                }
            }
            // Delay
                if (local.coll == 0 || local.coll > 2)
                && local.move == 1
                {
                    move_var = true;
                    set_alarm_scr(0,move_alarm_var);
                }
            // Pellets
                if local.coll == 3 || local.coll == 4
                {
                    if local.coll == 4 { par_var.score_var += par_var.power_pellet_score_var; }
                    else { par_var.score_var += par_var.pellet_score_var; }
                    par_var.pellet_var -= 1;
                    fmod_snd_play_scr(eat_snd_var);
                    if par_var.pellet_var <= 0
                    {
                        with par_var
                        {
                            lvl_var += 1;
                            event_user(0);
                            local.dead = -1;
                        }
                    }
                    else
                    {
                        ds_grid_set(par_var.map_grid_var,x,y,0);
                        if local.coll == 4 && par_var.scare_alarm_var > 0
                        {
                            with par_var.pac_ghost_obj_var
                            {
                                // Not leaving house or eaten
                                if state_var != 3 && state_var != 5 && scare_state_var != 2
                                {
                                    if state_var == 4 // Scared
                                    { set_alarm_scr(1,alarm_arr[1,0]+scare_alarm_var); }
                                    else
                                    {
                                        dir_var = mod_scr(dir_var+2,4);
                                        state_var = 4;
                                        set_alarm_scr(1,scare_alarm_var);
                                    }
                                }
                            }
                        }
                    }
            }
        }
    }
    local.dead = false;
    with par_var.pac_ghost_obj_var
    {
        if (x == other.x && y == other.y)
        || (x == other.x_prev_var && y == other.y_prev_var // You swapped places dummy
        && other.x == x_prev_var && other.y == y_prev_var)
        {
            if state_var != 5
            {
                if state_var == 4 || scare_state_var == 1
                {
                    par_var.score_var += par_var.ghost_score_var;
                    state_var = 5;
                    dir_var = mod_scr(dir_var+2,4);
                    set_alarm_scr(1,-1);
                }
                else if local.dead == false
                {
                    local.dead = true;
                    with par_var { event_user(1); }
                    break;
                } 
            }
        }
    }
    if local.dead
    {
        on_var = false;
        move_var = false;
        dead_var = true;
        spr_id_var = 0;
        reset_alarm_scr();
        set_alarm_scr(2,dead_alarm_01_var);
    }
');
// Target event
object_event_add
(argument0,ev_other,ev_user0,'
    target_run_var = false;
    target_rand_var = true;
    if smart_var
    {
        // Find nearest ghost
            local.ghost = noone; local.bestdist = 0;
            with par_var.pac_ghost_obj_var
            {
                if state_var != 0 && state_var != 4 && state_var != 5 && scare_state_var != 1
                {
                    local.dist = point_distance(x,y,other.x,other.y);
                    if local.ghost == noone || local.dist < local.bestdist
                    {
                        local.ghost = id;
                        local.bestdist = local.dist;
                    }
                }
            }
        // Run!
        if local.ghost != noone && local.bestdist < dist_var
        {
            target_rand_var = false;
            target_run_var = true;
            target_x_var = local.ghost.x;
            target_y_var = local.ghost.y;
        }
        else // Find Pellets
        {
            local.bestx = noone;
            local.besty = noone;
            local.bestdist = 0;
            for (local.i=0; local.i<ds_grid_width(par_var.map_grid_var); local.i+=1;)
            {
                for (local.j=0; local.j<ds_grid_width(par_var.map_grid_var); local.j+=1;)
                {
                    local.coll = ds_grid_get(par_var.map_grid_var,local.i,local.j);
                    if local.coll == 3 || local.coll == 4
                    {
                        local.dist = point_distance(local.i,local.j,x,y);
                        if local.bestx == noone || local.dist < local.bestdist
                        {
                            local.bestx = local.i;
                            local.besty = local.j;
                            local.bestdist = local.dist;
                        }
                    }
                }
            }
            if local.bestx != noone
            {
                target_rand_var = false;
                target_x_var = local.bestx;
                target_y_var = local.besty;
                target_dist_var = local.bestdist;
            }
        }
    }
');