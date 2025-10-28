/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','engine','ROOM_engine')+' 13';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 144;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 496;
    global.spawn_arr[1,1] = 416;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 171;
    global.mark_arr[0,1] = 273;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 233;
    global.mark_arr[1,1] = 250;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 335;
    global.mark_arr[2,1] = 355;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 468;
    global.mark_arr[3,1] = 413;
    global.mark_arr[3,2] = 0;
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
room_instance_add(argument0,208,256,floor_obj);
room_instance_add(argument0,240,256,floor_obj);
room_instance_add(argument0,240,224,floor_obj);
room_instance_add(argument0,208,224,floor_obj);
room_instance_add(argument0,176,224,floor_obj);
room_instance_add(argument0,144,224,floor_obj);
room_instance_add(argument0,144,288,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
room_instance_add(argument0,240,288,floor_obj);
room_instance_add(argument0,272,256,floor_obj);
room_instance_add(argument0,304,256,floor_obj);
room_instance_add(argument0,336,256,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,336,320,floor_obj);
room_instance_add(argument0,336,352,floor_obj);
room_instance_add(argument0,336,384,floor_obj);
room_instance_add(argument0,336,416,floor_obj);
room_instance_add(argument0,368,416,floor_obj);
room_instance_add(argument0,400,416,floor_obj);
room_instance_add(argument0,432,416,floor_obj);
room_instance_add(argument0,464,416,floor_obj);
room_instance_add(argument0,400,384,floor_obj);
room_instance_add(argument0,432,384,floor_obj);
room_instance_add(argument0,464,384,floor_obj);
room_instance_add(argument0,496,384,floor_obj);
room_instance_add(argument0,496,416,floor_obj);
room_instance_add(argument0,496,448,floor_obj);
room_instance_add(argument0,464,448,floor_obj);
room_instance_add(argument0,432,448,floor_obj);
room_instance_add(argument0,400,448,floor_obj);
// Ceilings
room_instance_add(argument0,144,256,ceil_obj);
room_instance_add(argument0,176,256,ceil_obj);
room_instance_add(argument0,208,256,ceil_obj);
room_instance_add(argument0,240,256,ceil_obj);
room_instance_add(argument0,240,224,ceil_obj);
room_instance_add(argument0,208,224,ceil_obj);
room_instance_add(argument0,176,224,ceil_obj);
room_instance_add(argument0,144,224,ceil_obj);
room_instance_add(argument0,144,288,ceil_obj);
room_instance_add(argument0,176,288,ceil_obj);
room_instance_add(argument0,208,288,ceil_obj);
room_instance_add(argument0,240,288,ceil_obj);
room_instance_add(argument0,272,256,ceil_obj);
room_instance_add(argument0,304,256,ceil_obj);
room_instance_add(argument0,336,256,ceil_obj);
room_instance_add(argument0,336,288,ceil_obj);
room_instance_add(argument0,336,320,ceil_obj);
room_instance_add(argument0,336,352,ceil_obj);
room_instance_add(argument0,336,384,ceil_obj);
room_instance_add(argument0,336,416,ceil_obj);
room_instance_add(argument0,368,416,ceil_obj);
room_instance_add(argument0,400,416,ceil_obj);
room_instance_add(argument0,432,416,ceil_obj);
room_instance_add(argument0,464,416,ceil_obj);
room_instance_add(argument0,400,384,ceil_obj);
room_instance_add(argument0,432,384,ceil_obj);
room_instance_add(argument0,464,384,ceil_obj);
room_instance_add(argument0,496,384,ceil_obj);
room_instance_add(argument0,496,416,ceil_obj);
room_instance_add(argument0,496,448,ceil_obj);
room_instance_add(argument0,464,448,ceil_obj);
room_instance_add(argument0,432,448,ceil_obj);
room_instance_add(argument0,400,448,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,208,wall_hor_obj);
room_instance_add(argument0,176,208,wall_hor_obj);
room_instance_add(argument0,208,208,wall_hor_obj);
room_instance_add(argument0,240,208,wall_hor_obj);
room_instance_add(argument0,240,304,wall_hor_obj);
room_instance_add(argument0,208,304,wall_hor_obj);
room_instance_add(argument0,176,304,wall_hor_obj);
room_instance_add(argument0,144,304,wall_hor_obj);
room_instance_add(argument0,272,240,wall_hor_obj);
room_instance_add(argument0,272,272,wall_hor_obj);
room_instance_add(argument0,304,272,wall_hor_obj);
room_instance_add(argument0,304,240,wall_hor_obj);
room_instance_add(argument0,336,240,wall_hor_obj);
room_instance_add(argument0,368,400,wall_hor_obj);
room_instance_add(argument0,368,432,wall_hor_obj);
room_instance_add(argument0,336,432,wall_hor_obj);
room_instance_add(argument0,400,368,wall_hor_obj);
room_instance_add(argument0,400,464,wall_hor_obj);
room_instance_add(argument0,432,464,wall_hor_obj);
room_instance_add(argument0,464,464,wall_hor_obj);
room_instance_add(argument0,496,464,wall_hor_obj);
room_instance_add(argument0,496,368,wall_hor_obj);
room_instance_add(argument0,464,368,wall_hor_obj);
room_instance_add(argument0,432,368,wall_hor_obj);
// Walls (Vertical)

room_instance_add(argument0,128,256,wall_vert_obj);
room_instance_add(argument0,128,224,wall_vert_obj);
room_instance_add(argument0,128,288,wall_vert_obj);
room_instance_add(argument0,256,288,wall_vert_obj);
room_instance_add(argument0,256,224,wall_vert_obj);
room_instance_add(argument0,320,288,wall_vert_obj);
room_instance_add(argument0,352,256,wall_vert_obj);
room_instance_add(argument0,352,288,wall_vert_obj);
room_instance_add(argument0,352,320,wall_vert_obj);
room_instance_add(argument0,352,384,wall_vert_obj);
room_instance_add(argument0,352,352,wall_vert_obj);
room_instance_add(argument0,320,320,wall_vert_obj);
room_instance_add(argument0,320,352,wall_vert_obj);
room_instance_add(argument0,320,384,wall_vert_obj);
room_instance_add(argument0,320,416,wall_vert_obj);
room_instance_add(argument0,384,384,wall_vert_obj);
room_instance_add(argument0,384,448,wall_vert_obj);
room_instance_add(argument0,512,384,wall_vert_obj);
room_instance_add(argument0,512,416,wall_vert_obj);
room_instance_add(argument0,512,448,wall_vert_obj);
// Engineering
room_instance_add(argument0,208,224,engine_rand_obj);
room_instance_add(argument0,208,288,engine_rand_obj);
room_instance_add(argument0,432,384,engine_rand_obj);
room_instance_add(argument0,432,448,engine_rand_obj);
room_instance_add(argument0,208,224,pole_metal_obj);
room_instance_add(argument0,208,288,pole_metal_obj);
room_instance_add(argument0,432,384,pole_metal_obj);
room_instance_add(argument0,432,448,pole_metal_obj);
room_instance_add(argument0,496,384,pole_metal_obj);
room_instance_add(argument0,496,448,pole_metal_obj);
room_instance_add(argument0,144,288,pole_metal_obj);
room_instance_add(argument0,144,224,pole_metal_obj);
room_instance_add(argument0,208,256,runner_obj);
room_instance_add(argument0,208,288,runner_obj);
room_instance_add(argument0,208,224,runner_obj);
room_instance_add(argument0,432,384,runner_obj);
room_instance_add(argument0,432,416,runner_obj);
room_instance_add(argument0,432,448,runner_obj);
// Jumpscare
room_instance_add(argument0,368,432,js_obj);