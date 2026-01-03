/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string("ROOM","thin","ROOM_thin")+" 14";
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 400;
    global.spawn_arr[1,1] = 320;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 241;
    global.mark_arr[0,1] = 171;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 404;
    global.mark_arr[1,1] = 176;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 431;
    global.mark_arr[2,1] = 248;
    global.mark_arr[2,2] = 0;
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
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,336,176,floor_obj);
room_instance_add(argument0,368,176,floor_obj);
room_instance_add(argument0,400,176,floor_obj);
room_instance_add(argument0,400,144,floor_obj);
room_instance_add(argument0,432,144,floor_obj);
room_instance_add(argument0,432,176,floor_obj);
room_instance_add(argument0,400,208,floor_obj);
room_instance_add(argument0,400,240,floor_obj);
room_instance_add(argument0,400,272,floor_obj);
room_instance_add(argument0,400,304,floor_obj);
room_instance_add(argument0,400,336,floor_obj);
room_instance_add(argument0,432,304,floor_obj);
room_instance_add(argument0,432,272,floor_obj);
room_instance_add(argument0,432,240,floor_obj);
room_instance_add(argument0,432,208,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,240,144,ceil_low_obj);
room_instance_add(argument0,240,176,ceil_low_obj);
room_instance_add(argument0,272,176,ceil_low_obj);
room_instance_add(argument0,304,176,ceil_low_obj);
room_instance_add(argument0,336,176,ceil_low_obj);
room_instance_add(argument0,368,176,ceil_low_obj);
room_instance_add(argument0,400,176,ceil_low_obj);
room_instance_add(argument0,400,144,ceil_low_obj);
room_instance_add(argument0,432,144,ceil_low_obj);
room_instance_add(argument0,432,176,ceil_low_obj);
room_instance_add(argument0,400,208,ceil_low_obj);
room_instance_add(argument0,400,240,ceil_low_obj);
room_instance_add(argument0,400,272,ceil_low_obj);
room_instance_add(argument0,400,304,ceil_low_obj);
room_instance_add(argument0,400,336,ceil_low_obj);
room_instance_add(argument0,432,304,ceil_low_obj);
room_instance_add(argument0,432,272,ceil_low_obj);
room_instance_add(argument0,432,240,ceil_low_obj);
room_instance_add(argument0,432,208,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,132,wall_hor_obj); // Higher
room_instance_add(argument0,208,132,wall_hor_obj);
room_instance_add(argument0,240,132,wall_hor_obj);
room_instance_add(argument0,272,164,wall_hor_obj);
room_instance_add(argument0,176,156,wall_hor_obj); // Lower
room_instance_add(argument0,208,156,wall_hor_obj);
room_instance_add(argument0,240,188,wall_hor_obj);
room_instance_add(argument0,272,188,wall_hor_obj);
room_instance_add(argument0,304,188,wall_hor_obj);
room_instance_add(argument0,336,184,wall_hor_obj); // Lowerer
room_instance_add(argument0,368,184,wall_hor_obj);
room_instance_add(argument0,304,160,wall_hor_obj); // Same
room_instance_add(argument0,336,160,wall_hor_obj);
room_instance_add(argument0,368,160,wall_hor_obj);
room_instance_add(argument0,400,128,wall_hor_obj);
room_instance_add(argument0,432,128,wall_hor_obj);
room_instance_add(argument0,432,320,wall_hor_obj);
room_instance_add(argument0,400,336,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,256,148,wall_vert_obj); // Higher
room_instance_add(argument0,288,148,wall_vert_obj);
room_instance_add(argument0,224,172,wall_vert_obj); // Lower
room_instance_add(argument0,320,200,wall_vert_obj); // Lowerer
room_instance_add(argument0,384,200,wall_vert_obj);
room_instance_add(argument0,384,232,wall_vert_obj);
room_instance_add(argument0,384,264,wall_vert_obj);
room_instance_add(argument0,384,296,wall_vert_obj);
room_instance_add(argument0,384,328,wall_vert_obj);
room_instance_add(argument0,160,144,wall_vert_obj); // Same
room_instance_add(argument0,384,144,wall_vert_obj);
room_instance_add(argument0,448,144,wall_vert_obj);
room_instance_add(argument0,448,176,wall_vert_obj);
room_instance_add(argument0,448,208,wall_vert_obj);
room_instance_add(argument0,448,240,wall_vert_obj);
room_instance_add(argument0,448,272,wall_vert_obj);
room_instance_add(argument0,448,304,wall_vert_obj);
room_instance_add(argument0,416,336,wall_vert_obj);
// Props
room_instance_add(argument0,400,144,chair_rand_obj);