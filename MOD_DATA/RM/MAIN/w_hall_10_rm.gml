/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','w','ROOM_w')+' 10';
	ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 368;
    global.spawn_arr[1,1] = 48;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 368;
    global.spawn_arr[2,1] = 240;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 245;
    global.mark_arr[0,1] = 157;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 309;
    global.mark_arr[1,1] = 116;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 307;
    global.mark_arr[2,1] = 61;
    global.mark_arr[2,2] = 0;
    mark_create_scr();
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
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
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,208,112,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,272,112,floor_obj);
room_instance_add(argument0,304,112,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,336,176,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,336,112,floor_obj);
room_instance_add(argument0,304,80,floor_obj);
room_instance_add(argument0,304,208,floor_obj);
room_instance_add(argument0,304,48,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,368,240,floor_obj);
room_instance_add(argument0,336,48,floor_obj);
room_instance_add(argument0,368,48,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,208,112,ceil_obj);
room_instance_add(argument0,240,112,ceil_obj);
room_instance_add(argument0,240,144,ceil_obj);
room_instance_add(argument0,240,176,ceil_obj);
room_instance_add(argument0,208,176,ceil_obj);
room_instance_add(argument0,272,176,ceil_obj);
room_instance_add(argument0,272,144,ceil_obj);
room_instance_add(argument0,272,112,ceil_obj);
room_instance_add(argument0,304,112,ceil_obj);
room_instance_add(argument0,304,144,ceil_obj);
room_instance_add(argument0,304,176,ceil_obj);
room_instance_add(argument0,336,176,ceil_obj);
room_instance_add(argument0,336,144,ceil_obj);
room_instance_add(argument0,336,112,ceil_obj);
room_instance_add(argument0,304,80,ceil_obj);
room_instance_add(argument0,304,208,ceil_obj);
room_instance_add(argument0,304,48,ceil_obj);
room_instance_add(argument0,304,240,ceil_obj);
room_instance_add(argument0,336,240,ceil_obj);
room_instance_add(argument0,368,240,ceil_obj);
room_instance_add(argument0,336,48,ceil_obj);
room_instance_add(argument0,368,48,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,272,96,wall_hor_obj);
room_instance_add(argument0,336,96,wall_hor_obj);
room_instance_add(argument0,336,192,wall_hor_obj);
room_instance_add(argument0,336,224,wall_hor_obj);
room_instance_add(argument0,368,224,wall_hor_obj);
room_instance_add(argument0,368,256,wall_hor_obj);
room_instance_add(argument0,336,256,wall_hor_obj);
room_instance_add(argument0,304,256,wall_hor_obj);
room_instance_add(argument0,272,192,wall_hor_obj);
room_instance_add(argument0,240,192,wall_hor_obj);
room_instance_add(argument0,208,192,wall_hor_obj);
room_instance_add(argument0,208,96,wall_hor_obj);
room_instance_add(argument0,240,96,wall_hor_obj);
room_instance_add(argument0,304,32,wall_hor_obj);
room_instance_add(argument0,336,32,wall_hor_obj);
room_instance_add(argument0,368,32,wall_hor_obj);
room_instance_add(argument0,368,64,wall_hor_obj);
room_instance_add(argument0,336,64,wall_hor_obj);
room_instance_add(argument0,176,128,wall_hor_obj);
room_instance_add(argument0,176,160,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,192,176,wall_vert_obj);
room_instance_add(argument0,192,112,wall_vert_obj);
room_instance_add(argument0,352,112,wall_vert_obj);
room_instance_add(argument0,320,80,wall_vert_obj);
room_instance_add(argument0,288,80,wall_vert_obj);
room_instance_add(argument0,384,48,wall_vert_obj);
room_instance_add(argument0,288,48,wall_vert_obj);
room_instance_add(argument0,352,144,wall_vert_obj);
room_instance_add(argument0,352,176,wall_vert_obj);
room_instance_add(argument0,320,208,wall_vert_obj);
room_instance_add(argument0,288,208,wall_vert_obj);
room_instance_add(argument0,288,240,wall_vert_obj);
room_instance_add(argument0,384,240,wall_vert_obj);
// Torches
room_instance_add(argument0,336,32,torch_north_obj);
room_instance_add(argument0,336,224,torch_north_obj);
room_instance_add(argument0,336,64,torch_south_obj);
room_instance_add(argument0,336,256,torch_south_obj);
// Furniture
room_instance_add(argument0,336,144,table_rand_obj);
room_instance_add(argument0,208,112,chair_east_obj);
room_instance_add(argument0,208,176,chair_east_obj);
room_instance_add(argument0,272,112,chair_east_obj);
room_instance_add(argument0,272,176,chair_east_obj);