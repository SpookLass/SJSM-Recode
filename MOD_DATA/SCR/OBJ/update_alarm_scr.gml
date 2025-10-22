/*
Argument 0: Delta Time
Set delta time to 1 if you aren't using it.
*/
if alarm_len_var
{
    for (local.i=0; local.i<alarm_len_var; local.i+=1;)
    {
        if alarm_arr[local.i,0] > 0
        {
            alarm_arr[local.i,0] -= argument0;
            if alarm_arr[local.i,0] <= 0
            {
                alarm_arr[local.i,0] = -1;
                alarm_arr[local.i,1] = -1;
                event_perform(ev_alarm,local.i);
            }
        }
    }
}