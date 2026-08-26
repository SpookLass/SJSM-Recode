/*
Argument 0-2: Ray position
Argument 3-5: Ray direction
Argument 6: Skip props
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
if !argument6
{
    with prop_par_obj
    {
        if solid_var == 1
        || (solid_var == float_solid_const && other.grav_var > 0 && !other.fall_var && other.on_floor_var)
        || (other.do_coll_var > 0 && other.do_coll_var == solid_var)
        {
            if coll_var[0] == -5 { local.coll = amn_crate_coll[0]; }
            else { local.coll = coll_var[0]; }
            if direction != 0
            {
                p3dc_set_modrot_scr(0,0,degtorad(direction));
                local.dist = p3dc_ray_rot_scr
                (
                    local.coll,x,y,z,
                    argument0,argument1,argument2,argument3,argument4,argument5,
                    0,0,degtorad(direction)
                );
            }
            else
            {
                local.dist = p3dc_ray_scr
                (
                    local.coll,x,y,z,
                    argument0,argument1,argument2,argument3,argument4,argument5,
                );
            }
            local.raydist = min(local.raydist,local.dist);
        }
    }
}
return local.raydist;