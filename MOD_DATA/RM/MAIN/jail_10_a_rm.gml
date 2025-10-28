/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','jail','ROOM_jail')+' 10 A';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 432;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 187;
    global.mark_arr[0,1] = 301;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 301;
    global.mark_arr[1,1] = 308;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 360;
    global.mark_arr[2,1] = 300;
    global.mark_arr[2,2] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
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
// Floors
room_instance_add(argument0,144,304,floor_obj);
room_instance_add(argument0,112,304,floor_obj);
room_instance_add(argument0,400,304,floor_obj);
room_instance_add(argument0,432,304,floor_obj);
room_instance_add(argument0,176,304,floor_obj);
room_instance_add(argument0,176,272,floor_obj);
room_instance_add(argument0,176,336,floor_obj);
room_instance_add(argument0,208,304,floor_obj);
room_instance_add(argument0,368,304,floor_obj);
room_instance_add(argument0,336,304,floor_obj);
room_instance_add(argument0,304,304,floor_obj);
room_instance_add(argument0,272,304,floor_obj);
room_instance_add(argument0,240,304,floor_obj);
room_instance_add(argument0,368,272,floor_obj);
room_instance_add(argument0,368,336,floor_obj);
room_instance_add(argument0,272,336,floor_obj);
room_instance_add(argument0,240,336,floor_obj);
room_instance_add(argument0,304,336,floor_obj);
room_instance_add(argument0,304,272,floor_obj);
room_instance_add(argument0,272,272,floor_obj);
room_instance_add(argument0,240,272,floor_obj);
room_instance_add(argument0,208,272,floor_obj);
room_instance_add(argument0,208,336,floor_obj);
room_instance_add(argument0,336,272,floor_obj);
room_instance_add(argument0,336,336,floor_obj);
room_instance_add(argument0,272,368,floor_obj);
room_instance_add(argument0,240,368,floor_obj);
room_instance_add(argument0,208,368,floor_obj);
room_instance_add(argument0,176,368,floor_obj);
room_instance_add(argument0,304,368,floor_obj);
room_instance_add(argument0,336,368,floor_obj);
room_instance_add(argument0,368,368,floor_obj);
room_instance_add(argument0,368,240,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,272,240,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
room_instance_add(argument0,208,240,floor_obj);
room_instance_add(argument0,176,240,floor_obj);
// Ceilings
room_instance_add(argument0,144,304,ceil_obj);
room_instance_add(argument0,112,304,ceil_obj);
room_instance_add(argument0,400,304,ceil_obj);
room_instance_add(argument0,432,304,ceil_obj);
room_instance_add(argument0,176,304,ceil_obj);
room_instance_add(argument0,176,272,ceil_obj);
room_instance_add(argument0,176,336,ceil_obj);
room_instance_add(argument0,208,304,ceil_obj);
room_instance_add(argument0,368,304,ceil_obj);
room_instance_add(argument0,336,304,ceil_obj);
room_instance_add(argument0,304,304,ceil_obj);
room_instance_add(argument0,272,304,ceil_obj);
room_instance_add(argument0,240,304,ceil_obj);
room_instance_add(argument0,368,272,ceil_obj);
room_instance_add(argument0,368,336,ceil_obj);
room_instance_add(argument0,272,336,ceil_obj);
room_instance_add(argument0,240,336,ceil_obj);
room_instance_add(argument0,304,336,ceil_obj);
room_instance_add(argument0,304,272,ceil_obj);
room_instance_add(argument0,272,272,ceil_obj);
room_instance_add(argument0,240,272,ceil_obj);
room_instance_add(argument0,208,272,ceil_obj);
room_instance_add(argument0,208,336,ceil_obj);
room_instance_add(argument0,336,272,ceil_obj);
room_instance_add(argument0,336,336,ceil_obj);
room_instance_add(argument0,272,368,ceil_obj);
room_instance_add(argument0,240,368,ceil_obj);
room_instance_add(argument0,208,368,ceil_obj);
room_instance_add(argument0,176,368,ceil_obj);
room_instance_add(argument0,304,368,ceil_obj);
room_instance_add(argument0,336,368,ceil_obj);
room_instance_add(argument0,368,368,ceil_obj);
room_instance_add(argument0,368,240,ceil_obj);
room_instance_add(argument0,336,240,ceil_obj);
room_instance_add(argument0,304,240,ceil_obj);
room_instance_add(argument0,272,240,ceil_obj);
room_instance_add(argument0,240,240,ceil_obj);
room_instance_add(argument0,208,240,ceil_obj);
room_instance_add(argument0,176,240,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,288,wall_hor_obj);
room_instance_add(argument0,112,288,wall_hor_obj);
room_instance_add(argument0,112,320,wall_hor_obj);
room_instance_add(argument0,144,320,wall_hor_obj);
room_instance_add(argument0,400,288,wall_hor_obj);
room_instance_add(argument0,432,288,wall_hor_obj);
room_instance_add(argument0,432,320,wall_hor_obj);
room_instance_add(argument0,400,320,wall_hor_obj);
room_instance_add(argument0,176,224,wall_hor_obj);
room_instance_add(argument0,208,224,wall_hor_obj);
room_instance_add(argument0,240,224,wall_hor_obj);
room_instance_add(argument0,272,224,wall_hor_obj);
room_instance_add(argument0,304,224,wall_hor_obj);
room_instance_add(argument0,336,224,wall_hor_obj);
room_instance_add(argument0,368,224,wall_hor_obj);
room_instance_add(argument0,336,384,wall_hor_obj);
room_instance_add(argument0,368,384,wall_hor_obj);
room_instance_add(argument0,304,384,wall_hor_obj);
room_instance_add(argument0,272,384,wall_hor_obj);
room_instance_add(argument0,176,384,wall_hor_obj);
room_instance_add(argument0,208,384,wall_hor_obj);
room_instance_add(argument0,240,384,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,304,wall_vert_obj);
room_instance_add(argument0,448,304,wall_vert_obj);
room_instance_add(argument0,160,272,wall_vert_obj);
room_instance_add(argument0,160,240,wall_vert_obj);
room_instance_add(argument0,160,336,wall_vert_obj);
room_instance_add(argument0,160,368,wall_vert_obj);
room_instance_add(argument0,384,336,wall_vert_obj);
room_instance_add(argument0,384,368,wall_vert_obj);
room_instance_add(argument0,384,272,wall_vert_obj);
room_instance_add(argument0,384,240,wall_vert_obj);
// Torches
room_instance_add(argument0,176,224,torch_north_obj);
room_instance_add(argument0,240,224,torch_north_obj);
room_instance_add(argument0,304,224,torch_north_obj);
room_instance_add(argument0,368,224,torch_north_obj);
room_instance_add(argument0,176,384,torch_south_obj);
room_instance_add(argument0,240,384,torch_south_obj);
room_instance_add(argument0,304,384,torch_south_obj);
room_instance_add(argument0,368,384,torch_south_obj);
// Props
room_instance_add(argument0,176,272,bar_hor_obj);
room_instance_add(argument0,208,272,bar_hor_obj);
room_instance_add(argument0,240,272,bar_hor_obj);
room_instance_add(argument0,272,272,bar_hor_obj);
room_instance_add(argument0,304,272,bar_hor_obj);
room_instance_add(argument0,336,272,bar_hor_obj);
room_instance_add(argument0,368,272,bar_hor_obj);
room_instance_add(argument0,368,336,bar_hor_obj);
room_instance_add(argument0,336,336,bar_hor_obj);
room_instance_add(argument0,304,336,bar_hor_obj);
room_instance_add(argument0,272,336,bar_hor_obj);
room_instance_add(argument0,240,336,bar_hor_obj);
room_instance_add(argument0,208,336,bar_hor_obj);
room_instance_add(argument0,176,336,bar_hor_obj);
// Doors
room_instance_add(argument0,204,224,door_north_obj);
room_instance_add(argument0,204,232,door_trig_obj);
room_instance_add(argument0,336,224,door_north_obj);
room_instance_add(argument0,336,232,door_trig_obj);
room_instance_add(argument0,204,384,door_south_obj);
room_instance_add(argument0,204,376,door_trig_obj);
room_instance_add(argument0,336,384,door_south_obj);
room_instance_add(argument0,336,376,door_trig_obj);
// Jumpscare
room_instance_add(argument0,416,320,js_obj);