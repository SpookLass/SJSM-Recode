/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 30';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 432;
    global.spawn_arr[1,1] = 464;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 168;
    global.mark_arr[0,1] = 466;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 241;
    global.mark_arr[1,1] = 456;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 319;
    global.mark_arr[2,1] = 465;
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
room_instance_add(argument0,112,464,floor_obj);
room_instance_add(argument0,144,464,floor_obj);
room_instance_add(argument0,176,464,floor_obj);
room_instance_add(argument0,208,464,floor_obj);
room_instance_add(argument0,176,432,floor_obj);
room_instance_add(argument0,176,496,floor_obj);
room_instance_add(argument0,208,496,floor_obj);
room_instance_add(argument0,208,432,floor_obj);
room_instance_add(argument0,240,464,floor_obj);
room_instance_add(argument0,240,432,floor_obj);
room_instance_add(argument0,240,496,floor_obj);
room_instance_add(argument0,272,496,floor_obj);
room_instance_add(argument0,304,496,floor_obj);
room_instance_add(argument0,336,496,floor_obj);
room_instance_add(argument0,368,496,floor_obj);
room_instance_add(argument0,368,464,floor_obj);
room_instance_add(argument0,368,432,floor_obj);
room_instance_add(argument0,400,464,floor_obj);
room_instance_add(argument0,336,432,floor_obj);
room_instance_add(argument0,304,432,floor_obj);
room_instance_add(argument0,272,432,floor_obj);
room_instance_add(argument0,272,464,floor_obj);
room_instance_add(argument0,304,464,floor_obj);
room_instance_add(argument0,336,464,floor_obj);
room_instance_add(argument0,432,464,floor_obj);
// Ceilings
room_instance_add(argument0,112,464,ceil_obj);
room_instance_add(argument0,144,464,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,208,464,ceil_obj);
room_instance_add(argument0,176,432,ceil_obj);
room_instance_add(argument0,176,496,ceil_obj);
room_instance_add(argument0,208,496,ceil_obj);
room_instance_add(argument0,208,432,ceil_obj);
room_instance_add(argument0,240,464,ceil_obj);
room_instance_add(argument0,240,432,ceil_obj);
room_instance_add(argument0,240,496,ceil_obj);
room_instance_add(argument0,272,496,ceil_obj);
room_instance_add(argument0,304,496,ceil_obj);
room_instance_add(argument0,336,496,ceil_obj);
room_instance_add(argument0,368,496,ceil_obj);
room_instance_add(argument0,368,464,ceil_obj);
room_instance_add(argument0,368,432,ceil_obj);
room_instance_add(argument0,400,464,ceil_obj);
room_instance_add(argument0,336,432,ceil_obj);
room_instance_add(argument0,304,432,ceil_obj);
room_instance_add(argument0,272,432,ceil_obj);
room_instance_add(argument0,272,464,ceil_obj);
room_instance_add(argument0,304,464,ceil_obj);
room_instance_add(argument0,336,464,ceil_obj);
room_instance_add(argument0,432,464,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,448,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
room_instance_add(argument0,144,480,wall_hor_obj);
room_instance_add(argument0,112,480,wall_hor_obj);
room_instance_add(argument0,176,416,wall_hor_obj);
room_instance_add(argument0,208,416,wall_hor_obj);
room_instance_add(argument0,240,416,wall_hor_obj);
room_instance_add(argument0,272,416,wall_hor_obj);
room_instance_add(argument0,304,416,wall_hor_obj);
room_instance_add(argument0,336,416,wall_hor_obj);
room_instance_add(argument0,368,416,wall_hor_obj);
room_instance_add(argument0,368,512,wall_hor_obj);
room_instance_add(argument0,336,512,wall_hor_obj);
room_instance_add(argument0,304,512,wall_hor_obj);
room_instance_add(argument0,272,512,wall_hor_obj);
room_instance_add(argument0,400,480,wall_hor_obj);
room_instance_add(argument0,432,480,wall_hor_obj);
room_instance_add(argument0,432,448,wall_hor_obj);
room_instance_add(argument0,400,448,wall_hor_obj);
room_instance_add(argument0,240,512,wall_hor_obj);
room_instance_add(argument0,208,512,wall_hor_obj);
room_instance_add(argument0,176,512,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,464,wall_vert_obj);
room_instance_add(argument0,160,432,wall_vert_obj);
room_instance_add(argument0,160,496,wall_vert_obj);
room_instance_add(argument0,384,432,wall_vert_obj);
room_instance_add(argument0,384,496,wall_vert_obj);
room_instance_add(argument0,448,464,wall_vert_obj);
// Torches
room_instance_add(argument0,208,416,torch_north_obj);
room_instance_add(argument0,272,416,torch_north_obj);
room_instance_add(argument0,336,416,torch_north_obj);
room_instance_add(argument0,208,512,torch_south_obj);
room_instance_add(argument0,272,512,torch_south_obj);
room_instance_add(argument0,336,512,torch_south_obj);
// Props
room_instance_add(argument0,180,433,web_rand_obj);
room_instance_add(argument0,187,482,web_rand_obj);
room_instance_add(argument0,307,468,web_rand_obj);
room_instance_add(argument0,369,447,web_rand_obj);
// Jumpscare
room_instance_add(argument0,400,480,js_obj);