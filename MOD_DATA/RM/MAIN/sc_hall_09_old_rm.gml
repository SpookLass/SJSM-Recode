/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string("ROOM","sc","ROOM_sc")+" 9";
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 416;
    global.spawn_arr[1,1] = 472;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    // Mark
    global.mark_len_var = 0;
    /*global.mark_arr[0,0] = 179;
    global.mark_arr[0,1] = 435;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 173;
    global.mark_arr[1,1] = 318;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 310;
    global.mark_arr[2,1] = 447;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 435;
    global.mark_arr[3,1] = 453;
    global.mark_arr[3,2] = 0;*/
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
room_instance_add(argument0,144,296,floor_obj);
room_instance_add(argument0,176,304,floor_obj);
room_instance_add(argument0,208,296,floor_obj);
room_instance_add(argument0,240,304,floor_obj);
room_instance_add(argument0,272,296,floor_obj);
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,336,280,floor_obj);
room_instance_add(argument0,368,272,floor_obj);
room_instance_add(argument0,400,280,floor_obj);
room_instance_add(argument0,400,312,floor_obj);
room_instance_add(argument0,400,344,floor_obj);
room_instance_add(argument0,408,376,floor_obj);
room_instance_add(argument0,400,408,floor_obj);
room_instance_add(argument0,408,440,floor_obj);
room_instance_add(argument0,416,472,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_2high_obj);
room_instance_add(argument0,144,296,ceil_2high_obj);
room_instance_add(argument0,176,304,ceil_2high_obj);
room_instance_add(argument0,208,296,ceil_2high_obj);
room_instance_add(argument0,240,304,ceil_2high_obj);
room_instance_add(argument0,272,296,ceil_2high_obj);
room_instance_add(argument0,304,288,ceil_2high_obj);
room_instance_add(argument0,336,280,ceil_2high_obj);
room_instance_add(argument0,368,272,ceil_2high_obj);
room_instance_add(argument0,400,280,ceil_2high_obj);
room_instance_add(argument0,400,312,ceil_2high_obj);
room_instance_add(argument0,400,344,ceil_2high_obj);
room_instance_add(argument0,408,376,ceil_2high_obj);
room_instance_add(argument0,400,408,ceil_2high_obj);
room_instance_add(argument0,408,440,ceil_2high_obj);
room_instance_add(argument0,416,472,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,280,wall_2high_hor_obj);
room_instance_add(argument0,112,296,wall_2high_hor_obj);
room_instance_add(argument0,144,304,wall_2high_hor_obj);
room_instance_add(argument0,144,280,wall_2high_hor_obj);
room_instance_add(argument0,176,288,wall_2high_hor_obj);
room_instance_add(argument0,208,280,wall_2high_hor_obj);
room_instance_add(argument0,176,312,wall_2high_hor_obj);
room_instance_add(argument0,208,304,wall_2high_hor_obj);
room_instance_add(argument0,240,312,wall_2high_hor_obj);
room_instance_add(argument0,240,288,wall_2high_hor_obj);
room_instance_add(argument0,272,280,wall_2high_hor_obj);
room_instance_add(argument0,272,304,wall_2high_hor_obj);
room_instance_add(argument0,304,296,wall_2high_hor_obj);
room_instance_add(argument0,304,272,wall_2high_hor_obj);
room_instance_add(argument0,336,264,wall_2high_hor_obj);
room_instance_add(argument0,336,288,wall_2high_hor_obj);
room_instance_add(argument0,368,256,wall_2high_hor_obj);
room_instance_add(argument0,368,280,wall_2high_hor_obj);
room_instance_add(argument0,400,264,wall_2high_hor_obj);
room_instance_add(argument0,416,488,wall_2high_hor_obj);
room_instance_add(argument0,424,328,wall_2high_hor_obj);
room_instance_add(argument0,432,360,wall_2high_hor_obj);
room_instance_add(argument0,432,392,wall_2high_hor_obj);
room_instance_add(argument0,432,424,wall_2high_hor_obj);
room_instance_add(argument0,440,456,wall_2high_hor_obj);
room_instance_add(argument0,384,424,wall_2high_hor_obj);
room_instance_add(argument0,384,392,wall_2high_hor_obj);
room_instance_add(argument0,384,360,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,288,wall_2high_vert_obj);
room_instance_add(argument0,128,312,wall_2high_vert_obj);
room_instance_add(argument0,160,320,wall_2high_vert_obj);
room_instance_add(argument0,192,320,wall_2high_vert_obj);
room_instance_add(argument0,224,320,wall_2high_vert_obj);
room_instance_add(argument0,256,320,wall_2high_vert_obj);
room_instance_add(argument0,288,312,wall_2high_vert_obj);
room_instance_add(argument0,320,304,wall_2high_vert_obj);
room_instance_add(argument0,352,296,wall_2high_vert_obj);
room_instance_add(argument0,384,296,wall_2high_vert_obj);
room_instance_add(argument0,384,248,wall_2high_vert_obj);
room_instance_add(argument0,352,248,wall_2high_vert_obj);
room_instance_add(argument0,320,256,wall_2high_vert_obj);
room_instance_add(argument0,288,264,wall_2high_vert_obj);
room_instance_add(argument0,256,272,wall_2high_vert_obj);
room_instance_add(argument0,224,272,wall_2high_vert_obj);
room_instance_add(argument0,192,272,wall_2high_vert_obj);
room_instance_add(argument0,160,272,wall_2high_vert_obj);
room_instance_add(argument0,400,376,wall_2high_vert_obj);
room_instance_add(argument0,384,328,wall_2high_vert_obj);
room_instance_add(argument0,384,360,wall_2high_vert_obj);
room_instance_add(argument0,392,408,wall_2high_vert_obj);
room_instance_add(argument0,400,440,wall_2high_vert_obj);
room_instance_add(argument0,400,472,wall_2high_vert_obj);
room_instance_add(argument0,432,472,wall_2high_vert_obj);
room_instance_add(argument0,424,440,wall_2high_vert_obj);
room_instance_add(argument0,416,408,wall_2high_vert_obj);
room_instance_add(argument0,424,376,wall_2high_vert_obj);
room_instance_add(argument0,416,344,wall_2high_vert_obj);
room_instance_add(argument0,408,280,wall_2high_vert_obj);
room_instance_add(argument0,408,312,wall_2high_vert_obj);
// Torches
// Props