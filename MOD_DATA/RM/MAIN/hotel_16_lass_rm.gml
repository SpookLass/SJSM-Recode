/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','hotel','ROOM_hotel')+' 16 Lass';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 416;
    global.spawn_arr[0,1] = 192;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 180;
    global.spawn_arr[1,0] = 416;
    global.spawn_arr[1,1] = 320;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 2;
    global.mark_arr[0,0] = 255;
    global.mark_arr[0,1] = 216;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 267;
    global.mark_arr[1,1] = 300;
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
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,256,320,floor_obj);
room_instance_add(argument0,320,320,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
room_instance_add(argument0,384,320,floor_obj);
room_instance_add(argument0,416,320,floor_obj);
room_instance_add(argument0,288,192,floor_obj);
room_instance_add(argument0,256,192,floor_obj);
room_instance_add(argument0,320,192,floor_obj);
room_instance_add(argument0,352,192,floor_obj);
room_instance_add(argument0,384,192,floor_obj);
room_instance_add(argument0,416,192,floor_obj);
// Ceilings
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,256,224,ceil_obj);
room_instance_add(argument0,288,224,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
room_instance_add(argument0,256,320,ceil_obj);
room_instance_add(argument0,320,320,ceil_obj);
room_instance_add(argument0,352,320,ceil_obj);
room_instance_add(argument0,384,320,ceil_obj);
room_instance_add(argument0,416,320,ceil_obj);
room_instance_add(argument0,288,192,ceil_obj);
room_instance_add(argument0,256,192,ceil_obj);
room_instance_add(argument0,320,192,ceil_obj);
room_instance_add(argument0,352,192,ceil_obj);
room_instance_add(argument0,384,192,ceil_obj);
room_instance_add(argument0,416,192,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,256,176,wall_hor_obj);
room_instance_add(argument0,288,176,wall_hor_obj);
room_instance_add(argument0,320,176,wall_hor_obj);
room_instance_add(argument0,352,176,wall_hor_obj);
room_instance_add(argument0,384,176,wall_hor_obj);
room_instance_add(argument0,416,176,wall_hor_obj);
room_instance_add(argument0,320,208,wall_hor_obj);
room_instance_add(argument0,352,208,wall_hor_obj);
room_instance_add(argument0,384,208,wall_hor_obj);
room_instance_add(argument0,416,208,wall_hor_obj);
room_instance_add(argument0,320,304,wall_hor_obj);
room_instance_add(argument0,352,304,wall_hor_obj);
room_instance_add(argument0,384,304,wall_hor_obj);
room_instance_add(argument0,416,304,wall_hor_obj);
room_instance_add(argument0,256,336,wall_hor_obj);
room_instance_add(argument0,288,336,wall_hor_obj);
room_instance_add(argument0,416,336,wall_hor_obj);
room_instance_add(argument0,384,336,wall_hor_obj);
room_instance_add(argument0,352,336,wall_hor_obj);
room_instance_add(argument0,320,336,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,432,192,wall_vert_obj);
room_instance_add(argument0,304,224,wall_vert_obj);
room_instance_add(argument0,304,256,wall_vert_obj);
room_instance_add(argument0,304,288,wall_vert_obj);
room_instance_add(argument0,432,320,wall_vert_obj);
room_instance_add(argument0,240,320,wall_vert_obj);
room_instance_add(argument0,240,288,wall_vert_obj);
room_instance_add(argument0,240,256,wall_vert_obj);
room_instance_add(argument0,240,224,wall_vert_obj);
room_instance_add(argument0,240,192,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,304,192,doorframe_01_vert_obj);
room_instance_add(argument0,304,320,doorframe_01_vert_obj);
room_instance_add(argument0,304,192,doorframe_02_vert_obj);
room_instance_add(argument0,304,320,doorframe_02_vert_obj);