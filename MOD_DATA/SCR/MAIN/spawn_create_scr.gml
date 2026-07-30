/*
Argument 0: Has Entrance
Argument 1: Lock
Argument 2: Custom Entrance Door
Argument 3: Custom Exit Door
Argument 4: Custom Trigger
*/
if argument2 > 0 { local.entranceobj = argument2; }
else { local.entranceobj = door_entrance_obj; }
if argument3 > 0 { local.exitobj = argument3; }
else { local.exitobj = door_obj; }
if argument4 > 0 { local.trigobj = argument4; }
else { local.trigobj = door_trig_obj; }
// Entrance
if argument0
{
    with instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),local.entranceobj)
    {
        global.spawn_arr[0,5] = id;
        z = global.spawn_arr[0,2];
        direction = global.spawn_arr[0,3];
        spawn_var = 0;
    }
}
else { global.spawn_arr[0,5] = noone; }
// Exit
global.unlock_var = -1;
if argument1 { global.unlock_var = irandom_range(1,global.spawn_len_var-1); }
local.spawns = max(global.spawn_len_var,global.spawn_len_extra_var);
for (local.i=1; local.i<local.spawns; local.i+=1;)
{
    with instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),local.exitobj)
    {
        global.spawn_arr[local.i,5] = id;
        z = global.spawn_arr[local.i,2];
        direction = global.spawn_arr[local.i,3];
        spawn_var = local.i;
    }
    local.lock = (argument1 && local.i != global.unlock_var && local.i < global.spawn_len_var);
    with instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),local.trigobj)
    {
        global.spawn_arr[local.i,4] = id;
        z = global.spawn_arr[local.i,2];
        spawn_var = local.i;
        lock_var = local.lock;
    }
}