/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Small Room 17'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 496;
    global.spawn_arr[0,1] = 544;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 528;
    global.spawn_arr[1,1] = 448;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    // Mark
    global.mark_len_var = 1;
    global.mark_arr[0,0] = 504;
    global.mark_arr[0,1] = 508;
    global.mark_arr[0,2] = 0;
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
room_instance_add(argument0,496,448,floor_obj);
room_instance_add(argument0,528,448,floor_obj);
room_instance_add(argument0,560,448,floor_obj);
room_instance_add(argument0,560,480,floor_obj);
room_instance_add(argument0,528,480,floor_obj);
room_instance_add(argument0,496,480,floor_obj);
room_instance_add(argument0,496,512,floor_obj);
room_instance_add(argument0,528,512,floor_obj);
room_instance_add(argument0,560,512,floor_obj);
room_instance_add(argument0,560,544,floor_obj);
room_instance_add(argument0,528,544,floor_obj);
room_instance_add(argument0,496,544,floor_obj);
// Ceilings
room_instance_add(argument0,496,448,ceil_obj);
room_instance_add(argument0,528,448,ceil_obj);
room_instance_add(argument0,560,448,ceil_obj);
room_instance_add(argument0,560,480,ceil_obj);
room_instance_add(argument0,528,480,ceil_obj);
room_instance_add(argument0,496,480,ceil_obj);
room_instance_add(argument0,496,512,ceil_obj);
room_instance_add(argument0,528,512,ceil_obj);
room_instance_add(argument0,560,512,ceil_obj);
room_instance_add(argument0,560,544,ceil_obj);
room_instance_add(argument0,528,544,ceil_obj);
room_instance_add(argument0,496,544,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,496,432,wall_hor_obj);
room_instance_add(argument0,528,432,wall_hor_obj);
room_instance_add(argument0,560,432,wall_hor_obj);
room_instance_add(argument0,560,560,wall_hor_obj);
room_instance_add(argument0,528,560,wall_hor_obj);
room_instance_add(argument0,496,560,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,576,448,wall_vert_obj);
room_instance_add(argument0,576,480,wall_vert_obj);
room_instance_add(argument0,576,512,wall_vert_obj);
room_instance_add(argument0,576,544,wall_vert_obj);
room_instance_add(argument0,480,544,wall_vert_obj);
room_instance_add(argument0,480,512,wall_vert_obj);
room_instance_add(argument0,480,480,wall_vert_obj);
room_instance_add(argument0,480,448,wall_vert_obj);
// Torches
room_instance_add(argument0,496,432,torch_north_obj);
room_instance_add(argument0,560,432,torch_north_obj);
room_instance_add(argument0,480,448,torch_west_obj);
room_instance_add(argument0,576,448,torch_east_obj);
// Props
room_instance_add(argument0,560,544,table_rand_obj);
room_instance_add(argument0,528,464,rug_rand_rot_obj);
room_instance_add(argument0,561,480,bone_rand_obj);
room_instance_add(argument0,576,496,painting_vert_obj);
room_instance_add(argument0,480,496,painting_vert_obj);