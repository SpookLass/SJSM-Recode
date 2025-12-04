
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 4';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 368;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 496;
    global.spawn_arr[1,1] = 432;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    // Mark
    global.mark_len_var = 2;
    global.mark_arr[0,0] = 400;
    global.mark_arr[0,1] = 368;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 304;
    global.mark_arr[1,1] = 368;
    global.mark_arr[1,2] = 0;
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
room_instance_add(argument0,176,368,floor_obj);
room_instance_add(argument0,208,368,floor_obj);
room_instance_add(argument0,240,368,floor_obj);
room_instance_add(argument0,272,368,floor_obj);
room_instance_add(argument0,304,368,floor_obj);
room_instance_add(argument0,336,368,floor_obj);
room_instance_add(argument0,368,368,floor_obj);
room_instance_add(argument0,400,368,floor_obj);
room_instance_add(argument0,432,368,floor_obj);
room_instance_add(argument0,464,368,floor_obj);
room_instance_add(argument0,496,368,floor_obj);
room_instance_add(argument0,496,400,floor_obj);
room_instance_add(argument0,496,432,floor_obj);
// Ceils
room_instance_add(argument0,176,368,ceil_obj);
room_instance_add(argument0,208,368,ceil_obj);
room_instance_add(argument0,240,368,ceil_obj);
room_instance_add(argument0,272,368,ceil_obj);
room_instance_add(argument0,304,368,ceil_obj);
room_instance_add(argument0,336,368,ceil_obj);
room_instance_add(argument0,368,368,ceil_obj);
room_instance_add(argument0,400,368,ceil_obj);
room_instance_add(argument0,432,368,ceil_obj);
room_instance_add(argument0,464,368,ceil_obj);
room_instance_add(argument0,496,368,ceil_obj);
room_instance_add(argument0,496,400,ceil_obj);
room_instance_add(argument0,496,432,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,352,wall_hor_obj);
room_instance_add(argument0,176,384,wall_hor_obj);
room_instance_add(argument0,208,352,wall_hor_obj);
room_instance_add(argument0,240,352,wall_hor_obj);
room_instance_add(argument0,272,352,wall_hor_obj);
room_instance_add(argument0,304,352,wall_hor_obj);
room_instance_add(argument0,336,352,wall_hor_obj);
room_instance_add(argument0,368,352,wall_hor_obj);
room_instance_add(argument0,400,352,wall_hor_obj);
room_instance_add(argument0,432,352,wall_hor_obj);
room_instance_add(argument0,464,352,wall_hor_obj);
room_instance_add(argument0,496,352,wall_hor_obj);
room_instance_add(argument0,496,448,wall_hor_obj);
room_instance_add(argument0,464,384,wall_hor_obj);
room_instance_add(argument0,432,384,wall_hor_obj);
room_instance_add(argument0,400,384,wall_hor_obj);
room_instance_add(argument0,368,384,wall_hor_obj);
room_instance_add(argument0,336,384,wall_hor_obj);
room_instance_add(argument0,304,384,wall_hor_obj);
room_instance_add(argument0,272,384,wall_hor_obj);
room_instance_add(argument0,240,384,wall_hor_obj);
room_instance_add(argument0,208,384,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,368,wall_vert_obj);
room_instance_add(argument0,512,368,wall_vert_obj);
room_instance_add(argument0,512,400,wall_vert_obj);
room_instance_add(argument0,512,432,wall_vert_obj);
room_instance_add(argument0,480,400,wall_vert_obj);
room_instance_add(argument0,480,432,wall_vert_obj);
// Torches
room_instance_add(argument0,240,352,torch_north_obj);
room_instance_add(argument0,368,352,torch_north_obj);
room_instance_add(argument0,496,352,torch_north_obj);
room_instance_add(argument0,240,384,torch_south_obj);
room_instance_add(argument0,368,384,torch_south_obj);
// Props
room_instance_add(argument0,335,379,web_rand_obj);
room_instance_add(argument0,488,407,web_rand_obj);
// Jumpscare
room_instance_add(argument0,448,384,js_obj);