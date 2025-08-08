/*
Argument 0: Delta Time
Set delta time to 1 if you aren't using it.
*/
// Movement add
local.xspd = x_spd_var*argument0;
local.yspd = y_spd_var*argument0;
if grav_var > 0
{
    // Do a pseudo circle cast
    local.zdist = 10000000;
    local.zdist_max = 0;
    for (local.i=0; local.i<4; local.i+=1;)
    {
        local.zdist_new = execute_file(global.p3dc_ray_split_scr,x+lengthdir_x(3,local.i*90),y+lengthdir_y(3,local.i*90),z+coll_var[1],0,0,-1);
        local.zdist = min(local.zdist,local.zdist_new);
        local.zdist_max = max(local.zdist_max,local.zdist_new)
    }
    local.zdist -= coll_var[1];
    // Add gravity
    z_spd_var -= grav_const*argument0;
    local.zspd = z_spd_var*argument0;
    // If the floor distance is shorter than gravity, snap to floor
    if -local.zdist >= local.zspd
    {
        z_spd_var = 0;
        local.zspd = -local.zdist;
        on_floor_var = true;
    }
    else { on_floor_var = false; }
}
else { local.zspd = z_spd_var*argument0; }
// If moving, check stuff
if local.xspd != 0 || local.yspd != 0 || local.zspd != 0
{
    xprevious = x;
    yprevious = y;
    zprevious = z;
    // If the object has collisions, check
    if coll_var[0]
    {
        
        // Move and slide
        if local.xspd < 0 { local.xdir = -1; } else { local.xdir = 1; }
        if local.yspd < 0 { local.ydir = -1; } else { local.ydir = 1; }
        if local.zspd < 0 { local.zdir = -1; } else { local.zdir = 1; }
        local.radius = 1+(coll_var[2]/2);
        if global.coll_prec_var 
        {
            local.dist = execute_file(global.p3dc_ray_still_scr,global.room_coll,x,y,z+(coll_var[1]/2),local.xspd,local.yspd,local.zspd);
            local.ray_coll = local.dist < local.radius+(spd_var*2) || local.dist >= 10000000;
        }
        else { local.ray_coll = false; }
        if execute_file(global.p3dc_check_split_scr,coll_var[0],x+local.xspd,y+local.yspd,z+local.zspd+0.01) || local.ray_coll
        {
            if !execute_file(global.p3dc_check_split_scr,coll_var[0],x+local.xspd,y,z+0.01)
            {
                if global.coll_prec_var
                {
                    local.xdist = execute_file(global.p3dc_ray_still_scr,global.room_coll,x,y,z+(coll_var[1]/2),local.xdir,0,0);
                    if local.xdist < 10000000
                    { x += local.xdir*min(abs(local.xspd),abs(local.xdist-local.radius)); }
                }
                else { x += local.xspd; }
            }
            if !execute_file(global.p3dc_check_split_scr,coll_var[0],x,y+local.yspd,z+0.01)
            {
                if global.coll_prec_var
                {
                    local.ydist = execute_file(global.p3dc_ray_still_scr,global.room_coll,x,y,z+(coll_var[1]/2),0,local.ydir,0);
                    if local.ydist < 10000000
                    { y += local.ydir*min(abs(local.yspd),abs(local.ydist-local.radius)); }
                }
                else { y += local.yspd; }
            }
            if !execute_file(global.p3dc_check_split_scr,coll_var[0],x,y,z+local.zspd+0.01)
            {
                if global.coll_prec_var
                {
                    local.zdist = execute_file(global.p3dc_ray_split_scr,x,y,z+(coll_var[1]/2),0,0,local.zdir);
                    if local.zdist < 10000000
                    { z += local.zdir*min(abs(local.zspd),abs(local.zdist-(coll_var[1]/2))); }
                }
                else { z += local.zspd; }
            }
        }
        else
        {
            x += local.xspd;
            y += local.yspd;
            z += local.zspd;
        }
    }
    else
    {
        // Add motion without checking anything
        x += local.xspd;
        y += local.yspd;
        z += local.zspd;
    }
}
