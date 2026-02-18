/*
Argument 0-2: Ray position
Argument 3-5: Ray direction
*/
local.raydist = 10000000;
// Always check split
local.dist = p3dc_ray_still_scr(global.room_coll,argument0,argument1,argument2,argument3,argument4,argument5);
local.raydist = min(local.raydist,local.dist);
// Check float if it exists
if !fall_var && !fall_temp_var && on_floor_var && global.room_float_coll != -1
{
    local.dist = p3dc_ray_still_scr(global.room_float_coll,argument0,argument1,argument2,argument3,argument4,argument5);
    local.raydist = min(local.raydist,local.dist);
}
// Check props
with prop_par_obj
{
    if solid_var
    {
        if direction != 0
        {
            p3dc_set_modrot_scr(0,0,degtorad(direction));
            local.dist = p3dc_ray_rot_scr
            (
                coll_var[0],x,y,z,
                argument0,argument1,argument2,argument3,argument4,argument5,
                0,0,degtorad(direction)
            );
        }
        else
        {
            local.dist = p3dc_ray_scr
            (
                coll_var[0],x,y,z,
                argument0,argument1,argument2,argument3,argument4,argument5,
            );
        }
        local.raydist = min(local.raydist,local.dist);
    }
}
return local.raydist;