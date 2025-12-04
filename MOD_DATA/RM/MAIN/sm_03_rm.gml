/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sm','ROOM_sm')+' 3';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 128;
    global.spawn_arr[0,1] = 224;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 320;
    global.spawn_arr[1,1] = 224;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 276;
    global.mark_arr[0,1] = 200;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 236;
    global.mark_arr[1,1] = 252;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 184;
    global.mark_arr[2,1] = 200;
    global.mark_arr[2,2] = 0;
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
room_instance_add(argument0,160,224,floor_obj);
room_instance_add(argument0,192,224,floor_obj);
room_instance_add(argument0,224,224,floor_obj);
room_instance_add(argument0,192,192,floor_obj);
room_instance_add(argument0,192,160,floor_obj);
room_instance_add(argument0,192,256,floor_obj);
room_instance_add(argument0,192,288,floor_obj);
room_instance_add(argument0,160,256,floor_obj);
room_instance_add(argument0,160,288,floor_obj);
room_instance_add(argument0,160,192,floor_obj);
room_instance_add(argument0,160,160,floor_obj);
room_instance_add(argument0,224,160,floor_obj);
room_instance_add(argument0,224,192,floor_obj);
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,224,288,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,256,192,floor_obj);
room_instance_add(argument0,256,160,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,288,192,floor_obj);
room_instance_add(argument0,288,160,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,128,224,floor_obj);
// Ceilings
room_instance_add(argument0,160,224,ceil_obj);
room_instance_add(argument0,192,224,ceil_obj);
room_instance_add(argument0,224,224,ceil_obj);
room_instance_add(argument0,192,192,ceil_obj);
room_instance_add(argument0,192,160,ceil_obj);
room_instance_add(argument0,192,256,ceil_obj);
room_instance_add(argument0,192,288,ceil_obj);
room_instance_add(argument0,160,256,ceil_obj);
room_instance_add(argument0,160,288,ceil_obj);
room_instance_add(argument0,160,192,ceil_obj);
room_instance_add(argument0,160,160,ceil_obj);
room_instance_add(argument0,224,160,ceil_obj);
room_instance_add(argument0,224,192,ceil_obj);
room_instance_add(argument0,224,256,ceil_obj);
room_instance_add(argument0,224,288,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,256,224,ceil_obj);
room_instance_add(argument0,256,192,ceil_obj);
room_instance_add(argument0,256,160,ceil_obj);
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,224,ceil_obj);
room_instance_add(argument0,288,192,ceil_obj);
room_instance_add(argument0,288,160,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,320,224,ceil_obj);
room_instance_add(argument0,128,224,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,128,208,wall_hor_obj);
room_instance_add(argument0,128,240,wall_hor_obj);
room_instance_add(argument0,320,208,wall_hor_obj);
room_instance_add(argument0,320,240,wall_hor_obj);
room_instance_add(argument0,288,304,wall_hor_obj);
room_instance_add(argument0,256,304,wall_hor_obj);
room_instance_add(argument0,224,304,wall_hor_obj);
room_instance_add(argument0,192,304,wall_hor_obj);
room_instance_add(argument0,160,304,wall_hor_obj);
room_instance_add(argument0,160,144,wall_hor_obj);
room_instance_add(argument0,192,144,wall_hor_obj);
room_instance_add(argument0,256,144,wall_hor_obj);
room_instance_add(argument0,224,144,wall_hor_obj);
room_instance_add(argument0,288,144,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,144,160,wall_vert_obj);
room_instance_add(argument0,144,192,wall_vert_obj);
room_instance_add(argument0,112,224,wall_vert_obj);
room_instance_add(argument0,144,256,wall_vert_obj);
room_instance_add(argument0,144,288,wall_vert_obj);
room_instance_add(argument0,304,288,wall_vert_obj);
room_instance_add(argument0,336,224,wall_vert_obj);
room_instance_add(argument0,304,256,wall_vert_obj);
room_instance_add(argument0,304,192,wall_vert_obj);
room_instance_add(argument0,304,160,wall_vert_obj);
// Torches
room_instance_add(argument0,160,144,torch_north_obj);
room_instance_add(argument0,224,144,torch_north_obj);
room_instance_add(argument0,288,144,torch_north_obj);
room_instance_add(argument0,160,304,torch_south_obj);
room_instance_add(argument0,224,304,torch_south_obj);
room_instance_add(argument0,288,304,torch_south_obj);
// Props
room_instance_add(argument0,256,160,table_rand_obj);
room_instance_add(argument0,192,160,chair_rand_obj);
room_instance_add(argument0,224,224,rug_rand_rot_obj);
room_instance_add(argument0,192,144,frame_hor_rand_obj);
room_instance_add(argument0,256,144,frame_hor_rand_obj);
room_instance_add(argument0,256,304,frame_hor_rand_obj);
room_instance_add(argument0,192,304,frame_hor_rand_obj);