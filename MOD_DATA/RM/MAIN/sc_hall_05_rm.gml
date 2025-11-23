/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sc','ROOM_sc')+' 5';
	ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 432;
    global.spawn_arr[1,1] = 352;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    global.spawn_arr[2,0] = 432;
    global.spawn_arr[2,1] = 224;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 211;
    global.mark_arr[0,1] = 289;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 377;
    global.mark_arr[1,1] = 282;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 454;
    global.mark_arr[2,1] = 276;
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
room_instance_add(argument0,0,0,fog_close_obj);
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,112,288,floor_obj);
room_instance_add(argument0,144,288,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
room_instance_add(argument0,240,288,floor_obj);
room_instance_add(argument0,272,288,floor_obj);
room_instance_add(argument0,272,320,floor_obj);
room_instance_add(argument0,272,256,floor_obj);
room_instance_add(argument0,304,256,floor_obj);
room_instance_add(argument0,336,256,floor_obj);
room_instance_add(argument0,368,256,floor_obj);
room_instance_add(argument0,400,256,floor_obj);
room_instance_add(argument0,400,288,floor_obj);
room_instance_add(argument0,400,320,floor_obj);
room_instance_add(argument0,368,320,floor_obj);
room_instance_add(argument0,336,320,floor_obj);
room_instance_add(argument0,304,320,floor_obj);
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,432,256,floor_obj);
room_instance_add(argument0,432,288,floor_obj);
room_instance_add(argument0,432,320,floor_obj);
room_instance_add(argument0,464,320,floor_obj);
room_instance_add(argument0,464,288,floor_obj);
room_instance_add(argument0,464,256,floor_obj);
room_instance_add(argument0,432,224,floor_obj);
room_instance_add(argument0,432,352,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_low_obj);
room_instance_add(argument0,144,288,ceil_low_obj);
room_instance_add(argument0,176,288,ceil_low_obj);
room_instance_add(argument0,208,288,ceil_low_obj);
room_instance_add(argument0,240,288,ceil_low_obj);
room_instance_add(argument0,272,288,ceil_low_obj);
room_instance_add(argument0,272,320,ceil_low_obj);
room_instance_add(argument0,272,256,ceil_low_obj);
room_instance_add(argument0,304,256,ceil_low_obj);
room_instance_add(argument0,336,256,ceil_low_obj);
room_instance_add(argument0,368,256,ceil_low_obj);
room_instance_add(argument0,400,256,ceil_low_obj);
room_instance_add(argument0,400,288,ceil_low_obj);
room_instance_add(argument0,400,320,ceil_low_obj);
room_instance_add(argument0,368,320,ceil_low_obj);
room_instance_add(argument0,336,320,ceil_low_obj);
room_instance_add(argument0,304,320,ceil_low_obj);
room_instance_add(argument0,304,288,ceil_low_obj);
room_instance_add(argument0,336,288,ceil_low_obj);
room_instance_add(argument0,368,288,ceil_low_obj);
room_instance_add(argument0,432,256,ceil_low_obj);
room_instance_add(argument0,432,288,ceil_low_obj);
room_instance_add(argument0,432,320,ceil_low_obj);
room_instance_add(argument0,464,320,ceil_low_obj);
room_instance_add(argument0,464,288,ceil_low_obj);
room_instance_add(argument0,464,256,ceil_low_obj);
room_instance_add(argument0,432,224,ceil_low_obj);
room_instance_add(argument0,432,352,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,272,wall_hor_obj);
room_instance_add(argument0,112,304,wall_hor_obj);
room_instance_add(argument0,240,272,wall_hor_obj);
room_instance_add(argument0,240,304,wall_hor_obj);
room_instance_add(argument0,208,304,wall_hor_obj);
room_instance_add(argument0,176,304,wall_hor_obj);
room_instance_add(argument0,144,304,wall_hor_obj);
room_instance_add(argument0,144,272,wall_hor_obj);
room_instance_add(argument0,176,272,wall_hor_obj);
room_instance_add(argument0,208,272,wall_hor_obj);
room_instance_add(argument0,272,336,wall_hor_obj);
room_instance_add(argument0,432,368,wall_hor_obj);
room_instance_add(argument0,432,208,wall_hor_obj);
room_instance_add(argument0,464,240,wall_hor_obj);
room_instance_add(argument0,464,336,wall_hor_obj);
room_instance_add(argument0,400,336,wall_hor_obj);
room_instance_add(argument0,336,336,wall_hor_obj);
room_instance_add(argument0,304,336,wall_hor_obj);
room_instance_add(argument0,368,336,wall_hor_obj);
room_instance_add(argument0,400,240,wall_hor_obj);
room_instance_add(argument0,368,240,wall_hor_obj);
room_instance_add(argument0,336,240,wall_hor_obj);
room_instance_add(argument0,304,240,wall_hor_obj);
room_instance_add(argument0,272,240,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,256,320,wall_vert_obj);
room_instance_add(argument0,256,256,wall_vert_obj);
room_instance_add(argument0,96,288,wall_vert_obj);
room_instance_add(argument0,448,224,wall_vert_obj);
room_instance_add(argument0,416,224,wall_vert_obj);
room_instance_add(argument0,480,256,wall_vert_obj);
room_instance_add(argument0,480,288,wall_vert_obj);
room_instance_add(argument0,480,320,wall_vert_obj);
room_instance_add(argument0,448,352,wall_vert_obj);
room_instance_add(argument0,416,352,wall_vert_obj);
// Torches
// Props