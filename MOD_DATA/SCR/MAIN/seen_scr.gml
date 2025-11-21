/*
Argument 0: Seen Yaw
Argument 1: Seen Pitch
Argument 2: Seer Yaw
Argument 3: Seer Pitch
Argument 4-6: Seer Position (Eye height needs to be included)
Argument 7: Type
    0: Square
    1: Radial
Argument 8: Seen Height
    0: Default (coll_var[1])
Argument 9: Seen width
    0: Default (coll_var[2])
Argument 10-12: Seen Position
    0: Default
Returns the seen percentage.
*/
// Collision
if argument8 == 0 { local.height = coll_var[1]/2; }
else { local.height = argument8/2; }
if argument9 { local.radius = coll_var[2]/2; }
else { local.radius = argument9/2; }
// Position
if argument10 != 0 || argument11 != 0 || argument12 != 0
{
    local.xtmp = argument10;
    local.ytmp = argument11;
    local.ztmp = argument12+local.height;
}
else
{
    local.xtmp = x;
    local.ytmp = y;
    local.ztmp = z+local.height;
}
local.dist = point_distance_3d_scr(argument4,argument5,argument6,local.xtmp,local.ytmp,local.ztmp);
// Calculate seen
if argument0 > 0
{
    local.yaw = abs(deg_diff_scr(point_direction(argument4,argument5,local.xtmp,local.ytmp),argument2));
    local.angle = radtodeg(arctan2(local.radius,local.dist));
    local.yawper = (local.yaw+local.angle)/(argument0+local.angle);
}
else { local.yawper = 0; }
if argument1 > 0
{
    local.pitch = abs(deg_diff_scr(point_direction_3d_scr(argument4,argument5,argument6,local.xtmp,local.ytmp,local.ztmp),argument3));
    local.angle = radtodeg(arctan2(local.height,local.dist));
    local.pitchper = (local.pitch+local.angle)/(argument1+local.angle);
}
else { local.pitchper = 0; }
// Return
if argument7 { return median(0,1,1-sqrt(sqr(local.yawper)+sqr(local.pitchper))); }
else { return median(0,1,1-max(local.pitchper,local.yawper)); }