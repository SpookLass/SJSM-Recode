/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 31';
    ini_close();
    // Spawn
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 368;
    global.spawn_arr[1,1] = 336;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 240;
    global.spawn_arr[2,1] = 208;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    global.spawn_arr[3,0] = 112;
    global.spawn_arr[3,1] = 336;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 0;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 189;
    global.mark_arr[0,1] = 333;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 236;
    global.mark_arr[1,1] = 295;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 238;
    global.mark_arr[2,1] = 386;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 288;
    global.mark_arr[3,1] = 340;
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
room_instance_add(argument0,112,464,floor_obj);
room_instance_add(argument0,144,464,floor_obj);
room_instance_add(argument0,176,464,floor_obj);
room_instance_add(argument0,208,464,floor_obj);
room_instance_add(argument0,240,464,floor_obj);
room_instance_add(argument0,240,432,floor_obj);
room_instance_add(argument0,240,400,floor_obj);
room_instance_add(argument0,240,368,floor_obj);
room_instance_add(argument0,240,336,floor_obj);
room_instance_add(argument0,240,304,floor_obj);
room_instance_add(argument0,240,272,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
room_instance_add(argument0,272,336,floor_obj);
room_instance_add(argument0,304,336,floor_obj);
room_instance_add(argument0,336,336,floor_obj);
room_instance_add(argument0,208,336,floor_obj);
room_instance_add(argument0,176,336,floor_obj);
room_instance_add(argument0,144,336,floor_obj);
room_instance_add(argument0,112,336,floor_obj);
room_instance_add(argument0,240,208,floor_obj);
room_instance_add(argument0,368,336,floor_obj);
// Ceilings
room_instance_add(argument0,112,464,ceil_obj);
room_instance_add(argument0,144,464,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,208,464,ceil_obj);
room_instance_add(argument0,240,464,ceil_obj);
room_instance_add(argument0,240,432,ceil_obj);
room_instance_add(argument0,240,400,ceil_obj);
room_instance_add(argument0,240,368,ceil_obj);
room_instance_add(argument0,240,336,ceil_obj);
room_instance_add(argument0,240,304,ceil_obj);
room_instance_add(argument0,240,272,ceil_obj);
room_instance_add(argument0,240,240,ceil_obj);
room_instance_add(argument0,272,336,ceil_obj);
room_instance_add(argument0,304,336,ceil_obj);
room_instance_add(argument0,336,336,ceil_obj);
room_instance_add(argument0,208,336,ceil_obj);
room_instance_add(argument0,176,336,ceil_obj);
room_instance_add(argument0,144,336,ceil_obj);
room_instance_add(argument0,112,336,ceil_obj);
room_instance_add(argument0,240,208,ceil_obj);
room_instance_add(argument0,368,336,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,448,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
room_instance_add(argument0,144,480,wall_hor_obj);
room_instance_add(argument0,112,480,wall_hor_obj);
room_instance_add(argument0,208,352,wall_hor_obj);
room_instance_add(argument0,208,320,wall_hor_obj);
room_instance_add(argument0,176,320,wall_hor_obj);
room_instance_add(argument0,144,320,wall_hor_obj);
room_instance_add(argument0,112,320,wall_hor_obj);
room_instance_add(argument0,112,352,wall_hor_obj);
room_instance_add(argument0,144,352,wall_hor_obj);
room_instance_add(argument0,176,352,wall_hor_obj);
room_instance_add(argument0,176,448,wall_hor_obj);
room_instance_add(argument0,208,448,wall_hor_obj);
room_instance_add(argument0,208,480,wall_hor_obj);
room_instance_add(argument0,176,480,wall_hor_obj);
room_instance_add(argument0,240,480,wall_hor_obj);
room_instance_add(argument0,272,352,wall_hor_obj);
room_instance_add(argument0,272,320,wall_hor_obj);
room_instance_add(argument0,304,320,wall_hor_obj);
room_instance_add(argument0,336,320,wall_hor_obj);
room_instance_add(argument0,368,320,wall_hor_obj);
room_instance_add(argument0,368,352,wall_hor_obj);
room_instance_add(argument0,336,352,wall_hor_obj);
room_instance_add(argument0,304,352,wall_hor_obj);
room_instance_add(argument0,240,192,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,464,wall_vert_obj);
room_instance_add(argument0,224,432,wall_vert_obj);
room_instance_add(argument0,256,464,wall_vert_obj);
room_instance_add(argument0,256,432,wall_vert_obj);
room_instance_add(argument0,256,368,wall_vert_obj);
room_instance_add(argument0,256,400,wall_vert_obj);
room_instance_add(argument0,224,368,wall_vert_obj);
room_instance_add(argument0,224,400,wall_vert_obj);
room_instance_add(argument0,224,304,wall_vert_obj);
room_instance_add(argument0,256,304,wall_vert_obj);
room_instance_add(argument0,256,208,wall_vert_obj);
room_instance_add(argument0,256,240,wall_vert_obj);
room_instance_add(argument0,256,272,wall_vert_obj);
room_instance_add(argument0,224,272,wall_vert_obj);
room_instance_add(argument0,224,240,wall_vert_obj);
room_instance_add(argument0,224,208,wall_vert_obj);
room_instance_add(argument0,384,336,wall_vert_obj);
room_instance_add(argument0,96,336,wall_vert_obj);
// Torches
room_instance_add(argument0,144,320,torch_north_obj);
room_instance_add(argument0,336,320,torch_north_obj);
room_instance_add(argument0,144,352,torch_south_obj);
room_instance_add(argument0,336,352,torch_south_obj);
room_instance_add(argument0,224,432,torch_west_obj);
room_instance_add(argument0,224,240,torch_west_obj);
room_instance_add(argument0,256,432,torch_east_obj);
room_instance_add(argument0,256,240,torch_east_obj);
// Props
room_instance_add(argument0,123,334,web_rand_obj);
room_instance_add(argument0,224,265,web_rand_obj);
room_instance_add(argument0,235,336,web_rand_obj);
room_instance_add(argument0,245,457,web_rand_obj);
room_instance_add(argument0,143,457,web_rand_obj);
room_instance_add(argument0,307,326,web_rand_obj);
// Jumpscare
room_instance_add(argument0,192,480,js_obj);