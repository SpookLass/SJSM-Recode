/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 20'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 608;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 560;
    global.spawn_arr[1,1] = 544;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 464;
    global.mark_arr[0,1] = 544;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 432;
    global.mark_arr[1,1] = 608;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 272;
    global.mark_arr[2,1] = 608;
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
room_instance_add(argument0,176,608,floor_obj);
room_instance_add(argument0,208,608,floor_obj);
room_instance_add(argument0,240,608,floor_obj);
room_instance_add(argument0,272,608,floor_obj);
room_instance_add(argument0,304,608,floor_obj);
room_instance_add(argument0,336,608,floor_obj);
room_instance_add(argument0,368,608,floor_obj);
room_instance_add(argument0,400,608,floor_obj);
room_instance_add(argument0,432,608,floor_obj);
room_instance_add(argument0,464,608,floor_obj);
room_instance_add(argument0,464,576,floor_obj);
room_instance_add(argument0,464,544,floor_obj);
room_instance_add(argument0,496,544,floor_obj);
room_instance_add(argument0,528,544,floor_obj);
room_instance_add(argument0,560,544,floor_obj);
// Ceilings
room_instance_add(argument0,176,608,ceil_obj);
room_instance_add(argument0,208,608,ceil_obj);
room_instance_add(argument0,240,608,ceil_obj);
room_instance_add(argument0,272,608,ceil_obj);
room_instance_add(argument0,304,608,ceil_obj);
room_instance_add(argument0,336,608,ceil_obj);
room_instance_add(argument0,368,608,ceil_obj);
room_instance_add(argument0,400,608,ceil_obj);
room_instance_add(argument0,432,608,ceil_obj);
room_instance_add(argument0,464,608,ceil_obj);
room_instance_add(argument0,464,576,ceil_obj);
room_instance_add(argument0,464,544,ceil_obj);
room_instance_add(argument0,496,544,ceil_obj);
room_instance_add(argument0,528,544,ceil_obj);
room_instance_add(argument0,560,544,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,496,560,wall_hor_obj);
room_instance_add(argument0,464,528,wall_hor_obj);
room_instance_add(argument0,496,528,wall_hor_obj);
room_instance_add(argument0,528,528,wall_hor_obj);
room_instance_add(argument0,560,528,wall_hor_obj);
room_instance_add(argument0,560,560,wall_hor_obj);
room_instance_add(argument0,528,560,wall_hor_obj);
room_instance_add(argument0,176,596,wall_hor_obj);
room_instance_add(argument0,208,596,wall_hor_obj);
room_instance_add(argument0,240,596,wall_hor_obj);
room_instance_add(argument0,272,596,wall_hor_obj);
room_instance_add(argument0,304,596,wall_hor_obj);
room_instance_add(argument0,336,596,wall_hor_obj);
room_instance_add(argument0,368,596,wall_hor_obj);
room_instance_add(argument0,400,596,wall_hor_obj);
room_instance_add(argument0,432,596,wall_hor_obj);
room_instance_add(argument0,176,620,wall_hor_obj);
room_instance_add(argument0,208,620,wall_hor_obj);
room_instance_add(argument0,240,620,wall_hor_obj);
room_instance_add(argument0,272,620,wall_hor_obj);
room_instance_add(argument0,304,620,wall_hor_obj);
room_instance_add(argument0,336,620,wall_hor_obj);
room_instance_add(argument0,368,620,wall_hor_obj);
room_instance_add(argument0,400,620,wall_hor_obj);
room_instance_add(argument0,432,620,wall_hor_obj);
room_instance_add(argument0,464,620,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,448,580,wall_vert_obj);
room_instance_add(argument0,448,548,wall_vert_obj);
room_instance_add(argument0,480,576,wall_vert_obj);
room_instance_add(argument0,480,608,wall_vert_obj);
room_instance_add(argument0,160,608,wall_vert_obj);
room_instance_add(argument0,576,544,wall_vert_obj);
room_instance_add(argument0,448,516,wall_vert_obj);
// Torches
room_instance_add(argument0,208,596,torch_north_obj);
room_instance_add(argument0,304,596,torch_north_obj);
room_instance_add(argument0,400,596,torch_north_obj);
room_instance_add(argument0,528,528,torch_north_obj);
room_instance_add(argument0,304,620,torch_south_obj);
room_instance_add(argument0,208,620,torch_south_obj);
room_instance_add(argument0,528,560,torch_south_obj);
room_instance_add(argument0,400,620,torch_south_obj);
room_instance_add(argument0,448,576,torch_west_obj);
room_instance_add(argument0,480,576,torch_east_obj);
// Not yet
/*room_instance_add(argument0,416,620,random_scare_mark1);
room_instance_add(argument0,473,611,webs_obj);
room_instance_add(argument0,494,534,webs_obj);
room_instance_add(argument0,331,602,webs_obj);*/