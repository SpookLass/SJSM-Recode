/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','w','ROOM_w')+' 15';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 496;
    global.spawn_arr[1,1] = 144;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 252;
    global.mark_arr[0,1] = 143;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 342;
    global.mark_arr[1,1] = 151;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 407;
    global.mark_arr[2,1] = 134;
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
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
room_instance_add(argument0,272,112,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,304,112,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,368,144,floor_obj);
room_instance_add(argument0,368,112,floor_obj);
room_instance_add(argument0,368,176,floor_obj);
room_instance_add(argument0,336,176,floor_obj);
room_instance_add(argument0,400,144,floor_obj);
room_instance_add(argument0,400,112,floor_obj);
room_instance_add(argument0,432,144,floor_obj);
room_instance_add(argument0,432,176,floor_obj);
room_instance_add(argument0,432,112,floor_obj);
room_instance_add(argument0,464,144,floor_obj);
room_instance_add(argument0,496,144,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,240,144,ceil_obj);
room_instance_add(argument0,272,144,ceil_obj);
room_instance_add(argument0,240,112,ceil_obj);
room_instance_add(argument0,272,112,ceil_obj);
room_instance_add(argument0,240,176,ceil_obj);
room_instance_add(argument0,304,176,ceil_obj);
room_instance_add(argument0,304,144,ceil_obj);
room_instance_add(argument0,304,112,ceil_obj);
room_instance_add(argument0,336,144,ceil_obj);
room_instance_add(argument0,368,144,ceil_obj);
room_instance_add(argument0,368,112,ceil_obj);
room_instance_add(argument0,368,176,ceil_obj);
room_instance_add(argument0,336,176,ceil_obj);
room_instance_add(argument0,400,144,ceil_obj);
room_instance_add(argument0,400,112,ceil_obj);
room_instance_add(argument0,432,144,ceil_obj);
room_instance_add(argument0,432,176,ceil_obj);
room_instance_add(argument0,432,112,ceil_obj);
room_instance_add(argument0,464,144,ceil_obj);
room_instance_add(argument0,496,144,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,128,wall_hor_obj);
room_instance_add(argument0,176,160,wall_hor_obj);
room_instance_add(argument0,208,128,wall_hor_obj);
room_instance_add(argument0,208,160,wall_hor_obj);
room_instance_add(argument0,240,192,wall_hor_obj);
room_instance_add(argument0,272,160,wall_hor_obj);
room_instance_add(argument0,272,96,wall_hor_obj);
room_instance_add(argument0,240,96,wall_hor_obj);
room_instance_add(argument0,304,96,wall_hor_obj);
room_instance_add(argument0,336,128,wall_hor_obj);
room_instance_add(argument0,400,160,wall_hor_obj);
room_instance_add(argument0,368,192,wall_hor_obj);
room_instance_add(argument0,336,192,wall_hor_obj);
room_instance_add(argument0,304,192,wall_hor_obj);
room_instance_add(argument0,432,192,wall_hor_obj);
room_instance_add(argument0,432,96,wall_hor_obj);
room_instance_add(argument0,400,96,wall_hor_obj);
room_instance_add(argument0,368,96,wall_hor_obj);
room_instance_add(argument0,464,128,wall_hor_obj);
room_instance_add(argument0,496,128,wall_hor_obj);
room_instance_add(argument0,496,160,wall_hor_obj);
room_instance_add(argument0,464,160,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,224,176,wall_vert_obj);
room_instance_add(argument0,256,176,wall_vert_obj);
room_instance_add(argument0,224,112,wall_vert_obj);
room_instance_add(argument0,320,112,wall_vert_obj);
room_instance_add(argument0,288,176,wall_vert_obj);
room_instance_add(argument0,384,176,wall_vert_obj);
room_instance_add(argument0,352,112,wall_vert_obj);
room_instance_add(argument0,448,112,wall_vert_obj);
room_instance_add(argument0,416,176,wall_vert_obj);
room_instance_add(argument0,448,176,wall_vert_obj);
room_instance_add(argument0,512,144,wall_vert_obj);
// Props
room_instance_add(argument0,272,96,frame_hor_rand_obj);
room_instance_add(argument0,400,96,frame_hor_rand_obj);
room_instance_add(argument0,336,192,frame_hor_rand_obj);
// Jumpscare
room_instance_add(argument0,472,160,js_obj);