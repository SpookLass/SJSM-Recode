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
	global.rm_name_var = ini_read_string('ROOM','tt','ROOM_tt')+' 3';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 128;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 400;
    global.spawn_arr[1,1] = 256;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 329;
    global.mark_arr[0,1] = 133;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 324;
    global.mark_arr[1,1] = 209;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 382;
    global.mark_arr[2,1] = 282;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 385;
    global.mark_arr[3,1] = 186;
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,176,128,floor_obj);
room_instance_add(argument0,208,128,floor_obj);
room_instance_add(argument0,240,128,floor_obj);
room_instance_add(argument0,272,128,floor_obj);
room_instance_add(argument0,304,96,floor_obj);
room_instance_add(argument0,304,128,floor_obj);
room_instance_add(argument0,304,160,floor_obj);
room_instance_add(argument0,336,160,floor_obj);
room_instance_add(argument0,336,128,floor_obj);
room_instance_add(argument0,336,96,floor_obj);
room_instance_add(argument0,368,96,floor_obj);
room_instance_add(argument0,368,128,floor_obj);
room_instance_add(argument0,368,160,floor_obj);
room_instance_add(argument0,368,192,floor_obj);
room_instance_add(argument0,336,192,floor_obj);
room_instance_add(argument0,304,192,floor_obj);
room_instance_add(argument0,304,224,floor_obj);
room_instance_add(argument0,336,224,floor_obj);
room_instance_add(argument0,368,224,floor_obj);
room_instance_add(argument0,368,256,floor_obj);
room_instance_add(argument0,336,256,floor_obj);
room_instance_add(argument0,304,256,floor_obj);
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,400,288,floor_obj);
room_instance_add(argument0,400,256,floor_obj);
room_instance_add(argument0,400,224,floor_obj);
room_instance_add(argument0,400,192,floor_obj);
room_instance_add(argument0,400,160,floor_obj);
room_instance_add(argument0,400,128,floor_obj);
room_instance_add(argument0,400,96,floor_obj);
// Ceilings
room_instance_add(argument0,176,128,ceil_obj);
room_instance_add(argument0,208,128,ceil_obj);
room_instance_add(argument0,240,128,ceil_obj);
room_instance_add(argument0,272,128,ceil_obj);
room_instance_add(argument0,304,96,ceil_obj);
room_instance_add(argument0,304,128,ceil_obj);
room_instance_add(argument0,304,160,ceil_obj);
room_instance_add(argument0,336,160,ceil_obj);
room_instance_add(argument0,336,128,ceil_obj);
room_instance_add(argument0,336,96,ceil_obj);
room_instance_add(argument0,368,96,ceil_obj);
room_instance_add(argument0,368,128,ceil_obj);
room_instance_add(argument0,368,160,ceil_obj);
room_instance_add(argument0,368,192,ceil_obj);
room_instance_add(argument0,336,192,ceil_obj);
room_instance_add(argument0,304,192,ceil_obj);
room_instance_add(argument0,304,224,ceil_obj);
room_instance_add(argument0,336,224,ceil_obj);
room_instance_add(argument0,368,224,ceil_obj);
room_instance_add(argument0,368,256,ceil_obj);
room_instance_add(argument0,336,256,ceil_obj);
room_instance_add(argument0,304,256,ceil_obj);
room_instance_add(argument0,304,288,ceil_obj);
room_instance_add(argument0,336,288,ceil_obj);
room_instance_add(argument0,368,288,ceil_obj);
room_instance_add(argument0,400,288,ceil_obj);
room_instance_add(argument0,400,256,ceil_obj);
room_instance_add(argument0,400,224,ceil_obj);
room_instance_add(argument0,400,192,ceil_obj);
room_instance_add(argument0,400,160,ceil_obj);
room_instance_add(argument0,400,128,ceil_obj);
room_instance_add(argument0,400,96,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,112,wall_hor_obj);
room_instance_add(argument0,176,144,wall_hor_obj);
room_instance_add(argument0,208,112,wall_hor_obj);
room_instance_add(argument0,240,112,wall_hor_obj);
room_instance_add(argument0,272,112,wall_hor_obj);
room_instance_add(argument0,272,144,wall_hor_obj);
room_instance_add(argument0,240,144,wall_hor_obj);
room_instance_add(argument0,208,144,wall_hor_obj);
room_instance_add(argument0,304,80,wall_tt_hor_obj);
room_instance_add(argument0,336,80,wall_tt_hor_obj);
room_instance_add(argument0,368,80,wall_tt_hor_obj);
room_instance_add(argument0,400,80,wall_tt_hor_obj);
room_instance_add(argument0,400,304,wall_tt_hor_obj);
room_instance_add(argument0,368,304,wall_tt_hor_obj);
room_instance_add(argument0,336,304,wall_tt_hor_obj);
room_instance_add(argument0,304,304,wall_tt_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,128,wall_vert_obj);
room_instance_add(argument0,288,96,wall_tt_vert_obj);
room_instance_add(argument0,288,160,wall_tt_vert_obj);
room_instance_add(argument0,288,192,wall_tt_vert_obj);
room_instance_add(argument0,288,224,wall_tt_vert_obj);
room_instance_add(argument0,288,256,wall_tt_vert_obj);
room_instance_add(argument0,288,288,wall_tt_vert_obj);
room_instance_add(argument0,416,96,wall_tt_vert_obj);
room_instance_add(argument0,416,128,wall_tt_vert_obj);
room_instance_add(argument0,416,160,wall_tt_vert_obj);
room_instance_add(argument0,416,192,wall_tt_vert_obj);
room_instance_add(argument0,416,224,wall_tt_vert_obj);
room_instance_add(argument0,416,256,wall_tt_vert_obj);
room_instance_add(argument0,416,288,wall_tt_vert_obj);
// Jumpscare
room_instance_add(argument0,272,144,js_obj);