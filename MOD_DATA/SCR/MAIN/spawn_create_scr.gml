/*
Argument 0: Has Entrance
Argument 1: Lock
*/
// Entrance
local.entrance = instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),door_entrance_obj);
local.entrance.z = global.spawn_arr[0,2];
local.entrance.direction = global.spawn_arr[0,3]+180;
global.spawn_arr[local.i,5] = local.entrance;
// Exit
if argument1 { local.unlock = irandom_range(1,global.spawn_len_var-1); }
for (local.i=1; local.i<global.spawn_len_var; local.i+=1;)
{
    local.exitdoor = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),door_obj);
    local.exitdoor.z = global.spawn_arr[local.i,2];
    local.exitdoor.direction = global.spawn_arr[local.i,3]+180;
    local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),door_trig_obj);
    local.exittrig.z = global.spawn_arr[local.i,2];
    if argument1 && local.i != local.unlock { local.exittrig.lock_var = true; }
    global.spawn_arr[local.i,4] = local.exittrig;
    global.spawn_arr[local.i,5] = local.exitdoor;
}
if argument1 { return local.unlock; }
else { return -1; }