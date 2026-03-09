/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,
    '
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","dead","ROOM_dead");
    ini_close();
    // Spawns
    global.spawn_len_var = 1;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 64;     // X
    global.spawn_arr[0,1] = 256;    // Y
    global.spawn_arr[0,2] = 0;      // Z
    global.spawn_arr[0,3] = 0;      // Angle (0 is right, 90 is up, etc)
    global.spawn_arr[0,4] = noone;
    global.spawn_arr[0,5] = noone;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
');
// Room settings
room_set_width(argument0,1280);
room_set_height(argument0,720);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Stuff
room_instance_add(argument0,1216,256,dl_dead_3d_obj);
room_instance_add(argument0,0,0,dl_dead_fog_obj);
room_instance_add(argument0,64,256,player_dead_obj);
// Floors (Kinda)
room_instance_add(argument0,64,256,dl_dead_path_obj);
room_instance_add(argument0,128,256,dl_dead_path_obj);
room_instance_add(argument0,192,256,dl_dead_path_obj);
room_instance_add(argument0,256,256,dl_dead_path_obj);
room_instance_add(argument0,320,256,dl_dead_path_obj);
room_instance_add(argument0,384,256,dl_dead_path_obj);
room_instance_add(argument0,448,256,dl_dead_path_obj);
room_instance_add(argument0,512,256,dl_dead_path_obj);
room_instance_add(argument0,576,256,dl_dead_path_obj);
room_instance_add(argument0,640,256,dl_dead_path_obj);
room_instance_add(argument0,704,256,dl_dead_path_obj);
room_instance_add(argument0,768,256,dl_dead_path_obj);
room_instance_add(argument0,832,256,dl_dead_path_obj);
room_instance_add(argument0,896,256,dl_dead_path_obj);
room_instance_add(argument0,960,256,dl_dead_path_obj);
room_instance_add(argument0,1024,256,dl_dead_path_obj);
room_instance_add(argument0,1088,256,dl_dead_path_obj);
room_instance_add(argument0,1152,256,dl_dead_path_obj);
room_instance_add(argument0,1216,256,dl_dead_path_obj);
room_instance_add(argument0,1280,256,dl_dead_path_obj);
// Walls (Vertical)
room_instance_add(argument0,32,208,spawn_wall_3high_vert_obj);
room_instance_add(argument0,32,240,spawn_wall_3high_vert_obj);
room_instance_add(argument0,32,272,spawn_wall_3high_vert_obj);
room_instance_add(argument0,32,304,spawn_wall_3high_vert_obj);
// Walls (Horizontal)
room_instance_add(argument0,48,224,wall_inv_hor_obj);
room_instance_add(argument0,48,288,wall_inv_hor_obj);
room_instance_add(argument0,80,224,wall_inv_hor_obj);
room_instance_add(argument0,80,288,wall_inv_hor_obj);
room_instance_add(argument0,112,224,wall_inv_hor_obj);
room_instance_add(argument0,112,288,wall_inv_hor_obj);
room_instance_add(argument0,144,224,wall_inv_hor_obj);
room_instance_add(argument0,144,288,wall_inv_hor_obj);
room_instance_add(argument0,176,224,wall_inv_hor_obj);
room_instance_add(argument0,176,288,wall_inv_hor_obj);
room_instance_add(argument0,208,224,wall_inv_hor_obj);
room_instance_add(argument0,208,288,wall_inv_hor_obj);
room_instance_add(argument0,240,224,wall_inv_hor_obj);
room_instance_add(argument0,240,288,wall_inv_hor_obj);
room_instance_add(argument0,272,224,wall_inv_hor_obj);
room_instance_add(argument0,272,288,wall_inv_hor_obj);
room_instance_add(argument0,304,224,wall_inv_hor_obj);
room_instance_add(argument0,304,288,wall_inv_hor_obj);
room_instance_add(argument0,336,224,wall_inv_hor_obj);
room_instance_add(argument0,336,288,wall_inv_hor_obj);
room_instance_add(argument0,368,224,wall_inv_hor_obj);
room_instance_add(argument0,368,288,wall_inv_hor_obj);
room_instance_add(argument0,400,224,wall_inv_hor_obj);
room_instance_add(argument0,400,288,wall_inv_hor_obj);
room_instance_add(argument0,432,224,wall_inv_hor_obj);
room_instance_add(argument0,432,288,wall_inv_hor_obj);
room_instance_add(argument0,464,224,wall_inv_hor_obj);
room_instance_add(argument0,464,288,wall_inv_hor_obj);
room_instance_add(argument0,496,224,wall_inv_hor_obj);
room_instance_add(argument0,496,288,wall_inv_hor_obj);
room_instance_add(argument0,528,224,wall_inv_hor_obj);
room_instance_add(argument0,528,288,wall_inv_hor_obj);
room_instance_add(argument0,560,224,wall_inv_hor_obj);
room_instance_add(argument0,560,288,wall_inv_hor_obj);
room_instance_add(argument0,592,224,wall_inv_hor_obj);
room_instance_add(argument0,592,288,wall_inv_hor_obj);
room_instance_add(argument0,624,224,wall_inv_hor_obj);
room_instance_add(argument0,624,288,wall_inv_hor_obj);
room_instance_add(argument0,656,224,wall_inv_hor_obj);
room_instance_add(argument0,656,288,wall_inv_hor_obj);
room_instance_add(argument0,688,224,wall_inv_hor_obj);
room_instance_add(argument0,688,288,wall_inv_hor_obj);
room_instance_add(argument0,720,224,wall_inv_hor_obj);
room_instance_add(argument0,720,288,wall_inv_hor_obj);
room_instance_add(argument0,752,224,wall_inv_hor_obj);
room_instance_add(argument0,752,288,wall_inv_hor_obj);
room_instance_add(argument0,784,224,wall_inv_hor_obj);
room_instance_add(argument0,784,288,wall_inv_hor_obj);
room_instance_add(argument0,816,224,wall_inv_hor_obj);
room_instance_add(argument0,816,288,wall_inv_hor_obj);
room_instance_add(argument0,848,224,wall_inv_hor_obj);
room_instance_add(argument0,848,288,wall_inv_hor_obj);
room_instance_add(argument0,880,224,wall_inv_hor_obj);
room_instance_add(argument0,880,288,wall_inv_hor_obj);
room_instance_add(argument0,912,224,wall_inv_hor_obj);
room_instance_add(argument0,912,288,wall_inv_hor_obj);
room_instance_add(argument0,944,224,wall_inv_hor_obj);
room_instance_add(argument0,944,288,wall_inv_hor_obj);
room_instance_add(argument0,976,224,wall_inv_hor_obj);
room_instance_add(argument0,976,288,wall_inv_hor_obj);
room_instance_add(argument0,1008,224,wall_inv_hor_obj);
room_instance_add(argument0,1008,288,wall_inv_hor_obj);
room_instance_add(argument0,1040,224,wall_inv_hor_obj);
room_instance_add(argument0,1040,288,wall_inv_hor_obj);
room_instance_add(argument0,1072,224,wall_inv_hor_obj);
room_instance_add(argument0,1072,288,wall_inv_hor_obj);
room_instance_add(argument0,1104,224,wall_inv_hor_obj);
room_instance_add(argument0,1104,288,wall_inv_hor_obj);
room_instance_add(argument0,1136,224,wall_inv_hor_obj);
room_instance_add(argument0,1136,288,wall_inv_hor_obj);
room_instance_add(argument0,1168,224,wall_inv_hor_obj);
room_instance_add(argument0,1168,288,wall_inv_hor_obj);
room_instance_add(argument0,1200,224,wall_inv_hor_obj);
room_instance_add(argument0,1200,288,wall_inv_hor_obj);
room_instance_add(argument0,1232,224,wall_inv_hor_obj);
room_instance_add(argument0,1232,288,wall_inv_hor_obj);
room_instance_add(argument0,1264,224,wall_inv_hor_obj);
room_instance_add(argument0,1264,288,wall_inv_hor_obj);
room_instance_add(argument0,1296,224,wall_inv_hor_obj);
room_instance_add(argument0,1296,288,wall_inv_hor_obj);