/*
Argument 0: Delta Time
Set delta time to 1 if you aren't using it.
*/
did_coll_var = false;
local.stop = false;
// Movement add
local.xspd = x_spd_var*argument0;
local.yspd = y_spd_var*argument0;
local.zspd = z_spd_var*argument0;
// If moving or gravity, check stuff to collide with
if local.xspd != 0 || local.yspd != 0 || local.zspd != 0 || (grav_var > 0 && do_coll_var)
{
    // Always check split
    local.coll_arr[0,0] = -1;
    local.coll_arr[0,1] = 0;
    local.coll_arr[0,2] = 0;
    local.coll_arr[0,3] = 0;
    local.coll_arr[0,4] = 0;
    local.coll_arr_len = 1;
    // Check float if it exists
    if !fall_var && on_floor_var && global.room_float_coll != -1
    {
        local.coll_arr[local.coll_arr_len,0] = -2;
        local.coll_arr[local.coll_arr_len,1] = 0;
        local.coll_arr[local.coll_arr_len,2] = 0;
        local.coll_arr[local.coll_arr_len,3] = 0;
        local.coll_arr[local.coll_arr_len,4] = 0;
        local.coll_arr_len += 1;
    }
    // Props, needed here since rotation lol
    local.collmax = max(coll_var[1],coll_var[2]);
    with prop_par_obj
    {
        // Equivalent to split size
        if solid_var
        {
            if box_coll_scr
            (
                other.x,other.y,other.z,
                other.coll_var[2]+4+abs(local.xspd*2),
                other.coll_var[2]+4+abs(local.yspd*2),
                other.coll_var[1]+4+abs(local.zspd*2),
                x,y,z,coll_var[2],coll_var[3],coll_var[1]
            )
            {
                local.coll_arr[local.coll_arr_len,0] = coll_var[0];
                local.coll_arr[local.coll_arr_len,1] = x;
                local.coll_arr[local.coll_arr_len,2] = y;
                local.coll_arr[local.coll_arr_len,3] = z;
                local.coll_arr[local.coll_arr_len,4] = degtorad(direction)
                local.coll_arr_len += 1;
            }
        }
    }
}
if do_coll_var && grav_var > 0
{
    // Do a pseudo circle cast
    local.zdist = 10000000;
    local.zdist_max = 0;
    local.radius = coll_var[2]/2;
    floor_mask_var = mask_none_const;
    for (local.c=0; local.c<local.coll_arr_len; local.c+=1;)
    {
        for (local.i=0; local.i<5; local.i+=1;)
        {
            local.xtmp = x;
            local.ytmp = y;
            if local.i != 0
            {
                local.xtmp += lengthdir_x(local.radius,local.i*90);
                local.ytmp += lengthdir_y(local.radius,local.i*90);
            }
            if local.coll_arr[local.c,0] == -1
            { local.zdist_new = p3dc_ray_still_scr(global.room_coll,local.xtmp,local.ytmp,z+coll_var[1],0,0,-1); } // p3dc_ray_split_scr
            // Don't check float walls
            else if local.coll_arr[local.c,0] != -2
            {
                if local.coll_arr[local.c,4] != 0
                {
                    // Seems to set variables for use in next function? So weird.
                    p3dc_set_modrot_scr(0,0,local.coll_arr[local.c,4]);
                    // I kid you not, THE EXAMPLE CODE IS OUTDATED
                    local.zdist_new = 
                    p3dc_ray_rot_scr
                    (
                        local.coll_arr[local.c,0],
                        local.coll_arr[local.c,1],
                        local.coll_arr[local.c,2],
                        local.coll_arr[local.c,3],
                        local.xtmp,local.ytmp,
                        z+coll_var[1],
                        0,0,-1,0,0,local.coll_arr[local.c,4]
                    );
                }
                else
                {
                    local.zdist_new = 
                    p3dc_ray_scr
                    (
                        local.coll_arr[local.c,0],
                        local.coll_arr[local.c,1],
                        local.coll_arr[local.c,2],
                        local.coll_arr[local.c,3],
                        local.xtmp,local.ytmp,
                        z+coll_var[1],
                        0,0,-1
                    );
                }
            }
            if local.zdist_new < local.zdist { floor_mask_var = p3dc_get_lastmask_scr(); }
            local.zdist = min(local.zdist,local.zdist_new);
            local.zdist_max = max(local.zdist_max,local.zdist_new)
        }
    }
    local.zdist -= coll_var[1];
    // Add gravity
    z_spd_var -= grav_var*argument0;
    local.zspd = z_spd_var*argument0;
    // If the floor distance is shorter than gravity, snap to floor
    if -local.zdist >= local.zspd
    {
        z_spd_var = 0;
        local.zspd = -local.zdist;
        on_floor_var = true;
        if !fall_temp_var
        {
            floor_x_var = x;
            floor_y_var = y;
            floor_z_var = z;
        }
    }
    else { on_floor_var = false; }
}
// If moving, check stuff
if local.xspd != 0 || local.yspd != 0 || local.zspd != 0
{
    xprevious = x;
    yprevious = y;
    zprevious = z;
    // If the object has collisions, check
    if do_coll_var
    {
        // Move and slide
        local.xdir = sign(local.xspd);
        local.ydir = sign(local.yspd);
        local.zdir = sign(local.zspd);
        local.xspd2 = local.xspd;
        local.yspd2 = local.yspd;
        local.zspd2 = local.zspd;
        local.radius = 1+(coll_var[2]/2);
        // Loop through collisions
        for (local.c=0; local.c<local.coll_arr_len; local.c+=1;)
        {
            local.ray_coll = false;
            // Check Split / Room collision
            if local.coll_arr[local.c,0] == -1
            {
                if global.coll_prec_var
                {
                    local.dist = p3dc_ray_still_scr(global.room_coll,x,y,z+(coll_var[1]/2),local.xspd,local.yspd,local.zspd);
                    local.ray_coll = local.dist < local.radius+(spd_var*2) || local.dist >= 10000000;
                }
                // If collided, slide
                if p3dc_check_split_scr(coll_var[0],x+local.xspd,y+local.yspd,z+local.zspd+0.01) || local.ray_coll
                {
                    did_coll_var = true;
                    // X Speed
                    if local.xspd != 0
                    {
                        if !p3dc_check_split_scr(coll_var[0],x+local.xspd,y,z+0.01)
                        {
                            if global.coll_prec_var
                            {
                                local.xdist = p3dc_ray_still_scr(global.room_coll,x,y,z+(coll_var[1]/2),local.xdir,0,0);
                                if local.xdist < 10000000
                                { local.xspd = local.xdir*min(abs(local.xspd),abs(local.xdist-local.radius)); }
                            }
                        }
                        else { local.xspd = 0; }
                    }
                    // Y Speed
                    if local.yspd != 0
                    {
                        if !p3dc_check_split_scr(coll_var[0],x,y+local.yspd,z+0.01)
                        {
                            if global.coll_prec_var
                            {
                                local.ydist = p3dc_ray_still_scr(global.room_coll,x,y,z+(coll_var[1]/2),0,local.ydir,0);
                                if local.ydist < 10000000
                                { local.yspd = local.ydir*min(abs(local.yspd),abs(local.ydist-local.radius)); }
                            }
                        }
                        else { local.yspd = 0; }
                    }
                    // Z Speed
                    if local.zspd != 0
                    {
                        if !p3dc_check_split_scr(coll_var[0],x,y,z+local.zspd+0.01)
                        {
                            if global.coll_prec_var
                            {
                                local.zdist = p3dc_ray_still_scr(global.room_coll,x,y,z+(coll_var[1]/2),0,0,local.zdir); // p3dc_ray_split_scr
                                if local.zdist < 10000000
                                { local.zspd = local.zdir*min(abs(local.zspd),abs(local.zdist-(coll_var[1]/2))); }
                            }
                        }
                        else { local.zspd = 0; }
                    }
                }
            }
            // Check float
            else if local.coll_arr[local.c,0] == -2
            {
                if global.coll_prec_var
                {
                    local.dist = p3dc_ray_still_scr(global.room_float_coll,x,y,z+(coll_var[1]/2),local.xspd,local.yspd,local.zspd);
                    local.ray_coll = local.dist < local.radius+(spd_var*2) || local.dist >= 10000000;
                }
                // If not collided, turn off float temp
                if !p3dc_check_still_scr(coll_var[0],x+local.xspd,y+local.yspd,z+local.zspd+0.01,global.room_float_coll) && !local.ray_coll
                { fall_temp_var = false; }
                // If collided and not inside, slide
                else if !fall_temp_var
                {
                    did_coll_var = true;
                    // X Speed
                    if local.xspd != 0
                    {
                        if !p3dc_check_still_scr(coll_var[0],x+local.xspd,y,z+0.01,global.room_float_coll)
                        {
                            if global.coll_prec_var
                            {
                                local.xdist = p3dc_ray_still_scr(global.room_float_coll,x,y,z+(coll_var[1]/2),local.xdir,0,0);
                                if local.xdist < 10000000
                                { local.xspd = local.xdir*min(abs(local.xspd),abs(local.xdist-local.radius)); }
                            }
                        }
                        else { local.xspd = 0; }
                    }
                    // Y Speed
                    if local.yspd != 0
                    {
                        if !p3dc_check_still_scr(coll_var[0],x,y+local.yspd,z+0.01,global.room_float_coll)
                        {
                            if global.coll_prec_var
                            {
                                local.ydist = p3dc_ray_still_scr(global.room_float_coll,x,y,z+(coll_var[1]/2),0,local.ydir,0);
                                if local.ydist < 10000000
                                { local.yspd = local.ydir*min(abs(local.yspd),abs(local.ydist-local.radius)); }
                            }
                        }
                        else { local.yspd = 0; }
                    }
                    // Z Speed
                    if local.zspd != 0
                    {
                        if !p3dc_check_still_scr(coll_var[0],x,y,z+local.zspd+0.01,global.room_float_coll)
                        {
                            if global.coll_prec_var
                            {
                                local.zdist = p3dc_ray_still_scr(global.room_float_coll,x,y,z+(coll_var[1]/2),0,0,local.zdir);
                                if local.zdist < 10000000
                                { local.zspd = local.zdir*min(abs(local.zspd),abs(local.zdist-(coll_var[1]/2))); }
                            }
                        }
                        else { local.zspd = 0; }
                    }
                }
            }
            // Check rotated prop collision
            else if local.coll_arr[local.c,4] != 0
            {
                // Seems to set variables for use in next function? So weird.
                p3dc_set_modrot_scr(0,0,local.coll_arr[local.c,4]);
                if global.coll_prec_var
                {
                    // I kid you not, THE EXAMPLE CODE IS OUTDATED
                    local.dist = 
                    p3dc_ray_rot_scr
                    (
                        local.coll_arr[local.c,0],
                        local.coll_arr[local.c,1],
                        local.coll_arr[local.c,2],
                        local.coll_arr[local.c,3],
                        x,y,z+(coll_var[1]/2),
                        local.xspd,local.yspd,local.zspd,
                        0,0,local.coll_arr[local.c,4]
                    );
                    local.ray_coll = local.dist < local.radius+(spd_var*2) || local.dist >= 10000000;
                }
                // If collided, slide
                if local.ray_coll || p3dc_check_rot_scr
                (
                    coll_var[0],x+local.xspd,y+local.yspd,z+local.zspd+0.01,
                    local.coll_arr[local.c,0],local.coll_arr[local.c,1],local.coll_arr[local.c,2],local.coll_arr[local.c,3],
                    0,0,0,0,0,local.coll_arr[local.c,4]
                )
                {
                    did_coll_var = true;
                    // X Speed
                    if local.xspd != 0
                    {
                        if !p3dc_check_rot_scr
                        (
                            coll_var[0],x+local.xspd,y,z+0.01,
                            local.coll_arr[local.c,0],local.coll_arr[local.c,1],local.coll_arr[local.c,2],local.coll_arr[local.c,3],
                            0,0,0,0,0,local.coll_arr[local.c,4]
                        )
                        {
                            if global.coll_prec_var
                            {
                                local.xdist = p3dc_ray_rot_scr
                                (
                                    local.coll_arr[local.c,0],
                                    local.coll_arr[local.c,1],
                                    local.coll_arr[local.c,2],
                                    local.coll_arr[local.c,3],
                                    x,y,z+(coll_var[1]/2),
                                    local.xdir,0,0,
                                    0,0,local.coll_arr[local.c,4]
                                );
                                if local.xdist < 10000000
                                { local.xspd = local.xdir*min(abs(local.xspd),abs(local.xdist-local.radius)); }
                            }
                        }
                        else { local.xspd = 0; }
                    }
                    // Y Speed
                    if local.yspd != 0
                    {
                        if !p3dc_check_rot_scr
                        (
                            coll_var[0],x,y+local.yspd,z+0.01,
                            local.coll_arr[local.c,0],local.coll_arr[local.c,1],local.coll_arr[local.c,2],local.coll_arr[local.c,3],
                            0,0,0,0,0,local.coll_arr[local.c,4]
                        )
                        {
                            if global.coll_prec_var
                            {
                                local.ydist = p3dc_ray_rot_scr
                                (
                                    local.coll_arr[local.c,0],
                                    local.coll_arr[local.c,1],
                                    local.coll_arr[local.c,2],
                                    local.coll_arr[local.c,3],
                                    x,y,z+(coll_var[1]/2),
                                    0,local.ydir,0,
                                    0,0,local.coll_arr[local.c,4]
                                );
                                if local.ydist < 10000000
                                { local.yspd = local.ydir*min(abs(local.yspd),abs(local.ydist-local.radius)); }
                            }
                        }
                        else { local.yspd = 0; }
                    }
                    // Z Speed
                    if local.zspd != 0
                    {
                        if !p3dc_check_rot_scr
                        (
                            coll_var[0],x,y,z+local.zspd+0.01,
                            local.coll_arr[local.c,0],local.coll_arr[local.c,1],local.coll_arr[local.c,2],local.coll_arr[local.c,3],
                            0,0,0,0,0,local.coll_arr[local.c,4]
                        )
                        {
                            if global.coll_prec_var
                            {
                                local.zdist = p3dc_ray_rot_scr
                                (
                                    local.coll_arr[local.c,0],
                                    local.coll_arr[local.c,1],
                                    local.coll_arr[local.c,2],
                                    local.coll_arr[local.c,3],
                                    x,y,z+(coll_var[1]/2),
                                    0,0,local.zdir,
                                    0,0,local.coll_arr[local.c,4]
                                );
                                if local.zdist < 10000000
                                { local.zspd = local.zdir*min(abs(local.zspd),abs(local.zdist-(coll_var[1]/2))); }
                            }
                        }
                        else { local.zspd = 0; }
                    }
                }
            }
            // Check static prop collision
            else if local.coll_arr[local.c,0] != -2
            {
                if global.coll_prec_var
                {
                    local.dist =
                    p3dc_ray_scr
                    (
                        local.coll_arr[local.c,0],
                        local.coll_arr[local.c,1],
                        local.coll_arr[local.c,2],
                        local.coll_arr[local.c,3],
                        x,y,z+(coll_var[1]/2),
                        local.xspd,local.yspd,local.zspd
                    );
                    local.ray_coll = local.dist < local.radius+(spd_var*2) || local.dist >= 10000000;
                }
                // If collided, slide
                if local.ray_coll || p3dc_check_scr
                (
                    coll_var[0],x+local.xspd,y+local.yspd,z+local.zspd+0.01,
                    local.coll_arr[local.c,0],local.coll_arr[local.c,1],local.coll_arr[local.c,2],local.coll_arr[local.c,3]
                )
                {
                    did_coll_var = true;
                    // X Speed
                    if local.xspd != 0
                    {
                        if !p3dc_check_scr
                        (
                            coll_var[0],x+local.xspd,y,z+0.01,
                            local.coll_arr[local.c,0],local.coll_arr[local.c,1],local.coll_arr[local.c,2],local.coll_arr[local.c,3],
                        )
                        {
                            if global.coll_prec_var
                            {
                                local.xdist = p3dc_ray_scr
                                (
                                    local.coll_arr[local.c,0],
                                    local.coll_arr[local.c,1],
                                    local.coll_arr[local.c,2],
                                    local.coll_arr[local.c,3],
                                    x,y,z+(coll_var[1]/2),
                                    local.xdir,0,0
                                );
                                if local.xdist < 10000000
                                { local.xspd = local.xdir*min(abs(local.xspd),abs(local.xdist-local.radius)); }
                            }
                        }
                        else { local.xspd = 0; }
                    }
                    // Y Speed
                    if local.yspd != 0
                    {
                        if !p3dc_check_scr
                        (
                            coll_var[0],x,y+local.yspd,z+0.01,
                            local.coll_arr[local.c,0],local.coll_arr[local.c,1],local.coll_arr[local.c,2],local.coll_arr[local.c,3],
                        )
                        {
                            if global.coll_prec_var
                            {
                                local.ydist = p3dc_ray_scr
                                (
                                    local.coll_arr[local.c,0],
                                    local.coll_arr[local.c,1],
                                    local.coll_arr[local.c,2],
                                    local.coll_arr[local.c,3],
                                    x,y,z+(coll_var[1]/2),
                                    0,local.ydir,0
                                );
                                if local.ydist < 10000000
                                { local.yspd = local.ydir*min(abs(local.yspd),abs(local.ydist-local.radius)); }
                            }
                        }
                        else { local.yspd = 0; }
                    }
                    // Z Speed
                    if local.zspd != 0
                    {
                        if !p3dc_check_scr
                        (
                            coll_var[0],x,y,z+local.zspd+0.01,
                            local.coll_arr[local.c,0],local.coll_arr[local.c,1],local.coll_arr[local.c,2],local.coll_arr[local.c,3],
                        )
                        {
                            if global.coll_prec_var
                            {
                                local.zdist = p3dc_ray_scr
                                (
                                    local.coll_arr[local.c,0],
                                    local.coll_arr[local.c,1],
                                    local.coll_arr[local.c,2],
                                    local.coll_arr[local.c,3],
                                    x,y,z+(coll_var[1]/2),
                                    0,0,local.zdir
                                );
                                if local.zdist < 10000000
                                { local.zspd = local.zdir*min(abs(local.zspd),abs(local.zdist-(coll_var[1]/2))); }
                            }
                        }
                        else { local.zspd = 0; }
                    }
                }
            }
            // If the object is still moving, continue to check.
            if local.xspd == 0 && local.yspd == 0 && local.zspd == 0
            { local.stop = true; break; }
        }
    }
    did_slide_var = global.coll_prec_var && did_coll_var && !local.stop
    // Add motion
    if !local.stop
    {
        x += local.xspd;
        y += local.yspd;
        z += local.zspd;
    }
}
