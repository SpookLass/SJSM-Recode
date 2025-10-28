/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sm','ROOM_sm')+' 4';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 128;
    global.spawn_arr[0,1] = 224;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 352;
    global.spawn_arr[1,1] = 192;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 281;
    global.mark_arr[0,1] = 209;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 256;
    global.mark_arr[1,1] = 240;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 176;
    global.mark_arr[2,1] = 208;
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
// Floors
room_instance_add(argument0,160,224,floor_obj);
room_instance_add(argument0,192,224,floor_obj);
room_instance_add(argument0,224,224,floor_obj);
room_instance_add(argument0,192,192,floor_obj);
room_instance_add(argument0,192,256,floor_obj);
room_instance_add(argument0,160,256,floor_obj);
room_instance_add(argument0,160,192,floor_obj);
room_instance_add(argument0,224,192,floor_obj);
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,256,192,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,288,192,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,128,224,floor_obj);
room_instance_add(argument0,320,192,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,352,224,floor_obj);
room_instance_add(argument0,352,192,floor_obj);
room_instance_add(argument0,384,192,floor_obj);
room_instance_add(argument0,384,224,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
// Ceilings
room_instance_add(argument0,160,224,ceil_obj);
room_instance_add(argument0,192,224,ceil_obj);
room_instance_add(argument0,224,224,ceil_obj);
room_instance_add(argument0,192,192,ceil_obj);
room_instance_add(argument0,192,256,ceil_obj);
room_instance_add(argument0,160,256,ceil_obj);
room_instance_add(argument0,160,192,ceil_obj);
room_instance_add(argument0,224,192,ceil_obj);
room_instance_add(argument0,224,256,ceil_obj);
room_instance_add(argument0,256,224,ceil_obj);
room_instance_add(argument0,256,192,ceil_obj);
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,224,ceil_obj);
room_instance_add(argument0,288,192,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,128,224,ceil_obj);
room_instance_add(argument0,320,192,ceil_obj);
room_instance_add(argument0,320,224,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,352,256,ceil_obj);
room_instance_add(argument0,352,224,ceil_obj);
room_instance_add(argument0,352,192,ceil_obj);
room_instance_add(argument0,384,192,ceil_obj);
room_instance_add(argument0,384,224,ceil_obj);
room_instance_add(argument0,384,256,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,128,208,wall_hor_obj);
room_instance_add(argument0,128,240,wall_hor_obj);
room_instance_add(argument0,160,176,wall_hor_obj);
room_instance_add(argument0,384,176,wall_hor_obj);
room_instance_add(argument0,352,176,wall_hor_obj);
room_instance_add(argument0,320,176,wall_hor_obj);
room_instance_add(argument0,288,176,wall_hor_obj);
room_instance_add(argument0,256,176,wall_hor_obj);
room_instance_add(argument0,224,176,wall_hor_obj);
room_instance_add(argument0,192,176,wall_hor_obj);
room_instance_add(argument0,160,272,wall_hor_obj);
room_instance_add(argument0,192,272,wall_hor_obj);
room_instance_add(argument0,224,272,wall_hor_obj);
room_instance_add(argument0,256,272,wall_hor_obj);
room_instance_add(argument0,288,272,wall_hor_obj);
room_instance_add(argument0,320,272,wall_hor_obj);
room_instance_add(argument0,352,272,wall_hor_obj);
room_instance_add(argument0,384,272,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,144,192,wall_vert_obj);
room_instance_add(argument0,112,224,wall_vert_obj);
room_instance_add(argument0,144,256,wall_vert_obj);
room_instance_add(argument0,400,192,wall_vert_obj);
room_instance_add(argument0,400,224,wall_vert_obj);
room_instance_add(argument0,400,256,wall_vert_obj);
// Torches
room_instance_add(argument0,400,192,torch_east_obj);
room_instance_add(argument0,400,256,torch_east_obj);
// Props
room_instance_add(argument0,208,192,chair_east_obj);
room_instance_add(argument0,208,256,chair_east_obj);
room_instance_add(argument0,240,192,chair_east_obj);
room_instance_add(argument0,240,256,chair_east_obj);
room_instance_add(argument0,272,192,chair_east_obj);
room_instance_add(argument0,272,256,chair_east_obj);
room_instance_add(argument0,304,192,chair_east_obj);
room_instance_add(argument0,304,256,chair_east_obj);
room_instance_add(argument0,383,224,bone_rand_obj);