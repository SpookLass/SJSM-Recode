/*
Argument 0: Monster to spawn
Argument 1: X
Argument 2: Y
Argument 3: Z
Argument 4: Force position
    2: No delay
Returns monster
*/
local.mon = noone;
fmod_update_take_over_when_lock_scr();
with instance_create(argument1,argument2,argument0)
{
    local.mon = id;
    ds_list_add(mon_curr_list,id);
    switch argument4
    {
        case 2:
        {
            event_perform(ev_alarm,0);
            set_alarm_scr(0,-1);
            enter_var = false;
            if type_var > 0 { do_coll_var = mon_solid_const; }
        }
        case 1:
        {
            x = argument1;
            y = argument2;
            z = argument3;
            break;
        }
    }
}
if instance_exists(local.mon)
{
    global.count_var = get_count_scr();
    global.mon_fail_var = 0;
    if global.reset_spd_var > 0 && global.game_spd_var > 1
    { global.game_spd_var = 1; fmod_group_set_pitch_scr(0,global.game_spd_var); }
    global.last_time_var = current_time;
    io_handle();
}
fmod_update_take_over_done_scr();
return local.mon;