/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','hotel','ROOM_hotel')+' 15 '+ini_read_string('ROOM','gold','ROOM_gold');
	ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 160;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 256;
    global.spawn_arr[1,1] = 368;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    global.spawn_arr[2,0] = 320;
    global.spawn_arr[2,1] = 144;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 276;
    global.mark_arr[0,1] = 156;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 294;
    global.mark_arr[1,1] = 243;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 284;
    global.mark_arr[2,1] = 289;
    global.mark_arr[2,2] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    local.entrance = instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),door_entrance_obj);
    local.entrance.z = global.spawn_arr[0,2];
    local.entrance.direction = global.spawn_arr[0,3]+180;
    // Exit
    local.unlock = irandom_range(1,global.spawn_len_var-1);
    for (local.i=1; local.i<global.spawn_len_var; local.i+=1;)
    {
        local.exitdoor = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),door_obj);
        local.exitdoor.direction = global.spawn_arr[local.i,3]+180;
        local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),door_trig_obj);
        local.exittrig.z = global.spawn_arr[local.i,2];
        if local.i != local.unlock { local.exittrig.lock_var = true; }
        global.spawn_arr[local.i,4] = local.exittrig;
    }
    // Torch 1
    //local.torch = instance_create(256,304,torch_gold_south_obj);
    //local.torch.door_var = global.spawn_arr[1,4];
    //local.torch = instance_create(320,304,torch_gold_south_obj);
    //local.torch.door_var = global.spawn_arr[1,4];
    // Torch 2
    //local.torch = instance_create(256,208,torch_gold_north_obj);
    //local.torch.door_var = global.spawn_arr[2,4];
    //local.torch = instance_create(320,208,torch_gold_north_obj);
    //local.torch.door_var = global.spawn_arr[2,4];


    // Torch 1
    local.torch = instance_create(272,320,torch_gold_west_obj);
    local.torch.door_var = global.spawn_arr[1,4];
    local.torch = instance_create(304,320,torch_gold_east_obj);
    local.torch.door_var = global.spawn_arr[1,4];
    // Torch 2
    local.torch = instance_create(272,192,torch_gold_west_obj);
    local.torch.door_var = global.spawn_arr[2,4];
    local.torch = instance_create(304,192,torch_gold_east_obj);
    local.torch.door_var = global.spawn_arr[2,4];
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
");

