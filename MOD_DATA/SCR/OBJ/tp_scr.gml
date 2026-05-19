/*
Argument 0: Minimum Distance
Argument 1: Maximum Distance
Argument 2: 3D
Argument 3: Sight Based
Argument 4: Offset (Minimum becomes offset)
*/
// Find center of players
local.xtmp = 0; local.ytmp = 0; local.ztmp = 0; local.yaw = 0; local.pitch = 0;
for (local.i=0; local.i<global.player_len_var; local.i+=1;)
{
    local.xtmp += global.player_arr[local.i].x;
    local.ytmp += global.player_arr[local.i].y;
    local.ztmp += global.player_arr[local.i].z;
    if argument3 || argument4
    {
        local.yaw += global.player_arr[local.i].yaw_var;
        if argument2 { local.pitch += global.player_arr[local.i].pitch_var; }
    }
}
local.xtmp /= global.player_len_var; 
local.ytmp /= global.player_len_var; 
local.ztmp /= global.player_len_var;
if argument3 || argument4
{
    local.yaw /= global.player_len_var;
    if argument2 { local.pitch /= global.player_len_var; }
}
// Find radius
local.bestdist = -1;
for (local.i=0; local.i<global.player_len_var; local.i+=1;)
{
    if argument2
    {
        local.dist = point_distance_3d_scr
        (
            global.player_arr[local.i].x,global.player_arr[local.i].y,global.player_arr[local.i].z,
            local.xtmp,local.ytmp,local.ztmp
        );
    }
    else { local.dist = point_distance(global.player_arr[local.i].x,global.player_arr[local.i].y,local.xtmp,local.ytmp); }
    if local.dist > local.bestdist || local.bestdist == -1 { local.bestdist = local.dist; }
    if argument3
    {
        local.yawdiff = abs(deg_diff_scr(yaw_var,local.yaw));
        if local.yawdiff > local.bestyaw || local.bestyaw == -1 { local.bestyaw = local.yawdiff; }
        if argument2
        {
            local.pitchdiff = abs(deg_diff_scr(pitch_var,local.pitch));
            if local.pitchdiff > local.bestpitch || local.bestpitch == -1 { local.bestpitch = local.pitchdiff; }
        }
    }
    
}
// Teleport
if !argument4
{
    local.randdist = local.bestdist+random_range(argument0,argument1);
    if argument3 { local.randyaw = random_range(local.yaw+local.bestyaw+seen_yaw_var,local.yaw+360-local.bestyaw-seen_yaw_var); }
    else { local.randyaw = random(360); }
    if argument2
    {
        if argument3 { local.randpitch = random_range(local.pitch+local.bestpitch+seen_pitch_var,local.pitch+360-local.bestpitch-seen_pitch_var); }
        else { local.randpitch = random_range(-90,90); }
        x = local.xtmp+lengthdir_x(lengthdir_x(local.randdist,local.randyaw),local.randpitch);
        y = local.ytmp+lengthdir_x(lengthdir_y(local.randdist,local.randyaw),local.randpitch);
        z = local.ztmp-lengthdir_y(local.randdist,local.randpitch);
    }
    else
    {
        x = local.xtmp+lengthdir_x(local.randdist,local.randyaw);
        y = local.ytmp+lengthdir_y(local.randdist,local.randyaw);
    }
}
// Teleport (Offset)
else
{
    local.dist = local.bestdist+argument0;
    local.randdist = random(argument1);
    local.randyaw = random(360);
    if argument2
    {
        local.pitch = random_range(-90,90);
        x = local.xtmp+lengthdir_x(lengthdir_x(local.randdist,local.randyaw),local.randpitch)+lengthdir_x(lengthdir_x(local.dist,local.yaw),local.pitch);
        y = local.ytmp+lengthdir_x(lengthdir_y(local.randdist,local.randyaw),local.randpitch)+lengthdir_x(lengthdir_y(local.dist,local.yaw),local.pitch);
        z = local.ztmp-lengthdir_y(local.randdist,local.randpitch)-lengthdir_y(local.dist,local.pitch);
    }
    else
    {
        x = local.xtmp+lengthdir_x(local.randdist,local.randyaw)+lengthdir_x(local.dist,local.yaw);
        y = local.ytmp+lengthdir_y(local.randdist,local.randyaw)+lengthdir_y(local.dist,local.yaw);
    }
}