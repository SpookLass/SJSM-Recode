/*
Argument 0: Attempts
Argument 1: Random
Argument 2: Player Distance
Argument 3: Spawn Distance
Argument 4: Self Distance
Returns true if spawn was successful
*/
for (local.i=0; local.i<argument0; local.i+=1;)
{
    local.flr = instance_find(floor_par_obj,irandom(instance_number(floor_par_obj)-1));
    local.xtmp = local.flr.x;
    local.ytmp = local.flr.y;
    local.ztmp = local.flr.z;
    if argument1
    {
        local.width = (local.flr.w_var-coll_var[1])*0.5;
        local.height = (local.flr.h_var-coll_var[1])*0.5;
        local.xtmp += random_range(-local.width,local.width);
        local.ytmp += random_range(-local.height,local.height);
    }
    local.bool = true;
    if argument2 > 0
    {
        with player_obj
        {
            if on_var && !dead_var && !in_door_var
            {
                if point_distance_3d_scr(local.xtmp,local.ytmp,local.ztmp,x,y,z) < argument2
                { local.bool = false; break; }
            }
        }
        if !local.bool { continue; }
    }
    if argument3 > 0
    {
        for (local.j=0; local.j<global.spawn_len_var; local.j+=1;)
        {
            if point_distance_3d_scr(local.xtmp,local.ytmp,local.ztmp,global.spawn_arr[local.j,0],global.spawn_arr[local.j,1],global.spawn_arr[local.j,2]) < argument3
            { local.bool = false; break; }
        }
        if !local.bool { continue; }
    }
    if argument4 > 0
    {
        with object_index
        {
            if id != other.id && object_index == other.object_index && on_var
            {
                if point_distance_3d_scr(local.xtmp,local.ytmp,local.ztmp,x,y,z) < argument3
                { local.bool = false; break; }
            }
        }
        if !local.bool { continue; }
    }
    if do_coll_var { if check_coll_scr(0,0,0,0,0,local.xtmp,local.ytmp,local.ztmp) { continue; }}
    x = local.xtmp;
    y = local.ytmp;
    z = local.ztmp;
    return true;
}
return false;