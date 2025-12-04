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
	global.rm_name_var = ini_read_string('ROOM','tt','ROOM_tt')+' 6';
	ini_close();
    global.spawn_len_var = 3;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 128;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 304;
    global.spawn_arr[1,1] = 352;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 0;
    global.spawn_arr[2,0] = 432;
    global.spawn_arr[2,1] = 352;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 243;
    global.mark_arr[0,1] = 127;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 299;
    global.mark_arr[1,1] = 131;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 352;
    global.mark_arr[2,1] = 250;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 372;
    global.mark_arr[3,1] = 296;
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
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,176,128,floor_obj);
room_instance_add(argument0,208,128,floor_obj);
room_instance_add(argument0,240,128,floor_obj);
room_instance_add(argument0,240,96,floor_obj);
room_instance_add(argument0,208,96,floor_obj);
room_instance_add(argument0,208,160,floor_obj);
room_instance_add(argument0,240,160,floor_obj);
room_instance_add(argument0,272,160,floor_obj);
room_instance_add(argument0,272,128,floor_obj);
room_instance_add(argument0,272,96,floor_obj);
room_instance_add(argument0,304,96,floor_obj);
room_instance_add(argument0,304,128,floor_obj);
room_instance_add(argument0,304,160,floor_obj);
room_instance_add(argument0,336,128,floor_obj);
room_instance_add(argument0,368,128,floor_obj);
room_instance_add(argument0,368,160,floor_obj);
room_instance_add(argument0,368,192,floor_obj);
room_instance_add(argument0,336,192,floor_obj);
room_instance_add(argument0,400,192,floor_obj);
room_instance_add(argument0,400,224,floor_obj);
room_instance_add(argument0,368,224,floor_obj);
room_instance_add(argument0,336,224,floor_obj);
room_instance_add(argument0,336,256,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,368,256,floor_obj);
room_instance_add(argument0,400,256,floor_obj);
room_instance_add(argument0,400,288,floor_obj);
room_instance_add(argument0,368,320,floor_obj);
room_instance_add(argument0,368,352,floor_obj);
room_instance_add(argument0,336,352,floor_obj);
room_instance_add(argument0,400,352,floor_obj);
room_instance_add(argument0,432,352,floor_obj);
room_instance_add(argument0,304,352,floor_obj);
// Ceilings
room_instance_add(argument0,176,128,ceil_obj);
room_instance_add(argument0,208,128,ceil_obj);
room_instance_add(argument0,240,128,ceil_obj);
room_instance_add(argument0,240,96,ceil_obj);
room_instance_add(argument0,208,96,ceil_obj);
room_instance_add(argument0,208,160,ceil_obj);
room_instance_add(argument0,240,160,ceil_obj);
room_instance_add(argument0,272,160,ceil_obj);
room_instance_add(argument0,272,128,ceil_obj);
room_instance_add(argument0,272,96,ceil_obj);
room_instance_add(argument0,304,96,ceil_obj);
room_instance_add(argument0,304,128,ceil_obj);
room_instance_add(argument0,304,160,ceil_obj);
room_instance_add(argument0,336,128,ceil_obj);
room_instance_add(argument0,368,128,ceil_obj);
room_instance_add(argument0,368,160,ceil_obj);
room_instance_add(argument0,368,192,ceil_obj);
room_instance_add(argument0,336,192,ceil_obj);
room_instance_add(argument0,400,192,ceil_obj);
room_instance_add(argument0,400,224,ceil_obj);
room_instance_add(argument0,368,224,ceil_obj);
room_instance_add(argument0,336,224,ceil_obj);
room_instance_add(argument0,336,256,ceil_obj);
room_instance_add(argument0,336,288,ceil_obj);
room_instance_add(argument0,368,288,ceil_obj);
room_instance_add(argument0,368,256,ceil_obj);
room_instance_add(argument0,400,256,ceil_obj);
room_instance_add(argument0,400,288,ceil_obj);
room_instance_add(argument0,368,320,ceil_obj);
room_instance_add(argument0,368,352,ceil_obj);
room_instance_add(argument0,336,352,ceil_obj);
room_instance_add(argument0,400,352,ceil_obj);
room_instance_add(argument0,432,352,ceil_obj);
room_instance_add(argument0,304,352,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,112,wall_hor_obj);
room_instance_add(argument0,176,144,wall_hor_obj);
room_instance_add(argument0,336,144,wall_hor_obj);
room_instance_add(argument0,336,112,wall_hor_obj);
room_instance_add(argument0,368,112,wall_hor_obj);
room_instance_add(argument0,400,336,wall_hor_obj);
room_instance_add(argument0,432,336,wall_hor_obj);
room_instance_add(argument0,432,368,wall_hor_obj);
room_instance_add(argument0,400,368,wall_hor_obj);
room_instance_add(argument0,368,368,wall_hor_obj);
room_instance_add(argument0,336,368,wall_hor_obj);
room_instance_add(argument0,304,368,wall_hor_obj);
room_instance_add(argument0,304,336,wall_hor_obj);
room_instance_add(argument0,336,336,wall_hor_obj);
room_instance_add(argument0,208,176,wall_tt_hor_obj);
room_instance_add(argument0,240,176,wall_tt_hor_obj);
room_instance_add(argument0,272,176,wall_tt_hor_obj);
room_instance_add(argument0,304,176,wall_tt_hor_obj);
room_instance_add(argument0,304,80,wall_tt_hor_obj);
room_instance_add(argument0,272,80,wall_tt_hor_obj);
room_instance_add(argument0,240,80,wall_tt_hor_obj);
room_instance_add(argument0,208,80,wall_tt_hor_obj);
room_instance_add(argument0,336,176,wall_tt_hor_obj);
room_instance_add(argument0,400,176,wall_tt_hor_obj);
room_instance_add(argument0,400,304,wall_tt_hor_obj);
room_instance_add(argument0,336,304,wall_tt_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,128,wall_vert_obj);
room_instance_add(argument0,352,160,wall_vert_obj);
room_instance_add(argument0,384,160,wall_vert_obj);
room_instance_add(argument0,384,128,wall_vert_obj);
room_instance_add(argument0,384,320,wall_vert_obj);
room_instance_add(argument0,352,320,wall_vert_obj);
room_instance_add(argument0,288,352,wall_vert_obj);
room_instance_add(argument0,448,352,wall_vert_obj);
room_instance_add(argument0,320,160,wall_tt_vert_obj);
room_instance_add(argument0,320,96,wall_tt_vert_obj);
room_instance_add(argument0,192,96,wall_tt_vert_obj);
room_instance_add(argument0,192,160,wall_tt_vert_obj);
room_instance_add(argument0,320,192,wall_tt_vert_obj);
room_instance_add(argument0,320,224,wall_tt_vert_obj);
room_instance_add(argument0,320,256,wall_tt_vert_obj);
room_instance_add(argument0,320,288,wall_tt_vert_obj);
room_instance_add(argument0,416,288,wall_tt_vert_obj);
room_instance_add(argument0,416,256,wall_tt_vert_obj);
room_instance_add(argument0,416,224,wall_tt_vert_obj);
room_instance_add(argument0,416,192,wall_tt_vert_obj);
// Torches
// Props