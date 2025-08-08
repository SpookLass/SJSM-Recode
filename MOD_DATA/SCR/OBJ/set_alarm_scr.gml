/*
Argument 0: Alarm to set
Argument 1: Frames to set
*/
if argument0 < alarm_len_var
{
    alarm_arr[argument0,0] = argument1;
    alarm_arr[argument0,1] = argument1;
}
else { show_error("Alarm "+string(argument0)+" is higher than the object's array length, "+string(alarm_len_var)+"!",false); }