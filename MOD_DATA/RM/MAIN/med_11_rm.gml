/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Med Room 11'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 416;
    global.spawn_arr[0,1] = 336;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 672;
    global.spawn_arr[1,1] = 336;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 0;
    /*global.mark_arr[0,0] = 164;
    global.mark_arr[0,1] = 346;
    global.mark_arr[0,2] = 0;*/
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
room_instance_add(argument0,0,0,color_control_med_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,water_obj);
// Floors
room_instance_add(argument0,416,336,floor_obj);
room_instance_add(argument0,448,336,floor_obj);
room_instance_add(argument0,480,336,floor_obj);
room_instance_add(argument0,416,304,floor_obj);
room_instance_add(argument0,416,368,floor_obj);
room_instance_add(argument0,416,400,floor_obj);
room_instance_add(argument0,416,272,floor_obj);
room_instance_add(argument0,512,336,floor_obj);
room_instance_add(argument0,544,336,floor_obj);
room_instance_add(argument0,544,368,floor_obj);
room_instance_add(argument0,544,400,floor_obj);
room_instance_add(argument0,544,304,floor_obj);
room_instance_add(argument0,544,272,floor_obj);
room_instance_add(argument0,672,272,floor_obj);
room_instance_add(argument0,672,304,floor_obj);
room_instance_add(argument0,672,336,floor_obj);
room_instance_add(argument0,640,336,floor_obj);
room_instance_add(argument0,608,336,floor_obj);
room_instance_add(argument0,576,336,floor_obj);
room_instance_add(argument0,672,400,floor_obj);
room_instance_add(argument0,672,368,floor_obj);
// Ceilings
room_instance_add(argument0,416,336,ceil_obj);
room_instance_add(argument0,448,336,ceil_obj);
room_instance_add(argument0,480,336,ceil_obj);
room_instance_add(argument0,416,304,ceil_obj);
room_instance_add(argument0,416,368,ceil_obj);
room_instance_add(argument0,416,400,ceil_obj);
room_instance_add(argument0,416,272,ceil_obj);
room_instance_add(argument0,512,336,ceil_obj);
room_instance_add(argument0,544,336,ceil_obj);
room_instance_add(argument0,544,368,ceil_obj);
room_instance_add(argument0,544,400,ceil_obj);
room_instance_add(argument0,544,304,ceil_obj);
room_instance_add(argument0,544,272,ceil_obj);
room_instance_add(argument0,672,272,ceil_obj);
room_instance_add(argument0,672,304,ceil_obj);
room_instance_add(argument0,672,336,ceil_obj);
room_instance_add(argument0,640,336,ceil_obj);
room_instance_add(argument0,608,336,ceil_obj);
room_instance_add(argument0,576,336,ceil_obj);
room_instance_add(argument0,672,400,ceil_obj);
room_instance_add(argument0,672,368,ceil_obj);
room_instance_add(argument0,448,272,ceil_obj);
room_instance_add(argument0,480,272,ceil_obj);
room_instance_add(argument0,512,272,ceil_obj);
room_instance_add(argument0,512,304,ceil_obj);
room_instance_add(argument0,480,304,ceil_obj);
room_instance_add(argument0,448,304,ceil_obj);
room_instance_add(argument0,576,272,ceil_obj);
room_instance_add(argument0,608,272,ceil_obj);
room_instance_add(argument0,640,272,ceil_obj);
room_instance_add(argument0,640,304,ceil_obj);
room_instance_add(argument0,608,304,ceil_obj);
room_instance_add(argument0,576,304,ceil_obj);
room_instance_add(argument0,576,368,ceil_obj);
room_instance_add(argument0,608,368,ceil_obj);
room_instance_add(argument0,640,368,ceil_obj);
room_instance_add(argument0,640,400,ceil_obj);
room_instance_add(argument0,608,400,ceil_obj);
room_instance_add(argument0,576,400,ceil_obj);
room_instance_add(argument0,512,368,ceil_obj);
room_instance_add(argument0,512,400,ceil_obj);
room_instance_add(argument0,480,400,ceil_obj);
room_instance_add(argument0,448,400,ceil_obj);
room_instance_add(argument0,448,368,ceil_obj);
room_instance_add(argument0,480,368,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,416,256,wall_hor_obj);
room_instance_add(argument0,448,256,wall_hor_obj);
room_instance_add(argument0,480,256,wall_hor_obj);
room_instance_add(argument0,512,256,wall_hor_obj);
room_instance_add(argument0,544,256,wall_hor_obj);
room_instance_add(argument0,576,256,wall_hor_obj);
room_instance_add(argument0,608,256,wall_hor_obj);
room_instance_add(argument0,640,256,wall_hor_obj);
room_instance_add(argument0,640,416,wall_hor_obj);
room_instance_add(argument0,608,416,wall_hor_obj);
room_instance_add(argument0,576,416,wall_hor_obj);
room_instance_add(argument0,544,416,wall_hor_obj);
room_instance_add(argument0,512,416,wall_hor_obj);
room_instance_add(argument0,480,416,wall_hor_obj);
room_instance_add(argument0,448,416,wall_hor_obj);
room_instance_add(argument0,416,416,wall_hor_obj);
room_instance_add(argument0,672,256,wall_hor_obj);
room_instance_add(argument0,672,416,wall_hor_obj);
room_instance_add(argument0,448,320,wall_pit_hor_obj);
room_instance_add(argument0,480,320,wall_pit_hor_obj);
room_instance_add(argument0,512,320,wall_pit_hor_obj);
room_instance_add(argument0,512,352,wall_pit_hor_obj);
room_instance_add(argument0,480,352,wall_pit_hor_obj);
room_instance_add(argument0,448,352,wall_pit_hor_obj);
room_instance_add(argument0,576,352,wall_pit_hor_obj);
room_instance_add(argument0,576,320,wall_pit_hor_obj);
room_instance_add(argument0,608,320,wall_pit_hor_obj);
room_instance_add(argument0,640,320,wall_pit_hor_obj);
room_instance_add(argument0,640,352,wall_pit_hor_obj);
room_instance_add(argument0,608,352,wall_pit_hor_obj);
room_instance_add(argument0,480,256,wall_pit_hor_obj);
room_instance_add(argument0,512,256,wall_pit_hor_obj);
room_instance_add(argument0,576,256,wall_pit_hor_obj);
room_instance_add(argument0,608,256,wall_pit_hor_obj);
room_instance_add(argument0,640,256,wall_pit_hor_obj);
room_instance_add(argument0,640,416,wall_pit_hor_obj);
room_instance_add(argument0,608,416,wall_pit_hor_obj);
room_instance_add(argument0,576,416,wall_pit_hor_obj);
room_instance_add(argument0,512,416,wall_pit_hor_obj);
room_instance_add(argument0,480,416,wall_pit_hor_obj);
room_instance_add(argument0,448,416,wall_pit_hor_obj);
room_instance_add(argument0,448,256,wall_pit_hor_obj);
room_instance_add(argument0,448,320,wall_float_hor_obj);
room_instance_add(argument0,480,320,wall_float_hor_obj);
room_instance_add(argument0,512,320,wall_float_hor_obj);
room_instance_add(argument0,512,352,wall_float_hor_obj);
room_instance_add(argument0,480,352,wall_float_hor_obj);
room_instance_add(argument0,448,352,wall_float_hor_obj);
room_instance_add(argument0,576,352,wall_float_hor_obj);
room_instance_add(argument0,576,320,wall_float_hor_obj);
room_instance_add(argument0,608,320,wall_float_hor_obj);
room_instance_add(argument0,640,320,wall_float_hor_obj);
room_instance_add(argument0,640,352,wall_float_hor_obj);
room_instance_add(argument0,608,352,wall_float_hor_obj);
room_instance_add(argument0,480,256,wall_float_hor_obj);
room_instance_add(argument0,512,256,wall_float_hor_obj);
room_instance_add(argument0,576,256,wall_float_hor_obj);
room_instance_add(argument0,608,256,wall_float_hor_obj);
room_instance_add(argument0,640,256,wall_float_hor_obj);
room_instance_add(argument0,640,416,wall_float_hor_obj);
room_instance_add(argument0,608,416,wall_float_hor_obj);
room_instance_add(argument0,576,416,wall_float_hor_obj);
room_instance_add(argument0,512,416,wall_float_hor_obj);
room_instance_add(argument0,480,416,wall_float_hor_obj);
room_instance_add(argument0,448,416,wall_float_hor_obj);
room_instance_add(argument0,448,256,wall_float_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,400,336,wall_vert_obj);
room_instance_add(argument0,400,272,wall_vert_obj);
room_instance_add(argument0,400,304,wall_vert_obj);
room_instance_add(argument0,400,368,wall_vert_obj);
room_instance_add(argument0,400,400,wall_vert_obj);
room_instance_add(argument0,688,400,wall_vert_obj);
room_instance_add(argument0,688,368,wall_vert_obj);
room_instance_add(argument0,688,336,wall_vert_obj);
room_instance_add(argument0,688,304,wall_vert_obj);
room_instance_add(argument0,688,272,wall_vert_obj);
room_instance_add(argument0,528,368,wall_pit_vert_obj);
room_instance_add(argument0,528,400,wall_pit_vert_obj);
room_instance_add(argument0,560,368,wall_pit_vert_obj);
room_instance_add(argument0,560,400,wall_pit_vert_obj);
room_instance_add(argument0,656,368,wall_pit_vert_obj);
room_instance_add(argument0,656,400,wall_pit_vert_obj);
room_instance_add(argument0,432,368,wall_pit_vert_obj);
room_instance_add(argument0,432,400,wall_pit_vert_obj);
room_instance_add(argument0,432,304,wall_pit_vert_obj);
room_instance_add(argument0,432,272,wall_pit_vert_obj);
room_instance_add(argument0,528,272,wall_pit_vert_obj);
room_instance_add(argument0,528,304,wall_pit_vert_obj);
room_instance_add(argument0,560,304,wall_pit_vert_obj);
room_instance_add(argument0,560,272,wall_pit_vert_obj);
room_instance_add(argument0,656,272,wall_pit_vert_obj);
room_instance_add(argument0,656,304,wall_pit_vert_obj);
room_instance_add(argument0,528,368,wall_float_vert_obj);
room_instance_add(argument0,528,400,wall_float_vert_obj);
room_instance_add(argument0,560,368,wall_float_vert_obj);
room_instance_add(argument0,560,400,wall_float_vert_obj);
room_instance_add(argument0,656,368,wall_float_vert_obj);
room_instance_add(argument0,656,400,wall_float_vert_obj);
room_instance_add(argument0,432,368,wall_float_vert_obj);
room_instance_add(argument0,432,400,wall_float_vert_obj);
room_instance_add(argument0,432,304,wall_float_vert_obj);
room_instance_add(argument0,432,272,wall_float_vert_obj);
room_instance_add(argument0,528,272,wall_float_vert_obj);
room_instance_add(argument0,528,304,wall_float_vert_obj);
room_instance_add(argument0,560,304,wall_float_vert_obj);
room_instance_add(argument0,560,272,wall_float_vert_obj);
room_instance_add(argument0,656,272,wall_float_vert_obj);
room_instance_add(argument0,656,304,wall_float_vert_obj);
// Torches
// Not yet