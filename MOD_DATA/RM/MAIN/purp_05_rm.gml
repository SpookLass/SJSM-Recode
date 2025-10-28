/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','purp','ROOM_purp')+' 5 / '+ini_read_string('ROOM','sm','ROOM_sm')+' 13';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 160;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 432;
    global.spawn_arr[1,1] = 416;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 2;
    global.mark_arr[0,0] = 300;
    global.mark_arr[0,1] = 159;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 367;
    global.mark_arr[1,1] = 351;
    global.mark_arr[1,2] = 0;
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
room_instance_add(argument0,0,0,color_control_purp_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,176,160,floor_obj);
room_instance_add(argument0,208,160,floor_obj);
room_instance_add(argument0,208,128,floor_obj);
room_instance_add(argument0,240,128,floor_obj);
room_instance_add(argument0,272,128,floor_obj);
room_instance_add(argument0,272,160,floor_obj);
room_instance_add(argument0,240,160,floor_obj);
room_instance_add(argument0,208,192,floor_obj);
room_instance_add(argument0,240,192,floor_obj);
room_instance_add(argument0,272,192,floor_obj);
room_instance_add(argument0,336,192,floor_obj);
room_instance_add(argument0,336,160,floor_obj);
room_instance_add(argument0,336,128,floor_obj);
room_instance_add(argument0,368,128,floor_obj);
room_instance_add(argument0,400,128,floor_obj);
room_instance_add(argument0,400,160,floor_obj);
room_instance_add(argument0,400,192,floor_obj);
room_instance_add(argument0,368,192,floor_obj);
room_instance_add(argument0,368,160,floor_obj);
room_instance_add(argument0,336,256,floor_obj);
room_instance_add(argument0,368,256,floor_obj);
room_instance_add(argument0,400,256,floor_obj);
room_instance_add(argument0,400,288,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,336,320,floor_obj);
room_instance_add(argument0,368,320,floor_obj);
room_instance_add(argument0,400,320,floor_obj);
room_instance_add(argument0,400,384,floor_obj);
room_instance_add(argument0,368,384,floor_obj);
room_instance_add(argument0,336,384,floor_obj);
room_instance_add(argument0,336,416,floor_obj);
room_instance_add(argument0,368,416,floor_obj);
room_instance_add(argument0,400,416,floor_obj);
room_instance_add(argument0,400,448,floor_obj);
room_instance_add(argument0,368,448,floor_obj);
room_instance_add(argument0,336,448,floor_obj);
room_instance_add(argument0,304,160,floor_obj);
room_instance_add(argument0,368,224,floor_obj);
room_instance_add(argument0,368,352,floor_obj);
room_instance_add(argument0,432,416,floor_obj);
// Ceilings
room_instance_add(argument0,176,160,ceil_obj);
room_instance_add(argument0,208,160,ceil_3high_obj);
room_instance_add(argument0,208,128,ceil_3high_obj);
room_instance_add(argument0,240,128,ceil_3high_obj);
room_instance_add(argument0,272,128,ceil_3high_obj);
room_instance_add(argument0,272,160,ceil_3high_obj);
room_instance_add(argument0,240,160,ceil_3high_obj);
room_instance_add(argument0,208,192,ceil_3high_obj);
room_instance_add(argument0,240,192,ceil_3high_obj);
room_instance_add(argument0,272,192,ceil_3high_obj);
room_instance_add(argument0,336,192,ceil_3high_obj);
room_instance_add(argument0,336,160,ceil_3high_obj);
room_instance_add(argument0,336,128,ceil_3high_obj);
room_instance_add(argument0,368,128,ceil_3high_obj);
room_instance_add(argument0,400,128,ceil_3high_obj);
room_instance_add(argument0,400,160,ceil_3high_obj);
room_instance_add(argument0,400,192,ceil_3high_obj);
room_instance_add(argument0,368,192,ceil_3high_obj);
room_instance_add(argument0,368,160,ceil_3high_obj);
room_instance_add(argument0,336,256,ceil_3high_obj);
room_instance_add(argument0,368,256,ceil_3high_obj);
room_instance_add(argument0,400,256,ceil_3high_obj);
room_instance_add(argument0,400,288,ceil_3high_obj);
room_instance_add(argument0,368,288,ceil_3high_obj);
room_instance_add(argument0,336,288,ceil_3high_obj);
room_instance_add(argument0,336,320,ceil_3high_obj);
room_instance_add(argument0,368,320,ceil_3high_obj);
room_instance_add(argument0,400,320,ceil_3high_obj);
room_instance_add(argument0,400,384,ceil_3high_obj);
room_instance_add(argument0,368,384,ceil_3high_obj);
room_instance_add(argument0,336,384,ceil_3high_obj);
room_instance_add(argument0,336,416,ceil_3high_obj);
room_instance_add(argument0,368,416,ceil_3high_obj);
room_instance_add(argument0,400,416,ceil_3high_obj);
room_instance_add(argument0,400,448,ceil_3high_obj);
room_instance_add(argument0,368,448,ceil_3high_obj);
room_instance_add(argument0,336,448,ceil_3high_obj);
room_instance_add(argument0,304,160,ceil_obj);
room_instance_add(argument0,368,224,ceil_obj);
room_instance_add(argument0,368,352,ceil_obj);
room_instance_add(argument0,432,416,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,144,wall_hor_obj);
room_instance_add(argument0,176,176,wall_hor_obj);
room_instance_add(argument0,304,144,wall_hor_obj);
room_instance_add(argument0,304,176,wall_hor_obj);
room_instance_add(argument0,432,400,wall_hor_obj);
room_instance_add(argument0,432,432,wall_hor_obj);
room_instance_add(argument0,208,112,wall_3high_hor_obj);
room_instance_add(argument0,240,112,wall_3high_hor_obj);
room_instance_add(argument0,272,112,wall_3high_hor_obj);
room_instance_add(argument0,272,208,wall_3high_hor_obj);
room_instance_add(argument0,240,208,wall_3high_hor_obj);
room_instance_add(argument0,208,208,wall_3high_hor_obj);
room_instance_add(argument0,336,208,wall_3high_hor_obj);
room_instance_add(argument0,400,208,wall_3high_hor_obj);
room_instance_add(argument0,400,240,wall_3high_hor_obj);
room_instance_add(argument0,336,240,wall_3high_hor_obj);
room_instance_add(argument0,336,112,wall_3high_hor_obj);
room_instance_add(argument0,368,112,wall_3high_hor_obj);
room_instance_add(argument0,400,112,wall_3high_hor_obj);
room_instance_add(argument0,400,336,wall_3high_hor_obj);
room_instance_add(argument0,336,336,wall_3high_hor_obj);
room_instance_add(argument0,336,368,wall_3high_hor_obj);
room_instance_add(argument0,400,368,wall_3high_hor_obj);
room_instance_add(argument0,400,464,wall_3high_hor_obj);
room_instance_add(argument0,368,464,wall_3high_hor_obj);
room_instance_add(argument0,336,464,wall_3high_hor_obj);
room_instance_add(argument0,368,240,wall_2doorway_hor_obj);
room_instance_add(argument0,368,208,wall_2doorway_hor_obj);
room_instance_add(argument0,368,336,wall_2doorway_hor_obj);
room_instance_add(argument0,368,368,wall_2doorway_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,160,wall_vert_obj);
room_instance_add(argument0,448,416,wall_vert_obj);
room_instance_add(argument0,384,224,wall_vert_obj);
room_instance_add(argument0,352,224,wall_vert_obj);
room_instance_add(argument0,352,352,wall_vert_obj);
room_instance_add(argument0,384,352,wall_vert_obj);
room_instance_add(argument0,288,192,wall_3high_vert_obj);
room_instance_add(argument0,288,128,wall_3high_vert_obj);
room_instance_add(argument0,192,128,wall_3high_vert_obj);
room_instance_add(argument0,192,192,wall_3high_vert_obj);
room_instance_add(argument0,416,192,wall_3high_vert_obj);
room_instance_add(argument0,416,160,wall_3high_vert_obj);
room_instance_add(argument0,416,128,wall_3high_vert_obj);
room_instance_add(argument0,320,128,wall_3high_vert_obj);
room_instance_add(argument0,320,192,wall_3high_vert_obj);
room_instance_add(argument0,320,256,wall_3high_vert_obj);
room_instance_add(argument0,320,288,wall_3high_vert_obj);
room_instance_add(argument0,320,320,wall_3high_vert_obj);
room_instance_add(argument0,416,320,wall_3high_vert_obj);
room_instance_add(argument0,416,288,wall_3high_vert_obj);
room_instance_add(argument0,416,256,wall_3high_vert_obj);
room_instance_add(argument0,416,384,wall_3high_vert_obj);
room_instance_add(argument0,416,448,wall_3high_vert_obj);
room_instance_add(argument0,320,448,wall_3high_vert_obj);
room_instance_add(argument0,320,416,wall_3high_vert_obj);
room_instance_add(argument0,320,384,wall_3high_vert_obj);
room_instance_add(argument0,192,160,wall_2doorway_vert_obj);
room_instance_add(argument0,288,160,wall_2doorway_vert_obj);
room_instance_add(argument0,320,160,wall_2doorway_vert_obj);
room_instance_add(argument0,416,416,wall_2doorway_vert_obj);
// Torches
room_instance_add(argument0,240,112,torch_north_obj);
room_instance_add(argument0,368,112,torch_north_obj);
room_instance_add(argument0,240,208,torch_south_obj);
room_instance_add(argument0,368,464,torch_south_obj);