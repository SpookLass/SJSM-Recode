/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','med','ROOM_med')+' 3';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 192;
    global.spawn_arr[0,1] = 240;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 352;
    global.spawn_arr[1,1] = 496;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 227;
    global.mark_arr[0,1] = 309;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 286;
    global.mark_arr[1,1] = 298;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 228;
    global.mark_arr[2,1] = 376;
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
room_instance_add(argument0,0,0,color_control_med_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
room_instance_add(argument0,0,0,water_obj);
// Floors
room_instance_add(argument0,192,240,floor_obj);
room_instance_add(argument0,224,240,floor_obj);
room_instance_add(argument0,224,272,floor_obj);
room_instance_add(argument0,224,208,floor_obj);
room_instance_add(argument0,224,176,floor_obj);
room_instance_add(argument0,256,176,floor_obj);
room_instance_add(argument0,288,176,floor_obj);
room_instance_add(argument0,288,208,floor_obj);
room_instance_add(argument0,288,240,floor_obj);
room_instance_add(argument0,288,272,floor_obj);
room_instance_add(argument0,288,304,floor_obj);
room_instance_add(argument0,256,304,floor_obj);
room_instance_add(argument0,224,304,floor_obj);
room_instance_add(argument0,224,336,floor_obj);
room_instance_add(argument0,288,336,floor_obj);
room_instance_add(argument0,288,368,floor_obj);
room_instance_add(argument0,224,368,floor_obj);
room_instance_add(argument0,224,400,floor_obj);
room_instance_add(argument0,288,400,floor_obj);
room_instance_add(argument0,288,432,floor_obj);
room_instance_add(argument0,256,432,floor_obj);
room_instance_add(argument0,224,432,floor_obj);
room_instance_add(argument0,256,464,floor_obj);
room_instance_add(argument0,256,496,floor_obj);
room_instance_add(argument0,288,496,floor_obj);
room_instance_add(argument0,320,496,floor_obj);
room_instance_add(argument0,352,496,floor_obj);
// Ceilings
room_instance_add(argument0,192,240,ceil_obj);
room_instance_add(argument0,224,240,ceil_obj);
room_instance_add(argument0,224,272,ceil_obj);
room_instance_add(argument0,224,208,ceil_obj);
room_instance_add(argument0,224,176,ceil_obj);
room_instance_add(argument0,256,176,ceil_obj);
room_instance_add(argument0,288,176,ceil_obj);
room_instance_add(argument0,288,208,ceil_obj);
room_instance_add(argument0,288,240,ceil_obj);
room_instance_add(argument0,288,272,ceil_obj);
room_instance_add(argument0,288,304,ceil_obj);
room_instance_add(argument0,256,304,ceil_obj);
room_instance_add(argument0,224,304,ceil_obj);
room_instance_add(argument0,224,336,ceil_obj);
room_instance_add(argument0,288,336,ceil_obj);
room_instance_add(argument0,288,368,ceil_obj);
room_instance_add(argument0,224,368,ceil_obj);
room_instance_add(argument0,224,400,ceil_obj);
room_instance_add(argument0,288,400,ceil_obj);
room_instance_add(argument0,288,432,ceil_obj);
room_instance_add(argument0,256,432,ceil_obj);
room_instance_add(argument0,224,432,ceil_obj);
room_instance_add(argument0,256,464,ceil_obj);
room_instance_add(argument0,256,496,ceil_obj);
room_instance_add(argument0,288,496,ceil_obj);
room_instance_add(argument0,320,496,ceil_obj);
room_instance_add(argument0,352,496,ceil_obj);
room_instance_add(argument0,256,336,ceil_obj);
room_instance_add(argument0,256,368,ceil_obj);
room_instance_add(argument0,256,400,ceil_obj);
room_instance_add(argument0,256,208,ceil_obj);
room_instance_add(argument0,256,240,ceil_obj);
room_instance_add(argument0,256,272,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,192,224,wall_hor_obj);
room_instance_add(argument0,192,256,wall_hor_obj);
room_instance_add(argument0,224,160,wall_hor_obj);
room_instance_add(argument0,256,160,wall_hor_obj);
room_instance_add(argument0,288,160,wall_hor_obj);
room_instance_add(argument0,288,448,wall_hor_obj);
room_instance_add(argument0,224,448,wall_hor_obj);
room_instance_add(argument0,288,480,wall_hor_obj);
room_instance_add(argument0,320,480,wall_hor_obj);
room_instance_add(argument0,352,480,wall_hor_obj);
room_instance_add(argument0,352,512,wall_hor_obj);
room_instance_add(argument0,320,512,wall_hor_obj);
room_instance_add(argument0,288,512,wall_hor_obj);
room_instance_add(argument0,256,512,wall_hor_obj);
room_instance_add(argument0,256,416,wall_pit_hor_obj);
room_instance_add(argument0,256,320,wall_pit_hor_obj);
room_instance_add(argument0,256,288,wall_pit_hor_obj);
room_instance_add(argument0,256,192,wall_pit_hor_obj);
room_instance_add(argument0,256,416,wall_float_hor_obj);
room_instance_add(argument0,256,320,wall_float_hor_obj);
room_instance_add(argument0,256,288,wall_float_hor_obj);
room_instance_add(argument0,256,192,wall_float_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,176,240,wall_vert_obj);
room_instance_add(argument0,368,496,wall_vert_obj);
room_instance_add(argument0,272,464,wall_vert_obj);
room_instance_add(argument0,240,464,wall_vert_obj);
room_instance_add(argument0,240,496,wall_vert_obj);
room_instance_add(argument0,304,432,wall_vert_obj);
room_instance_add(argument0,208,432,wall_vert_obj);
room_instance_add(argument0,208,400,wall_vert_obj);
room_instance_add(argument0,208,368,wall_vert_obj);
room_instance_add(argument0,208,336,wall_vert_obj);
room_instance_add(argument0,208,304,wall_vert_obj);
room_instance_add(argument0,208,272,wall_vert_obj);
room_instance_add(argument0,208,208,wall_vert_obj);
room_instance_add(argument0,208,176,wall_vert_obj);
room_instance_add(argument0,304,176,wall_vert_obj);
room_instance_add(argument0,304,208,wall_vert_obj);
room_instance_add(argument0,304,240,wall_vert_obj);
room_instance_add(argument0,304,272,wall_vert_obj);
room_instance_add(argument0,304,304,wall_vert_obj);
room_instance_add(argument0,304,336,wall_vert_obj);
room_instance_add(argument0,304,368,wall_vert_obj);
room_instance_add(argument0,304,400,wall_vert_obj);
room_instance_add(argument0,240,208,wall_pit_vert_obj);
room_instance_add(argument0,272,208,wall_pit_vert_obj);
room_instance_add(argument0,272,240,wall_pit_vert_obj);
room_instance_add(argument0,240,240,wall_pit_vert_obj);
room_instance_add(argument0,240,272,wall_pit_vert_obj);
room_instance_add(argument0,272,272,wall_pit_vert_obj);
room_instance_add(argument0,240,336,wall_pit_vert_obj);
room_instance_add(argument0,272,336,wall_pit_vert_obj);
room_instance_add(argument0,272,368,wall_pit_vert_obj);
room_instance_add(argument0,240,368,wall_pit_vert_obj);
room_instance_add(argument0,240,400,wall_pit_vert_obj);
room_instance_add(argument0,272,400,wall_pit_vert_obj);
room_instance_add(argument0,240,208,wall_float_vert_obj);
room_instance_add(argument0,272,208,wall_float_vert_obj);
room_instance_add(argument0,272,240,wall_float_vert_obj);
room_instance_add(argument0,240,240,wall_float_vert_obj);
room_instance_add(argument0,240,272,wall_float_vert_obj);
room_instance_add(argument0,272,272,wall_float_vert_obj);
room_instance_add(argument0,240,336,wall_float_vert_obj);
room_instance_add(argument0,272,336,wall_float_vert_obj);
room_instance_add(argument0,272,368,wall_float_vert_obj);
room_instance_add(argument0,240,368,wall_float_vert_obj);
room_instance_add(argument0,240,400,wall_float_vert_obj);
room_instance_add(argument0,272,400,wall_float_vert_obj);
// Torches
room_instance_add(argument0,320,480,torch_north_obj);
room_instance_add(argument0,320,512,torch_south_obj);
room_instance_add(argument0,288,448,torch_south_obj);
room_instance_add(argument0,224,448,torch_south_obj);