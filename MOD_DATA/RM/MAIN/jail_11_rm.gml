/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','jail','ROOM_jail')+' 11';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 464;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
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
room_instance_add(argument0,176,272,floor_obj);
room_instance_add(argument0,176,240,floor_obj);
room_instance_add(argument0,176,208,floor_obj);
room_instance_add(argument0,208,208,floor_obj);
room_instance_add(argument0,240,208,floor_obj);
room_instance_add(argument0,272,208,floor_obj);
room_instance_add(argument0,304,208,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,304,272,floor_obj);
room_instance_add(argument0,304,304,floor_obj);
room_instance_add(argument0,336,304,floor_obj);
room_instance_add(argument0,368,304,floor_obj);
room_instance_add(argument0,400,304,floor_obj);
room_instance_add(argument0,432,304,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,464,304,floor_obj);
// Ceilings
room_instance_add(argument0,144,304,ceil_obj);
room_instance_add(argument0,112,304,ceil_obj);
room_instance_add(argument0,176,304,ceil_obj);
room_instance_add(argument0,176,272,ceil_obj);
room_instance_add(argument0,176,240,ceil_obj);
room_instance_add(argument0,176,208,ceil_obj);
room_instance_add(argument0,208,208,ceil_obj);
room_instance_add(argument0,240,208,ceil_obj);
room_instance_add(argument0,272,208,ceil_obj);
room_instance_add(argument0,304,208,ceil_obj);
room_instance_add(argument0,304,240,ceil_obj);
room_instance_add(argument0,304,272,ceil_obj);
room_instance_add(argument0,304,304,ceil_obj);
room_instance_add(argument0,336,304,ceil_obj);
room_instance_add(argument0,368,304,ceil_obj);
room_instance_add(argument0,400,304,ceil_obj);
room_instance_add(argument0,432,304,ceil_obj);
room_instance_add(argument0,208,176,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,240,144,ceil_obj);
room_instance_add(argument0,240,176,ceil_obj);
room_instance_add(argument0,272,176,ceil_obj);
room_instance_add(argument0,272,144,ceil_obj);
room_instance_add(argument0,464,304,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,288,wall_hor_obj);
room_instance_add(argument0,112,288,wall_hor_obj);
room_instance_add(argument0,112,320,wall_hor_obj);
room_instance_add(argument0,144,320,wall_hor_obj);
room_instance_add(argument0,176,320,wall_hor_obj);
room_instance_add(argument0,176,192,wall_hor_obj);
room_instance_add(argument0,208,224,wall_hor_obj);
room_instance_add(argument0,240,224,wall_hor_obj);
room_instance_add(argument0,272,224,wall_hor_obj);
room_instance_add(argument0,208,128,wall_hor_obj);
room_instance_add(argument0,240,128,wall_hor_obj);
room_instance_add(argument0,272,128,wall_hor_obj);
room_instance_add(argument0,304,192,wall_hor_obj);
room_instance_add(argument0,304,320,wall_hor_obj);
room_instance_add(argument0,336,288,wall_hor_obj);
room_instance_add(argument0,336,320,wall_hor_obj);
room_instance_add(argument0,368,288,wall_hor_obj);
room_instance_add(argument0,368,320,wall_hor_obj);
room_instance_add(argument0,400,288,wall_hor_obj);
room_instance_add(argument0,400,320,wall_hor_obj);
room_instance_add(argument0,432,288,wall_hor_obj);
room_instance_add(argument0,432,320,wall_hor_obj);
room_instance_add(argument0,464,288,wall_hor_obj);
room_instance_add(argument0,464,320,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,304,wall_vert_obj);
room_instance_add(argument0,192,304,wall_vert_obj);
room_instance_add(argument0,192,240,wall_vert_obj);
room_instance_add(argument0,192,272,wall_vert_obj);
room_instance_add(argument0,160,208,wall_vert_obj);
room_instance_add(argument0,160,240,wall_vert_obj);
room_instance_add(argument0,160,272,wall_vert_obj);
room_instance_add(argument0,192,176,wall_vert_obj);
room_instance_add(argument0,192,144,wall_vert_obj);
room_instance_add(argument0,288,144,wall_vert_obj);
room_instance_add(argument0,288,176,wall_vert_obj);
room_instance_add(argument0,320,208,wall_vert_obj);
room_instance_add(argument0,320,240,wall_vert_obj);
room_instance_add(argument0,288,240,wall_vert_obj);
room_instance_add(argument0,320,272,wall_vert_obj);
room_instance_add(argument0,288,272,wall_vert_obj);
room_instance_add(argument0,288,304,wall_vert_obj);
room_instance_add(argument0,480,304,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,208,192,bar_hor_obj);
room_instance_add(argument0,240,192,bar_hor_obj);
room_instance_add(argument0,272,192,bar_hor_obj);
room_instance_add(argument0,171,218,web_rand_obj);
room_instance_add(argument0,272,202,web_rand_obj);
room_instance_add(argument0,238,142,web_rand_obj);
room_instance_add(argument0,275,143,web_rand_obj);
room_instance_add(argument0,200,138,web_rand_obj);
room_instance_add(argument0,200,158,web_rand_obj);
// Jumpscare
room_instance_add(argument0,384,320,js_obj);