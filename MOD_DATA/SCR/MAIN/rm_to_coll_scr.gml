local.rm_name = room_get_name(room);
// Grid
mp_grid_add_rectangle(global.phys_grid,0,0,global.rm_size_var,global.rm_size_var);
mp_grid_clear_rectangle(global.float_grid,0,0,global.rm_size_var,global.rm_size_var);
local.radius = (global.mon_coll[2]/2)-1;
with (floor_par_obj)
{
    if (solid_var == 1 || solid_var == mon_solid_const || solid_var == float_solid_const)  && grid_var
    {
        mp_grid_clear_rectangle
        (
            global.phys_grid,
            x-(w_var/2),
            y-(h_var/2),
            x+(w_var/2),
            y+(h_var/2)
        );
        if solid_var != float_solid_const
        {
            mp_grid_clear_rectangle
            (
                global.float_grid,
                x-(w_var/2),
                y-(h_var/2),
                x+(w_var/2),
                y+(h_var/2)
            );
        }
    }
}
with (wall_par_obj)
{
    if (solid_var == 1 || solid_var == mon_solid_const || solid_var == float_solid_const)  && grid_var
    {
        local.width = w_var/2;
        local.xtmp = local.radius+abs(lengthdir_y(local.width,direction));
        local.ytmp = local.radius+abs(lengthdir_x(local.width,direction));
        mp_grid_add_rectangle
        (
            global.phys_grid,
            x-local.xtmp,
            y-local.ytmp,
            x+local.xtmp,
            y+local.ytmp
        );
        if solid_var != float_solid_const
        {
            mp_grid_add_rectangle
            (
                global.float_grid,
                x-local.xtmp,
                y-local.ytmp,
                x+local.xtmp,
                y+local.ytmp
            );
        }
    }
}
with (prop_par_obj)
{
    if (solid_var == 1 || solid_var == mon_solid_const || solid_var == float_solid_const)  && grid_var
    {
        switch type_var
        {
            case 1:
            case 6:
            case 10:
            {
                local.width = w_var/2;
                local.xtmp = radius_var+abs(lengthdir_y(local.width,direction));
                local.ytmp = radius_var+abs(lengthdir_x(local.width,direction));
                
                mp_grid_add_rectangle
                (
                    global.phys_grid,
                    x-local.xtmp,
                    y-local.ytmp,
                    x+local.xtmp,
                    y+local.ytmp
                );
                if solid_var != float_solid_const
                {
                    mp_grid_add_rectangle
                    (
                        global.float_grid,
                        x-local.xtmp,
                        y-local.ytmp,
                        x+local.xtmp,
                        y+local.ytmp
                    );
                }
                break;
            }
            case 12:
            case 7:
            case 3: // No circle :(
            case 2:
            case 0: // No model either
            {
                local.width = w_var/2;
                local.length = l_var/2;
                mp_grid_add_rectangle
                (
                    global.phys_grid,
                    x-local.width,
                    y-local.length,
                    x+local.width,
                    y+local.length
                );
                if solid_var != float_solid_const
                {
                    mp_grid_add_rectangle
                    (
                        global.float_grid,
                        x-local.width,
                        y-local.length,
                        x+local.width,
                        y+local.length
                    );
                }
                break;
            }
            // Floor is not needed
            // case 4: { break; }
            case 5:
            case 11:
            {
                local.width = w_var/2;
                mp_grid_add_rectangle // No circle :(
                (
                    global.phys_grid,
                    x-local.width,
                    y-local.width,
                    x+local.width,
                    y+local.width
                );
                if solid_var != float_solid_const
                {
                    mp_grid_add_rectangle
                    (
                        global.float_grid,
                        x-local.width,
                        y-local.width,
                        x+local.width,
                        y+local.width
                    );
                }
                break;
            }
            case 8:
            case 9:
            {
                mp_grid_add_rectangle
                (
                    global.phys_grid,
                    x,
                    y,
                    x+w_var,
                    y
                );
                if solid_var != float_solid_const
                {
                    mp_grid_add_rectangle
                    (
                        global.float_grid,
                        x,
                        y,
                        x+w_var,
                        y
                    );
                }
                break;
            }
        }
    }
}
// Main
local.addextra = false;
if !variable_global_exists(local.rm_name+"_coll")
{
    execute_string("
        globalvar "+local.rm_name+"_coll
        globalvar "+local.rm_name+"_player_coll
        globalvar "+local.rm_name+"_mon_coll
        globalvar "+local.rm_name+"_coll
    ")
    variable_global_set("global."+local.rm_name+"_coll",p3dc_begin_mdl_scr());
    // Add floors
    with (floor_par_obj)
    {
        if solid_var
        {
            p3dc_set_trimask_scr(mask_var);
            p3dc_add_floor_scr
            (
                x-(w_var/2),
                y-(h_var/2),
                z,
                x+(w_var/2),
                y+(h_var/2),
                z
            );
            p3dc_set_trimask_scr(mask_basic_const);
        }
    }
    // Add ceilings
    with (ceil_par_obj)
    {
        if solid_var
        {
            p3dc_set_trimask_scr(mask_var);
            p3dc_add_floor_scr
            (
                x-(w_var/2),
                y-(h_var/2),
                z,
                x+(w_var/2),
                y+(h_var/2),
                z
            );
            p3dc_set_trimask_scr(mask_basic_const);
        }
    }
    // Add walls
    with (wall_par_obj)
    {
        if solid_var == 1
        {
            p3dc_set_trimask_scr(mask_var);
            p3dc_add_wall_scr
            (
                x-lengthdir_y(w_var/2,direction),
                y-lengthdir_x(w_var/2,direction),
                z+h_var,
                x+lengthdir_y(w_var/2,direction),
                y+lengthdir_x(w_var/2,direction),
                z
            );
            p3dc_set_trimask_scr(mask_basic_const);
        }
        else if solid_var == float_solid_const { local.addextra = true; }
    }
    // End
    p3dc_end_mdl_scr();
    // Add extra
    if local.addextra
    {
        variable_global_set("global."+local.rm_name+"_player_coll",p3dc_begin_mdl_scr());
        with (wall_par_obj)
        {
            if solid_var == player_solid_const
            {
                p3dc_set_trimask_scr(mask_var);
                p3dc_add_wall_scr
                (
                    x-lengthdir_y(w_var/2,direction),
                    y-lengthdir_x(w_var/2,direction),
                    z+h_var,
                    x+lengthdir_y(w_var/2,direction),
                    y+lengthdir_x(w_var/2,direction),
                    z
                );
                p3dc_set_trimask_scr(mask_basic_const);
            }
        }
        p3dc_end_mdl_scr();
        variable_global_set("global."+local.rm_name+"_mon_coll",p3dc_begin_mdl_scr());
        with (wall_par_obj)
        {
            if solid_var == mon_solid_const
            {
                p3dc_set_trimask_scr(mask_var);
                p3dc_add_wall_scr
                (
                    x-lengthdir_y(w_var/2,direction),
                    y-lengthdir_x(w_var/2,direction),
                    z+h_var,
                    x+lengthdir_y(w_var/2,direction),
                    y+lengthdir_x(w_var/2,direction),
                    z
                );
                p3dc_set_trimask_scr(mask_basic_const);
            }
        }
        p3dc_end_mdl_scr();
        variable_global_set("global."+local.rm_name+"_float_coll",p3dc_begin_mdl_scr());
        with (wall_par_obj)
        {
            if solid_var == float_solid_const
            {
                p3dc_set_trimask_scr(mask_var);
                p3dc_add_wall_scr
                (
                    x-lengthdir_y(w_var/2,direction),
                    y-lengthdir_x(w_var/2,direction),
                    z+h_var,
                    x+lengthdir_y(w_var/2,direction),
                    y+lengthdir_x(w_var/2,direction),
                    z
                );
                p3dc_set_trimask_scr(mask_basic_const);
            }
        }
        p3dc_end_mdl_scr();
    }
    else
    {
        variable_global_set("global."+local.rm_name+"_player_coll",-1);
        variable_global_set("global."+local.rm_name+"_mon_coll",-1);
        variable_global_set("global."+local.rm_name+"_float_coll",-1);
    }
}
global.room_coll = variable_global_get("global."+local.rm_name+"_coll");
global.room_player_coll = variable_global_get("global."+local.rm_name+"_player_coll");
global.room_mon_coll = variable_global_get("global."+local.rm_name+"_mon_coll");
global.room_float_coll = variable_global_get("global."+local.rm_name+"_float_coll");
// Split
local.cell = ceil(global.rm_size_var/32);
local.size = local.cell*32;
p3dc_split_mdl_scr(global.room_coll,local.size,local.size,local.cell,local.cell,6);
// p3dc_split_mdl_scr(global.room_coll,ceil(room_width/32)*32,ceil(room_height/32)*32,ceil(room_width/32),ceil(room_height/32),6);