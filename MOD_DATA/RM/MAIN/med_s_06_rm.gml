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
	global.rm_name_var = ini_read_string('ROOM','med_s','ROOM_med_s')+' 6';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 400;
    global.spawn_arr[1,1] = 288;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 0;
    /*global.mark_arr[0,0] = 300;
    global.mark_arr[0,1] = 313;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 327;
    global.mark_arr[1,1] = 186;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 396;
    global.mark_arr[2,1] = 162;
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
room_instance_add(argument0,144,256,floor_obj);
room_instance_add(argument0,112,320,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
room_instance_add(argument0,272,288,floor_obj);
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,368,256,floor_obj);
room_instance_add(argument0,272,256,floor_obj);
room_instance_add(argument0,240,256,floor_obj);
room_instance_add(argument0,208,320,floor_obj);
room_instance_add(argument0,240,320,floor_obj);
room_instance_add(argument0,336,320,floor_obj);
room_instance_add(argument0,368,320,floor_obj);
room_instance_add(argument0,400,256,floor_obj);
room_instance_add(argument0,400,288,floor_obj);
room_instance_add(argument0,400,320,floor_obj);
room_instance_add(argument0,304,320,floor_obj);
room_instance_add(argument0,272,320,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_low_obj);
room_instance_add(argument0,144,288,ceil_low_obj);
room_instance_add(argument0,144,256,ceil_low_obj);
room_instance_add(argument0,112,320,ceil_low_obj);
room_instance_add(argument0,176,288,ceil_low_obj);
room_instance_add(argument0,208,288,ceil_low_obj);
room_instance_add(argument0,272,288,ceil_low_obj);
room_instance_add(argument0,304,288,ceil_low_obj);
room_instance_add(argument0,368,256,ceil_low_obj);
room_instance_add(argument0,272,256,ceil_low_obj);
room_instance_add(argument0,240,256,ceil_low_obj);
room_instance_add(argument0,208,320,ceil_low_obj);
room_instance_add(argument0,240,320,ceil_low_obj);
room_instance_add(argument0,336,320,ceil_low_obj);
room_instance_add(argument0,368,320,ceil_low_obj);
room_instance_add(argument0,400,256,ceil_low_obj);
room_instance_add(argument0,400,288,ceil_low_obj);
room_instance_add(argument0,400,320,ceil_low_obj);
room_instance_add(argument0,304,320,ceil_low_obj);
room_instance_add(argument0,272,320,ceil_low_obj);
room_instance_add(argument0,208,256,ceil_low_obj);
room_instance_add(argument0,240,288,ceil_low_obj);
room_instance_add(argument0,176,320,ceil_low_obj);
room_instance_add(argument0,144,320,ceil_low_obj);
room_instance_add(argument0,304,256,ceil_low_obj);
room_instance_add(argument0,336,288,ceil_low_obj);
room_instance_add(argument0,368,288,ceil_low_obj);
room_instance_add(argument0,336,256,ceil_low_obj);
room_instance_add(argument0,176,256,ceil_low_obj);
room_instance_add(argument0,112,256,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,240,wall_hor_obj);
room_instance_add(argument0,144,240,wall_hor_obj);
room_instance_add(argument0,176,240,wall_hor_obj);
room_instance_add(argument0,208,240,wall_hor_obj);
room_instance_add(argument0,240,240,wall_hor_obj);
room_instance_add(argument0,272,240,wall_hor_obj);
room_instance_add(argument0,304,240,wall_hor_obj);
room_instance_add(argument0,336,240,wall_hor_obj);
room_instance_add(argument0,368,240,wall_hor_obj);
room_instance_add(argument0,400,240,wall_hor_obj);
room_instance_add(argument0,400,336,wall_hor_obj);
room_instance_add(argument0,368,336,wall_hor_obj);
room_instance_add(argument0,336,336,wall_hor_obj);
room_instance_add(argument0,304,336,wall_hor_obj);
room_instance_add(argument0,272,336,wall_hor_obj);
room_instance_add(argument0,240,336,wall_hor_obj);
room_instance_add(argument0,208,336,wall_hor_obj);
room_instance_add(argument0,176,336,wall_hor_obj);
room_instance_add(argument0,144,336,wall_hor_obj);
room_instance_add(argument0,112,336,wall_hor_obj);
room_instance_add(argument0,144,304,wall_pit_hor_obj);
room_instance_add(argument0,144,336,wall_pit_hor_obj);
room_instance_add(argument0,176,336,wall_pit_hor_obj);
room_instance_add(argument0,176,304,wall_pit_hor_obj);
room_instance_add(argument0,240,304,wall_pit_hor_obj);
room_instance_add(argument0,240,272,wall_pit_hor_obj);
room_instance_add(argument0,208,272,wall_pit_hor_obj);
room_instance_add(argument0,176,272,wall_pit_hor_obj);
room_instance_add(argument0,176,240,wall_pit_hor_obj);
room_instance_add(argument0,208,240,wall_pit_hor_obj);
room_instance_add(argument0,112,272,wall_pit_hor_obj);
room_instance_add(argument0,112,240,wall_pit_hor_obj);
room_instance_add(argument0,304,272,wall_pit_hor_obj);
room_instance_add(argument0,304,240,wall_pit_hor_obj);
room_instance_add(argument0,336,240,wall_pit_hor_obj);
room_instance_add(argument0,368,272,wall_pit_hor_obj);
room_instance_add(argument0,368,304,wall_pit_hor_obj);
room_instance_add(argument0,336,304,wall_pit_hor_obj);
room_instance_add(argument0,144,304,wall_float_hor_obj);
room_instance_add(argument0,144,336,wall_float_hor_obj);
room_instance_add(argument0,176,336,wall_float_hor_obj);
room_instance_add(argument0,176,304,wall_float_hor_obj);
room_instance_add(argument0,240,304,wall_float_hor_obj);
room_instance_add(argument0,240,272,wall_float_hor_obj);
room_instance_add(argument0,208,272,wall_float_hor_obj);
room_instance_add(argument0,176,272,wall_float_hor_obj);
room_instance_add(argument0,176,240,wall_float_hor_obj);
room_instance_add(argument0,208,240,wall_float_hor_obj);
room_instance_add(argument0,112,272,wall_float_hor_obj);
room_instance_add(argument0,112,240,wall_float_hor_obj);
room_instance_add(argument0,304,272,wall_float_hor_obj);
room_instance_add(argument0,304,240,wall_float_hor_obj);
room_instance_add(argument0,336,240,wall_float_hor_obj);
room_instance_add(argument0,368,272,wall_float_hor_obj);
room_instance_add(argument0,368,304,wall_float_hor_obj);
room_instance_add(argument0,336,304,wall_float_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,288,wall_vert_obj);
room_instance_add(argument0,96,320,wall_vert_obj);
room_instance_add(argument0,96,256,wall_vert_obj);
room_instance_add(argument0,416,256,wall_vert_obj);
room_instance_add(argument0,416,288,wall_vert_obj);
room_instance_add(argument0,416,320,wall_vert_obj);
room_instance_add(argument0,128,320,wall_pit_vert_obj);
room_instance_add(argument0,192,320,wall_pit_vert_obj);
room_instance_add(argument0,96,256,wall_pit_vert_obj);
room_instance_add(argument0,128,256,wall_pit_vert_obj);
room_instance_add(argument0,160,256,wall_pit_vert_obj);
room_instance_add(argument0,224,256,wall_pit_vert_obj);
room_instance_add(argument0,224,288,wall_pit_vert_obj);
room_instance_add(argument0,256,288,wall_pit_vert_obj);
room_instance_add(argument0,288,256,wall_pit_vert_obj);
room_instance_add(argument0,352,256,wall_pit_vert_obj);
room_instance_add(argument0,320,288,wall_pit_vert_obj);
room_instance_add(argument0,384,288,wall_pit_vert_obj);
room_instance_add(argument0,128,320,wall_float_vert_obj);
room_instance_add(argument0,192,320,wall_float_vert_obj);
room_instance_add(argument0,96,256,wall_float_vert_obj);
room_instance_add(argument0,128,256,wall_float_vert_obj);
room_instance_add(argument0,160,256,wall_float_vert_obj);
room_instance_add(argument0,224,256,wall_float_vert_obj);
room_instance_add(argument0,224,288,wall_float_vert_obj);
room_instance_add(argument0,256,288,wall_float_vert_obj);
room_instance_add(argument0,288,256,wall_float_vert_obj);
room_instance_add(argument0,352,256,wall_float_vert_obj);
room_instance_add(argument0,320,288,wall_float_vert_obj);
room_instance_add(argument0,384,288,wall_float_vert_obj);