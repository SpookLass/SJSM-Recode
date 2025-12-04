/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','long','ROOM_long')+' 12';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 688;
    global.spawn_arr[1,1] = 432;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 266;
    global.mark_arr[0,1] = 471;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 443;
    global.mark_arr[1,1] = 461;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 676;
    global.mark_arr[2,1] = 482;
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
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,112,464,floor_obj);
room_instance_add(argument0,144,464,floor_obj);
room_instance_add(argument0,176,464,floor_obj);
room_instance_add(argument0,208,464,floor_obj);
room_instance_add(argument0,240,464,floor_obj);
room_instance_add(argument0,272,464,floor_obj);
room_instance_add(argument0,304,464,floor_obj);
room_instance_add(argument0,336,464,floor_obj);
room_instance_add(argument0,368,464,floor_obj);
room_instance_add(argument0,400,464,floor_obj);
room_instance_add(argument0,432,464,floor_obj);
room_instance_add(argument0,464,464,floor_obj);
room_instance_add(argument0,496,464,floor_obj);
room_instance_add(argument0,528,464,floor_obj);
room_instance_add(argument0,560,496,floor_obj);
room_instance_add(argument0,560,464,floor_obj);
room_instance_add(argument0,560,432,floor_obj);
room_instance_add(argument0,592,432,floor_obj);
room_instance_add(argument0,592,464,floor_obj);
room_instance_add(argument0,592,496,floor_obj);
room_instance_add(argument0,624,496,floor_obj);
room_instance_add(argument0,624,464,floor_obj);
room_instance_add(argument0,624,432,floor_obj);
room_instance_add(argument0,656,432,floor_obj);
room_instance_add(argument0,688,432,floor_obj);
room_instance_add(argument0,720,432,floor_obj);
room_instance_add(argument0,720,464,floor_obj);
room_instance_add(argument0,720,496,floor_obj);
room_instance_add(argument0,688,496,floor_obj);
room_instance_add(argument0,656,496,floor_obj);
room_instance_add(argument0,656,464,floor_obj);
room_instance_add(argument0,688,464,floor_obj);
// Ceilings
room_instance_add(argument0,112,464,ceil_obj);
room_instance_add(argument0,144,464,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,208,464,ceil_obj);
room_instance_add(argument0,240,464,ceil_obj);
room_instance_add(argument0,272,464,ceil_obj);
room_instance_add(argument0,304,464,ceil_obj);
room_instance_add(argument0,336,464,ceil_obj);
room_instance_add(argument0,368,464,ceil_obj);
room_instance_add(argument0,400,464,ceil_obj);
room_instance_add(argument0,432,464,ceil_obj);
room_instance_add(argument0,464,464,ceil_obj);
room_instance_add(argument0,496,464,ceil_obj);
room_instance_add(argument0,528,464,ceil_obj);
room_instance_add(argument0,560,496,ceil_obj);
room_instance_add(argument0,560,464,ceil_obj);
room_instance_add(argument0,560,432,ceil_obj);
room_instance_add(argument0,592,432,ceil_obj);
room_instance_add(argument0,592,464,ceil_obj);
room_instance_add(argument0,592,496,ceil_obj);
room_instance_add(argument0,624,496,ceil_obj);
room_instance_add(argument0,624,464,ceil_obj);
room_instance_add(argument0,624,432,ceil_obj);
room_instance_add(argument0,656,432,ceil_obj);
room_instance_add(argument0,688,432,ceil_obj);
room_instance_add(argument0,720,432,ceil_obj);
room_instance_add(argument0,720,464,ceil_obj);
room_instance_add(argument0,720,496,ceil_obj);
room_instance_add(argument0,688,496,ceil_obj);
room_instance_add(argument0,656,496,ceil_obj);
room_instance_add(argument0,656,464,ceil_obj);
room_instance_add(argument0,688,464,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,448,wall_hor_obj);
room_instance_add(argument0,112,480,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
room_instance_add(argument0,432,448,wall_hor_obj);
room_instance_add(argument0,432,480,wall_hor_obj);
room_instance_add(argument0,400,448,wall_hor_obj);
room_instance_add(argument0,368,448,wall_hor_obj);
room_instance_add(argument0,336,448,wall_hor_obj);
room_instance_add(argument0,304,448,wall_hor_obj);
room_instance_add(argument0,272,448,wall_hor_obj);
room_instance_add(argument0,240,448,wall_hor_obj);
room_instance_add(argument0,208,448,wall_hor_obj);
room_instance_add(argument0,176,448,wall_hor_obj);
room_instance_add(argument0,144,480,wall_hor_obj);
room_instance_add(argument0,176,480,wall_hor_obj);
room_instance_add(argument0,208,480,wall_hor_obj);
room_instance_add(argument0,240,480,wall_hor_obj);
room_instance_add(argument0,272,480,wall_hor_obj);
room_instance_add(argument0,304,480,wall_hor_obj);
room_instance_add(argument0,336,480,wall_hor_obj);
room_instance_add(argument0,368,480,wall_hor_obj);
room_instance_add(argument0,400,480,wall_hor_obj);
room_instance_add(argument0,464,448,wall_hor_obj);
room_instance_add(argument0,496,448,wall_hor_obj);
room_instance_add(argument0,528,448,wall_hor_obj);
room_instance_add(argument0,528,480,wall_hor_obj);
room_instance_add(argument0,496,480,wall_hor_obj);
room_instance_add(argument0,464,480,wall_hor_obj);
room_instance_add(argument0,560,512,wall_hor_obj);
room_instance_add(argument0,560,416,wall_hor_obj);
room_instance_add(argument0,592,416,wall_hor_obj);
room_instance_add(argument0,624,416,wall_hor_obj);
room_instance_add(argument0,656,416,wall_hor_obj);
room_instance_add(argument0,688,416,wall_hor_obj);
room_instance_add(argument0,720,416,wall_hor_obj);
room_instance_add(argument0,720,512,wall_hor_obj);
room_instance_add(argument0,688,512,wall_hor_obj);
room_instance_add(argument0,656,512,wall_hor_obj);
room_instance_add(argument0,624,512,wall_hor_obj);
room_instance_add(argument0,592,512,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,464,wall_vert_obj);
room_instance_add(argument0,544,432,wall_vert_obj);
room_instance_add(argument0,544,496,wall_vert_obj);
room_instance_add(argument0,736,432,wall_vert_obj);
room_instance_add(argument0,736,464,wall_vert_obj);
room_instance_add(argument0,736,496,wall_vert_obj);
// Props
room_instance_add(argument0,306,456,web_rand_obj);
room_instance_add(argument0,362,458,web_rand_obj);
room_instance_add(argument0,661,438,web_rand_obj);
room_instance_add(argument0,703,456,web_rand_obj);