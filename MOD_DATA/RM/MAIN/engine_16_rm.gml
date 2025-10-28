/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','engine','ROOM_engine')+' 16';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 144;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 464;
    global.spawn_arr[1,1] = 256;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 214;
    global.mark_arr[0,1] = 254;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 320;
    global.mark_arr[1,1] = 262;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 399;
    global.mark_arr[2,1] = 255;
    global.mark_arr[2,2] = 0;
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
// Floors
room_instance_add(argument0,144,256,floor_obj);
room_instance_add(argument0,176,256,floor_obj);
room_instance_add(argument0,400,224,floor_obj);
room_instance_add(argument0,400,256,floor_obj);
room_instance_add(argument0,432,256,floor_obj);
room_instance_add(argument0,464,256,floor_obj);
room_instance_add(argument0,208,256,floor_obj);
room_instance_add(argument0,240,256,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
room_instance_add(argument0,240,288,floor_obj);
room_instance_add(argument0,272,288,floor_obj);
room_instance_add(argument0,272,256,floor_obj);
room_instance_add(argument0,272,224,floor_obj);
room_instance_add(argument0,240,224,floor_obj);
room_instance_add(argument0,208,224,floor_obj);
room_instance_add(argument0,304,224,floor_obj);
room_instance_add(argument0,304,256,floor_obj);
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,336,256,floor_obj);
room_instance_add(argument0,336,224,floor_obj);
room_instance_add(argument0,368,224,floor_obj);
room_instance_add(argument0,400,288,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,368,256,floor_obj);
// Ceilings
room_instance_add(argument0,144,256,ceil_obj);
room_instance_add(argument0,176,256,ceil_obj);
room_instance_add(argument0,400,224,ceil_obj);
room_instance_add(argument0,400,256,ceil_obj);
room_instance_add(argument0,432,256,ceil_obj);
room_instance_add(argument0,464,256,ceil_obj);
room_instance_add(argument0,208,256,ceil_obj);
room_instance_add(argument0,240,256,ceil_obj);
room_instance_add(argument0,208,288,ceil_obj);
room_instance_add(argument0,240,288,ceil_obj);
room_instance_add(argument0,272,288,ceil_obj);
room_instance_add(argument0,272,256,ceil_obj);
room_instance_add(argument0,272,224,ceil_obj);
room_instance_add(argument0,240,224,ceil_obj);
room_instance_add(argument0,208,224,ceil_obj);
room_instance_add(argument0,304,224,ceil_obj);
room_instance_add(argument0,304,256,ceil_obj);
room_instance_add(argument0,304,288,ceil_obj);
room_instance_add(argument0,336,288,ceil_obj);
room_instance_add(argument0,336,256,ceil_obj);
room_instance_add(argument0,336,224,ceil_obj);
room_instance_add(argument0,368,224,ceil_obj);
room_instance_add(argument0,400,288,ceil_obj);
room_instance_add(argument0,368,288,ceil_obj);
room_instance_add(argument0,368,256,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,240,wall_hor_obj);
room_instance_add(argument0,144,272,wall_hor_obj);
room_instance_add(argument0,176,240,wall_hor_obj);
room_instance_add(argument0,176,272,wall_hor_obj);
room_instance_add(argument0,464,272,wall_hor_obj);
room_instance_add(argument0,432,272,wall_hor_obj);
room_instance_add(argument0,432,240,wall_hor_obj);
room_instance_add(argument0,464,240,wall_hor_obj);
room_instance_add(argument0,208,208,wall_hor_obj);
room_instance_add(argument0,208,304,wall_hor_obj);
room_instance_add(argument0,400,304,wall_hor_obj);
room_instance_add(argument0,368,304,wall_hor_obj);
room_instance_add(argument0,336,304,wall_hor_obj);
room_instance_add(argument0,304,304,wall_hor_obj);
room_instance_add(argument0,272,304,wall_hor_obj);
room_instance_add(argument0,240,304,wall_hor_obj);
room_instance_add(argument0,240,208,wall_hor_obj);
room_instance_add(argument0,272,208,wall_hor_obj);
room_instance_add(argument0,304,208,wall_hor_obj);
room_instance_add(argument0,336,208,wall_hor_obj);
room_instance_add(argument0,368,208,wall_hor_obj);
room_instance_add(argument0,400,208,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,128,256,wall_vert_obj);
room_instance_add(argument0,416,224,wall_vert_obj);
room_instance_add(argument0,480,256,wall_vert_obj);
room_instance_add(argument0,192,224,wall_vert_obj);
room_instance_add(argument0,192,288,wall_vert_obj);
room_instance_add(argument0,416,288,wall_vert_obj);
// Engineering
room_instance_add(argument0,208,240,bar_hor_obj);
room_instance_add(argument0,240,240,bar_hor_obj);
room_instance_add(argument0,272,240,bar_hor_obj);
room_instance_add(argument0,304,240,bar_hor_obj);
room_instance_add(argument0,336,240,bar_hor_obj);
room_instance_add(argument0,368,240,bar_hor_obj);
room_instance_add(argument0,400,240,bar_hor_obj);
room_instance_add(argument0,400,272,bar_hor_obj);
room_instance_add(argument0,368,272,bar_hor_obj);
room_instance_add(argument0,336,272,bar_hor_obj);
room_instance_add(argument0,304,272,bar_hor_obj);
room_instance_add(argument0,272,272,bar_hor_obj);
room_instance_add(argument0,240,272,bar_hor_obj);
room_instance_add(argument0,208,272,bar_hor_obj);
room_instance_add(argument0,240,288,engine_rand_obj);
room_instance_add(argument0,208,288,engine_rand_obj);
room_instance_add(argument0,208,224,engine_rand_obj);
room_instance_add(argument0,240,224,engine_rand_obj);
room_instance_add(argument0,304,224,engine_rand_obj);
room_instance_add(argument0,304,288,engine_rand_obj);
room_instance_add(argument0,368,288,engine_rand_obj);
room_instance_add(argument0,400,288,engine_rand_obj);
room_instance_add(argument0,400,224,engine_rand_obj);
room_instance_add(argument0,368,224,engine_rand_obj);
room_instance_add(argument0,240,288,pole_metal_obj);
room_instance_add(argument0,208,288,pole_metal_obj);
room_instance_add(argument0,208,224,pole_metal_obj);
room_instance_add(argument0,240,224,pole_metal_obj);
room_instance_add(argument0,304,224,pole_metal_obj);
room_instance_add(argument0,304,288,pole_metal_obj);
room_instance_add(argument0,368,288,pole_metal_obj);
room_instance_add(argument0,400,288,pole_metal_obj);
room_instance_add(argument0,400,224,pole_metal_obj);
room_instance_add(argument0,368,224,pole_metal_obj);
room_instance_add(argument0,304,224,runner_obj);
room_instance_add(argument0,304,256,runner_obj);
room_instance_add(argument0,304,288,runner_obj);