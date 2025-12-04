/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','hotel','ROOM_hotel')+' 13 '+ini_read_string('ROOM','old','ROOM_old');
	ini_close();
    // Spawn
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 352;
    global.spawn_arr[1,1] = 288;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 352;
    global.spawn_arr[2,1] = 416;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    global.spawn_arr[3,0] = 352;
    global.spawn_arr[3,1] = 544;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 294;
    global.mark_arr[0,1] = 280;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 270;
    global.mark_arr[1,1] = 399;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 314;
    global.mark_arr[2,1] = 388;
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
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,288,352,floor_obj);
room_instance_add(argument0,256,384,floor_obj);
room_instance_add(argument0,288,384,floor_obj);
room_instance_add(argument0,320,384,floor_obj);
room_instance_add(argument0,320,416,floor_obj);
room_instance_add(argument0,288,416,floor_obj);
room_instance_add(argument0,256,416,floor_obj);
room_instance_add(argument0,288,448,floor_obj);
room_instance_add(argument0,288,480,floor_obj);
room_instance_add(argument0,256,512,floor_obj);
room_instance_add(argument0,288,512,floor_obj);
room_instance_add(argument0,320,512,floor_obj);
room_instance_add(argument0,320,544,floor_obj);
room_instance_add(argument0,288,544,floor_obj);
room_instance_add(argument0,256,544,floor_obj);
room_instance_add(argument0,352,416,floor_obj);
room_instance_add(argument0,352,544,floor_obj);
room_instance_add(argument0,352,288,floor_obj);
// Ceilings
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,320,288,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
room_instance_add(argument0,288,352,ceil_obj);
room_instance_add(argument0,256,384,ceil_obj);
room_instance_add(argument0,288,384,ceil_obj);
room_instance_add(argument0,320,384,ceil_obj);
room_instance_add(argument0,320,416,ceil_obj);
room_instance_add(argument0,288,416,ceil_obj);
room_instance_add(argument0,256,416,ceil_obj);
room_instance_add(argument0,288,448,ceil_obj);
room_instance_add(argument0,288,480,ceil_obj);
room_instance_add(argument0,256,512,ceil_obj);
room_instance_add(argument0,288,512,ceil_obj);
room_instance_add(argument0,320,512,ceil_obj);
room_instance_add(argument0,320,544,ceil_obj);
room_instance_add(argument0,288,544,ceil_obj);
room_instance_add(argument0,256,544,ceil_obj);
room_instance_add(argument0,352,416,ceil_obj);
room_instance_add(argument0,352,544,ceil_obj);
room_instance_add(argument0,352,288,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,256,240,wall_hor_obj);
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,320,240,wall_hor_obj);
room_instance_add(argument0,352,272,wall_hor_obj);
room_instance_add(argument0,352,304,wall_hor_obj);
room_instance_add(argument0,320,304,wall_hor_obj);
room_instance_add(argument0,320,368,wall_hor_obj);
room_instance_add(argument0,352,400,wall_hor_obj);
room_instance_add(argument0,352,432,wall_hor_obj);
room_instance_add(argument0,320,432,wall_hor_obj);
room_instance_add(argument0,320,496,wall_hor_obj);
room_instance_add(argument0,352,528,wall_hor_obj);
room_instance_add(argument0,352,560,wall_hor_obj);
room_instance_add(argument0,320,560,wall_hor_obj);
room_instance_add(argument0,288,560,wall_hor_obj);
room_instance_add(argument0,256,560,wall_hor_obj);
room_instance_add(argument0,256,496,wall_hor_obj);
room_instance_add(argument0,256,432,wall_hor_obj);
room_instance_add(argument0,256,368,wall_hor_obj);
room_instance_add(argument0,256,304,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,256,wall_vert_obj);
room_instance_add(argument0,240,288,wall_vert_obj);
room_instance_add(argument0,272,320,wall_vert_obj);
room_instance_add(argument0,272,352,wall_vert_obj);
room_instance_add(argument0,304,352,wall_vert_obj);
room_instance_add(argument0,304,320,wall_vert_obj);
room_instance_add(argument0,368,288,wall_vert_obj);
room_instance_add(argument0,336,256,wall_vert_obj);
room_instance_add(argument0,336,384,wall_vert_obj);
room_instance_add(argument0,368,416,wall_vert_obj);
room_instance_add(argument0,304,448,wall_vert_obj);
room_instance_add(argument0,304,480,wall_vert_obj);
room_instance_add(argument0,336,512,wall_vert_obj);
room_instance_add(argument0,368,544,wall_vert_obj);
room_instance_add(argument0,240,544,wall_vert_obj);
room_instance_add(argument0,240,512,wall_vert_obj);
room_instance_add(argument0,272,480,wall_vert_obj);
room_instance_add(argument0,272,448,wall_vert_obj);
room_instance_add(argument0,240,416,wall_vert_obj);
room_instance_add(argument0,240,384,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,288,304,doorframe_01_hor_obj);
room_instance_add(argument0,288,368,doorframe_01_hor_obj);
room_instance_add(argument0,288,432,doorframe_01_hor_obj);
room_instance_add(argument0,288,496,doorframe_01_hor_obj);
room_instance_add(argument0,288,304,doorframe_02_hor_obj);
room_instance_add(argument0,288,368,doorframe_02_hor_obj);
room_instance_add(argument0,288,432,doorframe_02_hor_obj);
room_instance_add(argument0,288,496,doorframe_02_hor_obj);
room_instance_add(argument0,352,288,bar_vert_obj);
room_instance_add(argument0,352,416,bar_vert_obj);