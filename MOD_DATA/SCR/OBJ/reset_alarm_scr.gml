/*
Reset all alarms, assuming they aren't persistent
*/
if alarm_len_var
{
    for (local.i=0; local.i<alarm_len_var; local.i+=1;)
    {
        if !alarm_arr[local.i,2]
        {
            alarm_arr[local.i,0] = -1;
            alarm_arr[local.i,1] = -1;
        }
    }
}