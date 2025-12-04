/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','jail','ROOM_jail')+' 12';
	ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 176;
    global.spawn_arr[1,1] = 464;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    global.spawn_arr[2,0] = 176;
    global.spawn_arr[2,1] = 144;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 161;
    global.mark_arr[0,1] = 306;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 184;
    global.mark_arr[1,1] = 213;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 303;
    global.mark_arr[2,1] = 235;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 327;
    global.mark_arr[3,1] = 303;
    global.mark_arr[3,2] = 0;
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
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,112,304,floor_obj);
room_instance_add(argument0,144,304,floor_obj);
room_instance_add(argument0,176,304,floor_obj);
room_instance_add(argument0,176,272,floor_obj);
room_instance_add(argument0,176,240,floor_obj);
room_instance_add(argument0,176,336,floor_obj);
room_instance_add(argument0,176,368,floor_obj);
room_instance_add(argument0,208,240,floor_obj);
room_instance_add(argument0,208,272,floor_obj);
room_instance_add(argument0,208,336,floor_obj);
room_instance_add(argument0,208,368,floor_obj);
room_instance_add(argument0,144,336,floor_obj);
room_instance_add(argument0,144,368,floor_obj);
room_instance_add(argument0,144,400,floor_obj);
room_instance_add(argument0,176,400,floor_obj);
room_instance_add(argument0,208,400,floor_obj);
room_instance_add(argument0,144,272,floor_obj);
room_instance_add(argument0,144,240,floor_obj);
room_instance_add(argument0,144,208,floor_obj);
room_instance_add(argument0,176,208,floor_obj);
room_instance_add(argument0,208,208,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,176,176,floor_obj);
room_instance_add(argument0,144,176,floor_obj);
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,144,432,floor_obj);
room_instance_add(argument0,176,432,floor_obj);
room_instance_add(argument0,208,432,floor_obj);
room_instance_add(argument0,176,464,floor_obj);
// Ceilings
room_instance_add(argument0,112,304,ceil_obj);
room_instance_add(argument0,144,304,ceil_obj);
room_instance_add(argument0,176,304,ceil_obj);
room_instance_add(argument0,176,272,ceil_obj);
room_instance_add(argument0,176,240,ceil_obj);
room_instance_add(argument0,176,336,ceil_obj);
room_instance_add(argument0,176,368,ceil_obj);
room_instance_add(argument0,208,240,ceil_obj);
room_instance_add(argument0,208,272,ceil_obj);
room_instance_add(argument0,208,336,ceil_obj);
room_instance_add(argument0,208,368,ceil_obj);
room_instance_add(argument0,144,336,ceil_obj);
room_instance_add(argument0,144,368,ceil_obj);
room_instance_add(argument0,144,400,ceil_obj);
room_instance_add(argument0,176,400,ceil_obj);
room_instance_add(argument0,208,400,ceil_obj);
room_instance_add(argument0,144,272,ceil_obj);
room_instance_add(argument0,144,240,ceil_obj);
room_instance_add(argument0,144,208,ceil_obj);
room_instance_add(argument0,176,208,ceil_obj);
room_instance_add(argument0,208,208,ceil_obj);
room_instance_add(argument0,208,176,ceil_obj);
room_instance_add(argument0,176,176,ceil_obj);
room_instance_add(argument0,144,176,ceil_obj);
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,144,432,ceil_obj);
room_instance_add(argument0,176,432,ceil_obj);
room_instance_add(argument0,208,432,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,288,wall_hor_obj);
room_instance_add(argument0,112,320,wall_hor_obj);
room_instance_add(argument0,144,288,wall_hor_obj);
room_instance_add(argument0,144,320,wall_hor_obj);
room_instance_add(argument0,208,288,wall_hor_obj);
room_instance_add(argument0,208,320,wall_hor_obj);
room_instance_add(argument0,176,128,wall_hor_obj);
room_instance_add(argument0,176,480,wall_hor_obj);
room_instance_add(argument0,144,384,wall_hor_obj);
room_instance_add(argument0,208,384,wall_hor_obj);
room_instance_add(argument0,144,224,wall_hor_obj);
room_instance_add(argument0,208,224,wall_hor_obj);
room_instance_add(argument0,208,160,wall_hor_obj);
room_instance_add(argument0,144,160,wall_hor_obj);
room_instance_add(argument0,208,448,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,304,wall_vert_obj);
room_instance_add(argument0,224,272,wall_vert_obj);
room_instance_add(argument0,224,240,wall_vert_obj);
room_instance_add(argument0,224,208,wall_vert_obj);
room_instance_add(argument0,224,176,wall_vert_obj);
room_instance_add(argument0,128,176,wall_vert_obj);
room_instance_add(argument0,128,208,wall_vert_obj);
room_instance_add(argument0,128,240,wall_vert_obj);
room_instance_add(argument0,128,272,wall_vert_obj);
room_instance_add(argument0,128,336,wall_vert_obj);
room_instance_add(argument0,128,368,wall_vert_obj);
room_instance_add(argument0,128,400,wall_vert_obj);
room_instance_add(argument0,128,432,wall_vert_obj);
room_instance_add(argument0,224,432,wall_vert_obj);
room_instance_add(argument0,224,400,wall_vert_obj);
room_instance_add(argument0,224,368,wall_vert_obj);
room_instance_add(argument0,224,336,wall_vert_obj);
room_instance_add(argument0,160,272,wall_vert_obj);
room_instance_add(argument0,160,336,wall_vert_obj);
room_instance_add(argument0,160,400,wall_vert_obj);
room_instance_add(argument0,160,208,wall_vert_obj);
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,192,144,wall_vert_obj);
room_instance_add(argument0,192,208,wall_vert_obj);
room_instance_add(argument0,192,272,wall_vert_obj);
room_instance_add(argument0,192,336,wall_vert_obj);
room_instance_add(argument0,192,400,wall_vert_obj);
room_instance_add(argument0,192,464,wall_vert_obj);
room_instance_add(argument0,160,464,wall_vert_obj);
room_instance_add(argument0,192,304,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,160,432,bar_vert_obj);
room_instance_add(argument0,160,368,bar_vert_obj);
room_instance_add(argument0,192,368,bar_vert_obj);
room_instance_add(argument0,192,432,bar_vert_obj);
room_instance_add(argument0,192,240,bar_vert_obj);
room_instance_add(argument0,160,240,bar_vert_obj);
room_instance_add(argument0,160,176,bar_vert_obj);
room_instance_add(argument0,192,176,bar_vert_obj);
room_instance_add(argument0,136,240,table_rand_obj);
room_instance_add(argument0,216,240,table_rand_obj);
room_instance_add(argument0,216,400,table_rand_obj);
room_instance_add(argument0,136,432,table_rand_obj);
room_instance_add(argument0,136,176,table_rand_obj);
room_instance_add(argument0,134,206,bone_rand_obj);
room_instance_add(argument0,207,183,bone_rand_obj);
room_instance_add(argument0,207,274,bone_rand_obj);
room_instance_add(argument0,210,339,bone_rand_obj);
room_instance_add(argument0,210,350,bone_rand_obj);
room_instance_add(argument0,212,366,bone_rand_obj);
room_instance_add(argument0,199,356,bone_rand_obj);
room_instance_add(argument0,199,335,bone_rand_obj);
room_instance_add(argument0,213,332,bone_rand_obj);
room_instance_add(argument0,147,336,bone_rand_obj);
room_instance_add(argument0,145,353,bone_rand_obj);
room_instance_add(argument0,138,414,bone_rand_obj);
room_instance_add(argument0,211,418,bone_rand_obj);