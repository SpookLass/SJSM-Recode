/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 336;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 608;
    global.spawn_arr[1,1] = 336;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 320;
    global.mark_arr[0,1] = 328;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 448;
    global.mark_arr[1,1] = 344;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 560;
    global.mark_arr[2,1] = 328;
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
room_instance_add(argument0,224,336,floor_obj);
room_instance_add(argument0,256,336,floor_obj);
room_instance_add(argument0,288,336,floor_obj);
room_instance_add(argument0,320,336,floor_obj);
room_instance_add(argument0,352,336,floor_obj);
room_instance_add(argument0,384,336,floor_obj);
room_instance_add(argument0,416,336,floor_obj);
room_instance_add(argument0,448,336,floor_obj);
room_instance_add(argument0,480,336,floor_obj);
room_instance_add(argument0,512,336,floor_obj);
room_instance_add(argument0,544,336,floor_obj);
room_instance_add(argument0,576,336,floor_obj);
room_instance_add(argument0,608,336,floor_obj);
// Ceilings
room_instance_add(argument0,224,336,ceil_obj);
room_instance_add(argument0,256,336,ceil_obj);
room_instance_add(argument0,288,336,ceil_obj);
room_instance_add(argument0,320,336,ceil_obj);
room_instance_add(argument0,352,336,ceil_obj);
room_instance_add(argument0,384,336,ceil_obj);
room_instance_add(argument0,416,336,ceil_obj);
room_instance_add(argument0,448,336,ceil_obj);
room_instance_add(argument0,480,336,ceil_obj);
room_instance_add(argument0,512,336,ceil_obj);
room_instance_add(argument0,544,336,ceil_obj);
room_instance_add(argument0,576,336,ceil_obj);
room_instance_add(argument0,608,336,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,328,wall_hor_obj);
room_instance_add(argument0,224,344,wall_hor_obj);
room_instance_add(argument0,256,328,wall_hor_obj);
room_instance_add(argument0,256,344,wall_hor_obj);
room_instance_add(argument0,288,344,wall_hor_obj);
room_instance_add(argument0,288,328,wall_hor_obj);
room_instance_add(argument0,320,328,wall_hor_obj);
room_instance_add(argument0,320,344,wall_hor_obj);
room_instance_add(argument0,352,344,wall_hor_obj);
room_instance_add(argument0,352,328,wall_hor_obj);
room_instance_add(argument0,384,328,wall_hor_obj);
room_instance_add(argument0,384,344,wall_hor_obj);
room_instance_add(argument0,416,344,wall_hor_obj);
room_instance_add(argument0,416,328,wall_hor_obj);
room_instance_add(argument0,448,328,wall_hor_obj);
room_instance_add(argument0,448,344,wall_hor_obj);
room_instance_add(argument0,480,344,wall_hor_obj);
room_instance_add(argument0,480,328,wall_hor_obj);
room_instance_add(argument0,512,328,wall_hor_obj);
room_instance_add(argument0,512,344,wall_hor_obj);
room_instance_add(argument0,544,344,wall_hor_obj);
room_instance_add(argument0,544,328,wall_hor_obj);
room_instance_add(argument0,576,328,wall_hor_obj);
room_instance_add(argument0,576,344,wall_hor_obj);
room_instance_add(argument0,608,328,wall_hor_obj);
room_instance_add(argument0,608,344,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,336,wall_vert_obj);
room_instance_add(argument0,624,336,wall_vert_obj);
// Torches
// Not yet
/**/