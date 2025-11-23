/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sc','ROOM_sc')+' 6';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 464;
    global.spawn_arr[1,1] = 448;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 179;
    global.mark_arr[0,1] = 435;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 173;
    global.mark_arr[1,1] = 318;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 310;
    global.mark_arr[2,1] = 447;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 435;
    global.mark_arr[3,1] = 453;
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
room_instance_add(argument0,0,0,fog_close_obj);
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,112,288,floor_obj);
room_instance_add(argument0,144,288,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,176,320,floor_obj);
room_instance_add(argument0,176,352,floor_obj);
room_instance_add(argument0,176,384,floor_obj);
room_instance_add(argument0,176,416,floor_obj);
room_instance_add(argument0,176,448,floor_obj);
room_instance_add(argument0,208,448,floor_obj);
room_instance_add(argument0,240,448,floor_obj);
room_instance_add(argument0,272,448,floor_obj);
room_instance_add(argument0,304,448,floor_obj);
room_instance_add(argument0,336,448,floor_obj);
room_instance_add(argument0,368,448,floor_obj);
room_instance_add(argument0,400,448,floor_obj);
room_instance_add(argument0,304,416,floor_obj);
room_instance_add(argument0,304,384,floor_obj);
room_instance_add(argument0,304,352,floor_obj);
room_instance_add(argument0,304,320,floor_obj);
room_instance_add(argument0,432,448,floor_obj);
room_instance_add(argument0,464,448,floor_obj);
// Ceilings
room_instance_add(argument0,112,288,ceil_low_obj);
room_instance_add(argument0,144,288,ceil_low_obj);
room_instance_add(argument0,176,288,ceil_low_obj);
room_instance_add(argument0,176,320,ceil_low_obj);
room_instance_add(argument0,176,352,ceil_low_obj);
room_instance_add(argument0,176,384,ceil_low_obj);
room_instance_add(argument0,176,416,ceil_low_obj);
room_instance_add(argument0,176,448,ceil_low_obj);
room_instance_add(argument0,208,448,ceil_low_obj);
room_instance_add(argument0,240,448,ceil_low_obj);
room_instance_add(argument0,272,448,ceil_low_obj);
room_instance_add(argument0,304,448,ceil_low_obj);
room_instance_add(argument0,336,448,ceil_low_obj);
room_instance_add(argument0,368,448,ceil_low_obj);
room_instance_add(argument0,400,448,ceil_low_obj);
room_instance_add(argument0,304,416,ceil_low_obj);
room_instance_add(argument0,304,384,ceil_low_obj);
room_instance_add(argument0,304,352,ceil_low_obj);
room_instance_add(argument0,304,320,ceil_low_obj);
room_instance_add(argument0,432,448,ceil_low_obj);
room_instance_add(argument0,464,448,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,272,wall_hor_obj);
room_instance_add(argument0,112,304,wall_hor_obj);
room_instance_add(argument0,304,304,wall_hor_obj);
room_instance_add(argument0,336,432,wall_hor_obj);
room_instance_add(argument0,336,464,wall_hor_obj);
room_instance_add(argument0,368,464,wall_hor_obj);
room_instance_add(argument0,400,464,wall_hor_obj);
room_instance_add(argument0,432,464,wall_hor_obj);
room_instance_add(argument0,464,464,wall_hor_obj);
room_instance_add(argument0,464,432,wall_hor_obj);
room_instance_add(argument0,432,432,wall_hor_obj);
room_instance_add(argument0,400,432,wall_hor_obj);
room_instance_add(argument0,368,432,wall_hor_obj);
room_instance_add(argument0,304,464,wall_hor_obj);
room_instance_add(argument0,272,432,wall_hor_obj);
room_instance_add(argument0,240,432,wall_hor_obj);
room_instance_add(argument0,208,432,wall_hor_obj);
room_instance_add(argument0,208,464,wall_hor_obj);
room_instance_add(argument0,240,464,wall_hor_obj);
room_instance_add(argument0,272,464,wall_hor_obj);
room_instance_add(argument0,176,464,wall_hor_obj);
room_instance_add(argument0,176,272,wall_hor_obj);
room_instance_add(argument0,144,272,wall_hor_obj);
room_instance_add(argument0,144,304,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,288,wall_vert_obj);
room_instance_add(argument0,160,320,wall_vert_obj);
room_instance_add(argument0,160,352,wall_vert_obj);
room_instance_add(argument0,192,416,wall_vert_obj);
room_instance_add(argument0,192,384,wall_vert_obj);
room_instance_add(argument0,192,352,wall_vert_obj);
room_instance_add(argument0,192,320,wall_vert_obj);
room_instance_add(argument0,192,288,wall_vert_obj);
room_instance_add(argument0,160,384,wall_vert_obj);
room_instance_add(argument0,160,416,wall_vert_obj);
room_instance_add(argument0,160,448,wall_vert_obj);
room_instance_add(argument0,288,416,wall_vert_obj);
room_instance_add(argument0,288,384,wall_vert_obj);
room_instance_add(argument0,288,352,wall_vert_obj);
room_instance_add(argument0,288,320,wall_vert_obj);
room_instance_add(argument0,320,320,wall_vert_obj);
room_instance_add(argument0,320,352,wall_vert_obj);
room_instance_add(argument0,320,384,wall_vert_obj);
room_instance_add(argument0,320,416,wall_vert_obj);
room_instance_add(argument0,480,448,wall_vert_obj);
// Torches
// Props