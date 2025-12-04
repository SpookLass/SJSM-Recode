/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','med','ROOM_med')+' 2 '+ini_read_string('ROOM','old','ROOM_old');
	ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 416;
    global.spawn_arr[0,1] = 336;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 544;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 544;
    global.spawn_arr[2,1] = 368;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 432;
    global.mark_arr[0,1] = 608;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 496;
    global.mark_arr[1,1] = 304;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 512;
    global.mark_arr[2,1] = 351;
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
room_instance_add(argument0,0,0,color_control_med_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
room_instance_add(argument0,0,0,water_obj);
// Floors
room_instance_add(argument0,416,336,floor_obj);
room_instance_add(argument0,448,304,floor_obj);
room_instance_add(argument0,416,304,floor_obj);
room_instance_add(argument0,416,368,floor_obj);
room_instance_add(argument0,448,368,floor_obj);
room_instance_add(argument0,480,368,floor_obj);
room_instance_add(argument0,480,304,floor_obj);
room_instance_add(argument0,512,368,floor_obj);
room_instance_add(argument0,512,336,floor_obj);
room_instance_add(argument0,512,304,floor_obj);
room_instance_add(argument0,544,304,floor_obj);
room_instance_add(argument0,544,336,floor_obj);
room_instance_add(argument0,544,272,floor_obj);
room_instance_add(argument0,512,272,floor_obj);
room_instance_add(argument0,512,400,floor_obj);
room_instance_add(argument0,544,400,floor_obj);
room_instance_add(argument0,544,368,floor_obj);
// Ceilings
room_instance_add(argument0,416,336,ceil_obj);
room_instance_add(argument0,448,304,ceil_obj);
room_instance_add(argument0,416,304,ceil_obj);
room_instance_add(argument0,416,368,ceil_obj);
room_instance_add(argument0,448,368,ceil_obj);
room_instance_add(argument0,480,368,ceil_obj);
room_instance_add(argument0,480,304,ceil_obj);
room_instance_add(argument0,512,368,ceil_obj);
room_instance_add(argument0,512,336,ceil_obj);
room_instance_add(argument0,512,304,ceil_obj);
room_instance_add(argument0,544,304,ceil_obj);
room_instance_add(argument0,544,336,ceil_obj);
room_instance_add(argument0,544,272,ceil_obj);
room_instance_add(argument0,512,272,ceil_obj);
room_instance_add(argument0,512,400,ceil_obj);
room_instance_add(argument0,544,400,ceil_obj);
room_instance_add(argument0,544,368,ceil_obj);
room_instance_add(argument0,448,336,ceil_obj);
room_instance_add(argument0,480,336,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,512,256,wall_hor_obj);
room_instance_add(argument0,544,256,wall_hor_obj);
room_instance_add(argument0,480,288,wall_hor_obj);
room_instance_add(argument0,448,288,wall_hor_obj);
room_instance_add(argument0,416,288,wall_hor_obj);
room_instance_add(argument0,416,384,wall_hor_obj);
room_instance_add(argument0,448,384,wall_hor_obj);
room_instance_add(argument0,480,384,wall_hor_obj);
room_instance_add(argument0,512,416,wall_hor_obj);
room_instance_add(argument0,544,416,wall_hor_obj);
room_instance_add(argument0,448,320,wall_pit_hor_obj);
room_instance_add(argument0,480,320,wall_pit_hor_obj);
room_instance_add(argument0,480,352,wall_pit_hor_obj);
room_instance_add(argument0,448,352,wall_pit_hor_obj);
room_instance_add(argument0,448,320,wall_float_hor_obj);
room_instance_add(argument0,480,320,wall_float_hor_obj);
room_instance_add(argument0,480,352,wall_float_hor_obj);
room_instance_add(argument0,448,352,wall_float_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,400,304,wall_vert_obj);
room_instance_add(argument0,400,336,wall_vert_obj);
room_instance_add(argument0,400,368,wall_vert_obj);
room_instance_add(argument0,496,272,wall_vert_obj);
room_instance_add(argument0,496,400,wall_vert_obj);
room_instance_add(argument0,560,400,wall_vert_obj);
room_instance_add(argument0,560,368,wall_vert_obj);
room_instance_add(argument0,560,336,wall_vert_obj);
room_instance_add(argument0,560,304,wall_vert_obj);
room_instance_add(argument0,560,272,wall_vert_obj);
room_instance_add(argument0,432,336,wall_pit_vert_obj);
room_instance_add(argument0,496,336,wall_pit_vert_obj);
room_instance_add(argument0,432,336,wall_float_vert_obj);
room_instance_add(argument0,496,336,wall_float_vert_obj);
// Torches
room_instance_add(argument0,560,272,torch_east_obj);
room_instance_add(argument0,560,336,torch_east_obj);
room_instance_add(argument0,560,400,torch_east_obj);