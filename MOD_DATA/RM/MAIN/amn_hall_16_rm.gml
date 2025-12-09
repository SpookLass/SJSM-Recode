/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","amn_hall","ROOM_amn_hall")+" 16";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 544;
    global.spawn_arr[1,1] = 352;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 5;
    global.mark_arr[0,0] = 265;
    global.mark_arr[0,1] = 355;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 322;
    global.mark_arr[1,1] = 334;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 368;
    global.mark_arr[2,1] = 319;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 372;
    global.mark_arr[3,1] = 382;
    global.mark_arr[3,2] = 0;
    global.mark_arr[4,0] = 449;
    global.mark_arr[4,1] = 361;
    global.mark_arr[4,2] = 0;
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
room_instance_add(argument0,352,352,floor_obj);
room_instance_add(argument0,384,352,floor_obj);
room_instance_add(argument0,416,352,floor_obj);
room_instance_add(argument0,448,352,floor_obj);
room_instance_add(argument0,480,352,floor_obj);
room_instance_add(argument0,512,352,floor_obj);
room_instance_add(argument0,544,352,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
room_instance_add(argument0,384,320,floor_obj);
room_instance_add(argument0,416,320,floor_obj);
room_instance_add(argument0,352,384,floor_obj);
room_instance_add(argument0,384,384,floor_obj);
room_instance_add(argument0,416,384,floor_obj);
room_instance_add(argument0,320,320,floor_obj);
room_instance_add(argument0,320,384,floor_obj);
room_instance_add(argument0,448,384,floor_obj);
room_instance_add(argument0,448,320,floor_obj);
room_instance_add(argument0,256,320,floor_obj);
room_instance_add(argument0,256,384,floor_obj);
//Ceilings
room_instance_add(argument0,224,352,ceil_obj);
room_instance_add(argument0,256,352,ceil_obj);
room_instance_add(argument0,288,352,ceil_obj);
room_instance_add(argument0,320,352,ceil_obj);
room_instance_add(argument0,352,352,ceil_obj);
room_instance_add(argument0,384,352,ceil_obj);
room_instance_add(argument0,416,352,ceil_obj);
room_instance_add(argument0,448,352,ceil_obj);
room_instance_add(argument0,480,352,ceil_obj);
room_instance_add(argument0,512,352,ceil_obj);
room_instance_add(argument0,544,352,ceil_obj);
room_instance_add(argument0,352,320,ceil_obj);
room_instance_add(argument0,384,320,ceil_obj);
room_instance_add(argument0,416,320,ceil_obj);
room_instance_add(argument0,352,384,ceil_obj);
room_instance_add(argument0,384,384,ceil_obj);
room_instance_add(argument0,416,384,ceil_obj);
room_instance_add(argument0,320,320,ceil_obj);
room_instance_add(argument0,320,384,ceil_obj);
room_instance_add(argument0,448,384,ceil_obj);
room_instance_add(argument0,448,320,ceil_obj);
room_instance_add(argument0,256,320,ceil_obj);
room_instance_add(argument0,256,384,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,336,wall_hor_obj);
room_instance_add(argument0,256,304,wall_hor_obj);
room_instance_add(argument0,288,336,wall_hor_obj);
room_instance_add(argument0,288,368,wall_hor_obj);
room_instance_add(argument0,224,368,wall_hor_obj);
room_instance_add(argument0,256,400,wall_hor_obj);
room_instance_add(argument0,320,400,wall_hor_obj);
room_instance_add(argument0,320,304,wall_hor_obj);
room_instance_add(argument0,352,304,wall_hor_obj);
room_instance_add(argument0,384,304,wall_hor_obj);
room_instance_add(argument0,416,304,wall_hor_obj);
room_instance_add(argument0,448,304,wall_hor_obj);
room_instance_add(argument0,480,336,wall_hor_obj);
room_instance_add(argument0,512,336,wall_hor_obj);
room_instance_add(argument0,544,336,wall_hor_obj);
room_instance_add(argument0,544,368,wall_hor_obj);
room_instance_add(argument0,512,368,wall_hor_obj);
room_instance_add(argument0,480,368,wall_hor_obj);
room_instance_add(argument0,448,400,wall_hor_obj);
room_instance_add(argument0,416,400,wall_hor_obj);
room_instance_add(argument0,384,400,wall_hor_obj);
room_instance_add(argument0,352,400,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,272,320,wall_vert_obj);
room_instance_add(argument0,240,320,wall_vert_obj);
room_instance_add(argument0,240,384,wall_vert_obj);
room_instance_add(argument0,272,384,wall_vert_obj);
room_instance_add(argument0,304,320,wall_vert_obj);
room_instance_add(argument0,304,384,wall_vert_obj);
room_instance_add(argument0,464,384,wall_vert_obj);
room_instance_add(argument0,464,320,wall_vert_obj);
room_instance_add(argument0,560,352,wall_vert_obj);
room_instance_add(argument0,208,352,wall_vert_obj);
// Siren
room_instance_add(argument0,256,288,siren_spawn_obj);
// Grates
room_instance_add(argument0,256,336,wall_grate_hor_obj);
room_instance_add(argument0,256,368,wall_grate_hor_obj);