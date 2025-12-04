/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sc','ROOM_sc')+' 7';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 240;
    global.spawn_arr[1,1] = 112;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
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
room_instance_add(argument0,0,0,fog_close_obj);
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,112,288,floor_obj);
room_instance_add(argument0,144,280,floor_obj);
room_instance_add(argument0,176,272,floor_obj);
room_instance_add(argument0,208,264,floor_obj);
room_instance_add(argument0,240,272,floor_obj);
room_instance_add(argument0,272,264,floor_obj);
room_instance_add(argument0,304,256,floor_obj);
room_instance_add(argument0,336,248,floor_obj);
room_instance_add(argument0,368,240,floor_obj);
room_instance_add(argument0,368,208,floor_obj);
room_instance_add(argument0,368,176,floor_obj);
room_instance_add(argument0,336,168,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,272,184,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,208,112,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_2high_obj);
room_instance_add(argument0,144,280,ceil_2high_obj);
room_instance_add(argument0,176,272,ceil_2high_obj);
room_instance_add(argument0,208,264,ceil_2high_obj);
room_instance_add(argument0,240,272,ceil_2high_obj);
room_instance_add(argument0,272,264,ceil_2high_obj);
room_instance_add(argument0,304,256,ceil_2high_obj);
room_instance_add(argument0,336,248,ceil_2high_obj);
room_instance_add(argument0,368,240,ceil_2high_obj);
room_instance_add(argument0,368,208,ceil_2high_obj);
room_instance_add(argument0,368,176,ceil_2high_obj);
room_instance_add(argument0,336,168,ceil_2high_obj);
room_instance_add(argument0,304,176,ceil_2high_obj);
room_instance_add(argument0,272,184,ceil_2high_obj);
room_instance_add(argument0,240,176,ceil_2high_obj);
room_instance_add(argument0,208,176,ceil_2high_obj);
room_instance_add(argument0,208,144,ceil_2high_obj);
room_instance_add(argument0,208,112,ceil_2high_obj);
room_instance_add(argument0,240,112,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,280,wall_2high_hor_obj);
room_instance_add(argument0,112,296,wall_2high_hor_obj);
room_instance_add(argument0,144,272,wall_2high_hor_obj);
room_instance_add(argument0,144,296,wall_2high_hor_obj);
room_instance_add(argument0,176,288,wall_2high_hor_obj);
room_instance_add(argument0,176,264,wall_2high_hor_obj);
room_instance_add(argument0,208,280,wall_2high_hor_obj);
room_instance_add(argument0,208,256,wall_2high_hor_obj);
room_instance_add(argument0,240,288,wall_2high_hor_obj);
room_instance_add(argument0,240,264,wall_2high_hor_obj);
room_instance_add(argument0,272,280,wall_2high_hor_obj);
room_instance_add(argument0,304,272,wall_2high_hor_obj);
room_instance_add(argument0,272,256,wall_2high_hor_obj);
room_instance_add(argument0,304,248,wall_2high_hor_obj);
room_instance_add(argument0,336,264,wall_2high_hor_obj);
room_instance_add(argument0,336,240,wall_2high_hor_obj);
room_instance_add(argument0,368,256,wall_2high_hor_obj);
room_instance_add(argument0,336,152,wall_2high_hor_obj);
room_instance_add(argument0,336,176,wall_2high_hor_obj);
room_instance_add(argument0,368,160,wall_2high_hor_obj);
room_instance_add(argument0,304,160,wall_2high_hor_obj);
room_instance_add(argument0,272,168,wall_2high_hor_obj);
room_instance_add(argument0,304,184,wall_2high_hor_obj);
room_instance_add(argument0,272,192,wall_2high_hor_obj);
room_instance_add(argument0,240,184,wall_2high_hor_obj);
room_instance_add(argument0,240,160,wall_2high_hor_obj);
room_instance_add(argument0,208,184,wall_2high_hor_obj);
room_instance_add(argument0,240,104,wall_2high_hor_obj);
room_instance_add(argument0,208,104,wall_2high_hor_obj);
room_instance_add(argument0,240,128,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,288,wall_2high_vert_obj);
room_instance_add(argument0,128,264,wall_2high_vert_obj);
room_instance_add(argument0,160,256,wall_2high_vert_obj);
room_instance_add(argument0,192,248,wall_2high_vert_obj);
room_instance_add(argument0,224,248,wall_2high_vert_obj);
room_instance_add(argument0,224,296,wall_2high_vert_obj);
room_instance_add(argument0,192,296,wall_2high_vert_obj);
room_instance_add(argument0,160,304,wall_2high_vert_obj);
room_instance_add(argument0,256,296,wall_2high_vert_obj);
room_instance_add(argument0,288,288,wall_2high_vert_obj);
room_instance_add(argument0,320,280,wall_2high_vert_obj);
room_instance_add(argument0,352,272,wall_2high_vert_obj);
room_instance_add(argument0,376,240,wall_2high_vert_obj);
room_instance_add(argument0,352,224,wall_2high_vert_obj);
room_instance_add(argument0,320,232,wall_2high_vert_obj);
room_instance_add(argument0,288,240,wall_2high_vert_obj);
room_instance_add(argument0,256,248,wall_2high_vert_obj);
room_instance_add(argument0,352,192,wall_2high_vert_obj);
room_instance_add(argument0,376,208,wall_2high_vert_obj);
room_instance_add(argument0,376,176,wall_2high_vert_obj);
room_instance_add(argument0,256,112,wall_2high_vert_obj);
room_instance_add(argument0,256,200,wall_2high_vert_obj);
room_instance_add(argument0,288,200,wall_2high_vert_obj);
room_instance_add(argument0,320,192,wall_2high_vert_obj);
room_instance_add(argument0,352,144,wall_2high_vert_obj);
room_instance_add(argument0,320,144,wall_2high_vert_obj);
room_instance_add(argument0,288,152,wall_2high_vert_obj);
room_instance_add(argument0,256,152,wall_2high_vert_obj);
room_instance_add(argument0,224,144,wall_2high_vert_obj);
room_instance_add(argument0,192,168,wall_2high_vert_obj);
room_instance_add(argument0,192,136,wall_2high_vert_obj);
room_instance_add(argument0,192,104,wall_2high_vert_obj);
// Torches
// Props