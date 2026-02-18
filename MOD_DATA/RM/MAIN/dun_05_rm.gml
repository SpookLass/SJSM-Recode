/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","dun","ROOM_dun")+" 5";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 416;
    global.spawn_arr[1,1] = 256;
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
room_instance_add(argument0,224,240,floor_obj);
room_instance_add(argument0,224,272,floor_obj);
room_instance_add(argument0,256,272,floor_obj);
room_instance_add(argument0,256,240,floor_obj);
room_instance_add(argument0,288,240,floor_obj);
room_instance_add(argument0,288,272,floor_obj);
room_instance_add(argument0,288,304,floor_obj);
room_instance_add(argument0,256,304,floor_obj);
room_instance_add(argument0,224,304,floor_obj);
room_instance_add(argument0,224,208,floor_obj);
room_instance_add(argument0,256,208,floor_obj);
room_instance_add(argument0,288,208,floor_obj);
room_instance_add(argument0,320,208,floor_obj);
room_instance_add(argument0,352,208,floor_obj);
room_instance_add(argument0,352,240,floor_obj);
room_instance_add(argument0,320,240,floor_obj);
room_instance_add(argument0,320,272,floor_obj);
room_instance_add(argument0,352,272,floor_obj);
room_instance_add(argument0,352,304,floor_obj);
room_instance_add(argument0,320,304,floor_obj);
room_instance_add(argument0,384,304,floor_obj);
room_instance_add(argument0,384,272,floor_obj);
room_instance_add(argument0,384,240,floor_obj);
room_instance_add(argument0,384,208,floor_obj);
room_instance_add(argument0,416,208,floor_obj);
room_instance_add(argument0,416,240,floor_obj);
room_instance_add(argument0,416,272,floor_obj);
room_instance_add(argument0,416,304,floor_obj);
// Ceilings
room_instance_add(argument0,224,240,ceil_2high_obj);
room_instance_add(argument0,224,272,ceil_2high_obj);
room_instance_add(argument0,256,272,ceil_2high_obj);
room_instance_add(argument0,256,240,ceil_2high_obj);
room_instance_add(argument0,288,240,ceil_2high_obj);
room_instance_add(argument0,288,272,ceil_2high_obj);
room_instance_add(argument0,288,304,ceil_2high_obj);
room_instance_add(argument0,256,304,ceil_2high_obj);
room_instance_add(argument0,224,304,ceil_2high_obj);
room_instance_add(argument0,224,208,ceil_2high_obj);
room_instance_add(argument0,256,208,ceil_2high_obj);
room_instance_add(argument0,288,208,ceil_2high_obj);
room_instance_add(argument0,320,208,ceil_2high_obj);
room_instance_add(argument0,352,208,ceil_2high_obj);
room_instance_add(argument0,352,240,ceil_2high_obj);
room_instance_add(argument0,320,240,ceil_2high_obj);
room_instance_add(argument0,320,272,ceil_2high_obj);
room_instance_add(argument0,352,272,ceil_2high_obj);
room_instance_add(argument0,352,304,ceil_2high_obj);
room_instance_add(argument0,320,304,ceil_2high_obj);
room_instance_add(argument0,384,304,ceil_2high_obj);
room_instance_add(argument0,384,272,ceil_2high_obj);
room_instance_add(argument0,384,240,ceil_2high_obj);
room_instance_add(argument0,384,208,ceil_2high_obj);
room_instance_add(argument0,416,208,ceil_2high_obj);
room_instance_add(argument0,416,240,ceil_2high_obj);
room_instance_add(argument0,416,272,ceil_2high_obj);
room_instance_add(argument0,416,304,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,192,wall_2high_hor_obj);
room_instance_add(argument0,224,320,wall_2high_hor_obj);
room_instance_add(argument0,256,320,wall_2high_hor_obj);
room_instance_add(argument0,288,320,wall_2high_hor_obj);
room_instance_add(argument0,320,320,wall_2high_hor_obj);
room_instance_add(argument0,352,320,wall_2high_hor_obj);
room_instance_add(argument0,384,320,wall_2high_hor_obj);
room_instance_add(argument0,416,320,wall_2high_hor_obj);
room_instance_add(argument0,416,192,wall_2high_hor_obj);
room_instance_add(argument0,384,192,wall_2high_hor_obj);
room_instance_add(argument0,352,192,wall_2high_hor_obj);
room_instance_add(argument0,320,192,wall_2high_hor_obj);
room_instance_add(argument0,288,192,wall_2high_hor_obj);
room_instance_add(argument0,256,192,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,208,wall_2high_vert_obj);
room_instance_add(argument0,208,240,wall_2high_vert_obj);
room_instance_add(argument0,208,272,wall_2high_vert_obj);
room_instance_add(argument0,208,304,wall_2high_vert_obj);
room_instance_add(argument0,432,208,wall_2high_vert_obj);
room_instance_add(argument0,432,240,wall_2high_vert_obj);
room_instance_add(argument0,432,272,wall_2high_vert_obj);
room_instance_add(argument0,432,304,wall_2high_vert_obj);
// Torches
room_instance_add(argument0,256,192,torch_north_obj);
room_instance_add(argument0,384,192,torch_north_obj);
room_instance_add(argument0,256,320,torch_south_obj);
room_instance_add(argument0,384,320,torch_south_obj);
// Props
room_instance_add(argument0,320,320,chain_hor_rand_obj);
room_instance_add(argument0,320,192,chain_hor_rand_obj);