/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sm_lab','ROOM_sm_lab')+' 5';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 128;
    global.spawn_arr[0,1] = 272;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 416;
    global.spawn_arr[1,1] = 272;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 0;
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,128,272,floor_obj);
room_instance_add(argument0,160,272,floor_obj);
room_instance_add(argument0,192,272,floor_obj);
room_instance_add(argument0,224,272,floor_obj);
room_instance_add(argument0,256,272,floor_obj);
room_instance_add(argument0,288,272,floor_obj);
room_instance_add(argument0,320,272,floor_obj);
room_instance_add(argument0,352,272,floor_obj);
room_instance_add(argument0,384,272,floor_obj);
room_instance_add(argument0,352,240,floor_obj);
room_instance_add(argument0,384,240,floor_obj);
room_instance_add(argument0,416,240,floor_obj);
room_instance_add(argument0,416,272,floor_obj);
room_instance_add(argument0,416,304,floor_obj);
room_instance_add(argument0,384,304,floor_obj);
room_instance_add(argument0,352,304,floor_obj);
room_instance_add(argument0,160,240,floor_high_obj);
room_instance_add(argument0,224,240,floor_high_obj);
room_instance_add(argument0,224,304,floor_high_obj);
room_instance_add(argument0,160,304,floor_high_obj);
room_instance_add(argument0,192,304,floor_high_obj);
room_instance_add(argument0,192,240,floor_high_obj);
room_instance_add(argument0,256,240,floor_high_obj);
room_instance_add(argument0,288,240,floor_high_obj);
room_instance_add(argument0,256,304,floor_high_obj);
room_instance_add(argument0,288,304,floor_high_obj);
room_instance_add(argument0,384,208,floor_high_obj);
room_instance_add(argument0,416,208,floor_high_obj);
room_instance_add(argument0,352,208,floor_high_obj);
room_instance_add(argument0,352,336,floor_high_obj);
room_instance_add(argument0,384,336,floor_high_obj);
room_instance_add(argument0,416,336,floor_high_obj);
// Ceilings
room_instance_add(argument0,128,272,ceil_2high_obj);
room_instance_add(argument0,160,272,ceil_2high_obj);
room_instance_add(argument0,192,272,ceil_2high_obj);
room_instance_add(argument0,224,272,ceil_2high_obj);
room_instance_add(argument0,256,272,ceil_2high_obj);
room_instance_add(argument0,288,272,ceil_2high_obj);
room_instance_add(argument0,320,272,ceil_2high_obj);
room_instance_add(argument0,352,272,ceil_2high_obj);
room_instance_add(argument0,384,272,ceil_2high_obj);
room_instance_add(argument0,352,240,ceil_2high_obj);
room_instance_add(argument0,384,240,ceil_2high_obj);
room_instance_add(argument0,416,240,ceil_2high_obj);
room_instance_add(argument0,416,272,ceil_2high_obj);
room_instance_add(argument0,416,304,ceil_2high_obj);
room_instance_add(argument0,384,304,ceil_2high_obj);
room_instance_add(argument0,352,304,ceil_2high_obj);
room_instance_add(argument0,160,240,ceil_2high_obj);
room_instance_add(argument0,224,240,ceil_2high_obj);
room_instance_add(argument0,224,304,ceil_2high_obj);
room_instance_add(argument0,160,304,ceil_2high_obj);
room_instance_add(argument0,192,304,ceil_2high_obj);
room_instance_add(argument0,192,240,ceil_2high_obj);
room_instance_add(argument0,256,240,ceil_2high_obj);
room_instance_add(argument0,288,240,ceil_2high_obj);
room_instance_add(argument0,256,304,ceil_2high_obj);
room_instance_add(argument0,288,304,ceil_2high_obj);
room_instance_add(argument0,384,208,ceil_2high_obj);
room_instance_add(argument0,416,208,ceil_2high_obj);
room_instance_add(argument0,352,208,ceil_2high_obj);
room_instance_add(argument0,352,336,ceil_2high_obj);
room_instance_add(argument0,384,336,ceil_2high_obj);
room_instance_add(argument0,416,336,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,128,288,wall_2high_hor_obj);
room_instance_add(argument0,128,256,wall_2high_hor_obj);
room_instance_add(argument0,192,256,wall_2high_hor_obj);
room_instance_add(argument0,192,288,wall_2high_hor_obj);
room_instance_add(argument0,256,256,wall_2high_hor_obj);
room_instance_add(argument0,320,256,wall_2high_hor_obj);
room_instance_add(argument0,320,288,wall_2high_hor_obj);
room_instance_add(argument0,256,288,wall_2high_hor_obj);
room_instance_add(argument0,352,224,wall_2high_hor_obj);
room_instance_add(argument0,416,224,wall_2high_hor_obj);
room_instance_add(argument0,416,320,wall_2high_hor_obj);
room_instance_add(argument0,352,320,wall_2high_hor_obj);
room_instance_add(argument0,160,224,wall_2high_hor_obj);
room_instance_add(argument0,192,224,wall_2high_hor_obj);
room_instance_add(argument0,224,224,wall_2high_hor_obj);
room_instance_add(argument0,256,224,wall_2high_hor_obj);
room_instance_add(argument0,288,224,wall_2high_hor_obj);
room_instance_add(argument0,352,192,wall_2high_hor_obj);
room_instance_add(argument0,384,192,wall_2high_hor_obj);
room_instance_add(argument0,416,192,wall_2high_hor_obj);
room_instance_add(argument0,416,352,wall_2high_hor_obj);
room_instance_add(argument0,384,352,wall_2high_hor_obj);
room_instance_add(argument0,352,352,wall_2high_hor_obj);
room_instance_add(argument0,288,320,wall_2high_hor_obj);
room_instance_add(argument0,256,320,wall_2high_hor_obj);
room_instance_add(argument0,224,320,wall_2high_hor_obj);
room_instance_add(argument0,192,320,wall_2high_hor_obj);
room_instance_add(argument0,160,320,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,112,272,wall_2high_vert_obj);
room_instance_add(argument0,336,304,wall_2high_vert_obj);
room_instance_add(argument0,336,240,wall_2high_vert_obj);
room_instance_add(argument0,432,240,wall_2high_vert_obj);
room_instance_add(argument0,432,272,wall_2high_vert_obj);
room_instance_add(argument0,432,304,wall_2high_vert_obj);
room_instance_add(argument0,144,304,wall_2high_vert_obj);
room_instance_add(argument0,144,240,wall_2high_vert_obj);
room_instance_add(argument0,304,240,wall_2high_vert_obj);
room_instance_add(argument0,304,304,wall_2high_vert_obj);
room_instance_add(argument0,336,336,wall_2high_vert_obj);
room_instance_add(argument0,432,336,wall_2high_vert_obj);
room_instance_add(argument0,432,208,wall_2high_vert_obj);
room_instance_add(argument0,336,208,wall_2high_vert_obj);
// Props
room_instance_add(argument0,160,288,lab_window_hor_obj);
room_instance_add(argument0,160,256,lab_window_hor_obj);
room_instance_add(argument0,224,256,lab_window_hor_obj);
room_instance_add(argument0,224,288,lab_window_hor_obj);
room_instance_add(argument0,288,256,lab_window_hor_obj);
room_instance_add(argument0,288,288,lab_window_hor_obj);
room_instance_add(argument0,384,320,lab_window_hor_obj);
room_instance_add(argument0,384,224,lab_window_hor_obj);