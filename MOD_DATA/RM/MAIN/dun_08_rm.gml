/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","dun","ROOM_dun")+" 8";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 352;
    global.spawn_arr[1,1] = 320;
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
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
room_instance_add(argument0,416,256,floor_obj);
room_instance_add(argument0,416,288,floor_obj);
room_instance_add(argument0,416,320,floor_obj);
room_instance_add(argument0,416,352,floor_obj);
room_instance_add(argument0,416,384,floor_obj);
room_instance_add(argument0,384,384,floor_obj);
room_instance_add(argument0,352,384,floor_obj);
room_instance_add(argument0,288,384,floor_obj);
room_instance_add(argument0,256,384,floor_obj);
room_instance_add(argument0,224,384,floor_obj);
room_instance_add(argument0,224,352,floor_obj);
room_instance_add(argument0,224,320,floor_obj);
room_instance_add(argument0,256,320,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,320,320,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
room_instance_add(argument0,320,384,floor_obj);
// Ceilings
room_instance_add(argument0,224,256,ceil_2high_obj);
room_instance_add(argument0,256,256,ceil_2high_obj);
room_instance_add(argument0,288,256,ceil_2high_obj);
room_instance_add(argument0,320,256,ceil_2high_obj);
room_instance_add(argument0,352,256,ceil_2high_obj);
room_instance_add(argument0,384,256,ceil_2high_obj);
room_instance_add(argument0,416,256,ceil_2high_obj);
room_instance_add(argument0,416,288,ceil_2high_obj);
room_instance_add(argument0,416,320,ceil_2high_obj);
room_instance_add(argument0,416,352,ceil_2high_obj);
room_instance_add(argument0,416,384,ceil_2high_obj);
room_instance_add(argument0,384,384,ceil_2high_obj);
room_instance_add(argument0,352,384,ceil_2high_obj);
room_instance_add(argument0,288,384,ceil_2high_obj);
room_instance_add(argument0,256,384,ceil_2high_obj);
room_instance_add(argument0,224,384,ceil_2high_obj);
room_instance_add(argument0,224,352,ceil_2high_obj);
room_instance_add(argument0,224,320,ceil_2high_obj);
room_instance_add(argument0,256,320,ceil_2high_obj);
room_instance_add(argument0,288,320,ceil_2high_obj);
room_instance_add(argument0,320,320,ceil_2high_obj);
room_instance_add(argument0,352,320,ceil_2high_obj);
room_instance_add(argument0,320,384,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,304,wall_2high_hor_obj);
room_instance_add(argument0,256,336,wall_2high_hor_obj);
room_instance_add(argument0,256,368,wall_2high_hor_obj);
room_instance_add(argument0,256,400,wall_2high_hor_obj);
room_instance_add(argument0,224,400,wall_2high_hor_obj);
room_instance_add(argument0,288,400,wall_2high_hor_obj);
room_instance_add(argument0,352,400,wall_2high_hor_obj);
room_instance_add(argument0,384,400,wall_2high_hor_obj);
room_instance_add(argument0,416,400,wall_2high_hor_obj);
room_instance_add(argument0,384,368,wall_2high_hor_obj);
room_instance_add(argument0,352,368,wall_2high_hor_obj);
room_instance_add(argument0,320,400,wall_2high_hor_obj);
room_instance_add(argument0,320,368,wall_2high_hor_obj);
room_instance_add(argument0,288,368,wall_2high_hor_obj);
room_instance_add(argument0,288,336,wall_2high_hor_obj);
room_instance_add(argument0,320,336,wall_2high_hor_obj);
room_instance_add(argument0,352,336,wall_2high_hor_obj);
room_instance_add(argument0,352,304,wall_2high_hor_obj);
room_instance_add(argument0,320,304,wall_2high_hor_obj);
room_instance_add(argument0,288,304,wall_2high_hor_obj);
room_instance_add(argument0,256,304,wall_2high_hor_obj);
room_instance_add(argument0,224,272,wall_2high_hor_obj);
room_instance_add(argument0,224,240,wall_2high_hor_obj);
room_instance_add(argument0,256,240,wall_2high_hor_obj);
room_instance_add(argument0,256,272,wall_2high_hor_obj);
room_instance_add(argument0,288,272,wall_2high_hor_obj);
room_instance_add(argument0,320,272,wall_2high_hor_obj);
room_instance_add(argument0,352,272,wall_2high_hor_obj);
room_instance_add(argument0,384,272,wall_2high_hor_obj);
room_instance_add(argument0,416,240,wall_2high_hor_obj);
room_instance_add(argument0,384,240,wall_2high_hor_obj);
room_instance_add(argument0,352,240,wall_2high_hor_obj);
room_instance_add(argument0,320,240,wall_2high_hor_obj);
room_instance_add(argument0,288,240,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,256,wall_2high_vert_obj);
room_instance_add(argument0,368,320,wall_2high_vert_obj);
room_instance_add(argument0,208,320,wall_2high_vert_obj);
room_instance_add(argument0,240,352,wall_2high_vert_obj);
room_instance_add(argument0,208,352,wall_2high_vert_obj);
room_instance_add(argument0,208,384,wall_2high_vert_obj);
room_instance_add(argument0,400,352,wall_2high_vert_obj);
room_instance_add(argument0,400,320,wall_2high_vert_obj);
room_instance_add(argument0,400,288,wall_2high_vert_obj);
room_instance_add(argument0,432,256,wall_2high_vert_obj);
room_instance_add(argument0,432,288,wall_2high_vert_obj);
room_instance_add(argument0,432,320,wall_2high_vert_obj);
room_instance_add(argument0,432,352,wall_2high_vert_obj);
room_instance_add(argument0,432,384,wall_2high_vert_obj);
// Torches
room_instance_add(argument0,288,240,torch_north_obj);
room_instance_add(argument0,352,240,torch_north_obj);
room_instance_add(argument0,288,368,torch_north_obj);
room_instance_add(argument0,352,368,torch_north_obj);
room_instance_add(argument0,288,272,torch_south_obj);
room_instance_add(argument0,352,272,torch_south_obj);
room_instance_add(argument0,352,400,torch_south_obj);
room_instance_add(argument0,288,400,torch_south_obj);