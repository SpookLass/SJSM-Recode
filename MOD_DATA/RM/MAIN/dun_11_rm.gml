/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","dun","ROOM_dun")+" 11";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 576;
    global.spawn_arr[1,1] = 416;
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,320,320,floor_obj);
room_instance_add(argument0,320,352,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,288,352,floor_obj);
room_instance_add(argument0,352,352,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
room_instance_add(argument0,352,384,floor_obj);
room_instance_add(argument0,320,384,floor_obj);
room_instance_add(argument0,288,384,floor_obj);
room_instance_add(argument0,288,416,floor_obj);
room_instance_add(argument0,320,416,floor_obj);
room_instance_add(argument0,352,416,floor_obj);
room_instance_add(argument0,352,448,floor_obj);
room_instance_add(argument0,320,448,floor_obj);
room_instance_add(argument0,288,448,floor_obj);
room_instance_add(argument0,384,416,floor_obj);
room_instance_add(argument0,416,416,floor_obj);
room_instance_add(argument0,448,416,floor_obj);
room_instance_add(argument0,480,416,floor_obj);
room_instance_add(argument0,512,416,floor_obj);
room_instance_add(argument0,544,416,floor_obj);
room_instance_add(argument0,576,416,floor_obj);
// Ceilings
room_instance_add(argument0,224,256,ceil_2high_obj);
room_instance_add(argument0,256,256,ceil_2high_obj);
room_instance_add(argument0,288,256,ceil_2high_obj);
room_instance_add(argument0,320,256,ceil_2high_obj);
room_instance_add(argument0,320,288,ceil_2high_obj);
room_instance_add(argument0,320,320,ceil_2high_obj);
room_instance_add(argument0,320,352,ceil_2high_obj);
room_instance_add(argument0,288,320,ceil_2high_obj);
room_instance_add(argument0,288,352,ceil_2high_obj);
room_instance_add(argument0,352,352,ceil_2high_obj);
room_instance_add(argument0,352,320,ceil_2high_obj);
room_instance_add(argument0,352,384,ceil_2high_obj);
room_instance_add(argument0,320,384,ceil_2high_obj);
room_instance_add(argument0,288,384,ceil_2high_obj);
room_instance_add(argument0,288,416,ceil_2high_obj);
room_instance_add(argument0,320,416,ceil_2high_obj);
room_instance_add(argument0,352,416,ceil_2high_obj);
room_instance_add(argument0,352,448,ceil_2high_obj);
room_instance_add(argument0,320,448,ceil_2high_obj);
room_instance_add(argument0,288,448,ceil_2high_obj);
room_instance_add(argument0,384,416,ceil_2high_obj);
room_instance_add(argument0,416,416,ceil_2high_obj);
room_instance_add(argument0,448,416,ceil_2high_obj);
room_instance_add(argument0,480,416,ceil_2high_obj);
room_instance_add(argument0,512,416,ceil_2high_obj);
room_instance_add(argument0,544,416,ceil_2high_obj);
room_instance_add(argument0,576,416,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,240,wall_2high_hor_obj);
room_instance_add(argument0,224,272,wall_2high_hor_obj);
room_instance_add(argument0,256,272,wall_2high_hor_obj);
room_instance_add(argument0,288,272,wall_2high_hor_obj);
room_instance_add(argument0,288,304,wall_2high_hor_obj);
room_instance_add(argument0,352,304,wall_2high_hor_obj);
room_instance_add(argument0,320,240,wall_2high_hor_obj);
room_instance_add(argument0,288,240,wall_2high_hor_obj);
room_instance_add(argument0,256,240,wall_2high_hor_obj);
room_instance_add(argument0,384,400,wall_2high_hor_obj);
room_instance_add(argument0,352,464,wall_2high_hor_obj);
room_instance_add(argument0,320,464,wall_2high_hor_obj);
room_instance_add(argument0,288,464,wall_2high_hor_obj);
room_instance_add(argument0,384,432,wall_2high_hor_obj);
room_instance_add(argument0,416,400,wall_2high_hor_obj);
room_instance_add(argument0,416,432,wall_2high_hor_obj);
room_instance_add(argument0,448,432,wall_2high_hor_obj);
room_instance_add(argument0,448,400,wall_2high_hor_obj);
room_instance_add(argument0,480,400,wall_2high_hor_obj);
room_instance_add(argument0,480,432,wall_2high_hor_obj);
room_instance_add(argument0,512,432,wall_2high_hor_obj);
room_instance_add(argument0,512,400,wall_2high_hor_obj);
room_instance_add(argument0,544,400,wall_2high_hor_obj);
room_instance_add(argument0,544,432,wall_2high_hor_obj);
room_instance_add(argument0,576,400,wall_2high_hor_obj);
room_instance_add(argument0,576,432,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,256,wall_2high_vert_obj);
room_instance_add(argument0,304,288,wall_2high_vert_obj);
room_instance_add(argument0,336,288,wall_2high_vert_obj);
room_instance_add(argument0,336,256,wall_2high_vert_obj);
room_instance_add(argument0,368,320,wall_2high_vert_obj);
room_instance_add(argument0,368,352,wall_2high_vert_obj);
room_instance_add(argument0,368,384,wall_2high_vert_obj);
room_instance_add(argument0,368,448,wall_2high_vert_obj);
room_instance_add(argument0,272,448,wall_2high_vert_obj);
room_instance_add(argument0,272,416,wall_2high_vert_obj);
room_instance_add(argument0,272,384,wall_2high_vert_obj);
room_instance_add(argument0,272,352,wall_2high_vert_obj);
room_instance_add(argument0,592,416,wall_2high_vert_obj);
room_instance_add(argument0,272,320,wall_2high_vert_obj);
// Torches
room_instance_add(argument0,448,400,torch_north_obj);
room_instance_add(argument0,512,400,torch_north_obj);
room_instance_add(argument0,448,432,torch_south_obj);
room_instance_add(argument0,512,432,torch_south_obj);
room_instance_add(argument0,272,352,torch_west_obj);
room_instance_add(argument0,368,352,torch_east_obj);