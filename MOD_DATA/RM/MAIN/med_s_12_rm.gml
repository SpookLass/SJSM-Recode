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
	global.rm_name_var = ini_read_string('ROOM','med_s','ROOM_med_s')+' 12';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 160;
    global.spawn_arr[1,1] = 224;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
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
room_instance_add(argument0,0,0,fog_close_big_obj);
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,112,288,floor_obj);
room_instance_add(argument0,144,288,floor_obj);
room_instance_add(argument0,144,320,floor_obj);
room_instance_add(argument0,144,352,floor_obj);
room_instance_add(argument0,176,352,floor_obj);
room_instance_add(argument0,112,352,floor_obj);
room_instance_add(argument0,80,352,floor_obj);
room_instance_add(argument0,48,320,floor_obj);
room_instance_add(argument0,80,320,floor_obj);
room_instance_add(argument0,48,288,floor_obj);
room_instance_add(argument0,48,256,floor_obj);
room_instance_add(argument0,80,256,floor_obj);
room_instance_add(argument0,80,224,floor_obj);
room_instance_add(argument0,112,224,floor_obj);
room_instance_add(argument0,144,224,floor_obj);
room_instance_add(argument0,176,224,floor_obj);
room_instance_add(argument0,176,256,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_low_obj);
room_instance_add(argument0,144,288,ceil_low_obj);
room_instance_add(argument0,144,320,ceil_low_obj);
room_instance_add(argument0,144,352,ceil_low_obj);
room_instance_add(argument0,176,352,ceil_low_obj);
room_instance_add(argument0,112,352,ceil_low_obj);
room_instance_add(argument0,80,352,ceil_low_obj);
room_instance_add(argument0,48,320,ceil_low_obj);
room_instance_add(argument0,80,320,ceil_low_obj);
room_instance_add(argument0,48,288,ceil_low_obj);
room_instance_add(argument0,48,256,ceil_low_obj);
room_instance_add(argument0,80,256,ceil_low_obj);
room_instance_add(argument0,80,224,ceil_low_obj);
room_instance_add(argument0,112,224,ceil_low_obj);
room_instance_add(argument0,144,224,ceil_low_obj);
room_instance_add(argument0,176,224,ceil_low_obj);
room_instance_add(argument0,176,256,ceil_low_obj);
room_instance_add(argument0,144,256,ceil_low_obj);
room_instance_add(argument0,112,256,ceil_low_obj);
room_instance_add(argument0,176,288,ceil_low_obj);
room_instance_add(argument0,48,224,ceil_low_obj);
room_instance_add(argument0,48,352,ceil_low_obj);
room_instance_add(argument0,112,320,ceil_low_obj);
room_instance_add(argument0,176,320,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,48,208,wall_hor_obj);
room_instance_add(argument0,80,272,wall_hor_obj);
room_instance_add(argument0,80,304,wall_hor_obj);
room_instance_add(argument0,144,208,wall_hor_obj);
room_instance_add(argument0,176,208,wall_hor_obj);
room_instance_add(argument0,176,368,wall_hor_obj);
room_instance_add(argument0,144,368,wall_hor_obj);
room_instance_add(argument0,112,368,wall_hor_obj);
room_instance_add(argument0,80,368,wall_hor_obj);
room_instance_add(argument0,48,368,wall_hor_obj);
room_instance_add(argument0,80,208,wall_hor_obj);
room_instance_add(argument0,112,208,wall_hor_obj);
room_instance_add(argument0,112,304,wall_pit_hor_obj);
room_instance_add(argument0,112,336,wall_pit_hor_obj);
room_instance_add(argument0,48,336,wall_pit_hor_obj);
room_instance_add(argument0,48,368,wall_pit_hor_obj);
room_instance_add(argument0,176,336,wall_pit_hor_obj);
room_instance_add(argument0,176,272,wall_pit_hor_obj);
room_instance_add(argument0,144,272,wall_pit_hor_obj);
room_instance_add(argument0,112,272,wall_pit_hor_obj);
room_instance_add(argument0,112,240,wall_pit_hor_obj);
room_instance_add(argument0,144,240,wall_pit_hor_obj);
room_instance_add(argument0,48,240,wall_pit_hor_obj);
room_instance_add(argument0,48,208,wall_pit_hor_obj);
room_instance_add(argument0,112,304,wall_float_hor_obj);
room_instance_add(argument0,112,336,wall_float_hor_obj);
room_instance_add(argument0,48,336,wall_float_hor_obj);
room_instance_add(argument0,48,368,wall_float_hor_obj);
room_instance_add(argument0,176,336,wall_float_hor_obj);
room_instance_add(argument0,176,272,wall_float_hor_obj);
room_instance_add(argument0,144,272,wall_float_hor_obj);
room_instance_add(argument0,112,272,wall_float_hor_obj);
room_instance_add(argument0,112,240,wall_float_hor_obj);
room_instance_add(argument0,144,240,wall_float_hor_obj);
room_instance_add(argument0,48,240,wall_float_hor_obj);
room_instance_add(argument0,48,208,wall_float_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,288,wall_vert_obj);
room_instance_add(argument0,64,288,wall_vert_obj);
room_instance_add(argument0,32,288,wall_vert_obj);
room_instance_add(argument0,32,256,wall_vert_obj);
room_instance_add(argument0,32,224,wall_vert_obj);
room_instance_add(argument0,32,320,wall_vert_obj);
room_instance_add(argument0,32,352,wall_vert_obj);
room_instance_add(argument0,192,352,wall_vert_obj);
room_instance_add(argument0,192,320,wall_vert_obj);
room_instance_add(argument0,192,288,wall_vert_obj);
room_instance_add(argument0,192,256,wall_vert_obj);
room_instance_add(argument0,192,224,wall_vert_obj);
room_instance_add(argument0,64,352,wall_pit_vert_obj);
room_instance_add(argument0,32,352,wall_pit_vert_obj);
room_instance_add(argument0,96,320,wall_pit_vert_obj);
room_instance_add(argument0,128,320,wall_pit_vert_obj);
room_instance_add(argument0,160,320,wall_pit_vert_obj);
room_instance_add(argument0,192,320,wall_pit_vert_obj);
room_instance_add(argument0,192,288,wall_pit_vert_obj);
room_instance_add(argument0,160,288,wall_pit_vert_obj);
room_instance_add(argument0,160,256,wall_pit_vert_obj);
room_instance_add(argument0,96,256,wall_pit_vert_obj);
room_instance_add(argument0,64,224,wall_pit_vert_obj);
room_instance_add(argument0,32,224,wall_pit_vert_obj);
room_instance_add(argument0,64,352,wall_float_vert_obj);
room_instance_add(argument0,32,352,wall_float_vert_obj);
room_instance_add(argument0,96,320,wall_float_vert_obj);
room_instance_add(argument0,128,320,wall_float_vert_obj);
room_instance_add(argument0,160,320,wall_float_vert_obj);
room_instance_add(argument0,192,320,wall_float_vert_obj);
room_instance_add(argument0,192,288,wall_float_vert_obj);
room_instance_add(argument0,160,288,wall_float_vert_obj);
room_instance_add(argument0,160,256,wall_float_vert_obj);
room_instance_add(argument0,96,256,wall_float_vert_obj);
room_instance_add(argument0,64,224,wall_float_vert_obj);
room_instance_add(argument0,32,224,wall_float_vert_obj);