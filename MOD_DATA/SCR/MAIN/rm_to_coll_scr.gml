local.rm_name = room_get_name(room);
mp_grid_add_rectangle(global.phys_grid,0,0,global.rm_size_var,global.rm_size_var);
mp_grid_add_rectangle(global.float_grid,0,0,global.rm_size_var,global.rm_size_var);
local.radius = global.mon_coll[2]/2;
with (floor_par_obj)
{
    if solid_var
    {
        mp_grid_clear_rectangle
        (
            global.phys_grid,
            x-(w_var/2),
            y-(h_var/2),
            x+(w_var/2),
            y+(h_var/2)
        );
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
with (wall_par_obj)
{
    if solid_var
    {
        mp_grid_add_rectangle
        (
            global.phys_grid,
            x-local.radius-lengthdir_y(w_var/2,direction),
            y-local.radius-lengthdir_x(w_var/2,direction),
            x+local.radius+lengthdir_y(w_var/2,direction),
            y+local.radius+lengthdir_x(w_var/2,direction)
        );
        mp_grid_add_rectangle
        (
            global.float_grid,
            x-local.radius-lengthdir_y(w_var/2,direction),
            y-local.radius-lengthdir_x(w_var/2,direction),
            x+local.radius+lengthdir_y(w_var/2,direction),
            y+local.radius+lengthdir_x(w_var/2,direction)
        );
    }
}
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
            if solid_var
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
        // Add props
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
                        p3dc_add_block_scr
                        (
                            x-radius_var-lengthdir_y(w_var/2,direction),
                            y-radius_var-lengthdir_x(w_var/2,direction),
                            z+h_var,
                            x+radius_var+lengthdir_y(w_var/2,direction),
                            y+radius_var+lengthdir_x(w_var/2,direction),
                            z
                        );
                        break;
                    }
                }
            }
        }
        // Failsafe box
        /*
        p3dc_add_floor_scr(0,0,-128,room_width,room_height,-128);
        p3dc_add_floor_scr(0,0,128,room_width,room_height,128);
        p3dc_add_wall_scr(0,0,-128,room_width,0,128);
        p3dc_add_wall_scr(0,room_height,-128,room_width,room_height,128);
        p3dc_add_wall_scr(0,0,-128,0,room_height,128);
        p3dc_add_wall_scr(room_width,0,-128,room_width,room_height,128);
        */
        // End
        p3dc_end_mdl_scr();
    }
    global.room_coll = global."+local.rm_name+"_coll;
");
p3dc_split_mdl_scr(global.room_coll,ceil(room_width/32)*32,ceil(room_height/32)*32,ceil(room_width/32),ceil(room_height/32),6);