// Room settings
room_set_width(argument0,1280);
room_set_height(argument0,720);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Effects
room_instance_add(argument0,0,0,maze_dark_fog_obj);
room_instance_add(argument0,0,0,maze_dark_color_obj);
// Floors
room_instance_add(argument0,160,256,floor_obj);
room_instance_add(argument0,192,256,floor_obj);
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,288,192,floor_obj);
room_instance_add(argument0,288,160,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,288,352,floor_obj);
room_instance_add(argument0,320,160,floor_obj);
room_instance_add(argument0,256,160,floor_obj);
room_instance_add(argument0,256,352,floor_obj);
room_instance_add(argument0,320,352,floor_obj);
room_instance_add(argument0,256,128,floor_obj);
room_instance_add(argument0,288,128,floor_obj);
room_instance_add(argument0,320,128,floor_obj);
room_instance_add(argument0,256,384,floor_obj);
room_instance_add(argument0,288,384,floor_obj);
room_instance_add(argument0,320,384,floor_obj);
// Ceilings
room_instance_add(argument0,160,256,ceil_obj);
room_instance_add(argument0,192,256,ceil_obj);
room_instance_add(argument0,224,256,ceil_obj);
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,256,224,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,320,288,ceil_obj);
room_instance_add(argument0,320,224,ceil_obj);
room_instance_add(argument0,288,224,ceil_obj);
room_instance_add(argument0,288,192,ceil_obj);
room_instance_add(argument0,288,160,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
room_instance_add(argument0,288,352,ceil_obj);
room_instance_add(argument0,320,160,ceil_obj);
room_instance_add(argument0,256,160,ceil_obj);
room_instance_add(argument0,256,352,ceil_obj);
room_instance_add(argument0,320,352,ceil_obj);
room_instance_add(argument0,256,128,ceil_obj);
room_instance_add(argument0,288,128,ceil_obj);
room_instance_add(argument0,320,128,ceil_obj);
room_instance_add(argument0,256,384,ceil_obj);
room_instance_add(argument0,288,384,ceil_obj);
room_instance_add(argument0,320,384,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,160,240,wall_hor_obj);
room_instance_add(argument0,192,240,wall_hor_obj);
room_instance_add(argument0,224,240,wall_hor_obj);
room_instance_add(argument0,160,272,wall_hor_obj);
room_instance_add(argument0,192,272,wall_hor_obj);
room_instance_add(argument0,224,272,wall_hor_obj);
room_instance_add(argument0,256,208,wall_hor_obj);
room_instance_add(argument0,256,176,wall_hor_obj);
room_instance_add(argument0,320,176,wall_hor_obj);
room_instance_add(argument0,288,112,wall_hor_obj);
room_instance_add(argument0,256,112,wall_hor_obj);
room_instance_add(argument0,288,400,wall_hor_obj);
room_instance_add(argument0,320,400,wall_hor_obj);
room_instance_add(argument0,320,336,wall_hor_obj);
room_instance_add(argument0,256,336,wall_hor_obj);
room_instance_add(argument0,320,304,wall_hor_obj);
room_instance_add(argument0,256,304,wall_hor_obj);
room_instance_add(argument0,320,208,wall_hor_obj);
room_instance_add(argument0,320,128,wall_hor_obj);
room_instance_add(argument0,256,384,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,144,256,wall_vert_obj);
room_instance_add(argument0,304,112,wall_vert_obj);
room_instance_add(argument0,272,112,wall_vert_obj);
room_instance_add(argument0,240,128,wall_vert_obj);
room_instance_add(argument0,240,160,wall_vert_obj);
room_instance_add(argument0,336,128,wall_vert_obj);
room_instance_add(argument0,336,160,wall_vert_obj);
room_instance_add(argument0,304,400,wall_vert_obj);
room_instance_add(argument0,272,400,wall_vert_obj);
room_instance_add(argument0,240,384,wall_vert_obj);
room_instance_add(argument0,240,352,wall_vert_obj);
room_instance_add(argument0,336,352,wall_vert_obj);
room_instance_add(argument0,336,384,wall_vert_obj);
room_instance_add(argument0,304,320,wall_vert_obj);
room_instance_add(argument0,272,320,wall_vert_obj);
room_instance_add(argument0,272,192,wall_vert_obj);
room_instance_add(argument0,304,192,wall_vert_obj);
room_instance_add(argument0,336,224,wall_vert_obj);
room_instance_add(argument0,336,256,wall_vert_obj);
room_instance_add(argument0,336,288,wall_vert_obj);
room_instance_add(argument0,240,288,wall_vert_obj);
room_instance_add(argument0,240,224,wall_vert_obj);
// Torches
room_instance_add(argument0,192,240,torch_gold_north_obj);
room_instance_add(argument0,192,272,torch_gold_south_obj);
room_instance_add(argument0,336,256,torch_gold_east_obj);
// Props
room_instance_add(argument0,288,128,doorframe_01_hor_obj);
room_instance_add(argument0,256,128,doorframe_01_hor_obj);
room_instance_add(argument0,288,384,doorframe_01_hor_obj);
room_instance_add(argument0,320,384,doorframe_01_hor_obj);
room_instance_add(argument0,256,128,doorframe_02_hor_obj);
room_instance_add(argument0,288,128,doorframe_02_hor_obj);
room_instance_add(argument0,288,384,doorframe_02_hor_obj);
room_instance_add(argument0,320,384,doorframe_02_hor_obj);