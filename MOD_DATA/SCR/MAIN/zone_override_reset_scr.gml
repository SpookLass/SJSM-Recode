/*
Argument 0: Zone
Argument 1: Rare Zone
Sets zone override.
*/
if argument0 > 0 { list_remove_list_scr(zone_override_list,argument0,false); }
if argument1 > 0 { list_remove_list_scr(rare_zone_override_list,argument1,false); }
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