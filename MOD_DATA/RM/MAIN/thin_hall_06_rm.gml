/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','thin','ROOM_thin')+' 6';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 464;
    global.spawn_arr[1,1] = 240;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 0;
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
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,272,112,floor_obj);
room_instance_add(argument0,304,112,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,304,208,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,368,240,floor_obj);
room_instance_add(argument0,400,240,floor_obj);
room_instance_add(argument0,432,240,floor_obj);
room_instance_add(argument0,272,208,floor_obj);
room_instance_add(argument0,464,240,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,240,144,ceil_low_obj);
room_instance_add(argument0,272,144,ceil_low_obj);
room_instance_add(argument0,272,112,ceil_low_obj);
room_instance_add(argument0,304,112,ceil_low_obj);
room_instance_add(argument0,304,144,ceil_low_obj);
room_instance_add(argument0,272,176,ceil_low_obj);
room_instance_add(argument0,304,176,ceil_low_obj);
room_instance_add(argument0,304,208,ceil_low_obj);
room_instance_add(argument0,304,240,ceil_low_obj);
room_instance_add(argument0,336,240,ceil_low_obj);
room_instance_add(argument0,368,240,ceil_low_obj);
room_instance_add(argument0,400,240,ceil_low_obj);
room_instance_add(argument0,432,240,ceil_low_obj);
room_instance_add(argument0,272,208,ceil_low_obj);
room_instance_add(argument0,464,240,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,132,wall_hor_obj);
room_instance_add(argument0,208,132,wall_hor_obj);
room_instance_add(argument0,240,132,wall_hor_obj);
room_instance_add(argument0,272,100,wall_hor_obj);
room_instance_add(argument0,304,100,wall_hor_obj);
room_instance_add(argument0,336,228,wall_hor_obj);
room_instance_add(argument0,368,228,wall_hor_obj);
room_instance_add(argument0,400,228,wall_hor_obj);
room_instance_add(argument0,432,228,wall_hor_obj);
room_instance_add(argument0,464,228,wall_hor_obj);
room_instance_add(argument0,176,156,wall_hor_obj);
room_instance_add(argument0,208,156,wall_hor_obj);
room_instance_add(argument0,240,156,wall_hor_obj);
room_instance_add(argument0,272,220,wall_hor_obj);
room_instance_add(argument0,304,252,wall_hor_obj);
room_instance_add(argument0,336,252,wall_hor_obj);
room_instance_add(argument0,368,252,wall_hor_obj);
room_instance_add(argument0,400,252,wall_hor_obj);
room_instance_add(argument0,432,252,wall_hor_obj);
room_instance_add(argument0,464,252,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,480,240,wall_vert_obj);
room_instance_add(argument0,256,116,wall_vert_obj);
room_instance_add(argument0,320,116,wall_vert_obj);
room_instance_add(argument0,320,148,wall_vert_obj);
room_instance_add(argument0,320,180,wall_vert_obj);
room_instance_add(argument0,320,212,wall_vert_obj);
room_instance_add(argument0,256,172,wall_vert_obj);
room_instance_add(argument0,256,204,wall_vert_obj);
room_instance_add(argument0,288,236,wall_vert_obj);
// Props
room_instance_add(argument0,304,120,table_rand_obj);