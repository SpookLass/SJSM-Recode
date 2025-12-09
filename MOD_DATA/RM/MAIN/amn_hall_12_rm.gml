/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","amn_hall","ROOM_amn_hall")+" 12";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 224;
    global.spawn_arr[1,1] = 224;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 0;
    // Mark
    global.mark_len_var = 9;
    global.mark_arr[0,0] = 246;
    global.mark_arr[0,1] = 326;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 291;
    global.mark_arr[1,1] = 382;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 333;
    global.mark_arr[2,1] = 330;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 410;
    global.mark_arr[3,1] = 354;
    global.mark_arr[3,2] = 0;
    global.mark_arr[4,0] = 454;
    global.mark_arr[4,1] = 340;
    global.mark_arr[4,2] = 0;
    global.mark_arr[5,0] = 452;
    global.mark_arr[5,1] = 223;
    global.mark_arr[5,2] = 0;
    global.mark_arr[6,0] = 378;
    global.mark_arr[6,1] = 221;
    global.mark_arr[6,2] = 0;
    global.mark_arr[7,0] = 312;
    global.mark_arr[7,1] = 196;
    global.mark_arr[7,2] = 0;
    global.mark_arr[8,0] = 269;
    global.mark_arr[8,1] = 238;
    global.mark_arr[8,2] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
