/*
Argument 0: Seen Yaw
Argument 1: Seen Pitch
Argument 2: Seen Distance
Argument 3: Seer Yaw
Argument 4: Seer Pitch
Argument 5-7: Seer Position (Eye height needs to be included)
Argument 8: Type
    0: Square
    1: Radial
Argument 9: Include distance
Argument 10: Seen Height
    0: Default (coll_var[1])
Argument 11: Seen width
    0: Default (coll_var[2])
Argument 12-14: Seen Position
    0: Default
Returns the seen percentage.
*/
// Collision
if argument10 == 0 { local.height = coll_var[1]/2; }
else { local.height = argument10/2; }
if argument11 == 0 { local.radius = coll_var[2]/2; }
else { local.radius = argument11/2; }
// Position
if argument12 != 0 || argument13 != 0 || argument14 != 0
{
    local.xtmp = argument12;
    local.ytmp = argument13;
    local.ztmp = argument14+local.height;
}
else
{
    local.xtmp = x;
    local.ytmp = y;
    local.ztmp = z+local.height;
}
local.dist = point_distance_3d_scr(argument5,argument6,argument7,local.xtmp,local.ytmp,local.ztmp);
// Calculate seen
if argument0 > 0
{
    local.yaw = abs(deg_diff_scr(point_direction(argument5,argument6,local.xtmp,local.ytmp),argument3));
    local.angle = radtodeg(arctan2(local.radius,local.dist));
    local.yawper = (local.yaw-local.angle)/argument0; // Should be less than 1 if local.yaw+local.angle < argument0
}
else { local.yawper = 0; }
if argument1 > 0
{
    local.pitch = abs(deg_diff_scr(point_direction_3d_scr(argument5,argument6,argument7,local.xtmp,local.ytmp,local.ztmp),argument4));
    local.angle = radtodeg(arctan2(local.height,local.dist));
    local.pitchper = (local.pitch-local.angle)/argument1;
}
else { local.pitchper = 0; }
if argument2 > 0
{
    if argument9 { local.distper = local.dist/argument2; }
    else
    {
        if local.dist > argument2 { local.distper = 1; }
        else { local.distper = 0; }
    }
}
else { local.distper = 0; }
// Return
if argument8 { local.per = sqrt(sqr(local.yawper)+sqr(local.pitchper)+sqr(local.distper)); }
else { local.per = max(local.pitchper,local.yawper,local.distper); }
return median(0,1,1-local.per);
