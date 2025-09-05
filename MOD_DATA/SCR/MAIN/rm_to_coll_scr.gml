local.rm_name = room_get_name(room);
// Grid
mp_grid_add_rectangle(global.phys_grid,0,0,global.rm_size_var,global.rm_size_var);
mp_grid_clear_rectangle(global.float_grid,0,0,global.rm_size_var,global.rm_size_var);
local.radius = (global.mon_coll[2]/2)-1;
with (floor_par_obj)
{
    if (solid_var == 1 || solid_var == mon_solid_const || solid_var == float_solid_const)  && !no_grid_var
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
    if (solid_var == 1 || solid_var == mon_solid_const || solid_var == float_solid_const)  && !no_grid_var
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
    if (solid_var == 1 || solid_var == mon_solid_const || solid_var == float_solid_const)  && !no_grid_var
    {
        switch type_var
        {
            case 6:
            case 1:
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
        }
    }
}
// Main
local.addextra = false;
execute_string
("
    if global."+local.rm_name+"_coll == 0
    {
        global."+local.rm_name+"_coll = p3dc_begin_mdl_scr();
        // Add floors
        with (floor_par_obj)
        {
            if solid_var
            {
                p3dc_add_floor_scr
                (
                    x-(w_var/2),
                    y-(h_var/2),
                    z,
                    x+(w_var/2),
                    y+(h_var/2),
                    z
                );
            }
        }
        // Add ceilings
        with (ceil_par_obj)
        {
            if solid_var
            {
                p3dc_add_floor_scr
                (
                    x-(w_var/2),
                    y-(h_var/2),
                    z,
                    x+(w_var/2),
                    y+(h_var/2),
                    z
                );
            }
        }
        // Add walls
        with (wall_par_obj)
        {
            if solid_var == 1
            {
                p3dc_add_wall_scr
                (
                    x-lengthdir_y(w_var/2,direction),
                    y-lengthdir_x(w_var/2,direction),
                    z+h_var,
                    x+lengthdir_y(w_var/2,direction),
                    y+lengthdir_x(w_var/2,direction),
                    z
                );
            }
            else if solid_var == float_solid_const { local.addextra = true; }
        }
        // Add props
        /*
        with (prop_par_obj)
        {
            if solid_var
            {
                switch type_var
                {
                    case 0:
                    {
                        if file_exists(string(mdl_path_var))
                        { p3dc_add_mdl_scr(mdl_path_var,x,y,z); }
                        break;
                    }
                    case 1:
                    {
                        local.width = w_var/2;
                        local.xtmp = radius_var+abs(lengthdir_y(local.width,direction));
                        local.ytmp = radius_var+abs(lengthdir_x(local.width,direction));
                        p3dc_add_block_scr
                        (
                            x-local.xtmp,
                            y-local.ytmp,
                            z+h_var,
                            x+local.xtmp,
                            y+local.ytmp,
                            z
                        );
                        break;
                    }
                    case 7:
                    case 2:
                    {
                        local.width = w_var/2;
                        local.length = l_var/2;
                        p3dc_add_block_scr
                        (
                            x-local.width,
                            y-local.length,
                            z+h_var,
                            x+local.width,
                            y+local.length,
                            z
                        );
                        break;
                    }
                    case 3:
                    {
                        local.width = w_var/2;
                        local.length = l_var/2;
                        p3dc_add_cylinder_scr
                        (
                            x-local.width,
                            y-local.length,
                            z+h_var,
                            x+local.width,
                            y+local.length,
                            z,
                            close_var,
                            step_var
                        );
                        break;
                    }
                    case 4:
                    {
                        local.width = w_var/2;
                        local.length = l_var/2;
                        p3dc_add_floor_scr
                        (
                            x-local.width,
                            y-local.length,
                            z,
                            x+local.width,
                            y+local.length,
                            z
                        );
                        break;
                    }
                    case 5:
                    {
                        local.width = w_var/2;
                        p3dc_add_cylinder_scr
                        (
                            x-local.width,
                            y-local.width,
                            z+h_var,
                            x+local.width,
                            y+local.width,
                            z,
                            true,
                            step_var
                        );
                        break;
                    }
                    case 6:
                    {
                        local.width = w_var/2;
                        local.xtmp = lengthdir_y(local.width,direction);
                        local.ytmp = lengthdir_x(local.width,direction);
                        p3dc_add_wall_scr
                        (
                            x-local.xtmp,
                            y-local.ytmp,
                            z+h_var,
                            x+local.xtmp,
                            y+local.ytmp,
                            z
                        );
                        break;
                    }
                }
            }
        }
        */
        // End
        p3dc_end_mdl_scr();
        // Add extra
        if local.addextra
        {
            global."+local.rm_name+"_player_coll = p3dc_begin_mdl_scr();
            with (wall_par_obj)
            {
                if solid_var == player_solid_const
                {
                    p3dc_add_wall_scr
                    (
                        x-lengthdir_y(w_var/2,direction),
                        y-lengthdir_x(w_var/2,direction),
                        z+h_var,
                        x+lengthdir_y(w_var/2,direction),
                        y+lengthdir_x(w_var/2,direction),
                        z
                    );
                }
            }
            p3dc_end_mdl_scr();
            global."+local.rm_name+"_mon_coll = p3dc_begin_mdl_scr();
            with (wall_par_obj)
            {
                if solid_var == mon_solid_const
                {
                    p3dc_add_wall_scr
                    (
                        x-lengthdir_y(w_var/2,direction),
                        y-lengthdir_x(w_var/2,direction),
                        z+h_var,
                        x+lengthdir_y(w_var/2,direction),
                        y+lengthdir_x(w_var/2,direction),
                        z
                    );
                }
            }
            p3dc_end_mdl_scr();
            global."+local.rm_name+"_float_coll = p3dc_begin_mdl_scr();
            with (wall_par_obj)
            {
                if solid_var == float_solid_const
                {
                    p3dc_add_wall_scr
                    (
                        x-lengthdir_y(w_var/2,direction),
                        y-lengthdir_x(w_var/2,direction),
                        z+h_var,
                        x+lengthdir_y(w_var/2,direction),
                        y+lengthdir_x(w_var/2,direction),
                        z
                    );
                }
            }
            p3dc_end_mdl_scr();
        }
        else
        {
            global."+local.rm_name+"_player_coll = -1;
            global."+local.rm_name+"_mon_coll = -1;
            global."+local.rm_name+"_float_coll = -1;
        }
    }
    global.room_coll = global."+local.rm_name+"_coll;
    global.room_player_coll = global."+local.rm_name+"_player_coll;
    global.room_mon_coll = global."+local.rm_name+"_mon_coll;
    global.room_float_coll = global."+local.rm_name+"_float_coll;
");
p3dc_split_mdl_scr(global.room_coll,ceil(room_width/32)*32,ceil(room_height/32)*32,ceil(room_width/32),ceil(room_height/32),6);