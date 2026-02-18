/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 23';
    ini_close();
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 320;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 544;
    global.spawn_arr[1,1] = 288;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 544;
    global.spawn_arr[2,1] = 416;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    // Mark
    global.mark_len_var = 2;
    global.mark_arr[0,0] = 480;
    global.mark_arr[0,1] = 320;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 384;
    global.mark_arr[1,1] = 352;
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
// Floors
room_instance_add(argument0,352,352,floor_obj);
room_instance_add(argument0,384,352,floor_obj);
room_instance_add(argument0,416,352,floor_obj);
room_instance_add(argument0,448,352,floor_obj);
room_instance_add(argument0,480,352,floor_obj);
room_instance_add(argument0,480,384,floor_obj);
room_instance_add(argument0,480,320,floor_obj);
room_instance_add(argument0,480,288,floor_obj);
room_instance_add(argument0,512,288,floor_obj);
room_instance_add(argument0,544,288,floor_obj);
room_instance_add(argument0,480,416,floor_obj);
room_instance_add(argument0,512,416,floor_obj);
room_instance_add(argument0,544,416,floor_obj);
room_instance_add(argument0,320,352,floor_obj);
// Ceilings
room_instance_add(argument0,352,352,ceil_obj);
room_instance_add(argument0,384,352,ceil_obj);
room_instance_add(argument0,416,352,ceil_obj);
room_instance_add(argument0,448,352,ceil_obj);
room_instance_add(argument0,480,352,ceil_obj);
room_instance_add(argument0,480,384,ceil_obj);
room_instance_add(argument0,480,320,ceil_obj);
room_instance_add(argument0,480,288,ceil_obj);
room_instance_add(argument0,512,288,ceil_obj);
room_instance_add(argument0,544,288,ceil_obj);
room_instance_add(argument0,480,416,ceil_obj);
room_instance_add(argument0,512,416,ceil_obj);
room_instance_add(argument0,544,416,ceil_obj);
room_instance_add(argument0,320,352,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,480,272,wall_hor_obj);
room_instance_add(argument0,512,272,wall_hor_obj);
room_instance_add(argument0,544,272,wall_hor_obj);
room_instance_add(argument0,544,304,wall_hor_obj);
room_instance_add(argument0,512,304,wall_hor_obj);
room_instance_add(argument0,480,432,wall_hor_obj);
room_instance_add(argument0,512,432,wall_hor_obj);
room_instance_add(argument0,544,432,wall_hor_obj);
room_instance_add(argument0,512,400,wall_hor_obj);
room_instance_add(argument0,544,400,wall_hor_obj);
room_instance_add(argument0,320,336,wall_hor_obj);
room_instance_add(argument0,352,336,wall_hor_obj);
room_instance_add(argument0,384,336,wall_hor_obj);
room_instance_add(argument0,416,336,wall_hor_obj);
room_instance_add(argument0,448,336,wall_hor_obj);
room_instance_add(argument0,448,368,wall_hor_obj);
room_instance_add(argument0,416,368,wall_hor_obj);
room_instance_add(argument0,384,368,wall_hor_obj);
room_instance_add(argument0,352,368,wall_hor_obj);
room_instance_add(argument0,320,368,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,304,352,wall_vert_obj);
room_instance_add(argument0,496,320,wall_vert_obj);
room_instance_add(argument0,496,352,wall_vert_obj);
room_instance_add(argument0,496,384,wall_vert_obj);
room_instance_add(argument0,464,288,wall_vert_obj);
room_instance_add(argument0,464,320,wall_vert_obj);
room_instance_add(argument0,464,384,wall_vert_obj);
room_instance_add(argument0,464,416,wall_vert_obj);
room_instance_add(argument0,560,288,wall_vert_obj);
room_instance_add(argument0,560,416,wall_vert_obj);
// Torches
room_instance_add(argument0,352,336,torch_north_obj);
room_instance_add(argument0,416,336,torch_north_obj);
room_instance_add(argument0,480,272,torch_north_obj);
room_instance_add(argument0,480,432,torch_south_obj);
room_instance_add(argument0,416,368,torch_south_obj);
room_instance_add(argument0,352,368,torch_south_obj);
room_instance_add(argument0,464,288,torch_west_obj);
room_instance_add(argument0,464,416,torch_west_obj);
room_instance_add(argument0,496,352,torch_east_obj);
// Props
room_instance_add(argument0,489,383,web_rand_obj);
room_instance_add(argument0,524,299,web_rand_obj);
// Jumpscare
room_instance_add(argument0,464,368,js_obj);