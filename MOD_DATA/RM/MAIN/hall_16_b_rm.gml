/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 16 B';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 160;
    global.spawn_arr[0,1] = 384;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 672;
    global.spawn_arr[1,1] = 320;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 254;
    global.mark_arr[0,1] = 382;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 383;
    global.mark_arr[1,1] = 384;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 430;
    global.mark_arr[2,1] = 319;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 580;
    global.mark_arr[3,1] = 320;
    global.mark_arr[3,2] = 0;
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
room_instance_add(argument0,160,384,floor_obj);
room_instance_add(argument0,192,384,floor_obj);
room_instance_add(argument0,224,384,floor_obj);
room_instance_add(argument0,256,384,floor_obj);
room_instance_add(argument0,288,384,floor_obj);
room_instance_add(argument0,320,384,floor_obj);
room_instance_add(argument0,352,384,floor_obj);
room_instance_add(argument0,384,384,floor_obj);
room_instance_add(argument0,416,384,floor_obj);
room_instance_add(argument0,416,352,floor_obj);
room_instance_add(argument0,416,320,floor_obj);
room_instance_add(argument0,448,320,floor_obj);
room_instance_add(argument0,480,320,floor_obj);
room_instance_add(argument0,512,320,floor_obj);
room_instance_add(argument0,544,320,floor_obj);
room_instance_add(argument0,576,320,floor_obj);
room_instance_add(argument0,608,320,floor_obj);
room_instance_add(argument0,640,320,floor_obj);
room_instance_add(argument0,672,320,floor_obj);
// Ceilings
room_instance_add(argument0,160,384,ceil_obj);
room_instance_add(argument0,192,384,ceil_obj);
room_instance_add(argument0,224,384,ceil_obj);
room_instance_add(argument0,256,384,ceil_obj);
room_instance_add(argument0,288,384,ceil_obj);
room_instance_add(argument0,320,384,ceil_obj);
room_instance_add(argument0,352,384,ceil_obj);
room_instance_add(argument0,384,384,ceil_obj);
room_instance_add(argument0,416,384,ceil_obj);
room_instance_add(argument0,416,352,ceil_obj);
room_instance_add(argument0,416,320,ceil_obj);
room_instance_add(argument0,448,320,ceil_obj);
room_instance_add(argument0,480,320,ceil_obj);
room_instance_add(argument0,512,320,ceil_obj);
room_instance_add(argument0,544,320,ceil_obj);
room_instance_add(argument0,576,320,ceil_obj);
room_instance_add(argument0,608,320,ceil_obj);
room_instance_add(argument0,640,320,ceil_obj);
room_instance_add(argument0,672,320,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,160,368,wall_hor_obj);
room_instance_add(argument0,384,368,wall_hor_obj);
room_instance_add(argument0,352,368,wall_hor_obj);
room_instance_add(argument0,320,368,wall_hor_obj);
room_instance_add(argument0,288,368,wall_hor_obj);
room_instance_add(argument0,256,368,wall_hor_obj);
room_instance_add(argument0,224,368,wall_hor_obj);
room_instance_add(argument0,192,368,wall_hor_obj);
room_instance_add(argument0,416,400,wall_hor_obj);
room_instance_add(argument0,416,304,wall_hor_obj);
room_instance_add(argument0,448,304,wall_hor_obj);
room_instance_add(argument0,448,336,wall_hor_obj);
room_instance_add(argument0,480,304,wall_hor_obj);
room_instance_add(argument0,512,304,wall_hor_obj);
room_instance_add(argument0,544,304,wall_hor_obj);
room_instance_add(argument0,576,304,wall_hor_obj);
room_instance_add(argument0,608,304,wall_hor_obj);
room_instance_add(argument0,640,304,wall_hor_obj);
room_instance_add(argument0,672,304,wall_hor_obj);
room_instance_add(argument0,672,336,wall_hor_obj);
room_instance_add(argument0,640,336,wall_hor_obj);
room_instance_add(argument0,608,336,wall_hor_obj);
room_instance_add(argument0,576,336,wall_hor_obj);
room_instance_add(argument0,480,336,wall_hor_obj);
room_instance_add(argument0,512,336,wall_hor_obj);
room_instance_add(argument0,544,336,wall_hor_obj);
room_instance_add(argument0,384,400,wall_hor_obj);
room_instance_add(argument0,352,400,wall_hor_obj);
room_instance_add(argument0,320,400,wall_hor_obj);
room_instance_add(argument0,288,400,wall_hor_obj);
room_instance_add(argument0,256,400,wall_hor_obj);
room_instance_add(argument0,224,400,wall_hor_obj);
room_instance_add(argument0,192,400,wall_hor_obj);
room_instance_add(argument0,160,400,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,144,384,wall_vert_obj);
room_instance_add(argument0,432,384,wall_vert_obj);
room_instance_add(argument0,432,352,wall_vert_obj);
room_instance_add(argument0,400,352,wall_vert_obj);
room_instance_add(argument0,400,320,wall_vert_obj);
room_instance_add(argument0,688,320,wall_vert_obj);
// Torches
room_instance_add(argument0,224,368,torch_north_obj);
room_instance_add(argument0,288,368,torch_north_obj);
room_instance_add(argument0,352,368,torch_north_obj);
room_instance_add(argument0,480,304,torch_north_obj);
room_instance_add(argument0,544,304,torch_north_obj);
room_instance_add(argument0,608,304,torch_north_obj);
room_instance_add(argument0,224,400,torch_south_obj);
room_instance_add(argument0,288,400,torch_south_obj);
room_instance_add(argument0,352,400,torch_south_obj);
room_instance_add(argument0,480,336,torch_south_obj);
room_instance_add(argument0,544,336,torch_south_obj);
room_instance_add(argument0,608,336,torch_south_obj);
// Jumpscare
room_instance_add(argument0,208,400,js_obj);