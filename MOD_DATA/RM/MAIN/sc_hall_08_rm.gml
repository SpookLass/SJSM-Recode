/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string("ROOM","sc","ROOM_sc")+" 8";
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 292;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 536;
    global.spawn_arr[1,1] = 456;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
');
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
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,112,288,floor_obj);
room_instance_add(argument0,144,288,floor_obj);
room_instance_add(argument0,176,296,floor_obj);
room_instance_add(argument0,208,304,floor_obj);
room_instance_add(argument0,240,312,floor_obj);
room_instance_add(argument0,272,320,floor_obj);
room_instance_add(argument0,280,352,floor_obj);
room_instance_add(argument0,288,384,floor_obj);
room_instance_add(argument0,280,416,floor_obj);
room_instance_add(argument0,272,448,floor_obj);
room_instance_add(argument0,280,480,floor_obj);
room_instance_add(argument0,312,480,floor_obj);
room_instance_add(argument0,344,480,floor_obj);
room_instance_add(argument0,376,472,floor_obj);
room_instance_add(argument0,408,480,floor_obj);
room_instance_add(argument0,440,472,floor_obj);
room_instance_add(argument0,472,464,floor_obj);
room_instance_add(argument0,504,456,floor_obj);
room_instance_add(argument0,536,456,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_2high_obj);
room_instance_add(argument0,144,288,ceil_2high_obj);
room_instance_add(argument0,176,296,ceil_2high_obj);
room_instance_add(argument0,208,304,ceil_2high_obj);
room_instance_add(argument0,240,312,ceil_2high_obj);
room_instance_add(argument0,272,320,ceil_2high_obj);
room_instance_add(argument0,280,352,ceil_2high_obj);
room_instance_add(argument0,288,384,ceil_2high_obj);
room_instance_add(argument0,280,416,ceil_2high_obj);
room_instance_add(argument0,272,448,ceil_2high_obj);
room_instance_add(argument0,280,480,ceil_2high_obj);
room_instance_add(argument0,312,480,ceil_2high_obj);
room_instance_add(argument0,344,480,ceil_2high_obj);
room_instance_add(argument0,376,472,ceil_2high_obj);
room_instance_add(argument0,408,480,ceil_2high_obj);
room_instance_add(argument0,440,472,ceil_2high_obj);
room_instance_add(argument0,472,464,ceil_2high_obj);
room_instance_add(argument0,504,456,ceil_2high_obj);
room_instance_add(argument0,536,456,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,280,wall_2high_hor_obj);
room_instance_add(argument0,112,304,wall_2high_hor_obj);
room_instance_add(argument0,144,304,wall_2high_hor_obj);
room_instance_add(argument0,176,304,wall_2high_hor_obj);
room_instance_add(argument0,208,312,wall_2high_hor_obj);
room_instance_add(argument0,144,280,wall_2high_hor_obj);
room_instance_add(argument0,176,280,wall_2high_hor_obj);
room_instance_add(argument0,208,288,wall_2high_hor_obj);
room_instance_add(argument0,240,296,wall_2high_hor_obj);
room_instance_add(argument0,272,304,wall_2high_hor_obj);
room_instance_add(argument0,240,320,wall_2high_hor_obj);
room_instance_add(argument0,256,336,wall_2high_hor_obj);
room_instance_add(argument0,264,368,wall_2high_hor_obj);
room_instance_add(argument0,264,400,wall_2high_hor_obj);
room_instance_add(argument0,256,432,wall_2high_hor_obj);
room_instance_add(argument0,280,496,wall_2high_hor_obj);
room_instance_add(argument0,304,464,wall_2high_hor_obj);
room_instance_add(argument0,312,472,wall_2high_hor_obj);
room_instance_add(argument0,312,496,wall_2high_hor_obj);
room_instance_add(argument0,344,496,wall_2high_hor_obj);
room_instance_add(argument0,376,488,wall_2high_hor_obj);
room_instance_add(argument0,408,496,wall_2high_hor_obj);
room_instance_add(argument0,472,480,wall_2high_hor_obj);
room_instance_add(argument0,440,488,wall_2high_hor_obj);
room_instance_add(argument0,504,472,wall_2high_hor_obj);
room_instance_add(argument0,536,472,wall_2high_hor_obj);
room_instance_add(argument0,536,448,wall_2high_hor_obj);
room_instance_add(argument0,504,448,wall_2high_hor_obj);
room_instance_add(argument0,472,456,wall_2high_hor_obj);
room_instance_add(argument0,440,464,wall_2high_hor_obj);
room_instance_add(argument0,408,472,wall_2high_hor_obj);
room_instance_add(argument0,376,464,wall_2high_hor_obj);
room_instance_add(argument0,344,472,wall_2high_hor_obj);
room_instance_add(argument0,304,336,wall_2high_hor_obj);
room_instance_add(argument0,312,368,wall_2high_hor_obj);
room_instance_add(argument0,312,400,wall_2high_hor_obj);
room_instance_add(argument0,304,432,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,288,wall_2high_vert_obj);
room_instance_add(argument0,192,320,wall_2high_vert_obj);
room_instance_add(argument0,224,328,wall_2high_vert_obj);
room_instance_add(argument0,256,336,wall_2high_vert_obj);
room_instance_add(argument0,256,288,wall_2high_vert_obj);
room_instance_add(argument0,224,280,wall_2high_vert_obj);
room_instance_add(argument0,192,272,wall_2high_vert_obj);
room_instance_add(argument0,288,320,wall_2high_vert_obj);
room_instance_add(argument0,296,352,wall_2high_vert_obj);
room_instance_add(argument0,304,384,wall_2high_vert_obj);
room_instance_add(argument0,296,416,wall_2high_vert_obj);
room_instance_add(argument0,288,448,wall_2high_vert_obj);
room_instance_add(argument0,264,448,wall_2high_vert_obj);
room_instance_add(argument0,272,416,wall_2high_vert_obj);
room_instance_add(argument0,280,384,wall_2high_vert_obj);
room_instance_add(argument0,272,352,wall_2high_vert_obj);
room_instance_add(argument0,264,480,wall_2high_vert_obj);
room_instance_add(argument0,552,456,wall_2high_vert_obj);
room_instance_add(argument0,360,456,wall_2high_vert_obj);
room_instance_add(argument0,296,456,wall_2high_vert_obj);
room_instance_add(argument0,424,456,wall_2high_vert_obj);
room_instance_add(argument0,392,456,wall_2high_vert_obj);
room_instance_add(argument0,488,440,wall_2high_vert_obj);
room_instance_add(argument0,456,448,wall_2high_vert_obj);
room_instance_add(argument0,488,488,wall_2high_vert_obj);
room_instance_add(argument0,456,496,wall_2high_vert_obj);
room_instance_add(argument0,424,504,wall_2high_vert_obj);
room_instance_add(argument0,392,504,wall_2high_vert_obj);
room_instance_add(argument0,360,504,wall_2high_vert_obj);
// Torches
// Props