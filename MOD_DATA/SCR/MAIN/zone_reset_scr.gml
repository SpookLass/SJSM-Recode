/*
Resets the room list, mostly used for specimens like White Face, Flesh, and Mermaid
*/
ds_list_clear(global.rm_list_var);
ds_list_copy(global.rm_list_var,global.zone_var);
ds_list_shuffle(global.rm_list_var);
with door_trig_obj
{
    if zone_var >= 0
    {
        zone_var = global.zone_var;
        event_user(0);
    }
}