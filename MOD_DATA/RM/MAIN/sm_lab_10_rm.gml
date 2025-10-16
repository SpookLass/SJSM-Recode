/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sm_lab','ROOM_sm_lab')+' 10';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 128;
    global.spawn_arr[0,1] = 272;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 288;
    global.spawn_arr[1,1] = 272;
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
room_instance_add(argument0,0,0,color_control_02_obj);
// Floors
room_instance_add(argument0,128,272,floor_obj);
room_instance_add(argument0,128,304,floor_obj);
room_instance_add(argument0,128,240,floor_obj);
room_instance_add(argument0,160,240,floor_obj);
room_instance_add(argument0,160,272,floor_obj);
room_instance_add(argument0,160,304,floor_obj);
room_instance_add(argument0,192,240,floor_obj);
room_instance_add(argument0,192,272,floor_obj);
room_instance_add(argument0,192,304,floor_obj);
room_instance_add(argument0,224,240,floor_obj);
room_instance_add(argument0,224,272,floor_obj);
room_instance_add(argument0,224,304,floor_obj);
room_instance_add(argument0,256,240,floor_obj);
room_instance_add(argument0,256,272,floor_obj);
room_instance_add(argument0,256,304,floor_obj);
room_instance_add(argument0,288,304,floor_obj);
room_instance_add(argument0,288,272,floor_obj);
room_instance_add(argument0,288,240,floor_obj);
room_instance_add(argument0,128,336,floor_high_obj);
room_instance_add(argument0,160,336,floor_high_obj);
room_instance_add(argument0,192,336,floor_high_obj);
room_instance_add(argument0,224,336,floor_high_obj);
room_instance_add(argument0,256,336,floor_high_obj);
room_instance_add(argument0,288,336,floor_high_obj);
// Ceilings
room_instance_add(argument0,128,272,ceil_2high_obj);
room_instance_add(argument0,128,304,ceil_2high_obj);
room_instance_add(argument0,128,240,ceil_2high_obj);
room_instance_add(argument0,160,240,ceil_2high_obj);
room_instance_add(argument0,160,272,ceil_2high_obj);
room_instance_add(argument0,160,304,ceil_2high_obj);
room_instance_add(argument0,192,240,ceil_2high_obj);
room_instance_add(argument0,192,272,ceil_2high_obj);
room_instance_add(argument0,192,304,ceil_2high_obj);
room_instance_add(argument0,224,240,ceil_2high_obj);
room_instance_add(argument0,224,272,ceil_2high_obj);
room_instance_add(argument0,224,304,ceil_2high_obj);
room_instance_add(argument0,256,240,ceil_2high_obj);
room_instance_add(argument0,256,272,ceil_2high_obj);
room_instance_add(argument0,256,304,ceil_2high_obj);
room_instance_add(argument0,288,304,ceil_2high_obj);
room_instance_add(argument0,288,272,ceil_2high_obj);
room_instance_add(argument0,288,240,ceil_2high_obj);
room_instance_add(argument0,128,336,ceil_2high_obj);
room_instance_add(argument0,160,336,ceil_2high_obj);
room_instance_add(argument0,192,336,ceil_2high_obj);
room_instance_add(argument0,224,336,ceil_2high_obj);
room_instance_add(argument0,256,336,ceil_2high_obj);
room_instance_add(argument0,288,336,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,128,224,wall_2high_hor_obj);
room_instance_add(argument0,128,320,wall_2high_hor_obj);
room_instance_add(argument0,128,352,wall_2high_hor_obj);
room_instance_add(argument0,160,352,wall_2high_hor_obj);
room_instance_add(argument0,192,352,wall_2high_hor_obj);
room_instance_add(argument0,224,352,wall_2high_hor_obj);
room_instance_add(argument0,256,352,wall_2high_hor_obj);
room_instance_add(argument0,288,352,wall_2high_hor_obj);
room_instance_add(argument0,288,320,wall_2high_hor_obj);
room_instance_add(argument0,288,224,wall_2high_hor_obj);
room_instance_add(argument0,256,224,wall_2high_hor_obj);
room_instance_add(argument0,224,224,wall_2high_hor_obj);
room_instance_add(argument0,192,224,wall_2high_hor_obj);
room_instance_add(argument0,160,224,wall_2high_hor_obj);
room_instance_add(argument0,160,320,wall_2high_hor_obj);
room_instance_add(argument0,192,320,wall_2high_hor_obj);
room_instance_add(argument0,224,320,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,112,272,wall_2high_vert_obj);
room_instance_add(argument0,112,240,wall_2high_vert_obj);
room_instance_add(argument0,112,304,wall_2high_vert_obj);
room_instance_add(argument0,304,240,wall_2high_vert_obj);
room_instance_add(argument0,304,272,wall_2high_vert_obj);
room_instance_add(argument0,304,304,wall_2high_vert_obj);
room_instance_add(argument0,304,336,wall_2high_vert_obj);
room_instance_add(argument0,112,336,wall_2high_vert_obj);
// Prop
room_instance_add(argument0,256,320,lab_window_hor_obj);