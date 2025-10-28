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
	global.rm_name_var = ini_read_string('ROOM','tt','ROOM_tt')+' 2';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 128;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 592;
    global.spawn_arr[1,1] = 128;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 291;
    global.mark_arr[0,1] = 128;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 397;
    global.mark_arr[1,1] = 114;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 459;
    global.mark_arr[2,1] = 127;
    global.mark_arr[2,2] = 0;
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
room_instance_add(argument0,400,96,floor_obj);
room_instance_add(argument0,400,128,floor_obj);
room_instance_add(argument0,400,160,floor_obj);
room_instance_add(argument0,432,160,floor_obj);
room_instance_add(argument0,432,128,floor_obj);
room_instance_add(argument0,432,96,floor_obj);
room_instance_add(argument0,464,160,floor_obj);
room_instance_add(argument0,464,128,floor_obj);
room_instance_add(argument0,464,96,floor_obj);
room_instance_add(argument0,496,128,floor_obj);
room_instance_add(argument0,528,128,floor_obj);
room_instance_add(argument0,560,128,floor_obj);
room_instance_add(argument0,592,128,floor_obj);
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
room_instance_add(argument0,400,96,ceil_obj);
room_instance_add(argument0,400,128,ceil_obj);
room_instance_add(argument0,400,160,ceil_obj);
room_instance_add(argument0,432,160,ceil_obj);
room_instance_add(argument0,432,128,ceil_obj);
room_instance_add(argument0,432,96,ceil_obj);
room_instance_add(argument0,464,160,ceil_obj);
room_instance_add(argument0,464,128,ceil_obj);
room_instance_add(argument0,464,96,ceil_obj);
room_instance_add(argument0,496,128,ceil_obj);
room_instance_add(argument0,528,128,ceil_obj);
room_instance_add(argument0,560,128,ceil_obj);
room_instance_add(argument0,592,128,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,272,112,wall_hor_obj);
room_instance_add(argument0,240,112,wall_hor_obj);
room_instance_add(argument0,208,112,wall_hor_obj);
room_instance_add(argument0,176,112,wall_hor_obj);
room_instance_add(argument0,176,144,wall_hor_obj);
room_instance_add(argument0,208,144,wall_hor_obj);
room_instance_add(argument0,240,144,wall_hor_obj);
room_instance_add(argument0,272,144,wall_hor_obj);
room_instance_add(argument0,496,144,wall_hor_obj);
room_instance_add(argument0,496,112,wall_hor_obj);
room_instance_add(argument0,528,112,wall_hor_obj);
room_instance_add(argument0,560,112,wall_hor_obj);
room_instance_add(argument0,592,112,wall_hor_obj);
room_instance_add(argument0,592,144,wall_hor_obj);
room_instance_add(argument0,560,144,wall_hor_obj);
room_instance_add(argument0,528,144,wall_hor_obj);
room_instance_add(argument0,304,80,wall_tt_hor_obj);
room_instance_add(argument0,304,176,wall_tt_hor_obj);
room_instance_add(argument0,336,80,wall_tt_hor_obj);
room_instance_add(argument0,368,80,wall_tt_hor_obj);
room_instance_add(argument0,400,80,wall_tt_hor_obj);
room_instance_add(argument0,432,80,wall_tt_hor_obj);
room_instance_add(argument0,464,80,wall_tt_hor_obj);
room_instance_add(argument0,464,176,wall_tt_hor_obj);
room_instance_add(argument0,432,176,wall_tt_hor_obj);
room_instance_add(argument0,400,176,wall_tt_hor_obj);
room_instance_add(argument0,368,176,wall_tt_hor_obj);
room_instance_add(argument0,336,176,wall_tt_hor_obj);

// Walls (Vertical)
room_instance_add(argument0,160,128,wall_vert_obj);
room_instance_add(argument0,608,128,wall_vert_obj);
room_instance_add(argument0,288,96,wall_tt_vert_obj);
room_instance_add(argument0,288,160,wall_tt_vert_obj);
room_instance_add(argument0,480,160,wall_tt_vert_obj);
room_instance_add(argument0,480,96,wall_tt_vert_obj);
// Torches
room_instance_add(argument0,336,80,torch_north_obj);
room_instance_add(argument0,432,80,torch_north_obj);
room_instance_add(argument0,336,176,torch_south_obj);
room_instance_add(argument0,432,176,torch_south_obj);
// Jumpscare
room_instance_add(argument0,512,144,js_obj);