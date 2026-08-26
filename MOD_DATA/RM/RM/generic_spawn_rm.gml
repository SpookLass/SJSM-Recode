local.hall_entrance_width = 1;
local.hall_entrance_len = 5;
local.hall_exit_width = 1;
local.hall_exit_len = 3;
local.width = 5;
local.length = 5;
local.xmiddle = round((local.width-local.hall_exit_width)/2);
local.ymiddle_entrance = round((local.length-local.hall_entrance_width)/2);
local.ymiddle_exit = round((local.length-local.hall_exit_width)/2);
local.xtmp1 = ((local.hall_entrance_len+local.xmiddle)*32)+48;
local.xtmp2 = ((local.hall_entrance_len+local.width+local.hall_exit_len)*32)+16;
local.ytmp1 = ((local.hall_exit_len+local.ymiddle_entrance)*32)+48;
local.ytmp2 = ((local.hall_exit_len+local.ymiddle_exit)*32)+48;
local.ytmp3 = (((local.hall_exit_len*2)+local.length)*32)+16;
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","spawn","ROOM_spawn");
    ini_close();
    // Spawns
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 48;
    global.spawn_arr[0,1] = '+string(local.ytmp1)+';
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = '+string(local.xtmp2)+';
    global.spawn_arr[1,1] = '+string(local.ytmp2)+';
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = '+string(local.xtmp1)+';
    global.spawn_arr[2,1] = 48;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    global.spawn_arr[3,0] = '+string(local.xtmp1)+';
    global.spawn_arr[3,1] = '+string(local.ytmp3)+';
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 90;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,false,false,spawn_leave_door_trig_obj);
');
// Room settings
    room_set_width(argument0,(2+local.hall_entrance_len+local.hall_exit_len+local.width)*32);
    room_set_height(argument0,(2+local.length+(local.hall_exit_len*2))*32);
    room_set_background_color(argument0,c_black,true);
    room_set_view_enabled(argument0,true);
    for (local.i=0; local.i<8; local.i+=1;)
    { room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
    room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Effects
    room_instance_add(argument0,0,0,fog_01_obj);
// Trigger
    local.xoff = local.hall_entrance_len;
    local.yoff = local.hall_exit_len+local.ymiddle_entrance;
    room_instance_add(argument0,(local.xoff*32)+48,(local.yoff*32)+48,generic_spawn_trig_obj);
// Floors and ceilings
    // Main
        local.xoff = local.hall_entrance_len;
        local.yoff = local.hall_exit_len;
        for (local.i=local.xoff; local.i<local.xoff+local.width; local.i+=1;)
        {
            for (local.j=local.yoff; local.j<local.yoff+local.length; local.j+=1;)
            {
                room_instance_add(argument0,(local.i*32)+48,(local.j*32)+48,spawn_floor_obj);
                room_instance_add(argument0,(local.i*32)+48,(local.j*32)+48,spawn_ceil_obj);
            }
        }
    // Entrance Hall
        local.xoff = 0;
        local.yoff = local.hall_exit_len+local.ymiddle_entrance;
        for (local.i=local.xoff; local.i<local.xoff+local.hall_entrance_len; local.i+=1;)
        {
            for (local.j=local.yoff; local.j<local.yoff+local.hall_entrance_width; local.j+=1;)
            {
                room_instance_add(argument0,(local.i*32)+48,(local.j*32)+48,spawn_floor_obj);
                room_instance_add(argument0,(local.i*32)+48,(local.j*32)+48,spawn_ceil_obj);
            }
        }
    // Exit Halls
        local.xoff = local.hall_entrance_len+local.width;
        local.yoff = local.hall_exit_len+local.ymiddle_exit;
        for (local.i=local.xoff; local.i<local.xoff+local.hall_exit_len; local.i+=1;)
        {
            for (local.j=local.yoff; local.j<local.yoff+local.hall_exit_width; local.j+=1;)
            {
                room_instance_add(argument0,(local.i*32)+48,(local.j*32)+48,spawn_floor_obj);
                room_instance_add(argument0,(local.i*32)+48,(local.j*32)+48,spawn_ceil_obj);
            }
        }
        local.xoff = local.hall_entrance_len+local.xmiddle;
        local.yoff = 0;
        for (local.i=local.xoff; local.i<local.xoff+local.hall_exit_width; local.i+=1;)
        {
            for (local.j=local.yoff; local.j<local.yoff+local.hall_exit_len; local.j+=1;)
            {
                room_instance_add(argument0,(local.i*32)+48,(local.j*32)+48,spawn_floor_obj);
                room_instance_add(argument0,(local.i*32)+48,(local.j*32)+48,spawn_ceil_obj);
            }
        }
        local.xoff = local.hall_entrance_len+local.xmiddle;
        local.yoff = local.hall_exit_len+local.length;
        for (local.i=local.xoff; local.i<local.xoff+local.hall_exit_width; local.i+=1;)
        {
            for (local.j=local.yoff; local.j<local.yoff+local.hall_exit_len; local.j+=1;)
            {
                room_instance_add(argument0,(local.i*32)+48,(local.j*32)+48,spawn_floor_obj);
                room_instance_add(argument0,(local.i*32)+48,(local.j*32)+48,spawn_ceil_obj);
            }
        }
// Walls (Horizontal)
    // Main
        local.xoff = local.hall_entrance_len;
        local.yoff = local.hall_exit_len;
        for (local.i=local.xoff; local.i<local.xoff+local.width; local.i+=1;)
        {
            if local.i < local.xmiddle+local.xoff || local.i >= local.xmiddle+local.hall_exit_width+local.xoff || local.hall_entrance_len <= 0
            {
                room_instance_add(argument0,(local.i*32)+48,(local.yoff+1)*32,spawn_wall_hor_obj);
                room_instance_add(argument0,(local.i*32)+48,(local.yoff+local.length+1)*32,spawn_wall_hor_obj);
            }
        }
    // Entrance Hall
        local.xoff = 0;
        local.yoff = local.hall_exit_len+local.ymiddle_entrance;
        for (local.i=local.xoff; local.i<local.xoff+local.hall_entrance_len; local.i+=1;)
        {
            room_instance_add(argument0,(local.i*32)+48,(local.yoff+1)*32,spawn_wall_hor_obj);
            room_instance_add(argument0,(local.i*32)+48,(local.yoff+local.hall_entrance_width+1)*32,spawn_wall_hor_obj);
        }
    // Exit Halls
        local.xoff = local.hall_entrance_len+local.xmiddle;
        local.yoff = 0;
        for (local.i=local.xoff; local.i<local.xoff+local.hall_entrance_width; local.i+=1;)
        { room_instance_add(argument0,(local.i*32)+48,(local.yoff+1)*32,spawn_wall_hor_obj); }
        local.xoff = local.hall_entrance_len+local.xmiddle;
        local.yoff = (local.hall_exit_len*2)+local.length;
        for (local.i=local.xoff; local.i<local.xoff+local.hall_exit_width; local.i+=1;)
        { room_instance_add(argument0,(local.i*32)+48,(local.yoff+1)*32,spawn_wall_hor_obj); }
        local.xoff = local.hall_entrance_len+local.width;
        local.yoff = local.hall_exit_len+local.ymiddle_exit;
        for (local.i=local.xoff; local.i<local.xoff+local.hall_exit_len; local.i+=1;)
        {
            room_instance_add(argument0,(local.i*32)+48,(local.yoff+1)*32,spawn_wall_hor_obj);
            room_instance_add(argument0,(local.i*32)+48,(local.yoff+local.hall_exit_width+1)*32,spawn_wall_hor_obj);
        }
// Walls (Vertical)
    // Main
        local.xoff = local.hall_entrance_len;
        local.yoff = local.hall_exit_len;
        for (local.i=local.yoff; local.i<local.yoff+local.length; local.i+=1;)
        {
            if local.i < local.ymiddle_entrance+local.yoff || local.i >= local.ymiddle_entrance+local.hall_entrance_width+local.yoff || local.hall_entrance_len <= 0
            { room_instance_add(argument0,(local.xoff+1)*32,(local.i*32)+48,spawn_wall_vert_obj); }
            if local.i < local.ymiddle_exit+local.yoff || local.i >= local.ymiddle_exit+local.hall_exit_width+local.yoff|| local.hall_exit_len <= 0
            { room_instance_add(argument0,(local.xoff+local.width+1)*32,(local.i*32)+48,spawn_wall_vert_obj); }
        }
    // Entrance Hall
        local.xoff = 0;
        local.yoff = local.hall_exit_len+local.ymiddle_entrance;
        for (local.i=local.yoff; local.i<local.yoff+local.hall_entrance_width; local.i+=1;)
        { room_instance_add(argument0,(local.xoff+1)*32,(local.i*32)+48,spawn_wall_vert_obj); }
    // Exit Halls
        local.xoff = local.hall_entrance_len+local.hall_exit_len+local.width;
        local.yoff = local.hall_exit_len+local.ymiddle_exit;
        for (local.i=local.yoff; local.i<local.yoff+local.hall_exit_width; local.i+=1;)
        { room_instance_add(argument0,(local.xoff+1)*32,(local.i*32)+48,spawn_wall_vert_obj); }
        local.xoff = local.hall_entrance_len+local.xmiddle;
        local.yoff = 0;
        for (local.i=local.yoff; local.i<local.yoff+local.hall_exit_len; local.i+=1;)
        {
            room_instance_add(argument0,(local.xoff+1)*32,(local.i*32)+48,spawn_wall_vert_obj);
            room_instance_add(argument0,(local.xoff+local.hall_exit_width+1)*32,(local.i*32)+48,spawn_wall_vert_obj);
        }
        local.xoff = local.hall_entrance_len+local.xmiddle;
        local.yoff = local.hall_exit_len+local.length;
        for (local.i=local.yoff; local.i<local.yoff+local.hall_exit_len; local.i+=1;)
        {
            room_instance_add(argument0,(local.xoff+1)*32,(local.i*32)+48,spawn_wall_vert_obj);
            room_instance_add(argument0,(local.xoff+local.hall_exit_width+1)*32,(local.i*32)+48,spawn_wall_vert_obj);
        }