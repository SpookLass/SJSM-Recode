/*
Argument 0: Shuffle entrance

Hehe hoho SJSM+
*/
if argument0 { local.start = 0; } else { local.start = 1; }
for(local.curr_id=global.spawn_len_var-1; local.curr_id>=local.start; local.curr_id-=1;)
{
    local.rand_id = irandom_range(local.start,local.curr_id);
    local.tempx = global.spawn_arr[local.curr_id,0];
    local.tempy = global.spawn_arr[local.curr_id,1];
    local.tempz = global.spawn_arr[local.curr_id,2];
    local.tempdir = global.spawn_arr[local.curr_id,3];
    global.spawn_arr[local.curr_id,0] = global.spawn_arr[local.rand_id,0];
    global.spawn_arr[local.curr_id,1] = global.spawn_arr[local.rand_id,1];
    global.spawn_arr[local.curr_id,2] = global.spawn_arr[local.rand_id,2];
    global.spawn_arr[local.curr_id,3] = global.spawn_arr[local.rand_id,3];
    global.spawn_arr[local.rand_id,0] = local.tempx;
    global.spawn_arr[local.rand_id,1] = local.tempy;
    global.spawn_arr[local.rand_id,2] = local.tempz;
    global.spawn_arr[local.rand_id,3] = local.tempdir;
}