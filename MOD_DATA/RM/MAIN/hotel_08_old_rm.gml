/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','hotel','ROOM_hotel')+' 8 '+ini_read_string('ROOM','old','ROOM_old');
	ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 256;
    global.spawn_arr[1,1] = 128;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 0;
    global.spawn_arr[2,0] = 256;
    global.spawn_arr[2,1] = 192;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 0;
    // Mark
    global.mark_len_var = 2;
    global.mark_arr[0,0] = 291;
    global.mark_arr[0,1] = 277;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 292;
    global.mark_arr[1,1] = 217;
    global.mark_arr[1,2] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    global.unlock_var = spawn_create_scr(true,true);
")

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
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,320,192,floor_obj);
room_instance_add(argument0,288,192,floor_obj);
room_instance_add(argument0,256,192,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,320,160,floor_obj);
room_instance_add(argument0,320,128,floor_obj);
room_instance_add(argument0,288,128,floor_obj);
room_instance_add(argument0,256,128,floor_obj);
room_instance_add(argument0,256,160,floor_obj);
room_instance_add(argument0,288,160,floor_obj);
// Ceilings
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,320,288,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,320,224,ceil_obj);
room_instance_add(argument0,320,192,ceil_obj);
room_instance_add(argument0,288,192,ceil_obj);
room_instance_add(argument0,256,192,ceil_obj);
room_instance_add(argument0,256,224,ceil_obj);
room_instance_add(argument0,288,224,ceil_obj);
room_instance_add(argument0,320,160,ceil_obj);
room_instance_add(argument0,320,128,ceil_obj);
room_instance_add(argument0,288,128,ceil_obj);
room_instance_add(argument0,256,128,ceil_obj);
room_instance_add(argument0,256,160,ceil_obj);
room_instance_add(argument0,288,160,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,256,240,wall_hor_obj);
room_instance_add(argument0,256,176,wall_hor_obj);
room_instance_add(argument0,256,112,wall_hor_obj);
room_instance_add(argument0,288,112,wall_hor_obj);
room_instance_add(argument0,288,176,wall_hor_obj);
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,320,304,wall_hor_obj);
room_instance_add(argument0,288,304,wall_hor_obj);
room_instance_add(argument0,256,304,wall_hor_obj);
room_instance_add(argument0,320,112,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,256,wall_vert_obj);
room_instance_add(argument0,240,288,wall_vert_obj);
room_instance_add(argument0,240,224,wall_vert_obj);
room_instance_add(argument0,240,192,wall_vert_obj);
room_instance_add(argument0,240,160,wall_vert_obj);
room_instance_add(argument0,240,128,wall_vert_obj);
room_instance_add(argument0,336,128,wall_vert_obj);
room_instance_add(argument0,336,160,wall_vert_obj);
room_instance_add(argument0,336,192,wall_vert_obj);
room_instance_add(argument0,336,224,wall_vert_obj);
room_instance_add(argument0,336,256,wall_vert_obj);
room_instance_add(argument0,336,288,wall_vert_obj);
// Props
room_instance_add(argument0,320,240,doorframe_01_hor_obj);
room_instance_add(argument0,320,176,doorframe_01_hor_obj);
room_instance_add(argument0,320,176,doorframe_02_hor_obj);
room_instance_add(argument0,320,240,doorframe_02_hor_obj);