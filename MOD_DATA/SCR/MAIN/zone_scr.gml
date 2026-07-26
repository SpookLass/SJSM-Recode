/*
Argument 0: Key (-2 to 4 by default)
Argument 1: Behavior
Argument 2: Mode
Argument 3: Zone
Argument 4: Go to room
Loads a zone based on the behavior, mode, key, and zone number.
Setting key to -3 or any other argument to -1 results in default.
*/
if argument0 >= -2
{ global.zone_key_var = argument0 }
else
{
    if argument1 < global.type_len_var && argument1 >= 0
    { local.type = argument1; }
    else { local.type = global.main_type_var; }
    if argument2 < global.mode_len_var && argument2 >= 0
    { local.mode = argument2; }
    else { local.mode = global.mode_var; }
    global.zone_key_var = zone_key_arr[local.type,local.mode];
}
switch global.zone_key_var
{
    case -2:
    {
        rand_zone_scr();
        local.newzone = rand_zone_list;
        rare_zone_list = rand_rare_zone_list;
        break;
    }
    case -1:
    {
        local.newzone = every_zone_list;
        rare_zone_list = every_rare_zone_list;
        break;
    }
    default:
    {
        if argument3 < zone_len_arr[global.zone_key_var] && argument3 >= 0
        { global.zone_var = argument3; }
        else if global.zone_rand_var { global.zone_var = irandom(zone_len_arr[global.zone_key_var]-1); }
        else { global.zone_var = mod_scr(ele_prog_scr(global.rm_count_var),zone_len_arr[global.zone_key_var]); }
        local.newzone = zone_arr[global.zone_key_var,global.zone_var];
        rare_zone_list = rare_zone_arr[global.zone_key_var,global.zone_var];
        break;
    }
}
if local.newzone != zone_list
{
    zone_list = local.newzone;
    zone_reset_scr();
}
if argument4
{
    local.rm = ds_list_find_value(rm_list,0);
    ds_list_delete(rm_list,0);
    rm_goto_scr(local.rm);
}
