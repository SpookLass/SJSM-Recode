/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","brain","ROOM_brain");
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 160;    // X
    global.spawn_arr[0,1] = 256;    // Y
    global.spawn_arr[0,2] = 0;      // Z
    global.spawn_arr[0,3] = 0;      // Angle (0 is right, 90 is up, etc)
    // Spawn 1 (exit)
    global.spawn_arr[1,0] = 544;
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
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,160,256,floor_obj);
room_instance_add(argument0,192,256,floor_obj);
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,256,320,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,320,320,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,384,256,floor_obj);
room_instance_add(argument0,384,288,floor_obj);
room_instance_add(argument0,384,320,floor_obj);
room_instance_add(argument0,416,320,floor_obj);
room_instance_add(argument0,448,320,floor_obj);
room_instance_add(argument0,448,288,floor_obj);
room_instance_add(argument0,448,256,floor_obj);
room_instance_add(argument0,480,256,floor_obj);
room_instance_add(argument0,512,256,floor_obj);
room_instance_add(argument0,352,224,floor_obj);
room_instance_add(argument0,544,256,floor_obj);
room_instance_add(argument0,352,192,floor_obj);
room_instance_add(argument0,320,192,floor_obj);
room_instance_add(argument0,384,192,floor_obj);
room_instance_add(argument0,416,192,floor_obj);
room_instance_add(argument0,288,192,floor_obj);
room_instance_add(argument0,320,160,floor_obj);
room_instance_add(argument0,352,160,floor_obj);
room_instance_add(argument0,384,160,floor_obj);
room_instance_add(argument0,416,160,floor_obj);
room_instance_add(argument0,416,128,floor_obj);
room_instance_add(argument0,384,128,floor_obj);
room_instance_add(argument0,352,128,floor_obj);
room_instance_add(argument0,320,128,floor_obj);
room_instance_add(argument0,288,128,floor_obj);
room_instance_add(argument0,288,160,floor_obj);
room_instance_add(argument0,320,96,floor_obj);
room_instance_add(argument0,352,96,floor_obj);
room_instance_add(argument0,384,96,floor_obj);
room_instance_add(argument0,416,96,floor_obj);
room_instance_add(argument0,288,96,floor_obj);
room_instance_add(argument0,352,64,floor_obj);
room_instance_add(argument0,320,64,floor_obj);
room_instance_add(argument0,384,64,floor_obj);
// Ceilings
room_instance_add(argument0,160,256,ceil_obj);
room_instance_add(argument0,192,256,ceil_obj);
room_instance_add(argument0,224,256,ceil_obj);
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,256,320,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
room_instance_add(argument0,320,320,ceil_obj);
room_instance_add(argument0,320,288,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,352,256,ceil_obj);
room_instance_add(argument0,384,256,ceil_obj);
room_instance_add(argument0,384,288,ceil_obj);
room_instance_add(argument0,384,320,ceil_obj);
room_instance_add(argument0,416,320,ceil_obj);
room_instance_add(argument0,448,320,ceil_obj);
room_instance_add(argument0,448,288,ceil_obj);
room_instance_add(argument0,448,256,ceil_obj);
room_instance_add(argument0,480,256,ceil_obj);
room_instance_add(argument0,512,256,ceil_obj);
room_instance_add(argument0,352,224,ceil_obj);
room_instance_add(argument0,544,256,ceil_obj);
room_instance_add(argument0,352,192,ceil_obj);
room_instance_add(argument0,320,192,ceil_obj);
room_instance_add(argument0,384,192,ceil_obj);
room_instance_add(argument0,416,192,ceil_obj);
room_instance_add(argument0,288,192,ceil_obj);
room_instance_add(argument0,320,160,ceil_obj);
room_instance_add(argument0,352,160,ceil_obj);
room_instance_add(argument0,384,160,ceil_obj);
room_instance_add(argument0,416,160,ceil_obj);
room_instance_add(argument0,416,128,ceil_obj);
room_instance_add(argument0,384,128,ceil_obj);
room_instance_add(argument0,352,128,ceil_obj);
room_instance_add(argument0,320,128,ceil_obj);
room_instance_add(argument0,288,128,ceil_obj);
room_instance_add(argument0,288,160,ceil_obj);
room_instance_add(argument0,320,96,ceil_obj);
room_instance_add(argument0,352,96,ceil_obj);
room_instance_add(argument0,384,96,ceil_obj);
room_instance_add(argument0,416,96,ceil_obj);
room_instance_add(argument0,288,96,ceil_obj);
room_instance_add(argument0,352,64,ceil_obj);
room_instance_add(argument0,320,64,ceil_obj);
room_instance_add(argument0,384,64,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,160,240,wall_hor_obj);
room_instance_add(argument0,192,240,wall_hor_obj);
room_instance_add(argument0,192,272,wall_hor_obj);
room_instance_add(argument0,160,272,wall_hor_obj);
room_instance_add(argument0,224,240,wall_hor_obj);
room_instance_add(argument0,256,240,wall_hor_obj);
room_instance_add(argument0,288,304,wall_hor_obj);
room_instance_add(argument0,416,304,wall_hor_obj);
room_instance_add(argument0,416,336,wall_hor_obj);
room_instance_add(argument0,448,336,wall_hor_obj);
room_instance_add(argument0,384,336,wall_hor_obj);
room_instance_add(argument0,480,272,wall_hor_obj);
room_instance_add(argument0,512,272,wall_hor_obj);
room_instance_add(argument0,544,272,wall_hor_obj);
room_instance_add(argument0,544,240,wall_hor_obj);
room_instance_add(argument0,512,240,wall_hor_obj);
room_instance_add(argument0,480,240,wall_hor_obj);
room_instance_add(argument0,448,240,wall_hor_obj);
room_instance_add(argument0,384,240,wall_hor_obj);
room_instance_add(argument0,320,240,wall_hor_obj);
room_instance_add(argument0,256,336,wall_hor_obj);
room_instance_add(argument0,288,336,wall_hor_obj);
room_instance_add(argument0,320,336,wall_hor_obj);
room_instance_add(argument0,352,272,wall_hor_obj);
room_instance_add(argument0,224,272,wall_hor_obj);
room_instance_add(argument0,288,80,wall_hor_obj);
room_instance_add(argument0,320,48,wall_hor_obj);
room_instance_add(argument0,352,48,wall_hor_obj);
room_instance_add(argument0,384,48,wall_hor_obj);
room_instance_add(argument0,416,80,wall_hor_obj);
room_instance_add(argument0,288,208,wall_hor_obj);
room_instance_add(argument0,320,208,wall_hor_obj);
room_instance_add(argument0,384,208,wall_hor_obj);
room_instance_add(argument0,416,208,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,144,256,wall_vert_obj);
room_instance_add(argument0,560,256,wall_vert_obj);
room_instance_add(argument0,464,288,wall_vert_obj);
room_instance_add(argument0,464,320,wall_vert_obj);
room_instance_add(argument0,432,288,wall_vert_obj);
room_instance_add(argument0,432,256,wall_vert_obj);
room_instance_add(argument0,400,256,wall_vert_obj);
room_instance_add(argument0,400,288,wall_vert_obj);
room_instance_add(argument0,336,288,wall_vert_obj);
room_instance_add(argument0,368,288,wall_vert_obj);
room_instance_add(argument0,368,320,wall_vert_obj);
room_instance_add(argument0,336,320,wall_vert_obj);
room_instance_add(argument0,304,256,wall_vert_obj);
room_instance_add(argument0,304,288,wall_vert_obj);
room_instance_add(argument0,240,320,wall_vert_obj);
room_instance_add(argument0,336,224,wall_vert_obj);
room_instance_add(argument0,368,224,wall_vert_obj);
room_instance_add(argument0,272,288,wall_vert_obj);
room_instance_add(argument0,272,256,wall_vert_obj);
room_instance_add(argument0,240,288,wall_vert_obj);
room_instance_add(argument0,272,192,wall_vert_obj);
room_instance_add(argument0,272,160,wall_vert_obj);
room_instance_add(argument0,272,128,wall_vert_obj);
room_instance_add(argument0,272,96,wall_vert_obj);
room_instance_add(argument0,304,64,wall_vert_obj);
room_instance_add(argument0,400,64,wall_vert_obj);
room_instance_add(argument0,432,96,wall_vert_obj);
room_instance_add(argument0,432,128,wall_vert_obj);
room_instance_add(argument0,432,160,wall_vert_obj);
room_instance_add(argument0,432,192,wall_vert_obj);
// Torches
room_instance_add(argument0,336,224,torch_west_obj);
room_instance_add(argument0,368,224,torch_east_obj);
// Props
room_instance_add(argument0,416,192,table_obj);
room_instance_add(argument0,288,192,table_obj);
room_instance_add(argument0,336,96,blood_rand_obj);
room_instance_add(argument0,368,80,blood_rand_obj);
room_instance_add(argument0,336,72,blood_rand_obj);
room_instance_add(argument0,320,64,pc_big_obj);
room_instance_add(argument0,384,64,pc_big_obj);
room_instance_add(argument0,416,96,pc_big_obj);
room_instance_add(argument0,288,96,pc_big_obj);
room_instance_add(argument0,288,116,pc_small_obj);
room_instance_add(argument0,416,116,pc_small_obj);
// Brain
room_instance_add(argument0,352,64,brain_obj);
room_instance_add(argument0,352,64,brain_tank_obj);
