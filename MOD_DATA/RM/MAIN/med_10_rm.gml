/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','med','ROOM_med')+' 10';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 96;
    global.spawn_arr[0,1] = 432;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 448;
    global.spawn_arr[1,1] = 432;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 164;
    global.mark_arr[0,1] = 346;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 298;
    global.mark_arr[1,1] = 329;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 314;
    global.mark_arr[2,1] = 286;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 390;
    global.mark_arr[3,1] = 387;
    global.mark_arr[3,2] = 0;
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
room_instance_add(argument0,0,0,color_control_med_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,water_obj);
// Floors
room_instance_add(argument0,160,432,floor_obj);
room_instance_add(argument0,128,432,floor_obj);
room_instance_add(argument0,96,432,floor_obj);
room_instance_add(argument0,416,432,floor_obj);
room_instance_add(argument0,448,432,floor_obj);
room_instance_add(argument0,160,400,floor_obj);
room_instance_add(argument0,160,368,floor_obj);
room_instance_add(argument0,160,336,floor_obj);
room_instance_add(argument0,160,304,floor_obj);
room_instance_add(argument0,192,304,floor_obj);
room_instance_add(argument0,224,304,floor_obj);
room_instance_add(argument0,320,304,floor_obj);
room_instance_add(argument0,384,432,floor_obj);
room_instance_add(argument0,384,400,floor_obj);
room_instance_add(argument0,384,368,floor_obj);
room_instance_add(argument0,384,336,floor_obj);
room_instance_add(argument0,384,304,floor_obj);
room_instance_add(argument0,352,304,floor_obj);
room_instance_add(argument0,224,336,floor_obj);
room_instance_add(argument0,256,336,floor_obj);
room_instance_add(argument0,288,336,floor_obj);
room_instance_add(argument0,320,336,floor_obj);
room_instance_add(argument0,320,272,floor_obj);
room_instance_add(argument0,288,272,floor_obj);
room_instance_add(argument0,256,272,floor_obj);
room_instance_add(argument0,224,272,floor_obj);
// Ceilings
room_instance_add(argument0,160,432,ceil_obj);
room_instance_add(argument0,128,432,ceil_obj);
room_instance_add(argument0,96,432,ceil_obj);
room_instance_add(argument0,416,432,ceil_obj);
room_instance_add(argument0,448,432,ceil_obj);
room_instance_add(argument0,160,400,ceil_obj);
room_instance_add(argument0,160,368,ceil_obj);
room_instance_add(argument0,160,336,ceil_obj);
room_instance_add(argument0,160,304,ceil_obj);
room_instance_add(argument0,192,304,ceil_obj);
room_instance_add(argument0,224,304,ceil_obj);
room_instance_add(argument0,320,304,ceil_obj);
room_instance_add(argument0,384,432,ceil_obj);
room_instance_add(argument0,384,400,ceil_obj);
room_instance_add(argument0,384,368,ceil_obj);
room_instance_add(argument0,384,336,ceil_obj);
room_instance_add(argument0,384,304,ceil_obj);
room_instance_add(argument0,352,304,ceil_obj);
room_instance_add(argument0,224,336,ceil_obj);
room_instance_add(argument0,256,336,ceil_obj);
room_instance_add(argument0,288,336,ceil_obj);
room_instance_add(argument0,320,336,ceil_obj);
room_instance_add(argument0,320,272,ceil_obj);
room_instance_add(argument0,288,272,ceil_obj);
room_instance_add(argument0,256,272,ceil_obj);
room_instance_add(argument0,224,272,ceil_obj);
room_instance_add(argument0,256,304,ceil_obj);
room_instance_add(argument0,288,304,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,128,416,wall_hor_obj);
room_instance_add(argument0,96,416,wall_hor_obj);
room_instance_add(argument0,96,448,wall_hor_obj);
room_instance_add(argument0,128,448,wall_hor_obj);
room_instance_add(argument0,224,256,wall_hor_obj);
room_instance_add(argument0,256,256,wall_hor_obj);
room_instance_add(argument0,288,256,wall_hor_obj);
room_instance_add(argument0,320,256,wall_hor_obj);
room_instance_add(argument0,320,352,wall_hor_obj);
room_instance_add(argument0,288,352,wall_hor_obj);
room_instance_add(argument0,256,352,wall_hor_obj);
room_instance_add(argument0,224,352,wall_hor_obj);
room_instance_add(argument0,352,320,wall_hor_obj);
room_instance_add(argument0,352,288,wall_hor_obj);
room_instance_add(argument0,384,288,wall_hor_obj);
room_instance_add(argument0,416,416,wall_hor_obj);
room_instance_add(argument0,448,416,wall_hor_obj);
room_instance_add(argument0,448,448,wall_hor_obj);
room_instance_add(argument0,416,448,wall_hor_obj);
room_instance_add(argument0,384,448,wall_hor_obj);
room_instance_add(argument0,192,320,wall_hor_obj);
room_instance_add(argument0,192,288,wall_hor_obj);
room_instance_add(argument0,160,288,wall_hor_obj);
room_instance_add(argument0,160,448,wall_hor_obj);
room_instance_add(argument0,256,320,wall_pit_hor_obj);
room_instance_add(argument0,288,320,wall_pit_hor_obj);
room_instance_add(argument0,288,288,wall_pit_hor_obj);
room_instance_add(argument0,256,288,wall_pit_hor_obj);
room_instance_add(argument0,256,320,wall_float_hor_obj);
room_instance_add(argument0,288,320,wall_float_hor_obj);
room_instance_add(argument0,288,288,wall_float_hor_obj);
room_instance_add(argument0,256,288,wall_float_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,80,432,wall_vert_obj);
room_instance_add(argument0,464,432,wall_vert_obj);
room_instance_add(argument0,176,432,wall_vert_obj);
room_instance_add(argument0,176,336,wall_vert_obj);
room_instance_add(argument0,176,368,wall_vert_obj);
room_instance_add(argument0,176,400,wall_vert_obj);
room_instance_add(argument0,144,400,wall_vert_obj);
room_instance_add(argument0,144,368,wall_vert_obj);
room_instance_add(argument0,144,336,wall_vert_obj);
room_instance_add(argument0,144,304,wall_vert_obj);
room_instance_add(argument0,208,272,wall_vert_obj);
room_instance_add(argument0,208,336,wall_vert_obj);
room_instance_add(argument0,336,336,wall_vert_obj);
room_instance_add(argument0,336,272,wall_vert_obj);
room_instance_add(argument0,400,304,wall_vert_obj);
room_instance_add(argument0,400,336,wall_vert_obj);
room_instance_add(argument0,400,368,wall_vert_obj);
room_instance_add(argument0,400,400,wall_vert_obj);
room_instance_add(argument0,368,432,wall_vert_obj);
room_instance_add(argument0,368,400,wall_vert_obj);
room_instance_add(argument0,368,368,wall_vert_obj);
room_instance_add(argument0,368,336,wall_vert_obj);
room_instance_add(argument0,240,304,wall_pit_vert_obj);
room_instance_add(argument0,304,304,wall_pit_vert_obj);
room_instance_add(argument0,240,304,wall_float_vert_obj);
room_instance_add(argument0,304,304,wall_float_vert_obj);
// Jumpscare
room_instance_add(argument0,192,320,js_obj);