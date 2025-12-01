/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Seek Hall Test'
    // Spawn
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 48;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 144;
    global.spawn_arr[1,1] = 48;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    global.spawn_arr[2,0] = 144;
    global.spawn_arr[2,1] = 240;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 90;
    global.spawn_arr[3,0] = 240;
    global.spawn_arr[3,1] = 144;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 180;
    // Doors
    local.lock = lock_scr();
    local.gold = gold_scr(local.lock);
    global.unlock_var = spawn_create_scr(true,local.lock);
    // Gold Effects
    if local.gold
    {
        instance_create(0,0,maze_dark_color_obj);
        instance_create(0,0,maze_dark_fog_obj);
        // Torch 1
        local.torch = instance_create(112,32,torch_gold_north_obj);
        local.torch.door_var = global.spawn_arr[1,4];
        local.torch = instance_create(176,32,torch_gold_north_obj);
        local.torch.door_var = global.spawn_arr[1,4];
        // Torch 2
        local.torch = instance_create(112,256,torch_gold_south_obj);
        local.torch.door_var = global.spawn_arr[2,4];
        local.torch = instance_create(176,256,torch_gold_south_obj);
        local.torch.door_var = global.spawn_arr[2,4];
        // Torch 3
        local.torch = instance_create(256,112,torch_gold_east_obj);
        local.torch.door_var = global.spawn_arr[3,4];
        local.torch = instance_create(256,176,torch_gold_east_obj);
        local.torch.door_var = global.spawn_arr[3,4];
    }
    else
    {
        instance_create(0,0,color_control_02_obj);
        instance_create(0,0,fog_01_obj);
    }
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
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,48,112,floor_obj);
room_instance_add(argument0,48,144,floor_obj);
room_instance_add(argument0,48,176,floor_obj);
room_instance_add(argument0,80,112,floor_obj);
room_instance_add(argument0,80,144,floor_obj);
room_instance_add(argument0,80,176,floor_obj);
room_instance_add(argument0,112,48,floor_obj);
room_instance_add(argument0,112,80,floor_obj);
room_instance_add(argument0,112,112,floor_obj);
room_instance_add(argument0,112,144,floor_obj);
room_instance_add(argument0,112,176,floor_obj);
room_instance_add(argument0,112,208,floor_obj);
room_instance_add(argument0,112,240,floor_obj);
room_instance_add(argument0,144,48,floor_obj);
room_instance_add(argument0,144,80,floor_obj);
room_instance_add(argument0,144,112,floor_obj);
room_instance_add(argument0,144,176,floor_obj);
room_instance_add(argument0,144,208,floor_obj);
room_instance_add(argument0,144,240,floor_obj);
room_instance_add(argument0,176,48,floor_obj);
room_instance_add(argument0,176,80,floor_obj);
room_instance_add(argument0,176,112,floor_obj);
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,176,176,floor_obj);
room_instance_add(argument0,176,208,floor_obj);
room_instance_add(argument0,176,240,floor_obj);
room_instance_add(argument0,208,112,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
// Ceils
room_instance_add(argument0,48,112,ceil_obj);
room_instance_add(argument0,48,144,ceil_obj);
room_instance_add(argument0,48,176,ceil_obj);
room_instance_add(argument0,80,112,ceil_obj);
room_instance_add(argument0,80,144,ceil_obj);
room_instance_add(argument0,80,176,ceil_obj);
room_instance_add(argument0,112,48,ceil_obj);
room_instance_add(argument0,112,80,ceil_obj);
room_instance_add(argument0,112,112,ceil_obj);
room_instance_add(argument0,112,144,ceil_obj);
room_instance_add(argument0,112,176,ceil_obj);
room_instance_add(argument0,112,208,ceil_obj);
room_instance_add(argument0,112,240,ceil_obj);
room_instance_add(argument0,144,48,ceil_obj);
room_instance_add(argument0,144,80,ceil_obj);
room_instance_add(argument0,144,112,ceil_obj);
room_instance_add(argument0,144,176,ceil_obj);
room_instance_add(argument0,144,208,ceil_obj);
room_instance_add(argument0,144,240,ceil_obj);
room_instance_add(argument0,176,48,ceil_obj);
room_instance_add(argument0,176,80,ceil_obj);
room_instance_add(argument0,176,112,ceil_obj);
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,176,176,ceil_obj);
room_instance_add(argument0,176,208,ceil_obj);
room_instance_add(argument0,176,240,ceil_obj);
room_instance_add(argument0,208,112,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,208,176,ceil_obj);
room_instance_add(argument0,240,112,ceil_obj);
room_instance_add(argument0,240,144,ceil_obj);
room_instance_add(argument0,240,176,ceil_obj);
// Walls (Vertical)
room_instance_add(argument0,32,112,wall_vert_obj);
room_instance_add(argument0,32,144,wall_vert_obj);
room_instance_add(argument0,32,176,wall_vert_obj);
room_instance_add(argument0,96,48,wall_vert_obj);
room_instance_add(argument0,96,80,wall_vert_obj);
room_instance_add(argument0,96,208,wall_vert_obj);
room_instance_add(argument0,96,240,wall_vert_obj);
room_instance_add(argument0,128,144,wall_vert_obj);
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,192,48,wall_vert_obj);
room_instance_add(argument0,192,80,wall_vert_obj);
room_instance_add(argument0,192,208,wall_vert_obj);
room_instance_add(argument0,192,240,wall_vert_obj);
room_instance_add(argument0,256,112,wall_vert_obj);
room_instance_add(argument0,256,144,wall_vert_obj);
room_instance_add(argument0,256,176,wall_vert_obj);
// Walls (Horizontal)
room_instance_add(argument0,48,96,wall_hor_obj);
room_instance_add(argument0,48,192,wall_hor_obj);
room_instance_add(argument0,80,96,wall_hor_obj);
room_instance_add(argument0,80,192,wall_hor_obj);
room_instance_add(argument0,112,32,wall_hor_obj);
room_instance_add(argument0,112,256,wall_hor_obj);
room_instance_add(argument0,144,32,wall_hor_obj);
room_instance_add(argument0,144,128,wall_hor_obj);
room_instance_add(argument0,144,160,wall_hor_obj);
room_instance_add(argument0,144,256,wall_hor_obj);
room_instance_add(argument0,176,32,wall_hor_obj);
room_instance_add(argument0,176,256,wall_hor_obj);
room_instance_add(argument0,208,96,wall_hor_obj);
room_instance_add(argument0,208,192,wall_hor_obj);
room_instance_add(argument0,240,96,wall_hor_obj);
room_instance_add(argument0,240,192,wall_hor_obj);