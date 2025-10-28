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
	global.rm_name_var = ini_read_string('ROOM','thin','ROOM_thin')+' 15';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 528;
    global.spawn_arr[1,1] = 208;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 246;
    global.mark_arr[0,1] = 151;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 462;
    global.mark_arr[1,1] = 185;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 211;
    global.mark_arr[2,1] = 117;
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
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,176,112,floor_obj);
room_instance_add(argument0,208,112,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,176,176,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,368,144,floor_obj);
room_instance_add(argument0,400,144,floor_obj);
room_instance_add(argument0,432,144,floor_obj);
room_instance_add(argument0,464,144,floor_obj);
room_instance_add(argument0,464,176,floor_obj);
room_instance_add(argument0,464,208,floor_obj);
room_instance_add(argument0,496,208,floor_obj);
room_instance_add(argument0,528,208,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,240,144,ceil_low_obj);
room_instance_add(argument0,176,112,ceil_low_obj);
room_instance_add(argument0,208,112,ceil_low_obj);
room_instance_add(argument0,240,112,ceil_low_obj);
room_instance_add(argument0,240,176,ceil_low_obj);
room_instance_add(argument0,208,176,ceil_low_obj);
room_instance_add(argument0,176,176,ceil_low_obj);
room_instance_add(argument0,272,176,ceil_low_obj);
room_instance_add(argument0,272,144,ceil_low_obj);
room_instance_add(argument0,304,144,ceil_low_obj);
room_instance_add(argument0,336,144,ceil_low_obj);
room_instance_add(argument0,368,144,ceil_low_obj);
room_instance_add(argument0,400,144,ceil_low_obj);
room_instance_add(argument0,432,144,ceil_low_obj);
room_instance_add(argument0,464,144,ceil_low_obj);
room_instance_add(argument0,464,176,ceil_low_obj);
room_instance_add(argument0,464,208,ceil_low_obj);
room_instance_add(argument0,496,208,ceil_low_obj);
room_instance_add(argument0,528,208,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,96,wall_hor_obj);
room_instance_add(argument0,208,96,wall_hor_obj);
room_instance_add(argument0,240,96,wall_hor_obj);
room_instance_add(argument0,176,192,wall_hor_obj);
room_instance_add(argument0,208,192,wall_hor_obj);
room_instance_add(argument0,240,192,wall_hor_obj);
room_instance_add(argument0,272,192,wall_hor_obj);
room_instance_add(argument0,304,152,wall_hor_obj);
room_instance_add(argument0,304,136,wall_hor_obj);
room_instance_add(argument0,336,136,wall_hor_obj);
room_instance_add(argument0,336,152,wall_hor_obj);
room_instance_add(argument0,368,136,wall_hor_obj);
room_instance_add(argument0,368,152,wall_hor_obj);
room_instance_add(argument0,400,152,wall_hor_obj);
room_instance_add(argument0,400,136,wall_hor_obj);
room_instance_add(argument0,432,136,wall_hor_obj);
room_instance_add(argument0,432,152,wall_hor_obj);
room_instance_add(argument0,464,136,wall_hor_obj);
room_instance_add(argument0,464,216,wall_hor_obj);
room_instance_add(argument0,496,216,wall_hor_obj);
room_instance_add(argument0,496,200,wall_hor_obj);
room_instance_add(argument0,528,200,wall_hor_obj);
room_instance_add(argument0,528,216,wall_hor_obj);
room_instance_add(argument0,272,128,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,288,168,wall_vert_obj);
room_instance_add(argument0,288,200,wall_vert_obj);
room_instance_add(argument0,256,112,wall_vert_obj);
room_instance_add(argument0,288,120,wall_vert_obj);
room_instance_add(argument0,160,112,wall_vert_obj);
room_instance_add(argument0,160,176,wall_vert_obj);
room_instance_add(argument0,448,168,wall_vert_obj);
room_instance_add(argument0,448,200,wall_vert_obj);
room_instance_add(argument0,480,152,wall_vert_obj);
room_instance_add(argument0,480,184,wall_vert_obj);
room_instance_add(argument0,544,208,wall_vert_obj);
// Torches
// Props