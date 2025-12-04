/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','hotel','ROOM_hotel')+' 12';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 480;
    global.spawn_arr[1,1] = 384;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 2;
    global.mark_arr[0,0] = 320;
    global.mark_arr[0,1] = 400;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 352;
    global.mark_arr[1,1] = 352;
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
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,352,288,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
room_instance_add(argument0,352,352,floor_obj);
room_instance_add(argument0,320,352,floor_obj);
room_instance_add(argument0,384,352,floor_obj);
room_instance_add(argument0,384,384,floor_obj);
room_instance_add(argument0,352,384,floor_obj);
room_instance_add(argument0,320,384,floor_obj);
room_instance_add(argument0,320,416,floor_obj);
room_instance_add(argument0,352,416,floor_obj);
room_instance_add(argument0,384,416,floor_obj);
room_instance_add(argument0,416,384,floor_obj);
room_instance_add(argument0,448,384,floor_obj);
room_instance_add(argument0,480,384,floor_obj);
// Ceilings
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,352,256,ceil_obj);
room_instance_add(argument0,352,288,ceil_obj);
room_instance_add(argument0,352,320,ceil_obj);
room_instance_add(argument0,352,352,ceil_obj);
room_instance_add(argument0,320,352,ceil_obj);
room_instance_add(argument0,384,352,ceil_obj);
room_instance_add(argument0,384,384,ceil_obj);
room_instance_add(argument0,352,384,ceil_obj);
room_instance_add(argument0,320,384,ceil_obj);
room_instance_add(argument0,320,416,ceil_obj);
room_instance_add(argument0,352,416,ceil_obj);
room_instance_add(argument0,384,416,ceil_obj);
room_instance_add(argument0,416,384,ceil_obj);
room_instance_add(argument0,448,384,ceil_obj);
room_instance_add(argument0,480,384,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,256,272,wall_hor_obj);
room_instance_add(argument0,288,272,wall_hor_obj);
room_instance_add(argument0,320,272,wall_hor_obj);
room_instance_add(argument0,320,336,wall_hor_obj);
room_instance_add(argument0,384,336,wall_hor_obj);
room_instance_add(argument0,384,432,wall_hor_obj);
room_instance_add(argument0,352,432,wall_hor_obj);
room_instance_add(argument0,320,432,wall_hor_obj);
room_instance_add(argument0,416,368,wall_hor_obj);
room_instance_add(argument0,448,368,wall_hor_obj);
room_instance_add(argument0,480,368,wall_hor_obj);
room_instance_add(argument0,480,400,wall_hor_obj);
room_instance_add(argument0,448,400,wall_hor_obj);
room_instance_add(argument0,416,400,wall_hor_obj);
room_instance_add(argument0,352,240,wall_hor_obj);
room_instance_add(argument0,320,240,wall_hor_obj);
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,256,240,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,256,wall_vert_obj);
room_instance_add(argument0,336,320,wall_vert_obj);
room_instance_add(argument0,336,288,wall_vert_obj);
room_instance_add(argument0,368,320,wall_vert_obj);
room_instance_add(argument0,496,384,wall_vert_obj);
room_instance_add(argument0,400,352,wall_vert_obj);
room_instance_add(argument0,400,416,wall_vert_obj);
room_instance_add(argument0,304,416,wall_vert_obj);
room_instance_add(argument0,304,384,wall_vert_obj);
room_instance_add(argument0,304,352,wall_vert_obj);
room_instance_add(argument0,368,288,wall_vert_obj);
room_instance_add(argument0,368,256,wall_vert_obj);
// Props
room_instance_add(argument0,400,384,doorframe_01_vert_obj);
room_instance_add(argument0,400,384,doorframe_02_vert_obj);
// Jumpscare
room_instance_add(argument0,432,400,js_obj);