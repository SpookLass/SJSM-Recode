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
	global.rm_name_var = ini_read_string('ROOM','thin','ROOM_thin')+' 1';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 148;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 560;
    global.spawn_arr[1,1] = 280;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 343;
    global.mark_arr[0,1] = 141;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 484;
    global.mark_arr[1,1] = 155;
    global.mark_arr[1,2] = 0;
    mark_create_scr();
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
room_instance_add(argument0,0,0,amb_control_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,136,wall_hor_obj);
room_instance_add(argument0,176,160,wall_hor_obj);
room_instance_add(argument0,208,136,wall_hor_obj);
room_instance_add(argument0,208,160,wall_hor_obj);
room_instance_add(argument0,240,136,wall_hor_obj);
room_instance_add(argument0,272,144,wall_hor_obj);
room_instance_add(argument0,304,136,wall_hor_obj);
room_instance_add(argument0,336,128,wall_hor_obj);
room_instance_add(argument0,368,120,wall_hor_obj);
room_instance_add(argument0,400,128,wall_hor_obj);
room_instance_add(argument0,432,136,wall_hor_obj);
room_instance_add(argument0,464,136,wall_hor_obj);
room_instance_add(argument0,496,136,wall_hor_obj);
room_instance_add(argument0,240,160,wall_hor_obj);
room_instance_add(argument0,272,168,wall_hor_obj);
room_instance_add(argument0,304,160,wall_hor_obj);
room_instance_add(argument0,336,152,wall_hor_obj);
room_instance_add(argument0,368,144,wall_hor_obj);
room_instance_add(argument0,400,152,wall_hor_obj);
room_instance_add(argument0,432,160,wall_hor_obj);
room_instance_add(argument0,464,160,wall_hor_obj);
room_instance_add(argument0,512,232,wall_hor_obj);
room_instance_add(argument0,512,264,wall_hor_obj);
room_instance_add(argument0,544,264,wall_hor_obj);
room_instance_add(argument0,576,264,wall_hor_obj);
room_instance_add(argument0,496,288,wall_hor_obj);
room_instance_add(argument0,528,288,wall_hor_obj);
room_instance_add(argument0,560,288,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,256,176,wall_vert_obj);
room_instance_add(argument0,288,176,wall_vert_obj);
room_instance_add(argument0,320,168,wall_vert_obj);
room_instance_add(argument0,352,160,wall_vert_obj);
room_instance_add(argument0,384,160,wall_vert_obj);
room_instance_add(argument0,416,168,wall_vert_obj);
room_instance_add(argument0,480,176,wall_vert_obj);
room_instance_add(argument0,504,152,wall_vert_obj);
room_instance_add(argument0,504,184,wall_vert_obj);
room_instance_add(argument0,504,216,wall_vert_obj);
room_instance_add(argument0,480,208,wall_vert_obj);
room_instance_add(argument0,480,240,wall_vert_obj);
room_instance_add(argument0,496,248,wall_vert_obj);
room_instance_add(argument0,480,272,wall_vert_obj);
room_instance_add(argument0,256,128,wall_vert_obj);
room_instance_add(argument0,288,128,wall_vert_obj);
room_instance_add(argument0,320,120,wall_vert_obj);
room_instance_add(argument0,352,112,wall_vert_obj);
room_instance_add(argument0,384,112,wall_vert_obj);
room_instance_add(argument0,416,120,wall_vert_obj);
room_instance_add(argument0,576,280,wall_vert_obj);
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,152,floor_obj);
room_instance_add(argument0,272,160,floor_obj);
room_instance_add(argument0,304,152,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,368,136,floor_obj);
room_instance_add(argument0,400,144,floor_obj);
room_instance_add(argument0,432,152,floor_obj);
room_instance_add(argument0,464,152,floor_obj);
room_instance_add(argument0,496,152,floor_obj);
room_instance_add(argument0,496,184,floor_obj);
room_instance_add(argument0,496,216,floor_obj);
room_instance_add(argument0,488,248,floor_obj);
room_instance_add(argument0,496,280,floor_obj);
room_instance_add(argument0,528,272,floor_obj);
room_instance_add(argument0,560,280,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,240,152,ceil_low_obj);
room_instance_add(argument0,272,160,ceil_low_obj);
room_instance_add(argument0,304,152,ceil_low_obj);
room_instance_add(argument0,336,144,ceil_low_obj);
room_instance_add(argument0,368,136,ceil_low_obj);
room_instance_add(argument0,400,144,ceil_low_obj);
room_instance_add(argument0,432,152,ceil_low_obj);
room_instance_add(argument0,464,152,ceil_low_obj);
room_instance_add(argument0,496,152,ceil_low_obj);
room_instance_add(argument0,496,184,ceil_low_obj);
room_instance_add(argument0,496,216,ceil_low_obj);
room_instance_add(argument0,488,248,ceil_low_obj);
room_instance_add(argument0,496,280,ceil_low_obj);
room_instance_add(argument0,528,272,ceil_low_obj);
room_instance_add(argument0,560,280,ceil_low_obj);
// Torches