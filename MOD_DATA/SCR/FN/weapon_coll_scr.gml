/*
Argument 0: Ellipsoid X
Argument 1: Ellipsoid Y
Argument 2: Ellipsoid Z
Argument 3: Ellipsoid Width
Argument 4: Ellipsoid Length
Argument 5: Ellipsoid Height
Argument 6: Ellipsoid Yaw
Argument 7: Ellipsoid Pitch
Argument 8: Cylinder X
Argument 9: Cylinder Y
Argument 10: Cylinder Z
Argument 11: Cylinder Width
Argument 12: Cylinder Height
*/
local.ex = argument0;
local.ey = argument1;
local.ez = argument2;
local.ewidth = argument3/2;
local.elength = argument4/2;
local.eheight = argument5/2;
local.eyaw = degtorad(argument6);
local.epitch = degtorad(argument7);
local.cylx = argument8;
local.cyly = argument9;
local.cylz = argument10;
local.cylwidth = argument11/2;
local.cylheight = argument12;

/// Inputs (example variable names)
var ex = ellipsoid_x;
var ey = ellipsoid_y;
var ez = ellipsoid_z;
var rx = ellipsoid_rx;
var ry = ellipsoid_ry;
var rz = ellipsoid_rz;
var yaw_deg = ellipsoid_yaw;   // degrees
var pitch_deg = ellipsoid_pitch;// degrees
var origin_offset = [ox, oy, oz]; // if none, set to [0,0,0]

var cx = cyl_x;
var cy = cyl_y;
var cz = cyl_z;
var r = cyl_radius;
var h = cyl_height;

/// 1) Adjust ellipsoid center for origin offset (if used)
ex += origin_offset[0];
ey += origin_offset[1];
ez += origin_offset[2];

/// 2) Convert angles to radians and compute sin/cos
var yaw = yaw_deg * pi/180;
var pitch = pitch_deg * pi/180;
var cyaw = dcos(yaw), syaw = dsin(yaw);
var cp = dcos(pitch), sp = dsin(pitch);

/// 3) Define a helper to rotate a point from world->ellipsoid-local WITHOUT building full matrices.
/// We apply inverse rotations: rotate by -yaw about Y, then by -pitch about X.
/// Equivalent: apply rotation by +(-yaw) and +(-pitch).

function world_to_ellipsoid_local(wx, wy, wz) {
    // translate
    var tx = wx - ex;
    var ty = wy - ey;
    var tz = wz - ez;

    // rotate by -yaw around Y:
    var sy = dsin(-yaw), cy_ = dcos(-yaw); // or use sy = -syaw, cy_ = cyaw
    // but compute directly for clarity:
    sy = -syaw; cy_ = cyaw;
    var rx1 =  cy_ * tx + sy * tz;
    var ry1 =  ty;
    var rz1 = -sy * tx + cy_ * tz;

    // rotate by -pitch around X:
    var sp_ = dsin(-pitch), cp_ = dcos(-pitch); // sp_ = -sp, cp_ = cp
    sp_ = -sp; cp_ = cp;
    var rx2 = rx1;
    var ry2 =  cp_ * ry1 - sp_ * rz1;
    var rz2 =  sp_ * ry1 + cp_ * rz1;

    return [rx2, ry2, rz2];
}

/// 4) Scale to ellipsoid (so ellipsoid becomes unit sphere)
function world_to_ellipsoid_scaled(wx, wy, wz) {
    var t = world_to_ellipsoid_local(wx, wy, wz);
    return [ t[0] / rx, t[1] / ry, t[2] / rz ];
}

/// 5) Transform cylinder axis endpoints (base and top) into scaled space
var base_scaled  = world_to_ellipsoid_scaled(cx, cy, cz);
var top_scaled   = world_to_ellipsoid_scaled(cx, cy + h, cz);

/// 6) Compute scaled cylinder radius approximation.
/// We transform one radial vector in world space (e.g., along +X by r) into scaled space and take length.
/// This approximates how the cylinder radius projects under the ellipsoid transform.
var radial_world = [cx + r, cy, cz]; // point at +X direction from center
var radial_scaled_point = world_to_ellipsoid_scaled(radial_world[0], radial_world[1], radial_world[2]);

// compute vector from scaled-axis-center to this radial point in scaled space:
var axis_center_scaled = [(base_scaled[0] + top_scaled[0]) * 0.5,
                          (base_scaled[1] + top_scaled[1]) * 0.5,
                          (base_scaled[2] + top_scaled[2]) * 0.5];

var rx_vec = radial_scaled_point[0] - axis_center_scaled[0];
var ry_vec = radial_scaled_point[1] - axis_center_scaled[1];
var rz_vec = radial_scaled_point[2] - axis_center_scaled[2];

var r_scaled = sqrt(rx_vec*rx_vec + ry_vec*ry_vec + rz_vec*rz_vec);

/// 7) Now we have a cylinder axis segment from A=base_scaled to B=top_scaled and radius r_scaled.
/// Compute shortest distance from origin to that segment (point-to-segment distance).
function point_segment_distance_squared(px, py, pz, ax, ay, az, bx, by, bz) {
    // returns squared distance from P to segment AB
    var abx = bx - ax; var aby = by - ay; var abz = bz - az;
    var apx = px - ax; var apy = py - ay; var apz = pz - az;
    var ab_len2 = abx*abx + aby*aby + abz*abz;
    if (ab_len2 == 0) {
        // A==B
        return apx*apx + apy*apy + apz*apz;
    }
    var t = (abx*apx + aby*apy + abz*apz) / ab_len2;
    if (t < 0) t = 0;
    if (t > 1) t = 1;
    var cx_ = ax + t*abx;
    var cy_ = ay + t*aby;
    var cz_ = az + t*abz;
    var dx = px - cx_; var dy = py - cy_; var dz = pz - cz_;
    return dx*dx + dy*dy + dz*dz;
}

var dist2 = point_segment_distance_squared(0,0,0,
                                          base_scaled[0], base_scaled[1], base_scaled[2],
                                          top_scaled[0],  top_scaled[1],  top_scaled[2]);

var dist = sqrt(dist2);

/// 8) Subtract r_scaled to get distance from sphere surface to cylinder surface
var dist_from_sphere_surface = dist - r_scaled;

/// 9) Collision if dist_from_sphere_surface <= 1 (sphere radius = 1)
var collision = (dist_from_sphere_surface <= 1);

/// Optional: if you want a small margin to reduce false negatives:
var margin = 0.01; // tweak as needed
collision = (dist_from_sphere_surface <= 1 + margin);

/// collision is true/false
