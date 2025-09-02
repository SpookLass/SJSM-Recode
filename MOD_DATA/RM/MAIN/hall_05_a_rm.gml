
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 5 A'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 560;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 272;
    global.mark_arr[0,1] = 304;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 336;
    global.mark_arr[1,1] = 304;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 464;
    global.mark_arr[2,1] = 304;
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
room_instance_add(argument0,176,304,floor_obj);
room_instance_add(argument0,208,304,floor_obj);
room_instance_add(argument0,240,304,floor_obj);
room_instance_add(argument0,272,304,floor_obj);
room_instance_add(argument0,304,304,floor_obj);
room_instance_add(argument0,336,304,floor_obj);
room_instance_add(argument0,368,304,floor_obj);
room_instance_add(argument0,400,304,floor_obj);
room_instance_add(argument0,432,304,floor_obj);
room_instance_add(argument0,464,304,floor_obj);
room_instance_add(argument0,496,304,floor_obj);
room_instance_add(argument0,528,304,floor_obj);
room_instance_add(argument0,560,304,floor_obj);
// Ceilings
room_instance_add(argument0,176,304,ceil_obj);
room_instance_add(argument0,208,304,ceil_obj);
room_instance_add(argument0,240,304,ceil_obj);
room_instance_add(argument0,272,304,ceil_obj);
room_instance_add(argument0,304,304,ceil_obj);
room_instance_add(argument0,336,304,ceil_obj);
room_instance_add(argument0,368,304,ceil_obj);
room_instance_add(argument0,400,304,ceil_obj);
room_instance_add(argument0,432,304,ceil_obj);
room_instance_add(argument0,464,304,ceil_obj);
room_instance_add(argument0,496,304,ceil_obj);
room_instance_add(argument0,528,304,ceil_obj);
room_instance_add(argument0,560,304,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,292,wall_hor_obj);
room_instance_add(argument0,208,292,wall_hor_obj);
room_instance_add(argument0,208,316,wall_hor_obj);
room_instance_add(argument0,176,316,wall_hor_obj);
room_instance_add(argument0,560,292,wall_hor_obj);
room_instance_add(argument0,528,292,wall_hor_obj);
room_instance_add(argument0,240,292,wall_hor_obj);
room_instance_add(argument0,272,292,wall_hor_obj);
room_instance_add(argument0,304,292,wall_hor_obj);
room_instance_add(argument0,336,292,wall_hor_obj);
room_instance_add(argument0,368,292,wall_hor_obj);
room_instance_add(argument0,400,292,wall_hor_obj);
room_instance_add(argument0,432,292,wall_hor_obj);
room_instance_add(argument0,464,292,wall_hor_obj);
room_instance_add(argument0,496,292,wall_hor_obj);
room_instance_add(argument0,560,316,wall_hor_obj);
room_instance_add(argument0,528,316,wall_hor_obj);
room_instance_add(argument0,496,316,wall_hor_obj);
room_instance_add(argument0,464,316,wall_hor_obj);
room_instance_add(argument0,432,316,wall_hor_obj);
room_instance_add(argument0,400,316,wall_hor_obj);
room_instance_add(argument0,368,316,wall_hor_obj);
room_instance_add(argument0,336,316,wall_hor_obj);
room_instance_add(argument0,304,316,wall_hor_obj);
room_instance_add(argument0,272,316,wall_hor_obj);
room_instance_add(argument0,240,316,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,304,wall_vert_obj);
room_instance_add(argument0,576,304,wall_vert_obj);
// Torches
room_instance_add(argument0,240,292,torch_north_obj);
room_instance_add(argument0,368,292,torch_north_obj);
room_instance_add(argument0,496,292,torch_north_obj);
room_instance_add(argument0,240,316,torch_south_obj);
room_instance_add(argument0,368,316,torch_south_obj);
room_instance_add(argument0,496,316,torch_south_obj);
// Not yet
/*room_instance_add(argument0,544,316,random_scare_mark1);
room_instance_add(argument0,212,309,webs_obj);
room_instance_add(argument0,396,297,webs_obj);
room_instance_add(argument0,435,310,webs_obj);*/

