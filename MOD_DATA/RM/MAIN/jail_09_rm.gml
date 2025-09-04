/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Jail Room 9'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 720;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 165;
    global.mark_arr[0,1] = 303;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 316;
    global.mark_arr[1,1] = 306;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 496;
    global.mark_arr[2,1] = 299;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 647;
    global.mark_arr[3,1] = 306;
    global.mark_arr[3,2] = 0;
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
room_instance_add(argument0,144,304,floor_obj);
room_instance_add(argument0,112,304,floor_obj);
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
room_instance_add(argument0,592,304,floor_obj);
room_instance_add(argument0,624,304,floor_obj);
room_instance_add(argument0,656,304,floor_obj);
room_instance_add(argument0,688,304,floor_obj);
room_instance_add(argument0,720,304,floor_obj);
room_instance_add(argument0,176,272,floor_obj);
room_instance_add(argument0,176,336,floor_obj);
room_instance_add(argument0,272,336,floor_obj);
room_instance_add(argument0,272,272,floor_obj);
room_instance_add(argument0,368,272,floor_obj);
room_instance_add(argument0,368,336,floor_obj);
room_instance_add(argument0,464,272,floor_obj);
room_instance_add(argument0,464,336,floor_obj);
room_instance_add(argument0,560,272,floor_obj);
room_instance_add(argument0,560,336,floor_obj);
room_instance_add(argument0,656,272,floor_obj);
room_instance_add(argument0,656,336,floor_obj);
// Ceilings
room_instance_add(argument0,144,304,ceil_obj);
room_instance_add(argument0,112,304,ceil_obj);
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
room_instance_add(argument0,592,304,ceil_obj);
room_instance_add(argument0,624,304,ceil_obj);
room_instance_add(argument0,656,304,ceil_obj);
room_instance_add(argument0,688,304,ceil_obj);
room_instance_add(argument0,720,304,ceil_obj);
room_instance_add(argument0,176,272,ceil_obj);
room_instance_add(argument0,176,336,ceil_obj);
room_instance_add(argument0,272,336,ceil_obj);
room_instance_add(argument0,272,272,ceil_obj);
room_instance_add(argument0,368,272,ceil_obj);
room_instance_add(argument0,368,336,ceil_obj);
room_instance_add(argument0,464,272,ceil_obj);
room_instance_add(argument0,464,336,ceil_obj);
room_instance_add(argument0,560,272,ceil_obj);
room_instance_add(argument0,560,336,ceil_obj);
room_instance_add(argument0,656,272,ceil_obj);
room_instance_add(argument0,656,336,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,288,wall_hor_obj);
room_instance_add(argument0,112,288,wall_hor_obj);
room_instance_add(argument0,112,320,wall_hor_obj);
room_instance_add(argument0,144,320,wall_hor_obj);
room_instance_add(argument0,176,256,wall_hor_obj);
room_instance_add(argument0,176,352,wall_hor_obj);
room_instance_add(argument0,208,320,wall_hor_obj);
room_instance_add(argument0,208,288,wall_hor_obj);
room_instance_add(argument0,240,288,wall_hor_obj);
room_instance_add(argument0,272,256,wall_hor_obj);
room_instance_add(argument0,272,352,wall_hor_obj);
room_instance_add(argument0,240,320,wall_hor_obj);
room_instance_add(argument0,304,288,wall_hor_obj);
room_instance_add(argument0,336,288,wall_hor_obj);
room_instance_add(argument0,304,320,wall_hor_obj);
room_instance_add(argument0,336,320,wall_hor_obj);
room_instance_add(argument0,368,352,wall_hor_obj);
room_instance_add(argument0,368,256,wall_hor_obj);
room_instance_add(argument0,400,288,wall_hor_obj);
room_instance_add(argument0,432,288,wall_hor_obj);
room_instance_add(argument0,432,320,wall_hor_obj);
room_instance_add(argument0,400,320,wall_hor_obj);
room_instance_add(argument0,464,256,wall_hor_obj);
room_instance_add(argument0,464,352,wall_hor_obj);
room_instance_add(argument0,496,320,wall_hor_obj);
room_instance_add(argument0,528,320,wall_hor_obj);
room_instance_add(argument0,528,288,wall_hor_obj);
room_instance_add(argument0,496,288,wall_hor_obj);
room_instance_add(argument0,560,256,wall_hor_obj);
room_instance_add(argument0,560,352,wall_hor_obj);
room_instance_add(argument0,592,288,wall_hor_obj);
room_instance_add(argument0,624,288,wall_hor_obj);
room_instance_add(argument0,656,256,wall_hor_obj);
room_instance_add(argument0,688,288,wall_hor_obj);
room_instance_add(argument0,720,288,wall_hor_obj);
room_instance_add(argument0,720,320,wall_hor_obj);
room_instance_add(argument0,688,320,wall_hor_obj);
room_instance_add(argument0,656,352,wall_hor_obj);
room_instance_add(argument0,624,320,wall_hor_obj);
room_instance_add(argument0,592,320,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,304,wall_vert_obj);
room_instance_add(argument0,736,304,wall_vert_obj);
room_instance_add(argument0,672,336,wall_vert_obj);
room_instance_add(argument0,640,336,wall_vert_obj);
room_instance_add(argument0,576,336,wall_vert_obj);
room_instance_add(argument0,544,336,wall_vert_obj);
room_instance_add(argument0,480,336,wall_vert_obj);
room_instance_add(argument0,448,336,wall_vert_obj);
room_instance_add(argument0,384,336,wall_vert_obj);
room_instance_add(argument0,352,336,wall_vert_obj);
room_instance_add(argument0,288,336,wall_vert_obj);
room_instance_add(argument0,256,336,wall_vert_obj);
room_instance_add(argument0,192,336,wall_vert_obj);
room_instance_add(argument0,160,336,wall_vert_obj);
room_instance_add(argument0,160,272,wall_vert_obj);
room_instance_add(argument0,192,272,wall_vert_obj);
room_instance_add(argument0,256,272,wall_vert_obj);
room_instance_add(argument0,288,272,wall_vert_obj);
room_instance_add(argument0,352,272,wall_vert_obj);
room_instance_add(argument0,384,272,wall_vert_obj);
room_instance_add(argument0,448,272,wall_vert_obj);
room_instance_add(argument0,480,272,wall_vert_obj);
room_instance_add(argument0,544,272,wall_vert_obj);
room_instance_add(argument0,576,272,wall_vert_obj);
room_instance_add(argument0,640,272,wall_vert_obj);
room_instance_add(argument0,672,272,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,176,288,bar_hor_obj);
room_instance_add(argument0,176,320,bar_hor_obj);
room_instance_add(argument0,272,288,bar_hor_obj);
room_instance_add(argument0,272,320,bar_hor_obj);
room_instance_add(argument0,368,288,bar_hor_obj);
room_instance_add(argument0,368,320,bar_hor_obj);
room_instance_add(argument0,464,320,bar_hor_obj);
room_instance_add(argument0,464,288,bar_hor_obj);
room_instance_add(argument0,560,288,bar_hor_obj);
room_instance_add(argument0,560,320,bar_hor_obj);
room_instance_add(argument0,656,288,bar_hor_obj);
room_instance_add(argument0,656,320,bar_hor_obj);
room_instance_add(argument0,179,265,bone_rand_obj);
room_instance_add(argument0,176,326,bone_rand_obj);
room_instance_add(argument0,367,269,bone_rand_obj);
room_instance_add(argument0,464,332,bone_rand_obj);
room_instance_add(argument0,467,270,bone_rand_obj);
room_instance_add(argument0,564,268,bone_rand_obj);
room_instance_add(argument0,656,338,bone_rand_obj);
// Not yet
//room_instance_add(argument0,416,320,random_scare_mark1);