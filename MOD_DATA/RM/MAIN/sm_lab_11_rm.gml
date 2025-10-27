/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sm_lab','ROOM_sm_lab')+' 11';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 32;
    global.spawn_arr[0,1] = 272;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 160;
    global.spawn_arr[1,1] = 560;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
room_instance_add(argument0,112,272,door1_fake_west);
room_instance_add(argument0,176,560,door1_vert);
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
        local.exitdoor.direction = global.spawn_arr[local.i,3]+180; local.exitdoor.z = global.spawn_arr[local.i,2];
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
room_instance_add(argument0,32,272,floor_obj);
room_instance_add(argument0,64,272,floor_obj);
room_instance_add(argument0,96,272,floor_obj);
room_instance_add(argument0,128,272,floor_obj);
room_instance_add(argument0,160,272,floor_obj);
room_instance_add(argument0,128,240,floor_obj);
room_instance_add(argument0,160,240,floor_obj);
room_instance_add(argument0,128,304,floor_obj);
room_instance_add(argument0,160,304,floor_obj);
room_instance_add(argument0,160,336,floor_obj);
room_instance_add(argument0,128,336,floor_obj);
room_instance_add(argument0,128,368,floor_obj);
room_instance_add(argument0,128,400,floor_obj);
room_instance_add(argument0,160,400,floor_obj);
room_instance_add(argument0,160,368,floor_obj);
room_instance_add(argument0,160,432,floor_obj);
room_instance_add(argument0,128,432,floor_obj);
room_instance_add(argument0,128,464,floor_obj);
room_instance_add(argument0,160,464,floor_obj);
room_instance_add(argument0,160,496,floor_obj);
room_instance_add(argument0,128,496,floor_obj);
room_instance_add(argument0,128,528,floor_obj);
room_instance_add(argument0,160,528,floor_obj);
room_instance_add(argument0,160,560,floor_obj);
room_instance_add(argument0,128,560,floor_obj);
room_instance_add(argument0,128,592,floor_obj);
room_instance_add(argument0,160,592,floor_obj);
room_instance_add(argument0,128,624,floor_high_obj);
room_instance_add(argument0,160,624,floor_high_obj);
// Ceilings
room_instance_add(argument0,32,272,ceil_2high_obj);
room_instance_add(argument0,64,272,ceil_2high_obj);
room_instance_add(argument0,96,272,ceil_2high_obj);
room_instance_add(argument0,128,272,ceil_2high_obj);
room_instance_add(argument0,160,272,ceil_2high_obj);
room_instance_add(argument0,128,240,ceil_2high_obj);
room_instance_add(argument0,160,240,ceil_2high_obj);
room_instance_add(argument0,128,304,ceil_2high_obj);
room_instance_add(argument0,160,304,ceil_2high_obj);
room_instance_add(argument0,160,336,ceil_2high_obj);
room_instance_add(argument0,128,336,ceil_2high_obj);
room_instance_add(argument0,128,368,ceil_2high_obj);
room_instance_add(argument0,128,400,ceil_2high_obj);
room_instance_add(argument0,160,400,ceil_2high_obj);
room_instance_add(argument0,160,368,ceil_2high_obj);
room_instance_add(argument0,160,432,ceil_2high_obj);
room_instance_add(argument0,128,432,ceil_2high_obj);
room_instance_add(argument0,128,464,ceil_2high_obj);
room_instance_add(argument0,160,464,ceil_2high_obj);
room_instance_add(argument0,160,496,ceil_2high_obj);
room_instance_add(argument0,128,496,ceil_2high_obj);
room_instance_add(argument0,128,528,ceil_2high_obj);
room_instance_add(argument0,160,528,ceil_2high_obj);
room_instance_add(argument0,160,560,ceil_2high_obj);
room_instance_add(argument0,128,560,ceil_2high_obj);
room_instance_add(argument0,128,592,ceil_2high_obj);
room_instance_add(argument0,160,592,ceil_2high_obj);
room_instance_add(argument0,128,624,ceil_2high_obj);
room_instance_add(argument0,160,624,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,128,224,wall_2high_hor_obj);
room_instance_add(argument0,160,224,wall_2high_hor_obj);
room_instance_add(argument0,32,256,wall_2high_hor_obj);
room_instance_add(argument0,64,256,wall_2high_hor_obj);
room_instance_add(argument0,96,256,wall_2high_hor_obj);
room_instance_add(argument0,32,288,wall_2high_hor_obj);
room_instance_add(argument0,64,288,wall_2high_hor_obj);
room_instance_add(argument0,96,288,wall_2high_hor_obj);
room_instance_add(argument0,128,608,wall_2high_hor_obj);
room_instance_add(argument0,128,640,wall_2high_hor_obj);
room_instance_add(argument0,160,640,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,16,272,wall_2high_vert_obj);
room_instance_add(argument0,112,592,wall_2high_vert_obj);
room_instance_add(argument0,112,624,wall_2high_vert_obj);
room_instance_add(argument0,176,624,wall_2high_vert_obj);
room_instance_add(argument0,176,592,wall_2high_vert_obj);
room_instance_add(argument0,176,560,wall_2high_vert_obj);
room_instance_add(argument0,176,528,wall_2high_vert_obj);
room_instance_add(argument0,176,496,wall_2high_vert_obj);
room_instance_add(argument0,176,464,wall_2high_vert_obj);
room_instance_add(argument0,176,432,wall_2high_vert_obj);
room_instance_add(argument0,176,400,wall_2high_vert_obj);
room_instance_add(argument0,176,368,wall_2high_vert_obj);
room_instance_add(argument0,176,336,wall_2high_vert_obj);
room_instance_add(argument0,176,304,wall_2high_vert_obj);
room_instance_add(argument0,176,272,wall_2high_vert_obj);
room_instance_add(argument0,176,240,wall_2high_vert_obj);
room_instance_add(argument0,112,240,wall_2high_vert_obj);
room_instance_add(argument0,112,304,wall_2high_vert_obj);
room_instance_add(argument0,112,336,wall_2high_vert_obj);
room_instance_add(argument0,112,368,wall_2high_vert_obj);
room_instance_add(argument0,112,400,wall_2high_vert_obj);
room_instance_add(argument0,112,432,wall_2high_vert_obj);
room_instance_add(argument0,112,464,wall_2high_vert_obj);
room_instance_add(argument0,112,496,wall_2high_vert_obj);
room_instance_add(argument0,112,528,wall_2high_vert_obj);
room_instance_add(argument0,112,560,wall_2high_vert_obj);
// Prop
room_instance_add(argument0,160,608,lab_window_hor_obj);