/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 21 A'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 576;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 592;
    global.spawn_arr[1,1] = 480;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 304;
    global.mark_arr[0,1] = 576;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 432;
    global.mark_arr[1,1] = 640;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 592;
    global.mark_arr[2,1] = 512;
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
// Floors
room_instance_add(argument0,112,576,floor_obj);
room_instance_add(argument0,144,576,floor_obj);
room_instance_add(argument0,176,576,floor_obj);
room_instance_add(argument0,208,576,floor_obj);
room_instance_add(argument0,240,576,floor_obj);
room_instance_add(argument0,272,576,floor_obj);
room_instance_add(argument0,304,576,floor_obj);
room_instance_add(argument0,336,576,floor_obj);
room_instance_add(argument0,368,576,floor_obj);
room_instance_add(argument0,400,576,floor_obj);
room_instance_add(argument0,432,576,floor_obj);
room_instance_add(argument0,432,608,floor_obj);
room_instance_add(argument0,432,640,floor_obj);
room_instance_add(argument0,432,672,floor_obj);
room_instance_add(argument0,464,672,floor_obj);
room_instance_add(argument0,496,672,floor_obj);
room_instance_add(argument0,528,672,floor_obj);
room_instance_add(argument0,560,672,floor_obj);
room_instance_add(argument0,464,576,floor_obj);
room_instance_add(argument0,496,576,floor_obj);
room_instance_add(argument0,560,576,floor_obj);
room_instance_add(argument0,592,672,floor_obj);
room_instance_add(argument0,592,640,floor_obj);
room_instance_add(argument0,592,608,floor_obj);
room_instance_add(argument0,592,576,floor_obj);
room_instance_add(argument0,592,544,floor_obj);
room_instance_add(argument0,592,512,floor_obj);
room_instance_add(argument0,592,480,floor_obj);
room_instance_add(argument0,528,576,floor_obj);
// Ceilings
room_instance_add(argument0,112,576,ceil_obj);
room_instance_add(argument0,144,576,ceil_obj);
room_instance_add(argument0,176,576,ceil_obj);
room_instance_add(argument0,208,576,ceil_obj);
room_instance_add(argument0,240,576,ceil_obj);
room_instance_add(argument0,272,576,ceil_obj);
room_instance_add(argument0,304,576,ceil_obj);
room_instance_add(argument0,336,576,ceil_obj);
room_instance_add(argument0,368,576,ceil_obj);
room_instance_add(argument0,400,576,ceil_obj);
room_instance_add(argument0,432,576,ceil_obj);
room_instance_add(argument0,432,608,ceil_obj);
room_instance_add(argument0,432,640,ceil_obj);
room_instance_add(argument0,432,672,ceil_obj);
room_instance_add(argument0,464,672,ceil_obj);
room_instance_add(argument0,496,672,ceil_obj);
room_instance_add(argument0,528,672,ceil_obj);
room_instance_add(argument0,560,672,ceil_obj);
room_instance_add(argument0,464,576,ceil_obj);
room_instance_add(argument0,496,576,ceil_obj);
room_instance_add(argument0,560,576,ceil_obj);
room_instance_add(argument0,592,672,ceil_obj);
room_instance_add(argument0,592,640,ceil_obj);
room_instance_add(argument0,592,608,ceil_obj);
room_instance_add(argument0,592,576,ceil_obj);
room_instance_add(argument0,592,544,ceil_obj);
room_instance_add(argument0,592,512,ceil_obj);
room_instance_add(argument0,592,480,ceil_obj);
room_instance_add(argument0,528,576,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,560,560,wall_hor_obj);
room_instance_add(argument0,496,560,wall_hor_obj);
room_instance_add(argument0,464,560,wall_hor_obj);
room_instance_add(argument0,464,592,wall_hor_obj);
room_instance_add(argument0,496,592,wall_hor_obj);
room_instance_add(argument0,560,592,wall_hor_obj);
room_instance_add(argument0,592,688,wall_hor_obj);
room_instance_add(argument0,560,688,wall_hor_obj);
room_instance_add(argument0,560,656,wall_hor_obj);
room_instance_add(argument0,528,656,wall_hor_obj);
room_instance_add(argument0,496,656,wall_hor_obj);
room_instance_add(argument0,464,656,wall_hor_obj);
room_instance_add(argument0,464,688,wall_hor_obj);
room_instance_add(argument0,496,688,wall_hor_obj);
room_instance_add(argument0,528,688,wall_hor_obj);
room_instance_add(argument0,432,688,wall_hor_obj);
room_instance_add(argument0,112,560,wall_hor_obj);
room_instance_add(argument0,144,560,wall_hor_obj);
room_instance_add(argument0,176,560,wall_hor_obj);
room_instance_add(argument0,208,560,wall_hor_obj);
room_instance_add(argument0,240,560,wall_hor_obj);
room_instance_add(argument0,272,560,wall_hor_obj);
room_instance_add(argument0,304,560,wall_hor_obj);
room_instance_add(argument0,336,560,wall_hor_obj);
room_instance_add(argument0,368,560,wall_hor_obj);
room_instance_add(argument0,400,560,wall_hor_obj);
room_instance_add(argument0,432,560,wall_hor_obj);
room_instance_add(argument0,400,592,wall_hor_obj);
room_instance_add(argument0,368,592,wall_hor_obj);
room_instance_add(argument0,336,592,wall_hor_obj);
room_instance_add(argument0,304,592,wall_hor_obj);
room_instance_add(argument0,272,592,wall_hor_obj);
room_instance_add(argument0,240,592,wall_hor_obj);
room_instance_add(argument0,208,592,wall_hor_obj);
room_instance_add(argument0,176,592,wall_hor_obj);
room_instance_add(argument0,144,592,wall_hor_obj);
room_instance_add(argument0,112,592,wall_hor_obj);
room_instance_add(argument0,592,464,wall_hor_obj);
room_instance_add(argument0,528,560,wall_hor_obj);
room_instance_add(argument0,528,592,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,576,wall_vert_obj);
room_instance_add(argument0,608,480,wall_vert_obj);
room_instance_add(argument0,608,512,wall_vert_obj);
room_instance_add(argument0,608,544,wall_vert_obj);
room_instance_add(argument0,576,544,wall_vert_obj);
room_instance_add(argument0,576,512,wall_vert_obj);
room_instance_add(argument0,576,480,wall_vert_obj);
room_instance_add(argument0,576,608,wall_vert_obj);
room_instance_add(argument0,576,640,wall_vert_obj);
room_instance_add(argument0,448,608,wall_vert_obj);
room_instance_add(argument0,448,640,wall_vert_obj);
room_instance_add(argument0,416,608,wall_vert_obj);
room_instance_add(argument0,416,640,wall_vert_obj);
room_instance_add(argument0,416,672,wall_vert_obj);
room_instance_add(argument0,608,672,wall_vert_obj);
room_instance_add(argument0,608,640,wall_vert_obj);
room_instance_add(argument0,608,608,wall_vert_obj);
room_instance_add(argument0,608,576,wall_vert_obj);
// Torches
room_instance_add(argument0,176,560,torch_north_obj);
room_instance_add(argument0,272,560,torch_north_obj);
room_instance_add(argument0,368,560,torch_north_obj);
room_instance_add(argument0,464,560,torch_north_obj);
room_instance_add(argument0,560,560,torch_north_obj);
room_instance_add(argument0,176,592,torch_south_obj);
room_instance_add(argument0,272,592,torch_south_obj);
room_instance_add(argument0,368,592,torch_south_obj);
room_instance_add(argument0,464,592,torch_south_obj);
room_instance_add(argument0,560,592,torch_south_obj);
// Not yet
/*room_instance_add(argument0,416,592,random_scare_mark1);
room_instance_add(argument0,428,566,webs_obj);
room_instance_add(argument0,468,683,webs_obj);
room_instance_add(argument0,581,620,webs_obj);*/