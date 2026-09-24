// Builtin Variables
object_set_depth(argument0,0);
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
    par_var = pac_control_obj;
    spr_var = par_var.pac_spr_var;
    dead_spr_var = par_var.dead_spr_var;
    dead_snd_var = par_var.dead_snd_var;
    nail_spr_var = par_var.nail_spr_var;
    eat_snd_var = par_var.eat_snd_var;
    move_alarm_var = par_var.move_alarm_var;
    dead_alarm_01_var = par_var.dead_alarm_01_var;
    dead_alarm_02_var = par_var.dead_alarm_02_var;
    dead_spr_spd_var = 0.1;
    move_var = false;
    dead_var = false;
    player_id_var = 0;
    spr_id_var = 0;
    dir_var = 0;
    on_var = false;
    x_prev_var = x;
    y_prev_var = y;
    alarm_len_var = 3;
    alarm_ini_scr();
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
        local.leftright = ceil(input_y_scr(player_id_var));
        local.updown = ceil(-input_x_scr(player_id_var));
        for (local.i=0; local.i<local.move; local.i+=1;)
        {
            local.coll = noone;
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
                    if par_var.pellet_var <= 0
                    {
                        with par_var
                        {
                            lvl_var += 1;
                            event_user(0);
                        }
                    }
                    ds_grid_set(par_var.map_grid_var,x,y,0);
                    fmod_snd_play_scr(eat_snd_var);
                    if local.coll == 4 && par_var.scare_alarm_var > 0
                    {
                        with pac_ghost_obj
                        {
                            // Not leaving house or eaten
                            if state_var != 3 && state_var != 5
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
    local.dead = false;
    with pac_ghost_obj
    {
        if (x == other.x && y == other.y)
        || (x == other.x_prev_var && y == other.y_prev_var // You swapped places dummy
        && other.x == x_prev_var && other.y == y_prev_var)
        {
            if state_var == 4
            {
                par_var.score_var += par_var.ghost_score_var;
                state_var = 5;
                dir_var = mod_scr(dir_var+2,4);
                set_alarm_scr(1,-1);
            }
            else if state_var != 5
            {
                local.dead = true;
                with par_var { event_user(1); }
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