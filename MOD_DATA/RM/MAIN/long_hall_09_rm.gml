/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','long','ROOM_long')+' 9';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 464;
    global.spawn_arr[1,1] = 112;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 425;
    global.mark_arr[0,1] = 140;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 439;
    global.mark_arr[1,1] = 73;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 436;
    global.mark_arr[2,1] = 289;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 284;
    global.mark_arr[3,1] = 464;
    global.mark_arr[3,2] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
")
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
room_instance_add(argument0,272,464,floor_obj);
room_instance_add(argument0,304,464,floor_obj);
room_instance_add(argument0,336,464,floor_obj);
room_instance_add(argument0,368,464,floor_obj);
room_instance_add(argument0,400,464,floor_obj);
room_instance_add(argument0,432,464,floor_obj);
room_instance_add(argument0,432,432,floor_obj);
room_instance_add(argument0,432,400,floor_obj);
room_instance_add(argument0,432,368,floor_obj);
room_instance_add(argument0,432,336,floor_obj);
room_instance_add(argument0,432,304,floor_obj);
room_instance_add(argument0,432,272,floor_obj);
room_instance_add(argument0,432,240,floor_obj);
room_instance_add(argument0,432,208,floor_obj);
room_instance_add(argument0,432,176,floor_obj);
room_instance_add(argument0,400,176,floor_obj);
room_instance_add(argument0,400,144,floor_obj);
room_instance_add(argument0,432,144,floor_obj);
room_instance_add(argument0,432,112,floor_obj);
room_instance_add(argument0,400,112,floor_obj);
room_instance_add(argument0,464,112,floor_obj);
room_instance_add(argument0,464,144,floor_obj);
room_instance_add(argument0,464,176,floor_obj);
room_instance_add(argument0,400,80,floor_obj);
room_instance_add(argument0,432,80,floor_obj);
room_instance_add(argument0,464,80,floor_obj);
room_instance_add(argument0,464,48,floor_obj);
room_instance_add(argument0,432,48,floor_obj);
room_instance_add(argument0,400,48,floor_obj);
// Ceilings
room_instance_add(argument0,112,464,ceil_obj);
room_instance_add(argument0,144,464,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,208,464,ceil_obj);
room_instance_add(argument0,240,464,ceil_obj);
room_instance_add(argument0,272,464,ceil_obj);
room_instance_add(argument0,304,464,ceil_obj);
room_instance_add(argument0,336,464,ceil_obj);
room_instance_add(argument0,368,464,ceil_obj);
room_instance_add(argument0,400,464,ceil_obj);
room_instance_add(argument0,432,464,ceil_obj);
room_instance_add(argument0,432,432,ceil_obj);
room_instance_add(argument0,432,400,ceil_obj);
room_instance_add(argument0,432,368,ceil_obj);
room_instance_add(argument0,432,336,ceil_obj);
room_instance_add(argument0,432,304,ceil_obj);
room_instance_add(argument0,432,272,ceil_obj);
room_instance_add(argument0,432,240,ceil_obj);
room_instance_add(argument0,432,208,ceil_obj);
room_instance_add(argument0,432,176,ceil_obj);
room_instance_add(argument0,400,176,ceil_obj);
room_instance_add(argument0,400,144,ceil_obj);
room_instance_add(argument0,432,144,ceil_obj);
room_instance_add(argument0,432,112,ceil_obj);
room_instance_add(argument0,400,112,ceil_obj);
room_instance_add(argument0,464,112,ceil_obj);
room_instance_add(argument0,464,144,ceil_obj);
room_instance_add(argument0,464,176,ceil_obj);
room_instance_add(argument0,400,80,ceil_obj);
room_instance_add(argument0,432,80,ceil_obj);
room_instance_add(argument0,464,80,ceil_obj);
room_instance_add(argument0,464,48,ceil_obj);
room_instance_add(argument0,432,48,ceil_obj);
room_instance_add(argument0,400,48,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,448,wall_hor_obj);
room_instance_add(argument0,112,480,wall_hor_obj);
room_instance_add(argument0,144,448,wall_hor_obj);
room_instance_add(argument0,400,448,wall_hor_obj);
room_instance_add(argument0,368,448,wall_hor_obj);
room_instance_add(argument0,336,448,wall_hor_obj);
room_instance_add(argument0,304,448,wall_hor_obj);
room_instance_add(argument0,272,448,wall_hor_obj);
room_instance_add(argument0,240,448,wall_hor_obj);
room_instance_add(argument0,208,448,wall_hor_obj);
room_instance_add(argument0,176,448,wall_hor_obj);
room_instance_add(argument0,144,480,wall_hor_obj);
room_instance_add(argument0,176,480,wall_hor_obj);
room_instance_add(argument0,208,480,wall_hor_obj);
room_instance_add(argument0,240,480,wall_hor_obj);
room_instance_add(argument0,272,480,wall_hor_obj);
room_instance_add(argument0,304,480,wall_hor_obj);
room_instance_add(argument0,336,480,wall_hor_obj);
room_instance_add(argument0,368,480,wall_hor_obj);
room_instance_add(argument0,400,480,wall_hor_obj);
room_instance_add(argument0,400,32,wall_hor_obj);
room_instance_add(argument0,400,192,wall_hor_obj);
room_instance_add(argument0,464,192,wall_hor_obj);
room_instance_add(argument0,432,480,wall_hor_obj);
room_instance_add(argument0,432,32,wall_hor_obj);
room_instance_add(argument0,464,32,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,464,wall_vert_obj);
room_instance_add(argument0,384,48,wall_vert_obj);
room_instance_add(argument0,384,80,wall_vert_obj);
room_instance_add(argument0,384,112,wall_vert_obj);
room_instance_add(argument0,384,144,wall_vert_obj);
room_instance_add(argument0,384,176,wall_vert_obj);
room_instance_add(argument0,416,208,wall_vert_obj);
room_instance_add(argument0,448,208,wall_vert_obj);
room_instance_add(argument0,480,176,wall_vert_obj);
room_instance_add(argument0,480,144,wall_vert_obj);
room_instance_add(argument0,480,112,wall_vert_obj);
room_instance_add(argument0,480,80,wall_vert_obj);
room_instance_add(argument0,480,48,wall_vert_obj);
room_instance_add(argument0,448,240,wall_vert_obj);
room_instance_add(argument0,448,272,wall_vert_obj);
room_instance_add(argument0,448,304,wall_vert_obj);
room_instance_add(argument0,448,336,wall_vert_obj);
room_instance_add(argument0,448,368,wall_vert_obj);
room_instance_add(argument0,448,400,wall_vert_obj);
room_instance_add(argument0,448,432,wall_vert_obj);
room_instance_add(argument0,448,464,wall_vert_obj);
room_instance_add(argument0,416,432,wall_vert_obj);
room_instance_add(argument0,416,400,wall_vert_obj);
room_instance_add(argument0,416,368,wall_vert_obj);
room_instance_add(argument0,416,336,wall_vert_obj);
room_instance_add(argument0,416,304,wall_vert_obj);
room_instance_add(argument0,416,272,wall_vert_obj);
room_instance_add(argument0,416,240,wall_vert_obj);
// Jumpscare
room_instance_add(argument0,392,480,js_obj);