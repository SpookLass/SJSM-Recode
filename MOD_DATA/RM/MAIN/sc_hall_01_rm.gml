/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sc','ROOM_sc')+' 1';
	ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 496;
    global.spawn_arr[1,1] = 384;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 304;
    global.spawn_arr[2,1] = 480;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 90;
    // Mark
    global.mark_len_var = 0;
    /*global.mark_arr[0,0] = 222;
    global.mark_arr[0,1] = 143;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 240;
    global.mark_arr[1,1] = 193;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 301;
    global.mark_arr[2,1] = 209;
    global.mark_arr[2,2] = 0;*/
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
room_instance_add(argument0,112,288,floor_obj);
room_instance_add(argument0,144,288,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
room_instance_add(argument0,240,288,floor_obj);
room_instance_add(argument0,272,288,floor_obj);
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,304,384,floor_obj);
room_instance_add(argument0,304,416,floor_obj);
room_instance_add(argument0,304,448,floor_obj);
room_instance_add(argument0,304,480,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,400,288,floor_obj);
room_instance_add(argument0,400,320,floor_obj);
room_instance_add(argument0,400,352,floor_obj);
room_instance_add(argument0,400,384,floor_obj);
room_instance_add(argument0,368,384,floor_obj);
room_instance_add(argument0,336,384,floor_obj);
room_instance_add(argument0,432,384,floor_obj);
room_instance_add(argument0,464,384,floor_obj);
room_instance_add(argument0,496,384,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_2high_obj);
room_instance_add(argument0,144,288,ceil_2high_obj);
room_instance_add(argument0,176,288,ceil_2high_obj);
room_instance_add(argument0,208,288,ceil_2high_obj);
room_instance_add(argument0,240,288,ceil_2high_obj);
room_instance_add(argument0,272,288,ceil_2high_obj);
room_instance_add(argument0,304,288,ceil_2high_obj);
room_instance_add(argument0,304,384,ceil_2high_obj);
room_instance_add(argument0,304,416,ceil_2high_obj);
room_instance_add(argument0,304,448,ceil_2high_obj);
room_instance_add(argument0,304,480,ceil_2high_obj);
room_instance_add(argument0,336,288,ceil_2high_obj);
room_instance_add(argument0,368,288,ceil_2high_obj);
room_instance_add(argument0,400,288,ceil_2high_obj);
room_instance_add(argument0,400,320,ceil_2high_obj);
room_instance_add(argument0,400,352,ceil_2high_obj);
room_instance_add(argument0,400,384,ceil_2high_obj);
room_instance_add(argument0,368,384,ceil_2high_obj);
room_instance_add(argument0,336,384,ceil_2high_obj);
room_instance_add(argument0,432,384,ceil_2high_obj);
room_instance_add(argument0,464,384,ceil_2high_obj);
room_instance_add(argument0,496,384,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,304,wall_2high_hor_obj);
room_instance_add(argument0,112,272,wall_2high_hor_obj);
room_instance_add(argument0,144,272,wall_2high_hor_obj);
room_instance_add(argument0,176,272,wall_2high_hor_obj);
room_instance_add(argument0,400,272,wall_2high_hor_obj);
room_instance_add(argument0,368,272,wall_2high_hor_obj);
room_instance_add(argument0,336,272,wall_2high_hor_obj);
room_instance_add(argument0,304,272,wall_2high_hor_obj);
room_instance_add(argument0,272,272,wall_2high_hor_obj);
room_instance_add(argument0,240,272,wall_2high_hor_obj);
room_instance_add(argument0,208,272,wall_2high_hor_obj);
room_instance_add(argument0,368,304,wall_2high_hor_obj);
room_instance_add(argument0,368,368,wall_2high_hor_obj);
room_instance_add(argument0,400,400,wall_2high_hor_obj);
room_instance_add(argument0,368,400,wall_2high_hor_obj);
room_instance_add(argument0,336,400,wall_2high_hor_obj);
room_instance_add(argument0,304,496,wall_2high_hor_obj);
room_instance_add(argument0,432,400,wall_2high_hor_obj);
room_instance_add(argument0,464,400,wall_2high_hor_obj);
room_instance_add(argument0,496,400,wall_2high_hor_obj);
room_instance_add(argument0,496,368,wall_2high_hor_obj);
room_instance_add(argument0,464,368,wall_2high_hor_obj);
room_instance_add(argument0,432,368,wall_2high_hor_obj);
room_instance_add(argument0,336,368,wall_2high_hor_obj);
room_instance_add(argument0,304,368,wall_2high_hor_obj);
room_instance_add(argument0,336,304,wall_2high_hor_obj);
room_instance_add(argument0,304,304,wall_2high_hor_obj);
room_instance_add(argument0,272,304,wall_2high_hor_obj);
room_instance_add(argument0,240,304,wall_2high_hor_obj);
room_instance_add(argument0,208,304,wall_2high_hor_obj);
room_instance_add(argument0,176,304,wall_2high_hor_obj);
room_instance_add(argument0,144,304,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,288,384,wall_2high_vert_obj);
room_instance_add(argument0,512,384,wall_2high_vert_obj);
room_instance_add(argument0,96,288,wall_2high_vert_obj);
room_instance_add(argument0,416,288,wall_2high_vert_obj);
room_instance_add(argument0,384,320,wall_2high_vert_obj);
room_instance_add(argument0,416,320,wall_2high_vert_obj);
room_instance_add(argument0,416,352,wall_2high_vert_obj);
room_instance_add(argument0,384,352,wall_2high_vert_obj);
room_instance_add(argument0,320,416,wall_2high_vert_obj);
room_instance_add(argument0,288,416,wall_2high_vert_obj);
room_instance_add(argument0,288,448,wall_2high_vert_obj);
room_instance_add(argument0,320,448,wall_2high_vert_obj);
room_instance_add(argument0,320,480,wall_2high_vert_obj);
room_instance_add(argument0,288,480,wall_2high_vert_obj);
// Jumpscare
room_instance_add(argument0,448,400,js_obj);