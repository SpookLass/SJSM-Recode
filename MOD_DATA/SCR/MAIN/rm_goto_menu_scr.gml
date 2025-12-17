/*
Argument 0: Room
Argument 1: Reset All
*/
if room_exists(argument0) && argument0 != 0
{
    if argument1
    {
        // Remove persistent objects
        with all
        {
            if persistent && object_index != pause_menu_obj && object_index != control_obj
            { instance_destroy(); }
        }
        // Stop sounds
        fmod_all_stop_scr();
        // Reset players
        for (local.i=0; local.i<global.player_len_var; local.i+=1;)
        { global.player_arr[local.i] = noone; }
        global.player_len_var = 1;
    }
    if global.res_override_var
    {
        local.res_w = global.res_override_w_var;
        local.res_h = global.res_override_h_var;
    }
    else
    {
        local.res_w = global.res_w_var;
        local.res_h = global.res_h_var;
    }
    room_set_view_enabled(argument0,true);
    for (local.i=0; local.i<8; local.i+=1;)
    { room_set_view(argument0,local.i,false,0,0,0,0,0,0,0,0,32,32,-1,-1,noone); }
    room_set_view(argument0,0,true,0,0,local.res_w,local.res_h,0,0,local.res_w,local.res_h,32,32,-1,-1,noone);
    room_goto(argument0)
    return true;
}
else
{
    show_error("Invalid room",false);
    return -1;
}
