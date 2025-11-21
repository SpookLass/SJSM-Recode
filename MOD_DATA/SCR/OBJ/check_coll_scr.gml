/*
Argument 0: Collision precision
    0: Default (global.coll_prec_var)
    -1: Off
    1: On
Argument 1: Collision
    0: Default (coll_var[0])
Argument 2: Collision height
    0: Default (coll_var[1])
Argument 3: Collision width
    0: Default (coll_var[2])
Argument 4-6: Position
    0: Default
*/
if x_spd_var != 0 || y_spd_var != 0 || z_spd_var != 0
{
    if argument0 == 0 { local.coll_prec = global.coll_prec_var; }
    else { local.coll_prec = argument0; }
}
else { local.coll_prec = false; }
// Collision
if argument1 == 0 { local.coll = coll_var[0]; }
else { local.coll = argument1; }
if argument2 == 0 { local.coll_height = coll_var[1]; }
else { local.coll_height = argument2; }
if argument3 == 0 { local.coll_width = coll_var[2]; }
else { local.coll_width = argument3; }
// Position
if argument4 != 0 || argument5 != 0 || argument6 != 0
{
    local.xtmp = argument4;
    local.ytmp = argument5;
    local.ztmp = argument6;
}
else
{
    local.xtmp = x;
    local.ytmp = y;
    local.ztmp = z;
}
// Always check split
if local.coll_prec
{
    local.dist = p3dc_ray_still_scr(global.room_coll,local.xtmp,local.ytmp,local.ztmp+(local.coll_height/2),x_spd_var,y_spd_var,z_spd_var);
    local.ray_coll = local.dist < local.radius+(spd_var*2) || local.dist >= 10000000;
}
if p3dc_check_split_scr(local.coll,local.xtmp,local.ytmp,local.ztmp+0.01) || local.ray_coll { return true; }
// Check float if it exists
if !float_var && !float_temp_var && on_floor_var && global.room_float_coll != -1
{
    if local.coll_prec
    {
        local.dist = p3dc_ray_still_scr(global.room_float_coll,local.xtmp,local.ytmp,local.ztmp+(local.coll_height/2),x_spd_var,y_spd_var,z_spd_var);
        local.ray_coll = local.dist < local.radius+(spd_var*2) || local.dist >= 10000000;
    }
    if p3dc_check_still_scr(local.coll,local.xtmp,local.ytmp,local.ztmp+0.01,global.room_float_coll) || local.ray_coll { return true; }
}
// Check props
with prop_par_obj
{
    // Equivalent to split size
    if solid_var && point_distance_3d_scr(local.xtmp,local.ytmp,local.ztmp,x,y,z) < 36+other.spd_var && coll_var[0] > 0
    {
        local.coll_arr[local.coll_arr_len,0] = coll_var[0];
        local.coll_arr[local.coll_arr_len,1] = x;
        local.coll_arr[local.coll_arr_len,2] = y;
        local.coll_arr[local.coll_arr_len,3] = z;
        local.coll_arr[local.coll_arr_len,4] = degtorad(direction)
        local.coll_arr_len += 1;
    }
}
// Loop
for (local.c=0; local.c<local.coll_arr_len; local.c+=1;)
{
    // Check rotated prop collision
    if local.coll_arr[local.c,4] != 0
    {
        // Seems to set variables for use in next function? So weird.
        p3dc_set_modrot_scr(0,0,local.coll_arr[local.c,4]);
        if local.coll_prec
        {
            // I kid you not, THE EXAMPLE CODE IS OUTDATED
            local.dist = 
            p3dc_ray_rot_scr
            (
                local.coll_arr[local.c,0],
                local.coll_arr[local.c,1],
                local.coll_arr[local.c,2],
                local.coll_arr[local.c,3],
                local.xtmp,local.ytmp,local.ztmp+(local.coll_height/2),
                x_spd_var,y_spd_var,z_spd_var,
                0,0,local.coll_arr[local.c,4]
            );
            local.ray_coll = local.dist < local.radius+(spd_var*2) || local.dist >= 10000000;
        }
        // If collided, slide
        if local.ray_coll || p3dc_check_rot_scr
        (
            local.coll,local.xtmp,local.ytmp,local.ztmp+0.01,
            local.coll_arr[local.c,0],local.coll_arr[local.c,1],local.coll_arr[local.c,2],local.coll_arr[local.c,3],
            0,0,0,0,0,local.coll_arr[local.c,4]
        )
        { return true; }
    }
    // Check static prop collision
    else
    {
        if local.coll_prec
        {
            local.dist =
            p3dc_ray_scr
            (
                local.coll_arr[local.c,0],
                local.coll_arr[local.c,1],
                local.coll_arr[local.c,2],
                local.coll_arr[local.c,3],
                local.xtmp,local.ytmp,local.ztmp+(local.coll_height/2),
                x_spd_var,y_spd_var,z_spd_var
            );
            local.ray_coll = local.dist < local.radius+(spd_var*2) || local.dist >= 10000000;
        }
        // If collided, slide
        if local.ray_coll || p3dc_check_scr
        (
            local.coll,local.xtmp,local.ytmp,local.ztmp+0.01,
            local.coll_arr[local.c,0],local.coll_arr[local.c,1],local.coll_arr[local.c,2],local.coll_arr[local.c,3]
        )
        { return true; }
    }
}
return false;