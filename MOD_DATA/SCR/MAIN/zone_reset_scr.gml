/*
Resets the room list, mostly used for specimens like White Face, Flesh, and Mermaid
*/
ds_list_clear(zone_override_list);
ds_list_clear(rare_zone_override_list);
ds_list_clear(rm_list);
ds_list_copy(rm_list,zone_list);
ds_list_shuffle(rm_list);
with door_trig_obj
{
    if zone_var >= 0 && zone_var != zone_list
    {
        zone_var = zone_list;
        event_user(0);
    }
}