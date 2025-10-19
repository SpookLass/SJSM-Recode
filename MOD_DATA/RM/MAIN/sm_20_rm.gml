/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sm','ROOM_sm')+' 20';
	ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 496;
    global.spawn_arr[0,1] = 448;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 656;
    global.spawn_arr[1,1] = 448;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 656;
    global.spawn_arr[2,1] = 544;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Mark
    global.mark_len_var = 2;
    global.mark_arr[0,0] = 528;
    global.mark_arr[0,1] = 488;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 592;
    global.mark_arr[1,1] = 504;
    global.mark_arr[1,2] = 0;
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
// Floors
room_instance_add(argument0,496,448,floor_obj);
room_instance_add(argument0,528,448,floor_obj);
room_instance_add(argument0,560,448,floor_obj);
room_instance_add(argument0,592,448,floor_obj);
room_instance_add(argument0,592,480,floor_obj);
room_instance_add(argument0,560,480,floor_obj);
room_instance_add(argument0,528,480,floor_obj);
room_instance_add(argument0,496,480,floor_obj);
room_instance_add(argument0,496,512,floor_obj);
room_instance_add(argument0,528,512,floor_obj);
room_instance_add(argument0,560,512,floor_obj);
room_instance_add(argument0,592,512,floor_obj);
room_instance_add(argument0,592,544,floor_obj);
room_instance_add(argument0,560,544,floor_obj);
room_instance_add(argument0,528,544,floor_obj);
room_instance_add(argument0,496,544,floor_obj);
room_instance_add(argument0,624,448,floor_obj);
room_instance_add(argument0,656,448,floor_obj);
room_instance_add(argument0,656,480,floor_obj);
room_instance_add(argument0,624,480,floor_obj);
room_instance_add(argument0,624,512,floor_obj);
room_instance_add(argument0,656,512,floor_obj);
room_instance_add(argument0,656,544,floor_obj);
room_instance_add(argument0,624,544,floor_obj);
// Ceilings
room_instance_add(argument0,496,448,ceil_obj);
room_instance_add(argument0,528,448,ceil_obj);
room_instance_add(argument0,560,448,ceil_obj);
room_instance_add(argument0,592,448,ceil_obj);
room_instance_add(argument0,592,480,ceil_obj);
room_instance_add(argument0,560,480,ceil_obj);
room_instance_add(argument0,528,480,ceil_obj);
room_instance_add(argument0,496,480,ceil_obj);
room_instance_add(argument0,496,512,ceil_obj);
room_instance_add(argument0,528,512,ceil_obj);
room_instance_add(argument0,560,512,ceil_obj);
room_instance_add(argument0,592,512,ceil_obj);
room_instance_add(argument0,592,544,ceil_obj);
room_instance_add(argument0,560,544,ceil_obj);
room_instance_add(argument0,528,544,ceil_obj);
room_instance_add(argument0,496,544,ceil_obj);
room_instance_add(argument0,624,448,ceil_obj);
room_instance_add(argument0,656,448,ceil_obj);
room_instance_add(argument0,656,480,ceil_obj);
room_instance_add(argument0,624,480,ceil_obj);
room_instance_add(argument0,624,512,ceil_obj);
room_instance_add(argument0,656,512,ceil_obj);
room_instance_add(argument0,656,544,ceil_obj);
room_instance_add(argument0,624,544,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,496,432,wall_hor_obj);
room_instance_add(argument0,528,432,wall_hor_obj);
room_instance_add(argument0,560,432,wall_hor_obj);
room_instance_add(argument0,592,432,wall_hor_obj);
room_instance_add(argument0,624,432,wall_hor_obj);
room_instance_add(argument0,656,432,wall_hor_obj);
room_instance_add(argument0,656,560,wall_hor_obj);
room_instance_add(argument0,624,560,wall_hor_obj);
room_instance_add(argument0,592,560,wall_hor_obj);
room_instance_add(argument0,560,560,wall_hor_obj);
room_instance_add(argument0,528,560,wall_hor_obj);
room_instance_add(argument0,496,560,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,672,448,wall_vert_obj);
room_instance_add(argument0,672,480,wall_vert_obj);
room_instance_add(argument0,672,512,wall_vert_obj);
room_instance_add(argument0,672,544,wall_vert_obj);
room_instance_add(argument0,480,544,wall_vert_obj);
room_instance_add(argument0,480,448,wall_vert_obj);
room_instance_add(argument0,480,480,wall_vert_obj);
room_instance_add(argument0,480,512,wall_vert_obj);
// Torches
room_instance_add(argument0,528,432,torch_north_obj);
room_instance_add(argument0,624,432,torch_north_obj);
room_instance_add(argument0,624,560,torch_south_obj);
room_instance_add(argument0,528,560,torch_south_obj);
// Props
room_instance_add(argument0,544,544,chair_rand_obj);
room_instance_add(argument0,576,548,table_rand_obj);
room_instance_add(argument0,550,446,bone_rand_obj);
room_instance_add(argument0,652,496,rug_rand_obj);
room_instance_add(argument0,576,456,rug_rand_rot_obj);
room_instance_add(argument0,576,536,rug_rand_rot_obj);
room_instance_add(argument0,576,432,frame_hor_rand_obj);
room_instance_add(argument0,576,560,frame_hor_rand_obj);
room_instance_add(argument0,672,496,frame_vert_rand_obj);