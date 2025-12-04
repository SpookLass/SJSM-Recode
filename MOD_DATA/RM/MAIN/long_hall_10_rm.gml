/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','long','ROOM_long')+' 10';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 848;
    global.spawn_arr[1,1] = 464;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 5;
    global.mark_arr[0,0] = 243;
    global.mark_arr[0,1] = 458;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 406;
    global.mark_arr[1,1] = 571;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 468;
    global.mark_arr[2,1] = 588;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 586;
    global.mark_arr[3,1] = 565;
    global.mark_arr[3,2] = 0;
    global.mark_arr[4,0] = 656;
    global.mark_arr[4,1] = 464;
    global.mark_arr[4,2] = 0;
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
room_instance_add(argument0,400,496,floor_obj);
room_instance_add(argument0,400,528,floor_obj);
room_instance_add(argument0,400,560,floor_obj);
room_instance_add(argument0,400,592,floor_obj);
room_instance_add(argument0,400,624,floor_obj);
room_instance_add(argument0,432,624,floor_obj);
room_instance_add(argument0,432,592,floor_obj);
room_instance_add(argument0,432,560,floor_obj);
room_instance_add(argument0,368,560,floor_obj);
room_instance_add(argument0,368,592,floor_obj);
room_instance_add(argument0,368,624,floor_obj);
room_instance_add(argument0,464,592,floor_obj);
room_instance_add(argument0,496,592,floor_obj);
room_instance_add(argument0,528,592,floor_obj);
room_instance_add(argument0,560,560,floor_obj);
room_instance_add(argument0,560,592,floor_obj);
room_instance_add(argument0,560,624,floor_obj);
room_instance_add(argument0,592,624,floor_obj);
room_instance_add(argument0,592,592,floor_obj);
room_instance_add(argument0,592,560,floor_obj);
room_instance_add(argument0,624,560,floor_obj);
room_instance_add(argument0,624,592,floor_obj);
room_instance_add(argument0,624,624,floor_obj);
room_instance_add(argument0,592,528,floor_obj);
room_instance_add(argument0,592,496,floor_obj);
room_instance_add(argument0,592,464,floor_obj);
room_instance_add(argument0,624,464,floor_obj);
room_instance_add(argument0,656,464,floor_obj);
room_instance_add(argument0,688,464,floor_obj);
room_instance_add(argument0,720,464,floor_obj);
room_instance_add(argument0,752,464,floor_obj);
room_instance_add(argument0,784,464,floor_obj);
room_instance_add(argument0,816,464,floor_obj);
room_instance_add(argument0,848,464,floor_obj);
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
room_instance_add(argument0,400,496,ceil_obj);
room_instance_add(argument0,400,528,ceil_obj);
room_instance_add(argument0,400,560,ceil_obj);
room_instance_add(argument0,400,592,ceil_obj);
room_instance_add(argument0,400,624,ceil_obj);
room_instance_add(argument0,432,624,ceil_obj);
room_instance_add(argument0,432,592,ceil_obj);
room_instance_add(argument0,432,560,ceil_obj);
room_instance_add(argument0,368,560,ceil_obj);
room_instance_add(argument0,368,592,ceil_obj);
room_instance_add(argument0,368,624,ceil_obj);
room_instance_add(argument0,464,592,ceil_obj);
room_instance_add(argument0,496,592,ceil_obj);
room_instance_add(argument0,528,592,ceil_obj);
room_instance_add(argument0,560,560,ceil_obj);
room_instance_add(argument0,560,592,ceil_obj);
room_instance_add(argument0,560,624,ceil_obj);
room_instance_add(argument0,592,624,ceil_obj);
room_instance_add(argument0,592,592,ceil_obj);
room_instance_add(argument0,592,560,ceil_obj);
room_instance_add(argument0,624,560,ceil_obj);
room_instance_add(argument0,624,592,ceil_obj);
room_instance_add(argument0,624,624,ceil_obj);
room_instance_add(argument0,592,528,ceil_obj);
room_instance_add(argument0,592,496,ceil_obj);
room_instance_add(argument0,592,464,ceil_obj);
room_instance_add(argument0,624,464,ceil_obj);
room_instance_add(argument0,656,464,ceil_obj);
room_instance_add(argument0,688,464,ceil_obj);
room_instance_add(argument0,720,464,ceil_obj);
room_instance_add(argument0,752,464,ceil_obj);
room_instance_add(argument0,784,464,ceil_obj);
room_instance_add(argument0,816,464,ceil_obj);
room_instance_add(argument0,848,464,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,448,wall_hor_obj);
room_instance_add(argument0,112,480,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
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
room_instance_add(argument0,400,448,wall_hor_obj);
room_instance_add(argument0,432,544,wall_hor_obj);
room_instance_add(argument0,368,544,wall_hor_obj);
room_instance_add(argument0,464,576,wall_hor_obj);
room_instance_add(argument0,496,576,wall_hor_obj);
room_instance_add(argument0,528,576,wall_hor_obj);
room_instance_add(argument0,528,608,wall_hor_obj);
room_instance_add(argument0,496,608,wall_hor_obj);
room_instance_add(argument0,464,608,wall_hor_obj);
room_instance_add(argument0,432,640,wall_hor_obj);
room_instance_add(argument0,400,640,wall_hor_obj);
room_instance_add(argument0,368,640,wall_hor_obj);
room_instance_add(argument0,560,640,wall_hor_obj);
room_instance_add(argument0,560,544,wall_hor_obj);
room_instance_add(argument0,624,544,wall_hor_obj);
room_instance_add(argument0,624,640,wall_hor_obj);
room_instance_add(argument0,592,640,wall_hor_obj);
room_instance_add(argument0,592,448,wall_hor_obj);
room_instance_add(argument0,848,480,wall_hor_obj);
room_instance_add(argument0,848,448,wall_hor_obj);
room_instance_add(argument0,816,448,wall_hor_obj);
room_instance_add(argument0,784,448,wall_hor_obj);
room_instance_add(argument0,752,448,wall_hor_obj);
room_instance_add(argument0,720,448,wall_hor_obj);
room_instance_add(argument0,688,448,wall_hor_obj);
room_instance_add(argument0,656,448,wall_hor_obj);
room_instance_add(argument0,624,448,wall_hor_obj);
room_instance_add(argument0,624,480,wall_hor_obj);
room_instance_add(argument0,656,480,wall_hor_obj);
room_instance_add(argument0,688,480,wall_hor_obj);
room_instance_add(argument0,720,480,wall_hor_obj);
room_instance_add(argument0,752,480,wall_hor_obj);
room_instance_add(argument0,784,480,wall_hor_obj);
room_instance_add(argument0,816,480,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,464,wall_vert_obj);
room_instance_add(argument0,416,464,wall_vert_obj);
room_instance_add(argument0,416,496,wall_vert_obj);
room_instance_add(argument0,416,528,wall_vert_obj);
room_instance_add(argument0,384,528,wall_vert_obj);
room_instance_add(argument0,384,496,wall_vert_obj);
room_instance_add(argument0,448,560,wall_vert_obj);
room_instance_add(argument0,448,624,wall_vert_obj);
room_instance_add(argument0,352,624,wall_vert_obj);
room_instance_add(argument0,352,592,wall_vert_obj);
room_instance_add(argument0,352,560,wall_vert_obj);
room_instance_add(argument0,544,560,wall_vert_obj);
room_instance_add(argument0,544,624,wall_vert_obj);
room_instance_add(argument0,640,624,wall_vert_obj);
room_instance_add(argument0,640,592,wall_vert_obj);
room_instance_add(argument0,640,560,wall_vert_obj);
room_instance_add(argument0,608,528,wall_vert_obj);
room_instance_add(argument0,608,496,wall_vert_obj);
room_instance_add(argument0,576,528,wall_vert_obj);
room_instance_add(argument0,576,496,wall_vert_obj);
room_instance_add(argument0,576,464,wall_vert_obj);
room_instance_add(argument0,864,464,wall_vert_obj);
// Props
room_instance_add(argument0,325,467,web_rand_obj);
room_instance_add(argument0,590,476,web_rand_obj);
room_instance_add(argument0,617,563,web_rand_obj);
// Jumpscare
room_instance_add(argument0,768,480,js_obj);