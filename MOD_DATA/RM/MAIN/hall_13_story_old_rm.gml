/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 13 Story Old'
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 144;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 240;
    global.spawn_arr[1,1] = 48;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 240;
    global.spawn_arr[2,1] = 240;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 144;
    global.mark_arr[0,1] = 144;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 176;
    global.mark_arr[1,1] = 48;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 336;
    global.mark_arr[2,1] = 176;
    global.mark_arr[2,2] = 0;
    // Doors
    local.entrance = instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),door_entrance_obj);
    local.entrance.z = global.spawn_arr[0,2];
    local.entrance.direction = global.spawn_arr[0,3]+180;
    // Exit
    local.unlock = irandom_range(1,global.spawn_len_var-1);
    if local.unlock == 1 { global.mark_arr[0,1] = 176; }
    else { global.mark_arr[0,1] = 112; }
    for (local.i=1; local.i<global.spawn_len_var; local.i+=1;)
    {
        local.exitdoor = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),door_obj);
        local.exitdoor.direction = global.spawn_arr[local.i,3]+180;
        local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),door_trig_obj);
        local.exittrig.z = global.spawn_arr[local.i,2];
        if local.i != local.unlock { local.exittrig.lock_var = true; }
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
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,144,144,floor_obj);
room_instance_add(argument0,144,48,floor_obj);
room_instance_add(argument0,144,80,floor_obj);
room_instance_add(argument0,144,112,floor_obj);
room_instance_add(argument0,144,176,floor_obj);
room_instance_add(argument0,144,208,floor_obj);
room_instance_add(argument0,144,240,floor_obj);
room_instance_add(argument0,176,48,floor_obj);
room_instance_add(argument0,176,240,floor_obj);
room_instance_add(argument0,208,48,floor_obj);
room_instance_add(argument0,208,240,floor_obj);
room_instance_add(argument0,240,48,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
// Ceils
room_instance_add(argument0,144,144,ceil_obj);
room_instance_add(argument0,144,48,ceil_obj);
room_instance_add(argument0,144,80,ceil_obj);
room_instance_add(argument0,144,112,ceil_obj);
room_instance_add(argument0,144,176,ceil_obj);
room_instance_add(argument0,144,208,ceil_obj);
room_instance_add(argument0,144,240,ceil_obj);
room_instance_add(argument0,176,48,ceil_obj);
room_instance_add(argument0,176,240,ceil_obj);
room_instance_add(argument0,208,48,ceil_obj);
room_instance_add(argument0,208,240,ceil_obj);
room_instance_add(argument0,240,48,ceil_obj);
room_instance_add(argument0,240,240,ceil_obj);
// Walls (Vertical)
room_instance_add(argument0,128,144,wall_vert_obj);
room_instance_add(argument0,128,48,wall_vert_obj);
room_instance_add(argument0,128,80,wall_vert_obj);
room_instance_add(argument0,128,112,wall_vert_obj);
room_instance_add(argument0,128,176,wall_vert_obj);
room_instance_add(argument0,128,208,wall_vert_obj);
room_instance_add(argument0,128,240,wall_vert_obj);
room_instance_add(argument0,160,80,wall_vert_obj);
room_instance_add(argument0,160,112,wall_vert_obj);
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,160,176,wall_vert_obj);
room_instance_add(argument0,160,208,wall_vert_obj);
room_instance_add(argument0,256,48,wall_vert_obj);
room_instance_add(argument0,256,240,wall_vert_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,32,wall_hor_obj);
room_instance_add(argument0,144,256,wall_hor_obj);
room_instance_add(argument0,176,32,wall_hor_obj);
room_instance_add(argument0,176,64,wall_hor_obj);
room_instance_add(argument0,176,224,wall_hor_obj);
room_instance_add(argument0,176,256,wall_hor_obj);
room_instance_add(argument0,208,32,wall_hor_obj);
room_instance_add(argument0,208,64,wall_hor_obj);
room_instance_add(argument0,208,224,wall_hor_obj);
room_instance_add(argument0,208,256,wall_hor_obj);
room_instance_add(argument0,240,32,wall_hor_obj);
room_instance_add(argument0,240,64,wall_hor_obj);
room_instance_add(argument0,240,224,wall_hor_obj);
room_instance_add(argument0,240,256,wall_hor_obj);
// Torches
room_instance_add(argument0,144,32,torch_north_obj);
room_instance_add(argument0,144,256,torch_south_obj);
room_instance_add(argument0,208,32,torch_north_obj);
room_instance_add(argument0,208,64,torch_south_obj);
room_instance_add(argument0,208,224,torch_north_obj);
room_instance_add(argument0,208,256,torch_south_obj);
/* Not ready yet
room_instance_add(argument0,324,160,global.js_obj);
*/