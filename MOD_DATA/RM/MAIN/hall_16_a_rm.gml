/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 16 A';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 128; // 160
    global.spawn_arr[0,1] = 208;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 288;
    global.spawn_arr[1,1] = 272;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 160;
    global.mark_arr[0,1] = 240;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 160;
    global.mark_arr[1,1] = 272;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 228;
    global.mark_arr[2,1] = 269;
    global.mark_arr[2,2] = 0;
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
room_instance_add(argument0,128,208,floor_obj); // Unslammify
room_instance_add(argument0,160,208,floor_obj);
room_instance_add(argument0,160,240,floor_obj);
room_instance_add(argument0,160,272,floor_obj);
room_instance_add(argument0,192,272,floor_obj);
room_instance_add(argument0,224,272,floor_obj);
room_instance_add(argument0,256,272,floor_obj);
room_instance_add(argument0,288,272,floor_obj);
// Ceilings
room_instance_add(argument0,128,208,ceil_obj); // Unslammify
room_instance_add(argument0,160,208,ceil_obj);
room_instance_add(argument0,160,240,ceil_obj);
room_instance_add(argument0,160,272,ceil_obj);
room_instance_add(argument0,192,272,ceil_obj);
room_instance_add(argument0,224,272,ceil_obj);
room_instance_add(argument0,256,272,ceil_obj);
room_instance_add(argument0,288,272,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,128,192,wall_hor_obj); // Unslammify
room_instance_add(argument0,128,224,wall_hor_obj); // Unslammify
room_instance_add(argument0,160,192,wall_hor_obj);
room_instance_add(argument0,160,288,wall_hor_obj);
room_instance_add(argument0,192,256,wall_hor_obj);
room_instance_add(argument0,224,256,wall_hor_obj);
room_instance_add(argument0,192,288,wall_hor_obj);
room_instance_add(argument0,224,288,wall_hor_obj);
room_instance_add(argument0,256,288,wall_hor_obj);
room_instance_add(argument0,288,288,wall_hor_obj);
room_instance_add(argument0,288,256,wall_hor_obj);
room_instance_add(argument0,256,256,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,112,208,wall_vert_obj); // Unslammify
room_instance_add(argument0,176,208,wall_vert_obj);
room_instance_add(argument0,176,240,wall_vert_obj);
room_instance_add(argument0,144,240,wall_vert_obj);
room_instance_add(argument0,144,272,wall_vert_obj);
room_instance_add(argument0,304,272,wall_vert_obj);
// Torches
room_instance_add(argument0,192,256,torch_north_obj);
room_instance_add(argument0,256,256,torch_north_obj);
room_instance_add(argument0,192,288,torch_south_obj);
room_instance_add(argument0,256,288,torch_south_obj);
// Jumpscare
room_instance_add(argument0,240,288,js_obj);