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
    local.entrance = instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),local.entranceobj);
    local.entrance.z = global.spawn_arr[0,2];
    local.entrance.direction = global.spawn_arr[0,3];
    global.spawn_arr[0,5] = local.entrance;
}
else { global.spawn_arr[0,5] = noone; }
// Exit
global.unlock_var = -1;
if argument1 { global.unlock_var = irandom_range(1,global.spawn_len_var-1); }
local.spawns = max(global.spawn_len_var,global.spawn_len_extra_var);
for (local.i=1; local.i<local.spawns; local.i+=1;)
{
    local.exitdoor = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),local.exitobj);
    local.exitdoor.z = global.spawn_arr[local.i,2];
    local.exitdoor.direction = global.spawn_arr[local.i,3];
    local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),local.trigobj);
    local.exittrig.z = global.spawn_arr[local.i,2];
    if argument1 && local.i != global.unlock_var && local.i < global.spawn_len_var
    { local.exittrig.lock_var = true; }
    global.spawn_arr[local.i,4] = local.exittrig;
    global.spawn_arr[local.i,5] = local.exitdoor;
}