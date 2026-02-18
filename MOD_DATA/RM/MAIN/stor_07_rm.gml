/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','stor','ROOM_stor')+' 7';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 272;
    global.spawn_arr[0,1] = 272;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 496;
    global.spawn_arr[1,1] = 272;
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
room_instance_add(argument0,272,272,floor_obj);
room_instance_add(argument0,304,272,floor_obj);
room_instance_add(argument0,336,272,floor_obj);
room_instance_add(argument0,368,272,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,272,240,floor_obj);
room_instance_add(argument0,272,304,floor_obj);
room_instance_add(argument0,304,304,floor_obj);
room_instance_add(argument0,336,304,floor_obj);
room_instance_add(argument0,368,304,floor_obj);
room_instance_add(argument0,368,240,floor_obj);
room_instance_add(argument0,400,240,floor_obj);
room_instance_add(argument0,400,272,floor_obj);
room_instance_add(argument0,400,304,floor_obj);
room_instance_add(argument0,432,304,floor_obj);
room_instance_add(argument0,432,272,floor_obj);
room_instance_add(argument0,432,240,floor_obj);
room_instance_add(argument0,464,240,floor_obj);
room_instance_add(argument0,464,272,floor_obj);
room_instance_add(argument0,464,304,floor_obj);
room_instance_add(argument0,496,304,floor_obj);
room_instance_add(argument0,496,272,floor_obj);
room_instance_add(argument0,496,240,floor_obj);
// Ceilings
room_instance_add(argument0,272,272,ceil_obj);
room_instance_add(argument0,304,272,ceil_obj);
room_instance_add(argument0,336,272,ceil_obj);
room_instance_add(argument0,368,272,ceil_obj);
room_instance_add(argument0,336,240,ceil_obj);
room_instance_add(argument0,304,240,ceil_obj);
room_instance_add(argument0,272,240,ceil_obj);
room_instance_add(argument0,272,304,ceil_obj);
room_instance_add(argument0,304,304,ceil_obj);
room_instance_add(argument0,336,304,ceil_obj);
room_instance_add(argument0,368,304,ceil_obj);
room_instance_add(argument0,368,240,ceil_obj);
room_instance_add(argument0,400,240,ceil_obj);
room_instance_add(argument0,400,272,ceil_obj);
room_instance_add(argument0,400,304,ceil_obj);
room_instance_add(argument0,432,304,ceil_obj);
room_instance_add(argument0,432,272,ceil_obj);
room_instance_add(argument0,432,240,ceil_obj);
room_instance_add(argument0,464,240,ceil_obj);
room_instance_add(argument0,464,272,ceil_obj);
room_instance_add(argument0,464,304,ceil_obj);
room_instance_add(argument0,496,304,ceil_obj);
room_instance_add(argument0,496,272,ceil_obj);
room_instance_add(argument0,496,240,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,272,224,wall_hor_obj);
room_instance_add(argument0,272,320,wall_hor_obj);
room_instance_add(argument0,304,320,wall_hor_obj);
room_instance_add(argument0,336,320,wall_hor_obj);
room_instance_add(argument0,368,320,wall_hor_obj);
room_instance_add(argument0,368,224,wall_hor_obj);
room_instance_add(argument0,336,224,wall_hor_obj);
room_instance_add(argument0,304,224,wall_hor_obj);
room_instance_add(argument0,400,224,wall_hor_obj);
room_instance_add(argument0,400,320,wall_hor_obj);
room_instance_add(argument0,432,320,wall_hor_obj);
room_instance_add(argument0,464,320,wall_hor_obj);
room_instance_add(argument0,496,320,wall_hor_obj);
room_instance_add(argument0,496,224,wall_hor_obj);
room_instance_add(argument0,464,224,wall_hor_obj);
room_instance_add(argument0,432,224,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,256,240,wall_vert_obj);
room_instance_add(argument0,256,272,wall_vert_obj);
room_instance_add(argument0,256,304,wall_vert_obj);
room_instance_add(argument0,512,240,wall_vert_obj);
room_instance_add(argument0,512,272,wall_vert_obj);
room_instance_add(argument0,512,304,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,272,240,crate_rand_obj);
room_instance_add(argument0,272,304,crate_rand_obj);
room_instance_add(argument0,304,304,crate_rand_obj);
room_instance_add(argument0,368,240,crate_rand_obj);
room_instance_add(argument0,496,240,crate_rand_obj);
room_instance_add(argument0,496,304,crate_rand_obj);
room_instance_add(argument0,464,304,crate_rand_obj);
room_instance_add(argument0,432,304,crate_rand_obj);