/*
Argument 0: Room Variable (same for all rooms)
*/
// Size (Don't go above 38!!!)
    local.width = argument2; 
    local.height = argument3;
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
            room_instance_add(argument0,local.xtmp,local.ytmp,argument1.spawn_floor_obj);
            room_instance_add(argument0,local.xtmp,local.ytmp,argument1.spawn_ceil_obj);
        }
    }
// Walls
    local.ytmp = 32+(local.height*32);
    for (local.i=0; local.i<local.width; local.i+=1;)
    {
        local.xtmp = 48+(local.i*32);
        room_instance_add(argument0,local.xtmp,32,argument1.spawn_wall_hor_obj);
        room_instance_add(argument0,local.xtmp,local.ytmp,argument1.spawn_wall_hor_obj);
    }
    local.xtmp = 32+(local.width*32);
    for (local.i=0; local.i<local.height; local.i+=1;)
    {
        local.ytmp = 48+(local.i*32);
        room_instance_add(argument0,32,local.ytmp,argument1.spawn_wall_vert_obj);
        room_instance_add(argument0,local.xtmp,local.ytmp,argument1.spawn_wall_vert_obj);
    }
// Lab
    if argument4 != 0 { room_instance_add(argument0,80,80,argument1.obj_arr_var[argument4,0]); }
    if argument5 != 0 { room_instance_add(argument0,112,80,argument1.obj_arr_var[argument5,0]); }
    if argument6 != 0 { room_instance_add(argument0,144,80,argument1.obj_arr_var[argument6,0]); }
    if argument7 != 0 { room_instance_add(argument0,176,80,argument1.obj_arr_var[argument7,0]); }
    if argument8 != 0 { room_instance_add(argument0,208,80,argument1.obj_arr_var[argument8,0]); }
    if argument9 != 0 { room_instance_add(argument0,240,80,argument1.obj_arr_var[argument9,0]); }
    if argument10 != 0 { room_instance_add(argument0,272,80,argument1.obj_arr_var[argument10,0]); }
    if argument11 != 0 { room_instance_add(argument0,304,80,argument1.obj_arr_var[argument11,0]); }
    if argument12 != 0 { room_instance_add(argument0,336,80,argument1.obj_arr_var[argument12,0]); }
    if argument13 != 0 { room_instance_add(argument0,368,80,argument1.obj_arr_var[argument13,0]); }
    if argument14 != 0 { room_instance_add(argument0,400,80,argument1.obj_arr_var[argument14,0]); }
    if argument15 != 0 { room_instance_add(argument0,400,80,argument1.obj_arr_var[argument15,0]); }