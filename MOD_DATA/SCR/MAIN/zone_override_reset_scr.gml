/*
Argument 0: Zone
Argument 1: Rare Zone
Sets zone override.
*/
if argument0 > 0
{
    local.size = ds_list_size(argument0);
    for (local.i=0; local.i<local.size; local.i+=1;)
    { list_remove_value_scr(zone_override_list,ds_list_find_value(argument0,local.i),false); }
}
if argument1 > 0
{
    local.size = ds_list_size(argument1);
    for (local.i=0; local.i<local.size; local.i+=1;)
    { list_remove_value_scr(rare_zone_override_list,ds_list_find_value(argument1,local.i),false); }
}
if ds_list_size(zone_override_list) > 0
{
    ds_list_clear(rm_list);
    ds_list_copy(rm_list,zone_override_list);
    ds_list_shuffle(rm_list);
    with door_trig_obj
    {
        if zone_var >= 0 && zone_var != zone_override_list
        {
            zone_var = zone_override_list;
            event_user(0);
        }
    }
}
else { zone_reset_scr(); }