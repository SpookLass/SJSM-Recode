/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Med Room 4'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 400;
    global.spawn_arr[0,1] = 176;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 528;
    global.spawn_arr[1,1] = 496;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 467;
    global.mark_arr[0,1] = 273;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 463;
    global.mark_arr[1,1] = 215;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 462;
    global.mark_arr[2,1] = 469;
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
room_instance_add(argument0,0,0,color_control_med_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,water_obj);
// Floors
room_instance_add(argument0,400,176,floor_obj);
room_instance_add(argument0,432,176,floor_obj);
room_instance_add(argument0,464,176,floor_obj);
room_instance_add(argument0,464,208,floor_obj);
room_instance_add(argument0,464,240,floor_obj);
room_instance_add(argument0,464,272,floor_obj);
room_instance_add(argument0,496,272,floor_obj);
room_instance_add(argument0,432,272,floor_obj);
room_instance_add(argument0,528,272,floor_obj);
room_instance_add(argument0,400,272,floor_obj);
room_instance_add(argument0,464,304,floor_obj);
room_instance_add(argument0,464,336,floor_obj);
room_instance_add(argument0,464,368,floor_obj);
room_instance_add(argument0,432,400,floor_obj);
room_instance_add(argument0,464,400,floor_obj);
room_instance_add(argument0,496,400,floor_obj);
room_instance_add(argument0,528,400,floor_obj);
room_instance_add(argument0,400,400,floor_obj);
room_instance_add(argument0,464,432,floor_obj);
room_instance_add(argument0,464,464,floor_obj);
room_instance_add(argument0,464,496,floor_obj);
room_instance_add(argument0,496,496,floor_obj);
room_instance_add(argument0,528,496,floor_obj);
// Ceilings
room_instance_add(argument0,400,176,ceil_obj);
room_instance_add(argument0,432,176,ceil_obj);
room_instance_add(argument0,464,176,ceil_obj);
room_instance_add(argument0,464,208,ceil_obj);
room_instance_add(argument0,464,240,ceil_obj);
room_instance_add(argument0,464,272,ceil_obj);
room_instance_add(argument0,496,272,ceil_obj);
room_instance_add(argument0,432,272,ceil_obj);
room_instance_add(argument0,528,272,ceil_obj);
room_instance_add(argument0,400,272,ceil_obj);
room_instance_add(argument0,464,304,ceil_obj);
room_instance_add(argument0,464,336,ceil_obj);
room_instance_add(argument0,464,368,ceil_obj);
room_instance_add(argument0,432,400,ceil_obj);
room_instance_add(argument0,464,400,ceil_obj);
room_instance_add(argument0,496,400,ceil_obj);
room_instance_add(argument0,528,400,ceil_obj);
room_instance_add(argument0,400,400,ceil_obj);
room_instance_add(argument0,464,432,ceil_obj);
room_instance_add(argument0,464,464,ceil_obj);
room_instance_add(argument0,464,496,ceil_obj);
room_instance_add(argument0,496,496,ceil_obj);
room_instance_add(argument0,528,496,ceil_obj);
room_instance_add(argument0,400,304,ceil_obj);
room_instance_add(argument0,432,304,ceil_obj);
room_instance_add(argument0,432,336,ceil_obj);
room_instance_add(argument0,400,336,ceil_obj);
room_instance_add(argument0,400,368,ceil_obj);
room_instance_add(argument0,432,368,ceil_obj);
room_instance_add(argument0,496,368,ceil_obj);
room_instance_add(argument0,528,368,ceil_obj);
room_instance_add(argument0,528,336,ceil_obj);
room_instance_add(argument0,528,304,ceil_obj);
room_instance_add(argument0,496,304,ceil_obj);
room_instance_add(argument0,496,336,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,400,160,wall_hor_obj);
room_instance_add(argument0,400,192,wall_hor_obj);
room_instance_add(argument0,432,192,wall_hor_obj);
room_instance_add(argument0,432,160,wall_hor_obj);
room_instance_add(argument0,464,160,wall_hor_obj);
room_instance_add(argument0,496,256,wall_hor_obj);
room_instance_add(argument0,528,256,wall_hor_obj);
room_instance_add(argument0,432,256,wall_hor_obj);
room_instance_add(argument0,400,256,wall_hor_obj);
room_instance_add(argument0,400,416,wall_hor_obj);
room_instance_add(argument0,432,416,wall_hor_obj);
room_instance_add(argument0,496,416,wall_hor_obj);
room_instance_add(argument0,528,416,wall_hor_obj);
room_instance_add(argument0,496,480,wall_hor_obj);
room_instance_add(argument0,528,480,wall_hor_obj);
room_instance_add(argument0,528,512,wall_hor_obj);
room_instance_add(argument0,496,512,wall_hor_obj);
room_instance_add(argument0,464,512,wall_hor_obj);
room_instance_add(argument0,400,288,wall_pit_hor_obj);
room_instance_add(argument0,432,288,wall_pit_hor_obj);
room_instance_add(argument0,432,384,wall_pit_hor_obj);
room_instance_add(argument0,400,384,wall_pit_hor_obj);
room_instance_add(argument0,496,384,wall_pit_hor_obj);
room_instance_add(argument0,528,384,wall_pit_hor_obj);
room_instance_add(argument0,528,288,wall_pit_hor_obj);
room_instance_add(argument0,496,288,wall_pit_hor_obj);
room_instance_add(argument0,400,288,wall_float_hor_obj);
room_instance_add(argument0,432,288,wall_float_hor_obj);
room_instance_add(argument0,432,384,wall_float_hor_obj);
room_instance_add(argument0,400,384,wall_float_hor_obj);
room_instance_add(argument0,496,384,wall_float_hor_obj);
room_instance_add(argument0,528,384,wall_float_hor_obj);
room_instance_add(argument0,528,288,wall_float_hor_obj);
room_instance_add(argument0,496,288,wall_float_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,448,208,wall_vert_obj);
room_instance_add(argument0,448,240,wall_vert_obj);
room_instance_add(argument0,384,272,wall_vert_obj);
room_instance_add(argument0,544,272,wall_vert_obj);
room_instance_add(argument0,544,304,wall_vert_obj);
room_instance_add(argument0,544,336,wall_vert_obj);
room_instance_add(argument0,544,368,wall_vert_obj);
room_instance_add(argument0,544,400,wall_vert_obj);
room_instance_add(argument0,384,400,wall_vert_obj);
room_instance_add(argument0,384,368,wall_vert_obj);
room_instance_add(argument0,384,336,wall_vert_obj);
room_instance_add(argument0,384,304,wall_vert_obj);
room_instance_add(argument0,448,432,wall_vert_obj);
room_instance_add(argument0,480,432,wall_vert_obj);
room_instance_add(argument0,448,464,wall_vert_obj);
room_instance_add(argument0,480,464,wall_vert_obj);
room_instance_add(argument0,448,496,wall_vert_obj);
room_instance_add(argument0,544,496,wall_vert_obj);
room_instance_add(argument0,480,240,wall_vert_obj);
room_instance_add(argument0,480,208,wall_vert_obj);
room_instance_add(argument0,480,176,wall_vert_obj);
room_instance_add(argument0,384,176,wall_vert_obj);
room_instance_add(argument0,384,304,wall_pit_vert_obj);
room_instance_add(argument0,384,336,wall_pit_vert_obj);
room_instance_add(argument0,384,368,wall_pit_vert_obj);
room_instance_add(argument0,544,368,wall_pit_vert_obj);
room_instance_add(argument0,544,336,wall_pit_vert_obj);
room_instance_add(argument0,544,304,wall_pit_vert_obj);
room_instance_add(argument0,480,304,wall_pit_vert_obj);
room_instance_add(argument0,480,336,wall_pit_vert_obj);
room_instance_add(argument0,480,368,wall_pit_vert_obj);
room_instance_add(argument0,448,368,wall_pit_vert_obj);
room_instance_add(argument0,448,336,wall_pit_vert_obj);
room_instance_add(argument0,448,304,wall_pit_vert_obj);
room_instance_add(argument0,384,304,wall_float_vert_obj);
room_instance_add(argument0,384,336,wall_float_vert_obj);
room_instance_add(argument0,384,368,wall_float_vert_obj);
room_instance_add(argument0,544,368,wall_float_vert_obj);
room_instance_add(argument0,544,336,wall_float_vert_obj);
room_instance_add(argument0,544,304,wall_float_vert_obj);
room_instance_add(argument0,480,304,wall_float_vert_obj);
room_instance_add(argument0,480,336,wall_float_vert_obj);
room_instance_add(argument0,480,368,wall_float_vert_obj);
room_instance_add(argument0,448,368,wall_float_vert_obj);
room_instance_add(argument0,448,336,wall_float_vert_obj);
room_instance_add(argument0,448,304,wall_float_vert_obj);
// Torches
room_instance_add(argument0,432,416,torch_south_obj);
room_instance_add(argument0,496,416,torch_south_obj);
// Not yet