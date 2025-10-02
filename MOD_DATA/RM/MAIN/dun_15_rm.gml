/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Dungeon Room 15'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 992;
    global.spawn_arr[1,1] = 256;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 0;
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,224,224,floor_obj);
room_instance_add(argument0,224,288,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,352,224,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,352,288,floor_obj);
room_instance_add(argument0,384,288,floor_obj);
room_instance_add(argument0,416,288,floor_obj);
room_instance_add(argument0,448,288,floor_obj);
room_instance_add(argument0,480,288,floor_obj);
room_instance_add(argument0,512,288,floor_obj);
room_instance_add(argument0,544,288,floor_obj);
room_instance_add(argument0,576,288,floor_obj);
room_instance_add(argument0,608,288,floor_obj);
room_instance_add(argument0,640,288,floor_obj);
room_instance_add(argument0,672,288,floor_obj);
room_instance_add(argument0,704,288,floor_obj);
room_instance_add(argument0,736,288,floor_obj);
room_instance_add(argument0,768,288,floor_obj);
room_instance_add(argument0,800,288,floor_obj);
room_instance_add(argument0,832,288,floor_obj);
room_instance_add(argument0,864,288,floor_obj);
room_instance_add(argument0,864,256,floor_obj);
room_instance_add(argument0,864,224,floor_obj);
room_instance_add(argument0,832,224,floor_obj);
room_instance_add(argument0,384,224,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
room_instance_add(argument0,416,256,floor_obj);
room_instance_add(argument0,416,224,floor_obj);
room_instance_add(argument0,448,224,floor_obj);
room_instance_add(argument0,448,256,floor_obj);
room_instance_add(argument0,480,256,floor_obj);
room_instance_add(argument0,480,224,floor_obj);
room_instance_add(argument0,512,224,floor_obj);
room_instance_add(argument0,512,256,floor_obj);
room_instance_add(argument0,544,256,floor_obj);
room_instance_add(argument0,544,224,floor_obj);
room_instance_add(argument0,576,224,floor_obj);
room_instance_add(argument0,576,256,floor_obj);
room_instance_add(argument0,608,256,floor_obj);
room_instance_add(argument0,608,224,floor_obj);
room_instance_add(argument0,640,224,floor_obj);
room_instance_add(argument0,640,256,floor_obj);
room_instance_add(argument0,672,256,floor_obj);
room_instance_add(argument0,672,224,floor_obj);
room_instance_add(argument0,704,224,floor_obj);
room_instance_add(argument0,704,256,floor_obj);
room_instance_add(argument0,736,256,floor_obj);
room_instance_add(argument0,736,224,floor_obj);
room_instance_add(argument0,768,224,floor_obj);
room_instance_add(argument0,800,224,floor_obj);
room_instance_add(argument0,800,256,floor_obj);
room_instance_add(argument0,768,256,floor_obj);
room_instance_add(argument0,832,256,floor_obj);
room_instance_add(argument0,896,224,floor_obj);
room_instance_add(argument0,896,256,floor_obj);
room_instance_add(argument0,896,288,floor_obj);
room_instance_add(argument0,928,288,floor_obj);
room_instance_add(argument0,928,256,floor_obj);
room_instance_add(argument0,928,224,floor_obj);
room_instance_add(argument0,960,224,floor_obj);
room_instance_add(argument0,960,256,floor_obj);
room_instance_add(argument0,960,288,floor_obj);
room_instance_add(argument0,992,288,floor_obj);
room_instance_add(argument0,992,256,floor_obj);
room_instance_add(argument0,992,224,floor_obj);
// Ceilings
room_instance_add(argument0,224,256,ceil_2high_obj);
room_instance_add(argument0,256,256,ceil_2high_obj);
room_instance_add(argument0,288,256,ceil_2high_obj);
room_instance_add(argument0,320,256,ceil_2high_obj);
room_instance_add(argument0,224,224,ceil_2high_obj);
room_instance_add(argument0,224,288,ceil_2high_obj);
room_instance_add(argument0,256,224,ceil_2high_obj);
room_instance_add(argument0,288,224,ceil_2high_obj);
room_instance_add(argument0,320,224,ceil_2high_obj);
room_instance_add(argument0,320,288,ceil_2high_obj);
room_instance_add(argument0,288,288,ceil_2high_obj);
room_instance_add(argument0,256,288,ceil_2high_obj);
room_instance_add(argument0,352,224,ceil_2high_obj);
room_instance_add(argument0,352,256,ceil_2high_obj);
room_instance_add(argument0,352,288,ceil_2high_obj);
room_instance_add(argument0,384,288,ceil_2high_obj);
room_instance_add(argument0,416,288,ceil_2high_obj);
room_instance_add(argument0,448,288,ceil_2high_obj);
room_instance_add(argument0,480,288,ceil_2high_obj);
room_instance_add(argument0,512,288,ceil_2high_obj);
room_instance_add(argument0,544,288,ceil_2high_obj);
room_instance_add(argument0,576,288,ceil_2high_obj);
room_instance_add(argument0,608,288,ceil_2high_obj);
room_instance_add(argument0,640,288,ceil_2high_obj);
room_instance_add(argument0,672,288,ceil_2high_obj);
room_instance_add(argument0,704,288,ceil_2high_obj);
room_instance_add(argument0,736,288,ceil_2high_obj);
room_instance_add(argument0,768,288,ceil_2high_obj);
room_instance_add(argument0,800,288,ceil_2high_obj);
room_instance_add(argument0,832,288,ceil_2high_obj);
room_instance_add(argument0,864,288,ceil_2high_obj);
room_instance_add(argument0,864,256,ceil_2high_obj);
room_instance_add(argument0,864,224,ceil_2high_obj);
room_instance_add(argument0,832,224,ceil_2high_obj);
room_instance_add(argument0,384,224,ceil_2high_obj);
room_instance_add(argument0,384,256,ceil_2high_obj);
room_instance_add(argument0,416,256,ceil_2high_obj);
room_instance_add(argument0,416,224,ceil_2high_obj);
room_instance_add(argument0,448,224,ceil_2high_obj);
room_instance_add(argument0,448,256,ceil_2high_obj);
room_instance_add(argument0,480,256,ceil_2high_obj);
room_instance_add(argument0,480,224,ceil_2high_obj);
room_instance_add(argument0,512,224,ceil_2high_obj);
room_instance_add(argument0,512,256,ceil_2high_obj);
room_instance_add(argument0,544,256,ceil_2high_obj);
room_instance_add(argument0,544,224,ceil_2high_obj);
room_instance_add(argument0,576,224,ceil_2high_obj);
room_instance_add(argument0,576,256,ceil_2high_obj);
room_instance_add(argument0,608,256,ceil_2high_obj);
room_instance_add(argument0,608,224,ceil_2high_obj);
room_instance_add(argument0,640,224,ceil_2high_obj);
room_instance_add(argument0,640,256,ceil_2high_obj);
room_instance_add(argument0,672,256,ceil_2high_obj);
room_instance_add(argument0,672,224,ceil_2high_obj);
room_instance_add(argument0,704,224,ceil_2high_obj);
room_instance_add(argument0,704,256,ceil_2high_obj);
room_instance_add(argument0,736,256,ceil_2high_obj);
room_instance_add(argument0,736,224,ceil_2high_obj);
room_instance_add(argument0,768,224,ceil_2high_obj);
room_instance_add(argument0,800,224,ceil_2high_obj);
room_instance_add(argument0,800,256,ceil_2high_obj);
room_instance_add(argument0,768,256,ceil_2high_obj);
room_instance_add(argument0,832,256,ceil_2high_obj);
room_instance_add(argument0,896,224,ceil_2high_obj);
room_instance_add(argument0,896,256,ceil_2high_obj);
room_instance_add(argument0,896,288,ceil_2high_obj);
room_instance_add(argument0,928,288,ceil_2high_obj);
room_instance_add(argument0,928,256,ceil_2high_obj);
room_instance_add(argument0,928,224,ceil_2high_obj);
room_instance_add(argument0,960,224,ceil_2high_obj);
room_instance_add(argument0,960,256,ceil_2high_obj);
room_instance_add(argument0,960,288,ceil_2high_obj);
room_instance_add(argument0,992,288,ceil_2high_obj);
room_instance_add(argument0,992,256,ceil_2high_obj);
room_instance_add(argument0,992,224,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,208,wall_2high_hor_obj);
room_instance_add(argument0,224,304,wall_2high_hor_obj);
room_instance_add(argument0,256,304,wall_2high_hor_obj);
room_instance_add(argument0,288,304,wall_2high_hor_obj);
room_instance_add(argument0,320,304,wall_2high_hor_obj);
room_instance_add(argument0,320,208,wall_2high_hor_obj);
room_instance_add(argument0,288,208,wall_2high_hor_obj);
room_instance_add(argument0,256,208,wall_2high_hor_obj);
room_instance_add(argument0,352,304,wall_2high_hor_obj);
room_instance_add(argument0,992,208,wall_2high_hor_obj);
room_instance_add(argument0,992,304,wall_2high_hor_obj);
room_instance_add(argument0,960,304,wall_2high_hor_obj);
room_instance_add(argument0,928,304,wall_2high_hor_obj);
room_instance_add(argument0,896,304,wall_2high_hor_obj);
room_instance_add(argument0,864,304,wall_2high_hor_obj);
room_instance_add(argument0,960,208,wall_2high_hor_obj);
room_instance_add(argument0,928,208,wall_2high_hor_obj);
room_instance_add(argument0,896,208,wall_2high_hor_obj);
room_instance_add(argument0,864,208,wall_2high_hor_obj);
room_instance_add(argument0,832,208,wall_2high_hor_obj);
room_instance_add(argument0,800,208,wall_2high_hor_obj);
room_instance_add(argument0,768,208,wall_2high_hor_obj);
room_instance_add(argument0,736,208,wall_2high_hor_obj);
room_instance_add(argument0,704,208,wall_2high_hor_obj);
room_instance_add(argument0,672,208,wall_2high_hor_obj);
room_instance_add(argument0,640,208,wall_2high_hor_obj);
room_instance_add(argument0,608,208,wall_2high_hor_obj);
room_instance_add(argument0,576,208,wall_2high_hor_obj);
room_instance_add(argument0,544,208,wall_2high_hor_obj);
room_instance_add(argument0,512,208,wall_2high_hor_obj);
room_instance_add(argument0,512,304,wall_2high_hor_obj);
room_instance_add(argument0,544,304,wall_2high_hor_obj);
room_instance_add(argument0,576,304,wall_2high_hor_obj);
room_instance_add(argument0,608,304,wall_2high_hor_obj);
room_instance_add(argument0,640,304,wall_2high_hor_obj);
room_instance_add(argument0,672,304,wall_2high_hor_obj);
room_instance_add(argument0,704,304,wall_2high_hor_obj);
room_instance_add(argument0,736,304,wall_2high_hor_obj);
room_instance_add(argument0,768,304,wall_2high_hor_obj);
room_instance_add(argument0,800,304,wall_2high_hor_obj);
room_instance_add(argument0,832,304,wall_2high_hor_obj);
room_instance_add(argument0,384,304,wall_2high_hor_obj);
room_instance_add(argument0,384,208,wall_2high_hor_obj);
room_instance_add(argument0,352,208,wall_2high_hor_obj);
room_instance_add(argument0,416,208,wall_2high_hor_obj);
room_instance_add(argument0,448,208,wall_2high_hor_obj);
room_instance_add(argument0,480,208,wall_2high_hor_obj);
room_instance_add(argument0,480,304,wall_2high_hor_obj);
room_instance_add(argument0,448,304,wall_2high_hor_obj);
room_instance_add(argument0,416,304,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,224,wall_2high_vert_obj);
room_instance_add(argument0,208,256,wall_2high_vert_obj);
room_instance_add(argument0,208,288,wall_2high_vert_obj);
room_instance_add(argument0,1008,224,wall_2high_vert_obj);
room_instance_add(argument0,1008,256,wall_2high_vert_obj);
room_instance_add(argument0,1008,288,wall_2high_vert_obj);
// Torches
room_instance_add(argument0,960,208,torch_north_obj);
room_instance_add(argument0,960,304,torch_south_obj);
room_instance_add(argument0,256,208,torch_north_obj);
room_instance_add(argument0,256,304,torch_south_obj);
// Props
room_instance_add(argument0,288,208,chain_hor_rand_obj);
room_instance_add(argument0,288,304,chain_hor_rand_obj);
// Not Yet