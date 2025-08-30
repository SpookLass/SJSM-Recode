/*
Argument 0: Object type
Argument 1: X
Argument 2: Y
Argument 3: Z
*/
local.bestinst = noone;
local.bestdist = 0;
with (argument0)
{
    local.dist = point_distance_3d_scr(argument1,argument2,argument3,x,y,z);
    if local.bestinst == noone || local.dist < local.bestdist
    {
        local.bestinst = id;
        local.bestdist = local.dist;
    }
}
return local.bestinst;