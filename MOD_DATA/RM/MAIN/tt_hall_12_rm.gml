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
	global.rm_name_var = ini_read_string('ROOM','tt','ROOM_tt')+' 12';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 128;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 1008;
    global.spawn_arr[1,1] = 128;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,176,128,floor_obj);
room_instance_add(argument0,208,128,floor_obj);
room_instance_add(argument0,240,128,floor_obj);
room_instance_add(argument0,272,128,floor_obj);
room_instance_add(argument0,304,128,floor_obj);
room_instance_add(argument0,336,128,floor_obj);
room_instance_add(argument0,368,128,floor_obj);
room_instance_add(argument0,400,128,floor_obj);
room_instance_add(argument0,432,128,floor_obj);
room_instance_add(argument0,464,128,floor_obj);
room_instance_add(argument0,496,128,floor_obj);
room_instance_add(argument0,528,128,floor_obj);
room_instance_add(argument0,560,128,floor_obj);
room_instance_add(argument0,592,128,floor_obj);
room_instance_add(argument0,624,128,floor_obj);
room_instance_add(argument0,656,128,floor_obj);
room_instance_add(argument0,688,128,floor_obj);
room_instance_add(argument0,720,128,floor_obj);
room_instance_add(argument0,752,128,floor_obj);
room_instance_add(argument0,784,128,floor_obj);
room_instance_add(argument0,816,128,floor_obj);
room_instance_add(argument0,848,128,floor_obj);
room_instance_add(argument0,880,128,floor_obj);
room_instance_add(argument0,912,128,floor_obj);
room_instance_add(argument0,944,128,floor_obj);
room_instance_add(argument0,976,128,floor_obj);
room_instance_add(argument0,1008,128,floor_obj);
// Ceilings
room_instance_add(argument0,176,128,ceil_obj);
room_instance_add(argument0,208,128,ceil_obj);
room_instance_add(argument0,240,128,ceil_obj);
room_instance_add(argument0,272,128,ceil_obj);
room_instance_add(argument0,304,128,ceil_obj);
room_instance_add(argument0,336,128,ceil_obj);
room_instance_add(argument0,368,128,ceil_obj);
room_instance_add(argument0,400,128,ceil_obj);
room_instance_add(argument0,432,128,ceil_obj);
room_instance_add(argument0,464,128,ceil_obj);
room_instance_add(argument0,496,128,ceil_obj);
room_instance_add(argument0,528,128,ceil_obj);
room_instance_add(argument0,560,128,ceil_obj);
room_instance_add(argument0,592,128,ceil_obj);
room_instance_add(argument0,624,128,ceil_obj);
room_instance_add(argument0,656,128,ceil_obj);
room_instance_add(argument0,688,128,ceil_obj);
room_instance_add(argument0,720,128,ceil_obj);
room_instance_add(argument0,752,128,ceil_obj);
room_instance_add(argument0,784,128,ceil_obj);
room_instance_add(argument0,816,128,ceil_obj);
room_instance_add(argument0,848,128,ceil_obj);
room_instance_add(argument0,880,128,ceil_obj);
room_instance_add(argument0,912,128,ceil_obj);
room_instance_add(argument0,944,128,ceil_obj);
room_instance_add(argument0,976,128,ceil_obj);
room_instance_add(argument0,1008,128,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,116,wall_tt_hor_obj);
room_instance_add(argument0,176,140,wall_tt_hor_obj);
room_instance_add(argument0,208,116,wall_tt_hor_obj);
room_instance_add(argument0,208,140,wall_tt_hor_obj);
room_instance_add(argument0,240,140,wall_tt_hor_obj);
room_instance_add(argument0,240,116,wall_tt_hor_obj);
room_instance_add(argument0,272,116,wall_tt_hor_obj);
room_instance_add(argument0,272,140,wall_tt_hor_obj);
room_instance_add(argument0,304,140,wall_tt_hor_obj);
room_instance_add(argument0,304,116,wall_tt_hor_obj);
room_instance_add(argument0,336,116,wall_tt_hor_obj);
room_instance_add(argument0,336,140,wall_tt_hor_obj);
room_instance_add(argument0,368,116,wall_tt_hor_obj);
room_instance_add(argument0,368,140,wall_tt_hor_obj);
room_instance_add(argument0,400,140,wall_tt_hor_obj);
room_instance_add(argument0,400,116,wall_tt_hor_obj);
room_instance_add(argument0,432,116,wall_tt_hor_obj);
room_instance_add(argument0,432,140,wall_tt_hor_obj);
room_instance_add(argument0,464,116,wall_tt_hor_obj);
room_instance_add(argument0,496,116,wall_tt_hor_obj);
room_instance_add(argument0,528,116,wall_tt_hor_obj);
room_instance_add(argument0,560,116,wall_tt_hor_obj);
room_instance_add(argument0,592,116,wall_tt_hor_obj);
room_instance_add(argument0,624,116,wall_tt_hor_obj);
room_instance_add(argument0,656,116,wall_tt_hor_obj);
room_instance_add(argument0,688,116,wall_tt_hor_obj);
room_instance_add(argument0,720,116,wall_tt_hor_obj);
room_instance_add(argument0,752,116,wall_tt_hor_obj);
room_instance_add(argument0,784,116,wall_tt_hor_obj);
room_instance_add(argument0,816,116,wall_tt_hor_obj);
room_instance_add(argument0,848,116,wall_tt_hor_obj);
room_instance_add(argument0,880,116,wall_tt_hor_obj);
room_instance_add(argument0,912,116,wall_tt_hor_obj);
room_instance_add(argument0,944,116,wall_tt_hor_obj);
room_instance_add(argument0,976,116,wall_tt_hor_obj);
room_instance_add(argument0,1008,116,wall_tt_hor_obj);
room_instance_add(argument0,1008,140,wall_tt_hor_obj);
room_instance_add(argument0,976,140,wall_tt_hor_obj);
room_instance_add(argument0,944,140,wall_tt_hor_obj);
room_instance_add(argument0,912,140,wall_tt_hor_obj);
room_instance_add(argument0,880,140,wall_tt_hor_obj);
room_instance_add(argument0,848,140,wall_tt_hor_obj);
room_instance_add(argument0,816,140,wall_tt_hor_obj);
room_instance_add(argument0,784,140,wall_tt_hor_obj);
room_instance_add(argument0,752,140,wall_tt_hor_obj);
room_instance_add(argument0,720,140,wall_tt_hor_obj);
room_instance_add(argument0,688,140,wall_tt_hor_obj);
room_instance_add(argument0,656,140,wall_tt_hor_obj);
room_instance_add(argument0,624,140,wall_tt_hor_obj);
room_instance_add(argument0,592,140,wall_tt_hor_obj);
room_instance_add(argument0,560,140,wall_tt_hor_obj);
room_instance_add(argument0,528,140,wall_tt_hor_obj);
room_instance_add(argument0,496,140,wall_tt_hor_obj);
room_instance_add(argument0,464,140,wall_tt_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,128,wall_tt_vert_obj);
room_instance_add(argument0,1024,128,wall_tt_vert_obj);
// Torches
// Props