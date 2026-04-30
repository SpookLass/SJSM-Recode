/*
Argument 0: Room Variable (same for all rooms)
*/
// Size (Don't go above 38!!!)
    local.width = 4; 
    local.height = 4;
// Room Code
    room_set_code
    (
        argument0,'
        global.rm_name_var = "Test Spawn Room"
        // Spawn
        global.spawn_len_var = 1;
        global.spawn_arr[0,0] = 48;
        global.spawn_arr[0,1] = '+string(16+(round(local.height/2)*32))+';
        global.spawn_arr[0,2] = 0;
        global.spawn_arr[0,3] = 0;
        // 3D Draw
        d3d_start();
        global.draw_3d_var = true;
        // Doors
        spawn_create_scr(true,false);
    ');
// Room settings
    room_set_width(argument0,1280);
    room_set_height(argument0,720);
    room_set_background_color(argument0,c_black,true);
    room_set_view_enabled(argument0,true);
    for (local.i=0; local.i<8; local.i+=1;)
    { room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
    room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Effects
    room_instance_add(argument0,0,0,fog_01_obj);
// Floors
    for (local.i=0; local.i<local.width; local.i+=1;)
    {
        for (local.j=0; local.j<local.height; local.j+=1;)
        {
            local.xtmp = 48+(local.i*32);
            local.ytmp = 48+(local.j*32);
            room_instance_add(argument0,local.xtmp,local.ytmp,spawn_floor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp,spawn_ceil_obj);
        }
    }
// Walls
    local.ytmp = 32+(local.height*32);
    for (local.i=0; local.i<30; local.i+=1;)
    {
        local.xtmp = 48+(local.i*32);
        room_instance_add(argument0,local.xtmp,32,spawn_wall_hor_obj);
        room_instance_add(argument0,local.xtmp,local.ytmp,spawn_wall_hor_obj);
    }
    local.xtmp = 32+(local.width*32);
    for (local.i=0; local.i<30; local.i+=1;)
    {
        local.ytmp = 48+(local.i*32);
        room_instance_add(argument0,32,local.ytmp,spawn_wall_vert_obj);
        room_instance_add(argument0,local.xtmp,local.ytmp,spawn_wall_vert_obj);
    }
// Lab
    room_instance_add(argument0,80,80,lab_wall_obj);
    room_instance_add(argument0,112,80,lab_tank_obj);
    room_instance_add(argument0,144,80,lab_tank_broke_obj);
