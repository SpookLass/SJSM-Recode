/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 1';
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;    // X
    global.spawn_arr[0,1] = 144;    // Y
    global.spawn_arr[0,2] = 0;      // Z
    global.spawn_arr[0,3] = 0;      // Angle (0 is right, 90 is up, etc)
    // Spawn 1 (exit)
    global.spawn_arr[1,0] = 336;
    global.spawn_arr[1,1] = 240;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    // Mark 0
    global.mark_arr[0,0] = 240;     // X
    global.mark_arr[0,1] = 144;     // Y
    global.mark_arr[0,2] = 0;       // Z
    // Mark 1
    global.mark_arr[1,0] = 336;
    global.mark_arr[1,1] = 144;
    global.mark_arr[1,2] = 0;
    // Mark 2
    global.mark_arr[2,0] = 336;
    global.mark_arr[2,1] = 176;
    global.mark_arr[2,2] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    local.entrance = instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),door_entrance_obj);
    local.entrance.z = global.spawn_arr[0,2];
    local.entrance.direction = global.spawn_arr[0,3]+180;
    for (local.i=1; local.i<global.spawn_len_var; local.i+=1;)
    {
        local.exitdoor = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),door_obj);
        local.exitdoor.direction = global.spawn_arr[local.i,3]+180;
        local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),door_trig_obj);
        local.exittrig.z = global.spawn_arr[local.i,2];
    }
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
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Walls (Horizontal)
room_instance_add(argument0,336,128,wall_hor_obj);
room_instance_add(argument0,304,128,wall_hor_obj);
room_instance_add(argument0,308,160,wall_hor_obj);
room_instance_add(argument0,336,256,wall_hor_obj);
room_instance_add(argument0,180,160,wall_hor_obj);
room_instance_add(argument0,212,160,wall_hor_obj);
room_instance_add(argument0,176,128,wall_hor_obj);
room_instance_add(argument0,208,128,wall_hor_obj);
room_instance_add(argument0,240,128,wall_hor_obj);
room_instance_add(argument0,272,128,wall_hor_obj);
room_instance_add(argument0,276,160,wall_hor_obj);
room_instance_add(argument0,244,160,wall_hor_obj);
room_instance_add(argument0,148,160,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,324,240,wall_vert_obj);
room_instance_add(argument0,348,240,wall_vert_obj);
room_instance_add(argument0,348,144,wall_vert_obj);
room_instance_add(argument0,348,176,wall_vert_obj);
room_instance_add(argument0,348,208,wall_vert_obj);
room_instance_add(argument0,324,176,wall_vert_obj);
room_instance_add(argument0,324,208,wall_vert_obj);
room_instance_add(argument0,160,144,wall_vert_obj);
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,336,176,floor_obj);
room_instance_add(argument0,336,208,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,240,144,ceil_obj);
room_instance_add(argument0,272,144,ceil_obj);
room_instance_add(argument0,304,144,ceil_obj);
room_instance_add(argument0,336,144,ceil_obj);
room_instance_add(argument0,336,176,ceil_obj);
room_instance_add(argument0,336,208,ceil_obj);
room_instance_add(argument0,336,240,ceil_obj);
// Torches
room_instance_add(argument0,208,128,torch_north_obj);
room_instance_add(argument0,272,128,torch_north_obj);
room_instance_add(argument0,208,160,torch_south_obj);
room_instance_add(argument0,272,160,torch_south_obj);
room_instance_add(argument0,324,208,torch_west_obj);
room_instance_add(argument0,348,208,torch_east_obj);
// Jumpscare
room_instance_add(argument0,324,160,js_obj);