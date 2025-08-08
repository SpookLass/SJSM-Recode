local.rm_name = room_get_name(room);
execute_string
("
    if global."+local.rm_name+"_coll == 0
    {
        global."+local.rm_name+"_coll = execute_file(global.p3dc_begin_mdl_scr);
        // Add floors
        with (global.floor_par_obj)
        {
            if solid_var
            {
                execute_file
                (
                    global.p3dc_add_floor_scr,
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
        with (global.ceil_par_obj)
        {
            if solid_var
            {
                execute_file
                (
                    global.p3dc_add_floor_scr,
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
        with (global.wall_par_obj)
        {
            if solid_var
            {
                execute_file
                (
                    global.p3dc_add_block_scr,
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
        with (global.prop_par_obj)
        {
            if solid_var && file_exists(string(mdl_path_var))
            {
                execute_file
                (
                    global.p3dc_add_mdl_scr,
                    mdl_path_var, x, y, z
                );
            }
        }
        // Failsafe box
        /*
        execute_file(global.p3dc_add_floor_scr,0,0,-128,room_width,room_height,-128);
        execute_file(global.p3dc_add_floor_scr,0,0,128,room_width,room_height,128);
        execute_file(global.p3dc_add_wall_scr,0,0,-128,room_width,0,128);
        execute_file(global.p3dc_add_wall_scr,0,room_height,-128,room_width,room_height,128);
        execute_file(global.p3dc_add_wall_scr,0,0,-128,0,room_height,128);
        execute_file(global.p3dc_add_wall_scr,room_width,0,-128,room_width,room_height,128);
        */
        // End
        execute_file(global.p3dc_end_mdl_scr);
    }
    global.room_coll = global."+local.rm_name+"_coll;
")
execute_file(global.p3dc_split_mdl_scr,global.room_coll,ceil(room_width/32)*32,ceil(room_height/32)*32,ceil(room_width/32),ceil(room_height/32),6);