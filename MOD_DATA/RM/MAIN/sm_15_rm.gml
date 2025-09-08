/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Small Room 15'
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 544;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 608;
    global.spawn_arr[1,1] = 224;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 608;
    global.spawn_arr[2,1] = 320;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Mark
    global.mark_len_var = 1;
    global.mark_arr[0,0] = 584;
    global.mark_arr[0,1] = 264;
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
room_instance_add(argument0,544,256,floor_obj);
room_instance_add(argument0,576,256,floor_obj);
room_instance_add(argument0,576,224,floor_obj);
room_instance_add(argument0,576,288,floor_obj);
room_instance_add(argument0,608,224,floor_obj);
room_instance_add(argument0,608,256,floor_obj);
room_instance_add(argument0,608,288,floor_obj);
room_instance_add(argument0,608,320,floor_obj);
room_instance_add(argument0,576,320,floor_obj);
// Ceilings
room_instance_add(argument0,544,256,ceil_obj);
room_instance_add(argument0,576,256,ceil_obj);
room_instance_add(argument0,576,224,ceil_obj);
room_instance_add(argument0,576,288,ceil_obj);
room_instance_add(argument0,608,224,ceil_obj);
room_instance_add(argument0,608,256,ceil_obj);
room_instance_add(argument0,608,288,ceil_obj);
room_instance_add(argument0,608,320,ceil_obj);
room_instance_add(argument0,576,320,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,544,240,wall_hor_obj);
room_instance_add(argument0,544,272,wall_hor_obj);
room_instance_add(argument0,576,208,wall_hor_obj);
room_instance_add(argument0,608,208,wall_hor_obj);
room_instance_add(argument0,608,336,wall_hor_obj);
room_instance_add(argument0,576,336,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,560,224,wall_vert_obj);
room_instance_add(argument0,528,256,wall_vert_obj);
room_instance_add(argument0,624,224,wall_vert_obj);
room_instance_add(argument0,624,256,wall_vert_obj);
room_instance_add(argument0,624,288,wall_vert_obj);
room_instance_add(argument0,624,320,wall_vert_obj);
room_instance_add(argument0,560,288,wall_vert_obj);
room_instance_add(argument0,560,320,wall_vert_obj);
// Torches
room_instance_add(argument0,624,256,torch_east_obj);
room_instance_add(argument0,624,288,torch_east_obj);
// Props
room_instance_add(argument0,616,272,table_rand_obj);