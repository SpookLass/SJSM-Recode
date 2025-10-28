/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','stor','ROOM_stor')+' 4';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 208;
    global.spawn_arr[0,1] = 320;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 208;
    global.spawn_arr[1,1] = 576;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 0;
    // Mark
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,208,320,floor_obj);
room_instance_add(argument0,240,320,floor_obj);
room_instance_add(argument0,272,320,floor_obj);
room_instance_add(argument0,304,320,floor_obj);
room_instance_add(argument0,336,320,floor_obj);
room_instance_add(argument0,368,320,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,304,352,floor_obj);
room_instance_add(argument0,336,352,floor_obj);
room_instance_add(argument0,368,352,floor_obj);
room_instance_add(argument0,336,384,floor_obj);
room_instance_add(argument0,336,416,floor_obj);
room_instance_add(argument0,368,448,floor_obj);
room_instance_add(argument0,336,448,floor_obj);
room_instance_add(argument0,304,448,floor_obj);
room_instance_add(argument0,304,480,floor_obj);
room_instance_add(argument0,336,480,floor_obj);
room_instance_add(argument0,368,480,floor_obj);
room_instance_add(argument0,336,512,floor_obj);
room_instance_add(argument0,304,544,floor_obj);
room_instance_add(argument0,336,544,floor_obj);
room_instance_add(argument0,368,544,floor_obj);
room_instance_add(argument0,208,576,floor_obj);
room_instance_add(argument0,240,576,floor_obj);
room_instance_add(argument0,272,576,floor_obj);
room_instance_add(argument0,368,576,floor_obj);
room_instance_add(argument0,336,576,floor_obj);
room_instance_add(argument0,304,576,floor_obj);
room_instance_add(argument0,304,608,floor_obj);
room_instance_add(argument0,336,608,floor_obj);
room_instance_add(argument0,368,608,floor_obj);
room_instance_add(argument0,368,416,floor_obj);
room_instance_add(argument0,304,416,floor_obj);
// Ceilings
room_instance_add(argument0,208,320,ceil_obj);
room_instance_add(argument0,240,320,ceil_obj);
room_instance_add(argument0,272,320,ceil_obj);
room_instance_add(argument0,208,576,ceil_obj);
room_instance_add(argument0,240,576,ceil_obj);
room_instance_add(argument0,272,576,ceil_obj);
room_instance_add(argument0,304,288,ceil_2high_obj);
room_instance_add(argument0,336,288,ceil_2high_obj);
room_instance_add(argument0,304,320,ceil_2high_obj);
room_instance_add(argument0,336,320,ceil_2high_obj);
room_instance_add(argument0,368,320,ceil_2high_obj);
room_instance_add(argument0,368,288,ceil_2high_obj);
room_instance_add(argument0,304,352,ceil_2high_obj);
room_instance_add(argument0,336,352,ceil_2high_obj);
room_instance_add(argument0,368,352,ceil_2high_obj);
room_instance_add(argument0,336,384,ceil_2high_obj);
room_instance_add(argument0,336,416,ceil_2high_obj);
room_instance_add(argument0,368,448,ceil_2high_obj);
room_instance_add(argument0,336,448,ceil_2high_obj);
room_instance_add(argument0,304,448,ceil_2high_obj);
room_instance_add(argument0,304,480,ceil_2high_obj);
room_instance_add(argument0,336,480,ceil_2high_obj);
room_instance_add(argument0,368,480,ceil_2high_obj);
room_instance_add(argument0,336,512,ceil_2high_obj);
room_instance_add(argument0,304,544,ceil_2high_obj);
room_instance_add(argument0,336,544,ceil_2high_obj);
room_instance_add(argument0,368,544,ceil_2high_obj);
room_instance_add(argument0,368,576,ceil_2high_obj);
room_instance_add(argument0,336,576,ceil_2high_obj);
room_instance_add(argument0,304,576,ceil_2high_obj);
room_instance_add(argument0,304,608,ceil_2high_obj);
room_instance_add(argument0,336,608,ceil_2high_obj);
room_instance_add(argument0,368,608,ceil_2high_obj);
room_instance_add(argument0,368,416,ceil_2high_obj);
room_instance_add(argument0,304,416,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,208,304,wall_hor_obj);
room_instance_add(argument0,240,304,wall_hor_obj);
room_instance_add(argument0,272,304,wall_hor_obj);
room_instance_add(argument0,208,336,wall_hor_obj);
room_instance_add(argument0,240,336,wall_hor_obj);
room_instance_add(argument0,272,336,wall_hor_obj);
room_instance_add(argument0,208,560,wall_hor_obj);
room_instance_add(argument0,240,560,wall_hor_obj);
room_instance_add(argument0,272,560,wall_hor_obj);
room_instance_add(argument0,208,592,wall_hor_obj);
room_instance_add(argument0,240,592,wall_hor_obj);
room_instance_add(argument0,272,592,wall_hor_obj);
room_instance_add(argument0,368,368,wall_2high_hor_obj);
room_instance_add(argument0,304,368,wall_2high_hor_obj);
room_instance_add(argument0,304,272,wall_2high_hor_obj);
room_instance_add(argument0,336,272,wall_2high_hor_obj);
room_instance_add(argument0,368,272,wall_2high_hor_obj);
room_instance_add(argument0,304,496,wall_2high_hor_obj);
room_instance_add(argument0,304,528,wall_2high_hor_obj);
room_instance_add(argument0,368,528,wall_2high_hor_obj);
room_instance_add(argument0,368,496,wall_2high_hor_obj);
room_instance_add(argument0,368,400,wall_2high_hor_obj);
room_instance_add(argument0,304,400,wall_2high_hor_obj);
room_instance_add(argument0,304,624,wall_2high_hor_obj);
room_instance_add(argument0,336,624,wall_2high_hor_obj);
room_instance_add(argument0,368,624,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,192,320,wall_vert_obj);
room_instance_add(argument0,192,576,wall_vert_obj);
room_instance_add(argument0,288,320,wall_doorway_vert_obj);
room_instance_add(argument0,288,576,wall_doorway_vert_obj);
room_instance_add(argument0,288,288,wall_2high_vert_obj);
room_instance_add(argument0,288,352,wall_2high_vert_obj);
room_instance_add(argument0,384,288,wall_2high_vert_obj);
room_instance_add(argument0,384,320,wall_2high_vert_obj);
room_instance_add(argument0,384,352,wall_2high_vert_obj);
room_instance_add(argument0,352,384,wall_2high_vert_obj);
room_instance_add(argument0,320,384,wall_2high_vert_obj);
room_instance_add(argument0,320,512,wall_2high_vert_obj);
room_instance_add(argument0,352,512,wall_2high_vert_obj);
room_instance_add(argument0,384,480,wall_2high_vert_obj);
room_instance_add(argument0,384,448,wall_2high_vert_obj);
room_instance_add(argument0,384,416,wall_2high_vert_obj);
room_instance_add(argument0,288,416,wall_2high_vert_obj);
room_instance_add(argument0,288,448,wall_2high_vert_obj);
room_instance_add(argument0,288,480,wall_2high_vert_obj);
room_instance_add(argument0,288,544,wall_2high_vert_obj);
room_instance_add(argument0,288,608,wall_2high_vert_obj);
room_instance_add(argument0,384,544,wall_2high_vert_obj);
room_instance_add(argument0,384,576,wall_2high_vert_obj);
room_instance_add(argument0,384,608,wall_2high_vert_obj);
// Torches
room_instance_add(argument0,240,560,torch_north_obj);
room_instance_add(argument0,240,304,torch_north_obj);
room_instance_add(argument0,240,592,torch_south_obj);
room_instance_add(argument0,240,336,torch_south_obj);
// Props
room_instance_add(argument0,304,288,crate_rand_obj);
room_instance_add(argument0,368,480,crate_rand_obj);
room_instance_add(argument0,304,480,crate_rand_obj);
room_instance_add(argument0,304,448,crate_rand_obj);
room_instance_add(argument0,368,544,crate_rand_obj);
room_instance_add(argument0,336,608,crate_rand_obj);
room_instance_add(argument0,368,608,crate_rand_obj);
room_instance_add(argument0,336,288,crate_rand_obj);
room_instance_add(argument0,336,448,pole_wood_obj);