/*
Argument 0: Type
    0: Background
    1: Sprite
Argument 1: Front
Argument 2: Back
Argument 3: Mode
Argument 4: Special Sound
*/
if argument3 < 0 
{
    for (local.i=0; local.i<global.mode_len_var; local.i+=1;)
    {
        local.len = js_len_arr[local.i];
        js_type_arr[local.i,local.len] = argument0;
        js_front_arr[local.i,local.len] = argument1;
        if argument0 == 0
        { js_back_arr[local.i,local.len] = argument2; }
        if is_string(argument4) { js_sp_snd_arr[local.i,local.len] = argument4; }
        else { js_sp_snd_arr[local.i,local.len] = ""; }
        js_len_arr[local.i] += 1;
    }
}
else
{
    local.len = js_len_arr[argument3];
    js_type_arr[argument3,local.len] = argument0;
    js_front_arr[argument3,local.len] = argument1;
    if argument0 == 0
    { js_back_arr[argument3,local.len] = argument2; }
    if is_string(argument4) { js_sp_snd_arr[argument3,local.len] = argument4; }
    else { js_sp_snd_arr[argument3,local.len] = ""; }
    js_len_arr[argument3] += 1;
}