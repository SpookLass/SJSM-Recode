/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','engine','ROOM_engine')+' 11';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 144;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 304;
    global.spawn_arr[1,1] = 68;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    // Mark
    global.mark_len_var = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
")
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
room_instance_add(argument0,144,256,floor_obj);
room_instance_add(argument0,176,256,floor_obj);
room_instance_add(argument0,208,256,floor_obj);
room_instance_add(argument0,240,256,floor_obj);
room_instance_add(argument0,272,256,floor_obj);
room_instance_add(argument0,304,256,floor_obj);
room_instance_add(argument0,336,256,floor_obj);
room_instance_add(argument0,368,256,floor_obj);
room_instance_add(argument0,400,256,floor_obj);
room_instance_add(argument0,432,256,floor_obj);
room_instance_add(argument0,464,256,floor_obj);
room_instance_add(argument0,496,256,floor_obj);
room_instance_add(argument0,528,256,floor_obj);
room_instance_add(argument0,560,256,floor_obj);
room_instance_add(argument0,592,256,floor_obj);
room_instance_add(argument0,624,256,floor_obj);
room_instance_add(argument0,304,224,floor_obj);
room_instance_add(argument0,304,192,floor_obj);
room_instance_add(argument0,304,160,floor_obj);
room_instance_add(argument0,304,128,floor_obj);
room_instance_add(argument0,304,96,floor_obj);
room_instance_add(argument0,304,64,floor_obj);
// Ceilings
room_instance_add(argument0,144,256,ceil_obj);
room_instance_add(argument0,176,256,ceil_obj);
room_instance_add(argument0,208,256,ceil_obj);
room_instance_add(argument0,240,256,ceil_obj);
room_instance_add(argument0,272,256,ceil_obj);
room_instance_add(argument0,304,256,ceil_obj);
room_instance_add(argument0,336,256,ceil_obj);
room_instance_add(argument0,368,256,ceil_obj);
room_instance_add(argument0,400,256,ceil_obj);
room_instance_add(argument0,432,256,ceil_obj);
room_instance_add(argument0,464,256,ceil_obj);
room_instance_add(argument0,496,256,ceil_obj);
room_instance_add(argument0,528,256,ceil_obj);
room_instance_add(argument0,560,256,ceil_obj);
room_instance_add(argument0,592,256,ceil_obj);
room_instance_add(argument0,624,256,ceil_obj);
room_instance_add(argument0,304,224,ceil_obj);
room_instance_add(argument0,304,192,ceil_obj);
room_instance_add(argument0,304,160,ceil_obj);
room_instance_add(argument0,304,128,ceil_obj);
room_instance_add(argument0,304,96,ceil_obj);
room_instance_add(argument0,304,64,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,152,244,wall_hor_obj);
room_instance_add(argument0,144,268,wall_hor_obj);
room_instance_add(argument0,176,268,wall_hor_obj);
room_instance_add(argument0,184,244,wall_hor_obj);
room_instance_add(argument0,216,244,wall_hor_obj);
room_instance_add(argument0,208,268,wall_hor_obj);
room_instance_add(argument0,240,268,wall_hor_obj);
room_instance_add(argument0,248,244,wall_hor_obj);
room_instance_add(argument0,280,244,wall_hor_obj);
room_instance_add(argument0,272,268,wall_hor_obj);
room_instance_add(argument0,304,268,wall_hor_obj);
room_instance_add(argument0,328,244,wall_hor_obj);
room_instance_add(argument0,336,268,wall_hor_obj);
room_instance_add(argument0,368,268,wall_hor_obj);
room_instance_add(argument0,400,268,wall_hor_obj);
room_instance_add(argument0,432,268,wall_hor_obj);
room_instance_add(argument0,464,268,wall_hor_obj);
room_instance_add(argument0,496,268,wall_hor_obj);
room_instance_add(argument0,528,268,wall_hor_obj);
room_instance_add(argument0,560,268,wall_hor_obj);
room_instance_add(argument0,592,268,wall_hor_obj);
room_instance_add(argument0,624,268,wall_hor_obj);
room_instance_add(argument0,616,244,wall_hor_obj);
room_instance_add(argument0,584,244,wall_hor_obj);
room_instance_add(argument0,552,244,wall_hor_obj);
room_instance_add(argument0,520,244,wall_hor_obj);
room_instance_add(argument0,488,244,wall_hor_obj);
room_instance_add(argument0,456,244,wall_hor_obj);
room_instance_add(argument0,424,244,wall_hor_obj);
room_instance_add(argument0,392,244,wall_hor_obj);
room_instance_add(argument0,360,244,wall_hor_obj);
room_instance_add(argument0,120,244,wall_hor_obj);
room_instance_add(argument0,304,52,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,128,256,wall_vert_obj);
room_instance_add(argument0,296,228,wall_vert_obj);
room_instance_add(argument0,312,228,wall_vert_obj);
room_instance_add(argument0,312,196,wall_vert_obj);
room_instance_add(argument0,296,196,wall_vert_obj);
room_instance_add(argument0,296,164,wall_vert_obj);
room_instance_add(argument0,312,164,wall_vert_obj);
room_instance_add(argument0,312,132,wall_vert_obj);
room_instance_add(argument0,296,132,wall_vert_obj);
room_instance_add(argument0,296,100,wall_vert_obj);
room_instance_add(argument0,312,100,wall_vert_obj);
room_instance_add(argument0,312,68,wall_vert_obj);
room_instance_add(argument0,296,68,wall_vert_obj);
room_instance_add(argument0,632,256,wall_vert_obj);
// Engineering
room_instance_add(argument0,384,256,bar_vert_obj);