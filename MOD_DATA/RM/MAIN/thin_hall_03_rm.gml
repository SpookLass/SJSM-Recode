
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','thin','ROOM_thin')+' 3';
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 48;
    global.spawn_arr[0,1] = 80;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 352;
    global.spawn_arr[1,1] = 80;
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
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,48,80,floor_obj);
room_instance_add(argument0,80,80,floor_obj);
room_instance_add(argument0,112,80,floor_obj);
room_instance_add(argument0,144,80,floor_obj);
room_instance_add(argument0,144,112,floor_obj);
room_instance_add(argument0,144,144,floor_obj);
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,208,112,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
room_instance_add(argument0,240,80,floor_obj);
room_instance_add(argument0,208,80,floor_obj);
room_instance_add(argument0,208,48,floor_obj);
room_instance_add(argument0,240,48,floor_obj);
room_instance_add(argument0,272,48,floor_obj);
room_instance_add(argument0,304,48,floor_obj);
room_instance_add(argument0,336,48,floor_obj);
room_instance_add(argument0,304,80,floor_obj);
room_instance_add(argument0,336,80,floor_obj);
room_instance_add(argument0,368,80,floor_obj);
// Ceilings
room_instance_add(argument0,48,80,ceil_low_obj);
room_instance_add(argument0,80,80,ceil_low_obj);
room_instance_add(argument0,112,80,ceil_low_obj);
room_instance_add(argument0,144,80,ceil_low_obj);
room_instance_add(argument0,144,112,ceil_low_obj);
room_instance_add(argument0,144,144,ceil_low_obj);
room_instance_add(argument0,176,144,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,240,144,ceil_low_obj);
room_instance_add(argument0,208,112,ceil_low_obj);
room_instance_add(argument0,240,112,ceil_low_obj);
room_instance_add(argument0,240,80,ceil_low_obj);
room_instance_add(argument0,208,80,ceil_low_obj);
room_instance_add(argument0,208,48,ceil_low_obj);
room_instance_add(argument0,240,48,ceil_low_obj);
room_instance_add(argument0,272,48,ceil_low_obj);
room_instance_add(argument0,304,48,ceil_low_obj);
room_instance_add(argument0,336,48,ceil_low_obj);
room_instance_add(argument0,304,80,ceil_low_obj);
room_instance_add(argument0,336,80,ceil_low_obj);
room_instance_add(argument0,368,80,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,48,92,wall_hor_obj);
room_instance_add(argument0,48,68,wall_hor_obj);
room_instance_add(argument0,80,68,wall_hor_obj);
room_instance_add(argument0,80,92,wall_hor_obj);
room_instance_add(argument0,112,92,wall_hor_obj);
room_instance_add(argument0,112,68,wall_hor_obj);
room_instance_add(argument0,144,68,wall_hor_obj);
room_instance_add(argument0,168,132,wall_hor_obj);
room_instance_add(argument0,200,132,wall_hor_obj);
room_instance_add(argument0,144,156,wall_hor_obj);
room_instance_add(argument0,176,156,wall_hor_obj);
room_instance_add(argument0,208,156,wall_hor_obj);
room_instance_add(argument0,240,156,wall_hor_obj);
room_instance_add(argument0,232,36,wall_hor_obj);
room_instance_add(argument0,256,60,wall_hor_obj);
room_instance_add(argument0,288,60,wall_hor_obj);
room_instance_add(argument0,264,36,wall_hor_obj);
room_instance_add(argument0,296,36,wall_hor_obj);
room_instance_add(argument0,328,36,wall_hor_obj);
room_instance_add(argument0,320,92,wall_hor_obj);
room_instance_add(argument0,352,92,wall_hor_obj);
room_instance_add(argument0,344,68,wall_hor_obj);
room_instance_add(argument0,376,68,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,128,108,wall_vert_obj);
room_instance_add(argument0,128,140,wall_vert_obj);
room_instance_add(argument0,152,84,wall_vert_obj);
room_instance_add(argument0,152,116,wall_vert_obj);
room_instance_add(argument0,216,116,wall_vert_obj);
room_instance_add(argument0,216,84,wall_vert_obj);
room_instance_add(argument0,216,52,wall_vert_obj);
room_instance_add(argument0,240,140,wall_vert_obj);
room_instance_add(argument0,240,108,wall_vert_obj);
room_instance_add(argument0,240,76,wall_vert_obj);
room_instance_add(argument0,304,76,wall_vert_obj);
room_instance_add(argument0,328,52,wall_vert_obj);
room_instance_add(argument0,368,76,wall_vert_obj);
room_instance_add(argument0,32,80,wall_vert_obj);