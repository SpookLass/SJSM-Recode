/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string("ROOM","thin","ROOM_thin")+" 10";
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 464;
    global.spawn_arr[1,1] = 160;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
');
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
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,272,208,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,304,208,floor_obj);
room_instance_add(argument0,336,208,floor_obj);
room_instance_add(argument0,368,208,floor_obj);
room_instance_add(argument0,400,176,floor_obj);
room_instance_add(argument0,400,208,floor_obj);
room_instance_add(argument0,400,240,floor_obj);
room_instance_add(argument0,432,240,floor_obj);
room_instance_add(argument0,432,208,floor_obj);
room_instance_add(argument0,432,176,floor_obj);
room_instance_add(argument0,464,176,floor_obj);
room_instance_add(argument0,464,208,floor_obj);
room_instance_add(argument0,464,240,floor_obj);
room_instance_add(argument0,464,144,floor_obj);
room_instance_add(argument0,432,144,floor_obj);
room_instance_add(argument0,400,144,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,240,144,ceil_low_obj);
room_instance_add(argument0,272,176,ceil_low_obj);
room_instance_add(argument0,272,208,ceil_low_obj);
room_instance_add(argument0,272,144,ceil_low_obj);
room_instance_add(argument0,304,208,ceil_low_obj);
room_instance_add(argument0,336,208,ceil_low_obj);
room_instance_add(argument0,368,208,ceil_low_obj);
room_instance_add(argument0,400,176,ceil_low_obj);
room_instance_add(argument0,400,208,ceil_low_obj);
room_instance_add(argument0,400,240,ceil_low_obj);
room_instance_add(argument0,432,240,ceil_low_obj);
room_instance_add(argument0,432,208,ceil_low_obj);
room_instance_add(argument0,432,176,ceil_low_obj);
room_instance_add(argument0,464,176,ceil_low_obj);
room_instance_add(argument0,464,208,ceil_low_obj);
room_instance_add(argument0,464,240,ceil_low_obj);
room_instance_add(argument0,464,144,ceil_low_obj);
room_instance_add(argument0,432,144,ceil_low_obj);
room_instance_add(argument0,400,144,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,128,wall_hor_obj);
room_instance_add(argument0,176,160,wall_hor_obj);
room_instance_add(argument0,208,128,wall_hor_obj);
room_instance_add(argument0,208,160,wall_hor_obj);
room_instance_add(argument0,240,136,wall_hor_obj);
room_instance_add(argument0,272,136,wall_hor_obj);
room_instance_add(argument0,240,160,wall_hor_obj);
room_instance_add(argument0,272,224,wall_hor_obj);
room_instance_add(argument0,296,192,wall_hor_obj);
room_instance_add(argument0,296,160,wall_hor_obj);
room_instance_add(argument0,304,220,wall_hor_obj); //Lower
room_instance_add(argument0,336,220,wall_hor_obj);
room_instance_add(argument0,368,220,wall_hor_obj);
room_instance_add(argument0,400,252,wall_hor_obj);
room_instance_add(argument0,432,252,wall_hor_obj);
room_instance_add(argument0,464,252,wall_hor_obj);
room_instance_add(argument0,320,196,wall_hor_obj); // Higher
room_instance_add(argument0,352,196,wall_hor_obj);
room_instance_add(argument0,384,196,wall_hor_obj);
room_instance_add(argument0,416,132,wall_hor_obj);
room_instance_add(argument0,448,132,wall_hor_obj);
room_instance_add(argument0,480,132,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,224,120,wall_vert_obj);
room_instance_add(argument0,288,152,wall_vert_obj);
room_instance_add(argument0,256,176,wall_vert_obj);
room_instance_add(argument0,280,176,wall_vert_obj);
room_instance_add(argument0,256,208,wall_vert_obj);
room_instance_add(argument0,480,144,wall_vert_obj);
room_instance_add(argument0,480,176,wall_vert_obj);
room_instance_add(argument0,480,208,wall_vert_obj);
room_instance_add(argument0,480,240,wall_vert_obj);
room_instance_add(argument0,288,236,wall_vert_obj); // Lower
room_instance_add(argument0,384,236,wall_vert_obj);
room_instance_add(argument0,304,180,wall_vert_obj); // Higher
room_instance_add(argument0,400,180,wall_vert_obj);
room_instance_add(argument0,400,148,wall_vert_obj);
// Props
room_instance_add(argument0,400,232,table_rand_obj);