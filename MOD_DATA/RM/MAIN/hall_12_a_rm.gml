/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 12 A';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 288;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 512;
    global.spawn_arr[1,1] = 256;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 384;
    global.mark_arr[0,1] = 256;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 416;
    global.mark_arr[1,1] = 256;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 496;
    global.mark_arr[2,1] = 256;
    global.mark_arr[2,2] = 0;
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
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
room_instance_add(argument0,416,256,floor_obj);
room_instance_add(argument0,448,256,floor_obj);
room_instance_add(argument0,480,256,floor_obj);
room_instance_add(argument0,512,256,floor_obj);
// Ceilings
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,352,256,ceil_obj);
room_instance_add(argument0,384,256,ceil_obj);
room_instance_add(argument0,416,256,ceil_obj);
room_instance_add(argument0,448,256,ceil_obj);
room_instance_add(argument0,480,256,ceil_obj);
room_instance_add(argument0,512,256,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,320,240,wall_hor_obj);
room_instance_add(argument0,352,240,wall_hor_obj);
room_instance_add(argument0,384,240,wall_hor_obj);
room_instance_add(argument0,416,240,wall_hor_obj);
room_instance_add(argument0,448,240,wall_hor_obj);
room_instance_add(argument0,480,240,wall_hor_obj);
room_instance_add(argument0,512,240,wall_hor_obj);
room_instance_add(argument0,512,272,wall_hor_obj);
room_instance_add(argument0,480,272,wall_hor_obj);
room_instance_add(argument0,448,272,wall_hor_obj);
room_instance_add(argument0,416,272,wall_hor_obj);
room_instance_add(argument0,384,272,wall_hor_obj);
room_instance_add(argument0,352,272,wall_hor_obj);
room_instance_add(argument0,320,272,wall_hor_obj);
room_instance_add(argument0,288,272,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,272,256,wall_vert_obj);
room_instance_add(argument0,528,256,wall_vert_obj);
// Torches
room_instance_add(argument0,352,240,torch_north_obj);
room_instance_add(argument0,448,240,torch_north_obj);
room_instance_add(argument0,352,272,torch_south_obj);
room_instance_add(argument0,448,272,torch_south_obj);
// Props
room_instance_add(argument0,332,265,web_rand_obj);
room_instance_add(argument0,468,248,web_rand_obj);
// Jumpscare
room_instance_add(argument0,480,272,js_obj);
