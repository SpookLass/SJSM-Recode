if global.spawn_len_extra_var > global.spawn_len_var
{ local.len = global.spawn_len_extra_var; }
else { local.len = global.spawn_len_var; }
global.unlock_var = -1;
global.spawn_len_var = -1;
global.spawn_len_extra_var = -1;
for (local.i=0; local.i<local.len; local.i+=1;)
{
    global.spawn_arr[local.i,0] = 0;
    global.spawn_arr[local.i,1] = 0;
    global.spawn_arr[local.i,2] = 0;
    global.spawn_arr[local.i,3] = 0;
    global.spawn_arr[local.i,4] = noone;
}