');
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,224,352,floor_obj);
room_instance_add(argument0,256,352,floor_obj);
room_instance_add(argument0,288,352,floor_obj);
room_instance_add(argument0,320,352,floor_obj);
room_instance_add(argument0,224,320,floor_obj);
room_instance_add(argument0,256,320,floor_obj);
room_instance_add(argument0,224,384,floor_obj);
room_instance_add(argument0,256,384,floor_obj);
room_instance_add(argument0,288,384,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,320,320,floor_obj);
room_instance_add(argument0,320,384,floor_obj);
room_instance_add(argument0,352,384,floor_obj);
room_instance_add(argument0,352,352,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
room_instance_add(argument0,384,352,floor_obj);
room_instance_add(argument0,416,352,floor_obj);
room_instance_add(argument0,448,352,floor_obj);
room_instance_add(argument0,448,320,floor_obj);
room_instance_add(argument0,448,288,floor_obj);
room_instance_add(argument0,448,256,floor_obj);
room_instance_add(argument0,448,224,floor_obj);
room_instance_add(argument0,416,224,floor_obj);
room_instance_add(argument0,384,224,floor_obj);
room_instance_add(argument0,352,224,floor_obj);
room_instance_add(argument0,352,256,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,320,192,floor_obj);
room_instance_add(argument0,352,192,floor_obj);
room_instance_add(argument0,288,192,floor_obj);
room_instance_add(argument0,256,192,floor_obj);
room_instance_add(argument0,224,192,floor_obj);
room_instance_add(argument0,224,224,floor_obj);
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,256,416,floor_obj);
//Ceilings
room_instance_add(argument0,224,352,ceil_obj);
room_instance_add(argument0,256,352,ceil_obj);
room_instance_add(argument0,288,352,ceil_obj);
room_instance_add(argument0,320,352,ceil_obj);
room_instance_add(argument0,224,320,ceil_obj);
room_instance_add(argument0,256,320,ceil_obj);
room_instance_add(argument0,224,384,ceil_obj);
room_instance_add(argument0,256,384,ceil_obj);
room_instance_add(argument0,288,384,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
room_instance_add(argument0,320,320,ceil_obj);
room_instance_add(argument0,320,384,ceil_obj);
room_instance_add(argument0,352,384,ceil_obj);
room_instance_add(argument0,352,352,ceil_obj);
room_instance_add(argument0,352,320,ceil_obj);
room_instance_add(argument0,384,352,ceil_obj);
room_instance_add(argument0,416,352,ceil_obj);
room_instance_add(argument0,448,352,ceil_obj);
room_instance_add(argument0,448,320,ceil_obj);
room_instance_add(argument0,448,288,ceil_obj);
room_instance_add(argument0,448,256,ceil_obj);
room_instance_add(argument0,448,224,ceil_obj);
room_instance_add(argument0,416,224,ceil_obj);
room_instance_add(argument0,384,224,ceil_obj);
room_instance_add(argument0,352,224,ceil_obj);
room_instance_add(argument0,352,256,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,320,224,ceil_obj);
room_instance_add(argument0,320,192,ceil_obj);
room_instance_add(argument0,352,192,ceil_obj);
room_instance_add(argument0,288,192,ceil_obj);
room_instance_add(argument0,256,192,ceil_obj);
room_instance_add(argument0,224,192,ceil_obj);
room_instance_add(argument0,224,224,ceil_obj);
room_instance_add(argument0,224,256,ceil_obj);
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,256,224,ceil_obj);
room_instance_add(argument0,288,224,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,256,416,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,304,wall_hor_obj);
room_instance_add(argument0,224,400,wall_hor_obj);
room_instance_add(argument0,288,400,wall_hor_obj);
room_instance_add(argument0,256,432,wall_hor_obj);
room_instance_add(argument0,256,304,wall_hor_obj);
room_instance_add(argument0,288,304,wall_hor_obj);
room_instance_add(argument0,320,304,wall_hor_obj);
room_instance_add(argument0,352,304,wall_hor_obj);
room_instance_add(argument0,352,400,wall_hor_obj);
room_instance_add(argument0,320,400,wall_hor_obj);
room_instance_add(argument0,384,336,wall_hor_obj);
room_instance_add(argument0,416,336,wall_hor_obj);
room_instance_add(argument0,416,368,wall_hor_obj);
room_instance_add(argument0,384,368,wall_hor_obj);
room_instance_add(argument0,448,368,wall_hor_obj);
room_instance_add(argument0,448,208,wall_hor_obj);
room_instance_add(argument0,416,208,wall_hor_obj);
room_instance_add(argument0,384,208,wall_hor_obj);
room_instance_add(argument0,384,240,wall_hor_obj);
room_instance_add(argument0,416,240,wall_hor_obj);
room_instance_add(argument0,352,176,wall_hor_obj);
room_instance_add(argument0,320,176,wall_hor_obj);
room_instance_add(argument0,288,176,wall_hor_obj);
room_instance_add(argument0,256,176,wall_hor_obj);
room_instance_add(argument0,224,176,wall_hor_obj);
room_instance_add(argument0,224,272,wall_hor_obj);
room_instance_add(argument0,256,272,wall_hor_obj);
room_instance_add(argument0,288,272,wall_hor_obj);
room_instance_add(argument0,320,272,wall_hor_obj);
room_instance_add(argument0,352,272,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,352,wall_vert_obj);
room_instance_add(argument0,208,192,wall_vert_obj);
room_instance_add(argument0,208,224,wall_vert_obj);
room_instance_add(argument0,208,256,wall_vert_obj);
room_instance_add(argument0,208,320,wall_vert_obj);
room_instance_add(argument0,208,384,wall_vert_obj);
room_instance_add(argument0,240,416,wall_vert_obj);
room_instance_add(argument0,272,416,wall_vert_obj);
room_instance_add(argument0,368,384,wall_vert_obj);
room_instance_add(argument0,368,320,wall_vert_obj);
room_instance_add(argument0,368,256,wall_vert_obj);
room_instance_add(argument0,368,192,wall_vert_obj);
room_instance_add(argument0,464,224,wall_vert_obj);
room_instance_add(argument0,432,256,wall_vert_obj);
room_instance_add(argument0,432,288,wall_vert_obj);
room_instance_add(argument0,432,320,wall_vert_obj);
room_instance_add(argument0,464,256,wall_vert_obj);
room_instance_add(argument0,464,288,wall_vert_obj);
room_instance_add(argument0,464,320,wall_vert_obj);
room_instance_add(argument0,464,352,wall_vert_obj);
// Siren
room_instance_add(argument0,256,416,siren_spawn_obj);
// Grates
room_instance_add(argument0,256,400,wall_grate_hor_obj);