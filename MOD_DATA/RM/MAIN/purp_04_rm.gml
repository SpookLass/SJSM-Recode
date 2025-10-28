/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','purp','ROOM_purp')+' 4 / '+ini_read_string('ROOM','sm','ROOM_sm')+' 12';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 272;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 496;
    global.spawn_arr[1,1] = 336;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 235;
    global.mark_arr[0,1] = 336;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 179;
    global.mark_arr[1,1] = 319;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 366;
    global.mark_arr[2,1] = 334;
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
room_instance_add(argument0,0,0,color_control_purp_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,112,272,floor_obj);
room_instance_add(argument0,144,272,floor_obj);
room_instance_add(argument0,176,272,floor_obj);
room_instance_add(argument0,176,304,floor_obj);
room_instance_add(argument0,176,336,floor_obj);
room_instance_add(argument0,208,336,floor_obj);
room_instance_add(argument0,240,336,floor_obj);
room_instance_add(argument0,272,336,floor_obj);
room_instance_add(argument0,272,304,floor_obj);
room_instance_add(argument0,304,304,floor_obj);
room_instance_add(argument0,336,304,floor_obj);
room_instance_add(argument0,336,336,floor_obj);
room_instance_add(argument0,336,368,floor_obj);
room_instance_add(argument0,304,368,floor_obj);
room_instance_add(argument0,272,368,floor_obj);
room_instance_add(argument0,304,336,floor_obj);
room_instance_add(argument0,400,304,floor_obj);
room_instance_add(argument0,432,304,floor_obj);
room_instance_add(argument0,464,304,floor_obj);
room_instance_add(argument0,464,336,floor_obj);
room_instance_add(argument0,432,336,floor_obj);
room_instance_add(argument0,400,336,floor_obj);
room_instance_add(argument0,400,368,floor_obj);
room_instance_add(argument0,432,368,floor_obj);
room_instance_add(argument0,464,368,floor_obj);
room_instance_add(argument0,368,336,floor_obj);
room_instance_add(argument0,496,336,floor_obj);
// Ceilings
room_instance_add(argument0,112,272,ceil_obj);
room_instance_add(argument0,144,272,ceil_obj);
room_instance_add(argument0,176,272,ceil_obj);
room_instance_add(argument0,176,304,ceil_obj);
room_instance_add(argument0,176,336,ceil_obj);
room_instance_add(argument0,208,336,ceil_obj);
room_instance_add(argument0,240,336,ceil_obj);
room_instance_add(argument0,272,336,ceil_3high_obj);
room_instance_add(argument0,272,304,ceil_3high_obj);
room_instance_add(argument0,304,304,ceil_3high_obj);
room_instance_add(argument0,336,304,ceil_3high_obj);
room_instance_add(argument0,336,336,ceil_3high_obj);
room_instance_add(argument0,336,368,ceil_3high_obj);
room_instance_add(argument0,304,368,ceil_3high_obj);
room_instance_add(argument0,272,368,ceil_3high_obj);
room_instance_add(argument0,304,336,ceil_3high_obj);
room_instance_add(argument0,400,304,ceil_3high_obj);
room_instance_add(argument0,432,304,ceil_3high_obj);
room_instance_add(argument0,464,304,ceil_3high_obj);
room_instance_add(argument0,464,336,ceil_3high_obj);
room_instance_add(argument0,432,336,ceil_3high_obj);
room_instance_add(argument0,400,336,ceil_3high_obj);
room_instance_add(argument0,400,368,ceil_3high_obj);
room_instance_add(argument0,432,368,ceil_3high_obj);
room_instance_add(argument0,464,368,ceil_3high_obj);
room_instance_add(argument0,368,336,ceil_obj);
room_instance_add(argument0,496,336,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,256,wall_hor_obj);
room_instance_add(argument0,112,288,wall_hor_obj);
room_instance_add(argument0,144,288,wall_hor_obj);
room_instance_add(argument0,176,256,wall_hor_obj);
room_instance_add(argument0,144,256,wall_hor_obj);
room_instance_add(argument0,208,320,wall_hor_obj);
room_instance_add(argument0,240,320,wall_hor_obj);
room_instance_add(argument0,240,352,wall_hor_obj);
room_instance_add(argument0,208,352,wall_hor_obj);
room_instance_add(argument0,176,352,wall_hor_obj);
room_instance_add(argument0,368,320,wall_hor_obj);
room_instance_add(argument0,368,352,wall_hor_obj);
room_instance_add(argument0,496,320,wall_hor_obj);
room_instance_add(argument0,496,352,wall_hor_obj);
room_instance_add(argument0,272,288,wall_3high_hor_obj);
room_instance_add(argument0,304,288,wall_3high_hor_obj);
room_instance_add(argument0,336,288,wall_3high_hor_obj);
room_instance_add(argument0,400,288,wall_3high_hor_obj);
room_instance_add(argument0,432,288,wall_3high_hor_obj);
room_instance_add(argument0,464,288,wall_3high_hor_obj);
room_instance_add(argument0,464,384,wall_3high_hor_obj);
room_instance_add(argument0,432,384,wall_3high_hor_obj);
room_instance_add(argument0,400,384,wall_3high_hor_obj);
room_instance_add(argument0,336,384,wall_3high_hor_obj);
room_instance_add(argument0,304,384,wall_3high_hor_obj);
room_instance_add(argument0,272,384,wall_3high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,272,wall_vert_obj);
room_instance_add(argument0,160,304,wall_vert_obj);
room_instance_add(argument0,160,336,wall_vert_obj);
room_instance_add(argument0,192,304,wall_vert_obj);
room_instance_add(argument0,192,272,wall_vert_obj);
room_instance_add(argument0,512,336,wall_vert_obj);
room_instance_add(argument0,256,304,wall_3high_vert_obj);
room_instance_add(argument0,256,368,wall_3high_vert_obj);
room_instance_add(argument0,352,368,wall_3high_vert_obj);
room_instance_add(argument0,352,304,wall_3high_vert_obj);
room_instance_add(argument0,384,304,wall_3high_vert_obj);
room_instance_add(argument0,480,304,wall_3high_vert_obj);
room_instance_add(argument0,480,368,wall_3high_vert_obj);
room_instance_add(argument0,384,368,wall_3high_vert_obj);
room_instance_add(argument0,256,336,wall_2doorway_vert_obj);
room_instance_add(argument0,352,336,wall_2doorway_vert_obj);
room_instance_add(argument0,384,336,wall_2doorway_vert_obj);
room_instance_add(argument0,480,336,wall_2doorway_vert_obj);
// Torches
room_instance_add(argument0,304,288,torch_north_obj);
room_instance_add(argument0,432,288,torch_north_obj);
room_instance_add(argument0,304,384,torch_south_obj);
room_instance_add(argument0,432,384,torch_south_obj);
// Props
room_instance_add(argument0,340,371,bone_rand_obj);
// Jumpscare
room_instance_add(argument0,224,352,js_obj);