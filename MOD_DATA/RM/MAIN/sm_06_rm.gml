/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sm','ROOM_sm')+' 6';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 128;
    global.spawn_arr[0,1] = 272;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 224;
    global.spawn_arr[1,1] = 208;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
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
room_instance_add(argument0,0,0,color_control_med_obj); // Why???
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,128,272,floor_obj);
room_instance_add(argument0,160,272,floor_obj);
room_instance_add(argument0,192,272,floor_obj);
room_instance_add(argument0,160,240,floor_obj);
room_instance_add(argument0,192,240,floor_obj);
room_instance_add(argument0,128,240,floor_obj);
room_instance_add(argument0,128,304,floor_obj);
room_instance_add(argument0,160,304,floor_obj);
room_instance_add(argument0,192,304,floor_obj);
room_instance_add(argument0,224,304,floor_obj);
room_instance_add(argument0,224,272,floor_obj);
room_instance_add(argument0,224,240,floor_obj);
room_instance_add(argument0,224,208,floor_obj);
room_instance_add(argument0,192,208,floor_obj);
room_instance_add(argument0,160,208,floor_obj);
room_instance_add(argument0,128,208,floor_obj);
room_instance_add(argument0,256,208,floor_obj);
room_instance_add(argument0,256,240,floor_obj);
room_instance_add(argument0,256,272,floor_obj);
room_instance_add(argument0,256,304,floor_obj);
// Ceilings
room_instance_add(argument0,128,272,ceil_obj);
room_instance_add(argument0,160,272,ceil_obj);
room_instance_add(argument0,192,272,ceil_obj);
room_instance_add(argument0,160,240,ceil_obj);
room_instance_add(argument0,192,240,ceil_obj);
room_instance_add(argument0,128,240,ceil_obj);
room_instance_add(argument0,128,304,ceil_obj);
room_instance_add(argument0,160,304,ceil_obj);
room_instance_add(argument0,192,304,ceil_obj);
room_instance_add(argument0,224,304,ceil_obj);
room_instance_add(argument0,224,272,ceil_obj);
room_instance_add(argument0,224,240,ceil_obj);
room_instance_add(argument0,224,208,ceil_obj);
room_instance_add(argument0,192,208,ceil_obj);
room_instance_add(argument0,160,208,ceil_obj);
room_instance_add(argument0,128,208,ceil_obj);
room_instance_add(argument0,256,208,ceil_obj);
room_instance_add(argument0,256,240,ceil_obj);
room_instance_add(argument0,256,272,ceil_obj);
room_instance_add(argument0,256,304,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,128,192,wall_hor_obj);
room_instance_add(argument0,128,320,wall_hor_obj);
room_instance_add(argument0,160,320,wall_hor_obj);
room_instance_add(argument0,192,320,wall_hor_obj);
room_instance_add(argument0,224,320,wall_hor_obj);
room_instance_add(argument0,256,320,wall_hor_obj);
room_instance_add(argument0,256,192,wall_hor_obj);
room_instance_add(argument0,224,192,wall_hor_obj);
room_instance_add(argument0,192,192,wall_hor_obj);
room_instance_add(argument0,160,192,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,112,208,wall_vert_obj);
room_instance_add(argument0,112,240,wall_vert_obj);
room_instance_add(argument0,112,272,wall_vert_obj);
room_instance_add(argument0,112,304,wall_vert_obj);
room_instance_add(argument0,272,304,wall_vert_obj);
room_instance_add(argument0,272,272,wall_vert_obj);
room_instance_add(argument0,272,240,wall_vert_obj);
room_instance_add(argument0,272,208,wall_vert_obj);
// Torches
room_instance_add(argument0,128,192,torch_north_obj);
room_instance_add(argument0,256,192,torch_north_obj);
room_instance_add(argument0,128,320,torch_south_obj);
room_instance_add(argument0,256,320,torch_south_obj);
// Props
room_instance_add(argument0,256,256,table_rand_obj);