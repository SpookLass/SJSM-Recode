/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","endless","ROOM_endless");
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 48;
    global.spawn_arr[0,1] = 224;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 112;
    global.spawn_arr[1,1] = 160;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    // Marks (Slime spawners)
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
    // Not Multiplayer
    if global.player_len_var > 1
    { instance_create(160,224,endless_wall_vert_south_obj); }
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
room_instance_add(argument0,0,0,dark_color_obj);
// Floors
room_instance_add(argument0,352,608,floor_obj);
room_instance_add(argument0,352,640,floor_obj);
room_instance_add(argument0,352,672,floor_obj);
room_instance_add(argument0,48,224,floor_obj);
room_instance_add(argument0,80,224,floor_obj);
room_instance_add(argument0,112,224,floor_obj);
room_instance_add(argument0,112,192,floor_obj);
room_instance_add(argument0,112,160,floor_obj);
room_instance_add(argument0,144,224,floor_obj);
room_instance_add(argument0,176,224,floor_obj);
room_instance_add(argument0,208,224,floor_obj);
room_instance_add(argument0,240,224,floor_obj);
room_instance_add(argument0,112,256,floor_obj);
room_instance_add(argument0,112,288,floor_obj);
room_instance_add(argument0,144,288,floor_obj);
room_instance_add(argument0,144,320,floor_obj);
room_instance_add(argument0,112,320,floor_obj);
room_instance_add(argument0,80,320,floor_obj);
room_instance_add(argument0,80,288,floor_obj);
room_instance_add(argument0,80,352,floor_obj);
room_instance_add(argument0,112,352,floor_obj);
room_instance_add(argument0,144,352,floor_obj);
room_instance_add(argument0,176,352,floor_obj);
room_instance_add(argument0,176,320,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,272,224,floor_obj);
room_instance_add(argument0,304,224,floor_obj);
room_instance_add(argument0,336,224,floor_obj);
room_instance_add(argument0,368,224,floor_obj);
room_instance_add(argument0,400,224,floor_obj);
room_instance_add(argument0,432,224,floor_obj);
room_instance_add(argument0,464,224,floor_obj);
room_instance_add(argument0,496,224,floor_obj);
room_instance_add(argument0,528,224,floor_obj);
room_instance_add(argument0,560,224,floor_obj);
room_instance_add(argument0,592,224,floor_obj);
room_instance_add(argument0,624,224,floor_obj);
room_instance_add(argument0,656,224,floor_obj);
room_instance_add(argument0,688,224,floor_obj);
room_instance_add(argument0,720,224,floor_obj);
room_instance_add(argument0,752,224,floor_obj);
room_instance_add(argument0,784,224,floor_obj);
room_instance_add(argument0,816,224,floor_obj);
room_instance_add(argument0,848,224,floor_obj);
room_instance_add(argument0,880,224,floor_obj);
room_instance_add(argument0,912,224,floor_obj);
room_instance_add(argument0,944,224,floor_obj);
room_instance_add(argument0,976,224,floor_obj);
room_instance_add(argument0,1008,224,floor_obj);
room_instance_add(argument0,1040,224,floor_obj);
room_instance_add(argument0,1072,224,floor_obj);
room_instance_add(argument0,1104,224,floor_obj);
room_instance_add(argument0,1136,224,floor_obj);
// Ceilings
room_instance_add(argument0,352,608,ceil_obj);
room_instance_add(argument0,352,640,ceil_obj);
room_instance_add(argument0,352,672,ceil_obj);
room_instance_add(argument0,48,224,ceil_obj);
room_instance_add(argument0,80,224,ceil_obj);
room_instance_add(argument0,112,224,ceil_obj);
room_instance_add(argument0,112,192,ceil_obj);
room_instance_add(argument0,112,160,ceil_obj);
room_instance_add(argument0,144,224,ceil_obj);
room_instance_add(argument0,176,224,ceil_obj);
room_instance_add(argument0,208,224,ceil_obj);
room_instance_add(argument0,240,224,ceil_obj);
room_instance_add(argument0,112,256,ceil_obj);
room_instance_add(argument0,112,288,ceil_obj);
room_instance_add(argument0,144,288,ceil_obj);
room_instance_add(argument0,144,320,ceil_obj);
room_instance_add(argument0,112,320,ceil_obj);
room_instance_add(argument0,80,320,ceil_obj);
room_instance_add(argument0,80,288,ceil_obj);
room_instance_add(argument0,80,352,ceil_obj);
room_instance_add(argument0,112,352,ceil_obj);
room_instance_add(argument0,144,352,ceil_obj);
room_instance_add(argument0,176,352,ceil_obj);
room_instance_add(argument0,176,320,ceil_obj);
room_instance_add(argument0,176,288,ceil_obj);
room_instance_add(argument0,272,224,ceil_obj);
room_instance_add(argument0,304,224,ceil_obj);
room_instance_add(argument0,336,224,ceil_obj);
room_instance_add(argument0,368,224,ceil_obj);
room_instance_add(argument0,400,224,ceil_obj);
room_instance_add(argument0,432,224,ceil_obj);
room_instance_add(argument0,464,224,ceil_obj);
room_instance_add(argument0,496,224,ceil_obj);
room_instance_add(argument0,528,224,ceil_obj);
room_instance_add(argument0,560,224,ceil_obj);
room_instance_add(argument0,592,224,ceil_obj);
room_instance_add(argument0,624,224,ceil_obj);
room_instance_add(argument0,656,224,ceil_obj);
room_instance_add(argument0,688,224,ceil_obj);
room_instance_add(argument0,720,224,ceil_obj);
room_instance_add(argument0,752,224,ceil_obj);
room_instance_add(argument0,784,224,ceil_obj);
room_instance_add(argument0,816,224,ceil_obj);
room_instance_add(argument0,848,224,ceil_obj);
room_instance_add(argument0,880,224,ceil_obj);
room_instance_add(argument0,912,224,ceil_obj);
room_instance_add(argument0,944,224,ceil_obj);
room_instance_add(argument0,976,224,ceil_obj);
room_instance_add(argument0,1008,224,ceil_obj);
room_instance_add(argument0,1040,224,ceil_obj);
room_instance_add(argument0,1072,224,ceil_obj);
room_instance_add(argument0,1104,224,ceil_obj);
room_instance_add(argument0,1136,224,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,80,208,wall_hor_obj);
room_instance_add(argument0,80,240,wall_hor_obj);
room_instance_add(argument0,48,240,wall_hor_obj);
room_instance_add(argument0,48,208,wall_hor_obj);
room_instance_add(argument0,80,272,wall_hor_obj);
room_instance_add(argument0,144,272,wall_hor_obj);
room_instance_add(argument0,176,272,wall_hor_obj);
room_instance_add(argument0,176,368,wall_hor_obj);
room_instance_add(argument0,144,368,wall_hor_obj);
room_instance_add(argument0,112,368,wall_hor_obj);
room_instance_add(argument0,80,368,wall_hor_obj);
room_instance_add(argument0,112,144,wall_hor_obj);
room_instance_add(argument0,144,208,wall_hor_obj);
room_instance_add(argument0,144,240,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,256,wall_vert_obj);
room_instance_add(argument0,128,256,wall_vert_obj);
room_instance_add(argument0,96,192,wall_vert_obj);
room_instance_add(argument0,128,192,wall_vert_obj);
room_instance_add(argument0,32,224,wall_vert_obj);
room_instance_add(argument0,96,160,wall_vert_obj);
room_instance_add(argument0,128,160,wall_vert_obj);
room_instance_add(argument0,192,288,wall_vert_obj);
room_instance_add(argument0,192,320,wall_vert_obj);
room_instance_add(argument0,192,352,wall_vert_obj);
room_instance_add(argument0,64,288,wall_vert_obj);
room_instance_add(argument0,64,320,wall_vert_obj);
room_instance_add(argument0,64,352,wall_vert_obj);
// Endless Room Control
room_instance_add(argument0,1152,224,wall_inv_vert_obj);
room_instance_add(argument0,752,224,endless_ctrl_obj);
// Walls Horizontal Down
room_instance_add(argument0,176,208,endless_wall_hor_south_obj);
room_instance_add(argument0,208,208,endless_wall_hor_south_obj);
room_instance_add(argument0,240,208,endless_wall_hor_south_obj);
room_instance_add(argument0,272,208,endless_wall_hor_south_obj);
room_instance_add(argument0,304,208,endless_wall_hor_south_obj);
room_instance_add(argument0,336,208,endless_wall_hor_south_obj);
room_instance_add(argument0,368,208,endless_wall_hor_south_obj);
room_instance_add(argument0,400,208,endless_wall_hor_south_obj);
room_instance_add(argument0,432,208,endless_wall_hor_south_obj);
room_instance_add(argument0,464,208,endless_wall_hor_south_obj);
room_instance_add(argument0,496,208,endless_wall_hor_south_obj);
room_instance_add(argument0,528,208,endless_wall_hor_south_obj);
room_instance_add(argument0,560,208,endless_wall_hor_south_obj);
room_instance_add(argument0,592,208,endless_wall_hor_south_obj);
room_instance_add(argument0,624,208,endless_wall_hor_south_obj);
room_instance_add(argument0,656,208,endless_wall_hor_south_obj);
room_instance_add(argument0,688,208,endless_wall_hor_south_obj);
room_instance_add(argument0,720,208,endless_wall_hor_south_obj);
room_instance_add(argument0,752,208,endless_wall_hor_south_obj);
room_instance_add(argument0,784,208,endless_wall_hor_south_obj);
room_instance_add(argument0,816,208,endless_wall_hor_south_obj);
room_instance_add(argument0,848,208,endless_wall_hor_south_obj);
room_instance_add(argument0,880,208,endless_wall_hor_south_obj);
room_instance_add(argument0,912,208,endless_wall_hor_south_obj);
room_instance_add(argument0,944,208,endless_wall_hor_south_obj);
room_instance_add(argument0,976,208,endless_wall_hor_south_obj);
room_instance_add(argument0,1008,208,endless_wall_hor_south_obj);
room_instance_add(argument0,1040,208,endless_wall_hor_south_obj);
room_instance_add(argument0,1072,208,endless_wall_hor_south_obj);
room_instance_add(argument0,1104,208,endless_wall_hor_south_obj);
room_instance_add(argument0,1136,208,endless_wall_hor_south_obj);
// Walls Horizontal Up
room_instance_add(argument0,176,240,endless_wall_hor_north_obj);
room_instance_add(argument0,208,240,endless_wall_hor_north_obj);
room_instance_add(argument0,240,240,endless_wall_hor_north_obj);
room_instance_add(argument0,272,240,endless_wall_hor_north_obj);
room_instance_add(argument0,304,240,endless_wall_hor_north_obj);
room_instance_add(argument0,1136,240,endless_wall_hor_north_obj);
room_instance_add(argument0,1104,240,endless_wall_hor_north_obj);
room_instance_add(argument0,1072,240,endless_wall_hor_north_obj);
room_instance_add(argument0,1040,240,endless_wall_hor_north_obj);
room_instance_add(argument0,1008,240,endless_wall_hor_north_obj);
room_instance_add(argument0,976,240,endless_wall_hor_north_obj);
room_instance_add(argument0,944,240,endless_wall_hor_north_obj);
room_instance_add(argument0,912,240,endless_wall_hor_north_obj);
room_instance_add(argument0,880,240,endless_wall_hor_north_obj);
room_instance_add(argument0,848,240,endless_wall_hor_north_obj);
room_instance_add(argument0,816,240,endless_wall_hor_north_obj);
room_instance_add(argument0,784,240,endless_wall_hor_north_obj);
room_instance_add(argument0,752,240,endless_wall_hor_north_obj);
room_instance_add(argument0,720,240,endless_wall_hor_north_obj);
room_instance_add(argument0,688,240,endless_wall_hor_north_obj);
room_instance_add(argument0,656,240,endless_wall_hor_north_obj);
room_instance_add(argument0,624,240,endless_wall_hor_north_obj);
room_instance_add(argument0,336,240,endless_wall_hor_north_obj);
room_instance_add(argument0,368,240,endless_wall_hor_north_obj);
room_instance_add(argument0,400,240,endless_wall_hor_north_obj);
room_instance_add(argument0,432,240,endless_wall_hor_north_obj);
room_instance_add(argument0,464,240,endless_wall_hor_north_obj);
room_instance_add(argument0,496,240,endless_wall_hor_north_obj);
room_instance_add(argument0,528,240,endless_wall_hor_north_obj);
room_instance_add(argument0,560,240,endless_wall_hor_north_obj);
room_instance_add(argument0,592,240,endless_wall_hor_north_obj);
// Walls Vertical
room_instance_add(argument0,160,192,endless_wall_vert_south_obj);
room_instance_add(argument0,160,256,endless_wall_vert_north_obj);
// Torch
room_instance_add(argument0,1184,224,endless_torch_obj);
// Props
room_instance_add(argument0,80,368,torch_south_obj);
room_instance_add(argument0,176,368,torch_south_obj);
room_instance_add(argument0,128,320,rug_rand_rot_obj);
room_instance_add(argument0,176,288,chair_rand_obj);
room_instance_add(argument0,128,352,table_obj);