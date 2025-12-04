/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 9 B';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 96;
    global.spawn_arr[0,1] = 432;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 416;
    global.spawn_arr[1,1] = 432;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 160;
    global.mark_arr[0,1] = 416;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 224;
    global.mark_arr[1,1] = 448;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 288;
    global.mark_arr[2,1] = 432;
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
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,128,432,floor_obj);
room_instance_add(argument0,160,432,floor_obj);
room_instance_add(argument0,160,400,floor_obj);
room_instance_add(argument0,160,464,floor_obj);
room_instance_add(argument0,192,400,floor_obj);
room_instance_add(argument0,224,400,floor_obj);
room_instance_add(argument0,224,432,floor_obj);
room_instance_add(argument0,192,432,floor_obj);
room_instance_add(argument0,192,464,floor_obj);
room_instance_add(argument0,224,464,floor_obj);
room_instance_add(argument0,256,432,floor_obj);
room_instance_add(argument0,288,432,floor_obj);
room_instance_add(argument0,288,400,floor_obj);
room_instance_add(argument0,320,400,floor_obj);
room_instance_add(argument0,352,400,floor_obj);
room_instance_add(argument0,352,432,floor_obj);
room_instance_add(argument0,320,432,floor_obj);
room_instance_add(argument0,288,464,floor_obj);
room_instance_add(argument0,320,464,floor_obj);
room_instance_add(argument0,352,464,floor_obj);
room_instance_add(argument0,384,432,floor_obj);
room_instance_add(argument0,416,432,floor_obj);
room_instance_add(argument0,96,432,floor_obj);
// Ceilings
room_instance_add(argument0,128,432,ceil_obj);
room_instance_add(argument0,160,432,ceil_obj);
room_instance_add(argument0,160,400,ceil_obj);
room_instance_add(argument0,160,464,ceil_obj);
room_instance_add(argument0,192,400,ceil_obj);
room_instance_add(argument0,224,400,ceil_obj);
room_instance_add(argument0,224,432,ceil_obj);
room_instance_add(argument0,192,432,ceil_obj);
room_instance_add(argument0,192,464,ceil_obj);
room_instance_add(argument0,224,464,ceil_obj);
room_instance_add(argument0,256,432,ceil_obj);
room_instance_add(argument0,288,432,ceil_obj);
room_instance_add(argument0,288,400,ceil_obj);
room_instance_add(argument0,320,400,ceil_obj);
room_instance_add(argument0,352,400,ceil_obj);
room_instance_add(argument0,352,432,ceil_obj);
room_instance_add(argument0,320,432,ceil_obj);
room_instance_add(argument0,288,464,ceil_obj);
room_instance_add(argument0,320,464,ceil_obj);
room_instance_add(argument0,352,464,ceil_obj);
room_instance_add(argument0,384,432,ceil_obj);
room_instance_add(argument0,416,432,ceil_obj);
room_instance_add(argument0,96,432,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,96,416,wall_hor_obj);
room_instance_add(argument0,128,416,wall_hor_obj);
room_instance_add(argument0,128,448,wall_hor_obj);
room_instance_add(argument0,96,448,wall_hor_obj);
room_instance_add(argument0,160,480,wall_hor_obj);
room_instance_add(argument0,192,480,wall_hor_obj);
room_instance_add(argument0,224,480,wall_hor_obj);
room_instance_add(argument0,256,448,wall_hor_obj);
room_instance_add(argument0,288,480,wall_hor_obj);
room_instance_add(argument0,320,480,wall_hor_obj);
room_instance_add(argument0,352,480,wall_hor_obj);
room_instance_add(argument0,384,448,wall_hor_obj);
room_instance_add(argument0,416,448,wall_hor_obj);
room_instance_add(argument0,416,416,wall_hor_obj);
room_instance_add(argument0,384,416,wall_hor_obj);
room_instance_add(argument0,352,384,wall_hor_obj);
room_instance_add(argument0,320,384,wall_hor_obj);
room_instance_add(argument0,288,384,wall_hor_obj);
room_instance_add(argument0,224,384,wall_hor_obj);
room_instance_add(argument0,256,416,wall_hor_obj);
room_instance_add(argument0,192,384,wall_hor_obj);
room_instance_add(argument0,160,384,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,80,432,wall_vert_obj);
room_instance_add(argument0,144,400,wall_vert_obj);
room_instance_add(argument0,144,464,wall_vert_obj);
room_instance_add(argument0,240,464,wall_vert_obj);
room_instance_add(argument0,240,400,wall_vert_obj);
room_instance_add(argument0,272,400,wall_vert_obj);
room_instance_add(argument0,272,464,wall_vert_obj);
room_instance_add(argument0,368,464,wall_vert_obj);
room_instance_add(argument0,368,400,wall_vert_obj);
room_instance_add(argument0,432,432,wall_vert_obj);
// Props
room_instance_add(argument0,230,391,web_rand_obj);
room_instance_add(argument0,279,406,web_rand_obj);
room_instance_add(argument0,366,470,web_rand_obj);
room_instance_add(argument0,192,432,rug_rand_rot_obj);
room_instance_add(argument0,320,432,rug_rand_rot_obj);
// Jumpscare
room_instance_add(argument0,400,448,js_obj);