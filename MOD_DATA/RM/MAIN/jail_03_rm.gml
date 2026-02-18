/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','jail','ROOM_jail')+' 3';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 240;
    global.spawn_arr[1,1] = 528;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 174;
    global.mark_arr[0,1] = 365;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 176;
    global.mark_arr[1,1] = 451;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 207;
    global.mark_arr[2,1] = 528;
    global.mark_arr[2,2] = 0;
    mark_create_scr();
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
room_instance_add(argument0,144,304,floor_obj);
room_instance_add(argument0,112,304,floor_obj);
room_instance_add(argument0,176,304,floor_obj);
room_instance_add(argument0,176,336,floor_obj);
room_instance_add(argument0,176,368,floor_obj);
room_instance_add(argument0,176,400,floor_obj);
room_instance_add(argument0,176,432,floor_obj);
room_instance_add(argument0,176,464,floor_obj);
room_instance_add(argument0,144,368,floor_obj);
room_instance_add(argument0,112,368,floor_obj);
room_instance_add(argument0,208,368,floor_obj);
room_instance_add(argument0,240,368,floor_obj);
room_instance_add(argument0,208,464,floor_obj);
room_instance_add(argument0,240,464,floor_obj);
room_instance_add(argument0,144,464,floor_obj);
room_instance_add(argument0,112,464,floor_obj);
room_instance_add(argument0,176,496,floor_obj);
room_instance_add(argument0,176,528,floor_obj);
room_instance_add(argument0,208,528,floor_obj);
room_instance_add(argument0,240,528,floor_obj);
// Ceilings
room_instance_add(argument0,144,304,ceil_obj);
room_instance_add(argument0,112,304,ceil_obj);
room_instance_add(argument0,176,304,ceil_obj);
room_instance_add(argument0,176,336,ceil_obj);
room_instance_add(argument0,176,368,ceil_obj);
room_instance_add(argument0,176,400,ceil_obj);
room_instance_add(argument0,176,432,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,144,368,ceil_obj);
room_instance_add(argument0,112,368,ceil_obj);
room_instance_add(argument0,208,368,ceil_obj);
room_instance_add(argument0,240,368,ceil_obj);
room_instance_add(argument0,208,464,ceil_obj);
room_instance_add(argument0,240,464,ceil_obj);
room_instance_add(argument0,144,464,ceil_obj);
room_instance_add(argument0,112,464,ceil_obj);
room_instance_add(argument0,176,496,ceil_obj);
room_instance_add(argument0,176,528,ceil_obj);
room_instance_add(argument0,208,528,ceil_obj);
room_instance_add(argument0,240,528,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,288,wall_hor_obj);
room_instance_add(argument0,112,288,wall_hor_obj);
room_instance_add(argument0,112,320,wall_hor_obj);
room_instance_add(argument0,144,320,wall_hor_obj);
room_instance_add(argument0,176,544,wall_hor_obj);
room_instance_add(argument0,208,544,wall_hor_obj);
room_instance_add(argument0,240,544,wall_hor_obj);
room_instance_add(argument0,240,512,wall_hor_obj);
room_instance_add(argument0,208,512,wall_hor_obj);
room_instance_add(argument0,208,480,wall_hor_obj);
room_instance_add(argument0,240,480,wall_hor_obj);
room_instance_add(argument0,240,448,wall_hor_obj);
room_instance_add(argument0,208,448,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
room_instance_add(argument0,112,448,wall_hor_obj);
room_instance_add(argument0,112,480,wall_hor_obj);
room_instance_add(argument0,144,480,wall_hor_obj);
room_instance_add(argument0,144,384,wall_hor_obj);
room_instance_add(argument0,112,384,wall_hor_obj);
room_instance_add(argument0,112,352,wall_hor_obj);
room_instance_add(argument0,144,352,wall_hor_obj);
room_instance_add(argument0,176,288,wall_hor_obj);
room_instance_add(argument0,208,352,wall_hor_obj);
room_instance_add(argument0,240,352,wall_hor_obj);
room_instance_add(argument0,240,384,wall_hor_obj);
room_instance_add(argument0,208,384,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,304,wall_vert_obj);
room_instance_add(argument0,96,368,wall_vert_obj);
room_instance_add(argument0,256,368,wall_vert_obj);
room_instance_add(argument0,192,304,wall_vert_obj);
room_instance_add(argument0,192,336,wall_vert_obj);
room_instance_add(argument0,160,336,wall_vert_obj);
room_instance_add(argument0,160,400,wall_vert_obj);
room_instance_add(argument0,160,432,wall_vert_obj);
room_instance_add(argument0,192,400,wall_vert_obj);
room_instance_add(argument0,192,432,wall_vert_obj);
room_instance_add(argument0,256,464,wall_vert_obj);
room_instance_add(argument0,96,464,wall_vert_obj);
room_instance_add(argument0,160,496,wall_vert_obj);
room_instance_add(argument0,192,496,wall_vert_obj);
room_instance_add(argument0,256,528,wall_vert_obj);
room_instance_add(argument0,160,528,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,160,368,bar_vert_obj);
room_instance_add(argument0,192,368,bar_vert_obj);
room_instance_add(argument0,192,464,bar_vert_obj);
room_instance_add(argument0,160,464,bar_vert_obj);
room_instance_add(argument0,108,360,chair_rand_obj);
room_instance_add(argument0,226,459,table_rand_obj);
room_instance_add(argument0,135,465,bone_rand_obj);
room_instance_add(argument0,210,472,bone_rand_obj);
room_instance_add(argument0,244,368,bone_rand_obj);
room_instance_add(argument0,176,328,web_rand_obj);
room_instance_add(argument0,220,367,web_rand_obj);
room_instance_add(argument0,174,494,web_rand_obj);
room_instance_add(argument0,108,462,web_rand_obj);
room_instance_add(argument0,224,521,web_rand_obj);