/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 17 A'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 96;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 1184;
    global.spawn_arr[1,1] = 144;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 256;
    global.mark_arr[0,1] = 144;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 576;
    global.mark_arr[1,1] = 144;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 640;
    global.mark_arr[2,1] = 144;
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
")
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
room_instance_add(argument0,128,144,floor_obj);
room_instance_add(argument0,160,144,floor_obj);
room_instance_add(argument0,96,144,floor_obj);
room_instance_add(argument0,192,144,floor_obj);
room_instance_add(argument0,224,144,floor_obj);
room_instance_add(argument0,256,144,floor_obj);
room_instance_add(argument0,288,144,floor_obj);
room_instance_add(argument0,320,144,floor_obj);
room_instance_add(argument0,352,144,floor_obj);
room_instance_add(argument0,384,144,floor_obj);
room_instance_add(argument0,416,144,floor_obj);
room_instance_add(argument0,448,144,floor_obj);
room_instance_add(argument0,480,144,floor_obj);
room_instance_add(argument0,512,144,floor_obj);
room_instance_add(argument0,544,144,floor_obj);
room_instance_add(argument0,576,144,floor_obj);
room_instance_add(argument0,608,144,floor_obj);
room_instance_add(argument0,640,144,floor_obj);
room_instance_add(argument0,672,144,floor_obj);
room_instance_add(argument0,704,144,floor_obj);
room_instance_add(argument0,736,144,floor_obj);
room_instance_add(argument0,768,144,floor_obj);
room_instance_add(argument0,800,144,floor_obj);
room_instance_add(argument0,832,144,floor_obj);
room_instance_add(argument0,864,144,floor_obj);
room_instance_add(argument0,896,144,floor_obj);
room_instance_add(argument0,928,144,floor_obj);
room_instance_add(argument0,960,144,floor_obj);
room_instance_add(argument0,992,144,floor_obj);
room_instance_add(argument0,1024,144,floor_obj);
room_instance_add(argument0,1056,144,floor_obj);
room_instance_add(argument0,1088,144,floor_obj);
room_instance_add(argument0,1120,144,floor_obj);
room_instance_add(argument0,1184,144,floor_obj);
room_instance_add(argument0,1152,144,floor_obj);
// Ceilings
room_instance_add(argument0,128,144,ceil_obj);
room_instance_add(argument0,160,144,ceil_obj);
room_instance_add(argument0,96,144,ceil_obj);
room_instance_add(argument0,192,144,ceil_obj);
room_instance_add(argument0,224,144,ceil_obj);
room_instance_add(argument0,256,144,ceil_obj);
room_instance_add(argument0,288,144,ceil_obj);
room_instance_add(argument0,320,144,ceil_obj);
room_instance_add(argument0,352,144,ceil_obj);
room_instance_add(argument0,384,144,ceil_obj);
room_instance_add(argument0,416,144,ceil_obj);
room_instance_add(argument0,448,144,ceil_obj);
room_instance_add(argument0,480,144,ceil_obj);
room_instance_add(argument0,512,144,ceil_obj);
room_instance_add(argument0,544,144,ceil_obj);
room_instance_add(argument0,576,144,ceil_obj);
room_instance_add(argument0,608,144,ceil_obj);
room_instance_add(argument0,640,144,ceil_obj);
room_instance_add(argument0,672,144,ceil_obj);
room_instance_add(argument0,704,144,ceil_obj);
room_instance_add(argument0,736,144,ceil_obj);
room_instance_add(argument0,768,144,ceil_obj);
room_instance_add(argument0,800,144,ceil_obj);
room_instance_add(argument0,832,144,ceil_obj);
room_instance_add(argument0,864,144,ceil_obj);
room_instance_add(argument0,896,144,ceil_obj);
room_instance_add(argument0,928,144,ceil_obj);
room_instance_add(argument0,960,144,ceil_obj);
room_instance_add(argument0,992,144,ceil_obj);
room_instance_add(argument0,1024,144,ceil_obj);
room_instance_add(argument0,1056,144,ceil_obj);
room_instance_add(argument0,1088,144,ceil_obj);
room_instance_add(argument0,1120,144,ceil_obj);
room_instance_add(argument0,1184,144,ceil_obj);
room_instance_add(argument0,1152,144,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,96,132,wall_hor_obj);
room_instance_add(argument0,96,156,wall_hor_obj);
room_instance_add(argument0,128,156,wall_hor_obj);
room_instance_add(argument0,128,132,wall_hor_obj);
room_instance_add(argument0,160,132,wall_hor_obj);
room_instance_add(argument0,160,156,wall_hor_obj);
room_instance_add(argument0,192,156,wall_hor_obj);
room_instance_add(argument0,224,156,wall_hor_obj);
room_instance_add(argument0,256,156,wall_hor_obj);
room_instance_add(argument0,288,156,wall_hor_obj);
room_instance_add(argument0,320,156,wall_hor_obj);
room_instance_add(argument0,352,156,wall_hor_obj);
room_instance_add(argument0,384,156,wall_hor_obj);
room_instance_add(argument0,416,156,wall_hor_obj);
room_instance_add(argument0,448,156,wall_hor_obj);
room_instance_add(argument0,480,156,wall_hor_obj);
room_instance_add(argument0,512,156,wall_hor_obj);
room_instance_add(argument0,544,156,wall_hor_obj);
room_instance_add(argument0,576,156,wall_hor_obj);
room_instance_add(argument0,608,156,wall_hor_obj);
room_instance_add(argument0,640,156,wall_hor_obj);
room_instance_add(argument0,672,156,wall_hor_obj);
room_instance_add(argument0,704,156,wall_hor_obj);
room_instance_add(argument0,736,156,wall_hor_obj);
room_instance_add(argument0,768,156,wall_hor_obj);
room_instance_add(argument0,800,156,wall_hor_obj);
room_instance_add(argument0,832,156,wall_hor_obj);
room_instance_add(argument0,864,156,wall_hor_obj);
room_instance_add(argument0,896,156,wall_hor_obj);
room_instance_add(argument0,928,156,wall_hor_obj);
room_instance_add(argument0,960,156,wall_hor_obj);
room_instance_add(argument0,992,156,wall_hor_obj);
room_instance_add(argument0,1024,156,wall_hor_obj);
room_instance_add(argument0,1056,156,wall_hor_obj);
room_instance_add(argument0,1088,156,wall_hor_obj);
room_instance_add(argument0,1120,156,wall_hor_obj);
room_instance_add(argument0,1184,156,wall_hor_obj);
room_instance_add(argument0,1184,132,wall_hor_obj);
room_instance_add(argument0,1152,156,wall_hor_obj);
room_instance_add(argument0,1152,132,wall_hor_obj);
room_instance_add(argument0,1120,132,wall_hor_obj);
room_instance_add(argument0,1088,132,wall_hor_obj);
room_instance_add(argument0,1056,132,wall_hor_obj);
room_instance_add(argument0,1024,132,wall_hor_obj);
room_instance_add(argument0,992,132,wall_hor_obj);
room_instance_add(argument0,960,132,wall_hor_obj);
room_instance_add(argument0,928,132,wall_hor_obj);
room_instance_add(argument0,896,132,wall_hor_obj);
room_instance_add(argument0,864,132,wall_hor_obj);
room_instance_add(argument0,832,132,wall_hor_obj);
room_instance_add(argument0,800,132,wall_hor_obj);
room_instance_add(argument0,768,132,wall_hor_obj);
room_instance_add(argument0,736,132,wall_hor_obj);
room_instance_add(argument0,704,132,wall_hor_obj);
room_instance_add(argument0,672,132,wall_hor_obj);
room_instance_add(argument0,640,132,wall_hor_obj);
room_instance_add(argument0,608,132,wall_hor_obj);
room_instance_add(argument0,576,132,wall_hor_obj);
room_instance_add(argument0,544,132,wall_hor_obj);
room_instance_add(argument0,512,132,wall_hor_obj);
room_instance_add(argument0,480,132,wall_hor_obj);
room_instance_add(argument0,192,132,wall_hor_obj);
room_instance_add(argument0,224,132,wall_hor_obj);
room_instance_add(argument0,256,132,wall_hor_obj);
room_instance_add(argument0,288,132,wall_hor_obj);
room_instance_add(argument0,320,132,wall_hor_obj);
room_instance_add(argument0,352,132,wall_hor_obj);
room_instance_add(argument0,384,132,wall_hor_obj);
room_instance_add(argument0,416,132,wall_hor_obj);
room_instance_add(argument0,448,132,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,80,144,wall_vert_obj);
room_instance_add(argument0,1200,144,wall_vert_obj);
// Torches
room_instance_add(argument0,160,132,torch_north_obj);
room_instance_add(argument0,288,132,torch_north_obj);
room_instance_add(argument0,416,132,torch_north_obj);
room_instance_add(argument0,544,132,torch_north_obj);
room_instance_add(argument0,672,132,torch_north_obj);
room_instance_add(argument0,800,132,torch_north_obj);
room_instance_add(argument0,928,132,torch_north_obj);
room_instance_add(argument0,1056,132,torch_north_obj);
room_instance_add(argument0,1056,156,torch_south_obj);
room_instance_add(argument0,928,156,torch_south_obj);
room_instance_add(argument0,800,156,torch_south_obj);
room_instance_add(argument0,672,156,torch_south_obj);
room_instance_add(argument0,544,156,torch_south_obj);
room_instance_add(argument0,416,156,torch_south_obj);
room_instance_add(argument0,288,156,torch_south_obj);
room_instance_add(argument0,160,156,torch_south_obj);
// Not yet
/*room_instance_add(argument0,1008,160,random_scare_mark1);*/
