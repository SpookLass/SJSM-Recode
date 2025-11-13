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
	global.rm_name_var = ini_read_string('ROOM','thin','ROOM_thin')+' 2';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 464;
    global.spawn_arr[1,1] = 272;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
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
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,304,208,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,336,208,floor_obj);
room_instance_add(argument0,336,176,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,368,144,floor_obj);
room_instance_add(argument0,368,176,floor_obj);
room_instance_add(argument0,400,176,floor_obj);
room_instance_add(argument0,432,176,floor_obj);
room_instance_add(argument0,432,208,floor_obj);
room_instance_add(argument0,432,240,floor_obj);
room_instance_add(argument0,432,272,floor_obj);
room_instance_add(argument0,464,272,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,240,144,ceil_low_obj);
room_instance_add(argument0,272,144,ceil_low_obj);
room_instance_add(argument0,304,144,ceil_low_obj);
room_instance_add(argument0,304,176,ceil_low_obj);
room_instance_add(argument0,304,208,ceil_low_obj);
room_instance_add(argument0,304,240,ceil_low_obj);
room_instance_add(argument0,336,240,ceil_low_obj);
room_instance_add(argument0,336,208,ceil_low_obj);
room_instance_add(argument0,336,176,ceil_low_obj);
room_instance_add(argument0,336,144,ceil_low_obj);
room_instance_add(argument0,368,144,ceil_low_obj);
room_instance_add(argument0,368,176,ceil_low_obj);
room_instance_add(argument0,400,176,ceil_low_obj);
room_instance_add(argument0,432,176,ceil_low_obj);
room_instance_add(argument0,432,208,ceil_low_obj);
room_instance_add(argument0,432,240,ceil_low_obj);
room_instance_add(argument0,432,272,ceil_low_obj);
room_instance_add(argument0,464,272,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,136,wall_hor_obj);
room_instance_add(argument0,176,152,wall_hor_obj);
room_instance_add(argument0,208,136,wall_hor_obj);
room_instance_add(argument0,240,136,wall_hor_obj);
room_instance_add(argument0,240,152,wall_hor_obj);
room_instance_add(argument0,208,152,wall_hor_obj);
room_instance_add(argument0,272,152,wall_hor_obj);
room_instance_add(argument0,272,136,wall_hor_obj);
room_instance_add(argument0,304,136,wall_hor_obj);
room_instance_add(argument0,304,248,wall_hor_obj);
room_instance_add(argument0,336,248,wall_hor_obj);
room_instance_add(argument0,336,136,wall_hor_obj);
room_instance_add(argument0,368,136,wall_hor_obj);
room_instance_add(argument0,352,152,wall_hor_obj);
room_instance_add(argument0,384,184,wall_hor_obj);
room_instance_add(argument0,416,184,wall_hor_obj);
room_instance_add(argument0,400,168,wall_hor_obj);
room_instance_add(argument0,432,168,wall_hor_obj);
room_instance_add(argument0,448,280,wall_hor_obj);
room_instance_add(argument0,464,264,wall_hor_obj);
room_instance_add(argument0,480,280,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,288,168,wall_vert_obj);
room_instance_add(argument0,288,200,wall_vert_obj);
room_instance_add(argument0,288,232,wall_vert_obj);
room_instance_add(argument0,312,200,wall_vert_obj);
room_instance_add(argument0,312,168,wall_vert_obj);
room_instance_add(argument0,312,136,wall_vert_obj);
room_instance_add(argument0,336,232,wall_vert_obj);
room_instance_add(argument0,336,200,wall_vert_obj);
room_instance_add(argument0,336,168,wall_vert_obj);
room_instance_add(argument0,384,152,wall_vert_obj);
room_instance_add(argument0,368,168,wall_vert_obj);
room_instance_add(argument0,448,184,wall_vert_obj);
room_instance_add(argument0,448,216,wall_vert_obj);
room_instance_add(argument0,448,248,wall_vert_obj);
room_instance_add(argument0,432,200,wall_vert_obj);
room_instance_add(argument0,432,232,wall_vert_obj);
room_instance_add(argument0,432,264,wall_vert_obj);
room_instance_add(argument0,480,280,wall_vert_obj);