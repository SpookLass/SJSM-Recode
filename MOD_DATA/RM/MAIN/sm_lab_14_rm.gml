/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sm_lab','ROOM_sm_lab')+' 14';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 128;
    global.spawn_arr[0,1] = 272;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 384;
    global.spawn_arr[1,1] = 432;
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
room_instance_add(argument0,128,240,floor_obj);
room_instance_add(argument0,128,304,floor_obj);
room_instance_add(argument0,160,240,floor_obj);
room_instance_add(argument0,160,272,floor_obj);
room_instance_add(argument0,160,304,floor_obj);
room_instance_add(argument0,192,304,floor_obj);
room_instance_add(argument0,192,272,floor_obj);
room_instance_add(argument0,192,240,floor_obj);
room_instance_add(argument0,224,240,floor_obj);
room_instance_add(argument0,224,272,floor_obj);
room_instance_add(argument0,224,304,floor_obj);
room_instance_add(argument0,192,336,floor_obj);
room_instance_add(argument0,192,368,floor_obj);
room_instance_add(argument0,192,400,floor_obj);
room_instance_add(argument0,192,432,floor_obj);
room_instance_add(argument0,224,432,floor_obj);
room_instance_add(argument0,256,432,floor_obj);
room_instance_add(argument0,288,432,floor_obj);
room_instance_add(argument0,320,432,floor_obj);
room_instance_add(argument0,320,400,floor_obj);
room_instance_add(argument0,352,400,floor_obj);
room_instance_add(argument0,352,432,floor_obj);
room_instance_add(argument0,320,464,floor_obj);
room_instance_add(argument0,352,464,floor_obj);
room_instance_add(argument0,384,464,floor_obj);
room_instance_add(argument0,384,432,floor_obj);
room_instance_add(argument0,384,400,floor_obj);
room_instance_add(argument0,192,464,floor_high_obj);
room_instance_add(argument0,160,464,floor_high_obj);
// Ceilings
room_instance_add(argument0,128,272,ceil_2high_obj);
room_instance_add(argument0,128,240,ceil_2high_obj);
room_instance_add(argument0,128,304,ceil_2high_obj);
room_instance_add(argument0,160,240,ceil_2high_obj);
room_instance_add(argument0,160,272,ceil_2high_obj);
room_instance_add(argument0,160,304,ceil_2high_obj);
room_instance_add(argument0,192,304,ceil_2high_obj);
room_instance_add(argument0,192,272,ceil_2high_obj);
room_instance_add(argument0,192,240,ceil_2high_obj);
room_instance_add(argument0,224,240,ceil_2high_obj);
room_instance_add(argument0,224,272,ceil_2high_obj);
room_instance_add(argument0,224,304,ceil_2high_obj);
room_instance_add(argument0,192,336,ceil_2high_obj);
room_instance_add(argument0,192,368,ceil_2high_obj);
room_instance_add(argument0,192,400,ceil_2high_obj);
room_instance_add(argument0,192,432,ceil_2high_obj);
room_instance_add(argument0,224,432,ceil_2high_obj);
room_instance_add(argument0,256,432,ceil_2high_obj);
room_instance_add(argument0,288,432,ceil_2high_obj);
room_instance_add(argument0,320,432,ceil_2high_obj);
room_instance_add(argument0,320,400,ceil_2high_obj);
room_instance_add(argument0,352,400,ceil_2high_obj);
room_instance_add(argument0,352,432,ceil_2high_obj);
room_instance_add(argument0,320,464,ceil_2high_obj);
room_instance_add(argument0,352,464,ceil_2high_obj);
room_instance_add(argument0,384,464,ceil_2high_obj);
room_instance_add(argument0,384,432,ceil_2high_obj);
room_instance_add(argument0,384,400,ceil_2high_obj);
room_instance_add(argument0,192,464,ceil_2high_obj);
room_instance_add(argument0,160,464,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,128,224,wall_2high_hor_obj);
room_instance_add(argument0,128,320,wall_2high_hor_obj);
room_instance_add(argument0,160,224,wall_2high_hor_obj);
room_instance_add(argument0,192,224,wall_2high_hor_obj);
room_instance_add(argument0,224,224,wall_2high_hor_obj);
room_instance_add(argument0,224,320,wall_2high_hor_obj);
room_instance_add(argument0,160,320,wall_2high_hor_obj);
room_instance_add(argument0,224,448,wall_2high_hor_obj);
room_instance_add(argument0,192,480,wall_2high_hor_obj);
room_instance_add(argument0,160,480,wall_2high_hor_obj);
room_instance_add(argument0,320,480,wall_2high_hor_obj);
room_instance_add(argument0,352,480,wall_2high_hor_obj);
room_instance_add(argument0,384,480,wall_2high_hor_obj);
room_instance_add(argument0,384,384,wall_2high_hor_obj);
room_instance_add(argument0,352,384,wall_2high_hor_obj);
room_instance_add(argument0,320,384,wall_2high_hor_obj);
room_instance_add(argument0,288,416,wall_2high_hor_obj);
room_instance_add(argument0,256,416,wall_2high_hor_obj);
room_instance_add(argument0,224,416,wall_2high_hor_obj);
room_instance_add(argument0,256,448,wall_2high_hor_obj);
room_instance_add(argument0,288,448,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,112,272,wall_2high_vert_obj);
room_instance_add(argument0,112,240,wall_2high_vert_obj);
room_instance_add(argument0,112,304,wall_2high_vert_obj);
room_instance_add(argument0,240,304,wall_2high_vert_obj);
room_instance_add(argument0,208,336,wall_2high_vert_obj);
room_instance_add(argument0,208,368,wall_2high_vert_obj);
room_instance_add(argument0,208,400,wall_2high_vert_obj);
room_instance_add(argument0,304,400,wall_2high_vert_obj);
room_instance_add(argument0,304,464,wall_2high_vert_obj);
room_instance_add(argument0,400,464,wall_2high_vert_obj);
room_instance_add(argument0,400,432,wall_2high_vert_obj);
room_instance_add(argument0,400,400,wall_2high_vert_obj);
room_instance_add(argument0,176,432,wall_2high_vert_obj);
room_instance_add(argument0,176,400,wall_2high_vert_obj);
room_instance_add(argument0,176,368,wall_2high_vert_obj);
room_instance_add(argument0,176,336,wall_2high_vert_obj);
room_instance_add(argument0,240,272,wall_2high_vert_obj);
room_instance_add(argument0,240,240,wall_2high_vert_obj);
room_instance_add(argument0,208,464,wall_2high_vert_obj);
room_instance_add(argument0,144,464,wall_2high_vert_obj);
// Props
room_instance_add(argument0,192,448,lab_window_hor_obj);
// Not Yet
// room_instance_add(argument0,232,448,js_obj);