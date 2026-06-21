/*
Argument 0: Sound
Argument 1: Mode
*/
if argument1 < 0 
{
    for (local.i=0; local.i<global.mode_len_var; local.i+=1;)
    {
        local.len = js_snd_len_arr[local.i];
        js_snd_arr[local.i,local.len] = argument0;
        js_snd_len_arr[local.i] += 1;
    }
}
else
{
    local.len = js_snd_len_arr[argument1];
    js_snd_arr[argument1,local.len] = argument0;
    js_snd_len_arr[argument1] += 1;
}