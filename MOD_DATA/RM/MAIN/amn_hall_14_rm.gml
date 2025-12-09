/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","amn_hall","ROOM_amn_hall")+" 14";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 288;
    global.spawn_arr[1,1] = 224;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 7;
    global.mark_arr[0,0] = 272;
    global.mark_arr[0,1] = 347;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 330;
    global.mark_arr[1,1] = 352;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 322;
    global.mark_arr[2,1] = 302;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 376;
    global.mark_arr[3,1] = 285;
    global.mark_arr[3,2] = 0;
    global.mark_arr[4,0] = 270;
    global.mark_arr[4,1] = 284;
    global.mark_arr[4,2] = 0;
    global.mark_arr[5,0] = 218;
    global.mark_arr[5,1] = 280;
    global.mark_arr[5,2] = 0;
    global.mark_arr[6,0] = 240;
    global.mark_arr[6,1] = 219;
    global.mark_arr[6,2] = 0;
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
room_instance_add(argument0,352,288,floor_obj);
room_instance_add(argument0,256,384,floor_obj);
room_instance_add(argument0,320,320,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,384,288,floor_obj);
room_instance_add(argument0,384,320,floor_obj);
room_instance_add(argument0,384,352,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,224,288,floor_obj);
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,224,224,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
//Ceilings
room_instance_add(argument0,224,352,ceil_obj);
room_instance_add(argument0,256,352,ceil_obj);
room_instance_add(argument0,288,352,ceil_obj);
room_instance_add(argument0,320,352,ceil_obj);
room_instance_add(argument0,352,352,ceil_obj);
room_instance_add(argument0,352,288,ceil_obj);
room_instance_add(argument0,256,384,ceil_obj);
room_instance_add(argument0,320,320,ceil_obj);
room_instance_add(argument0,320,288,ceil_obj);
room_instance_add(argument0,384,288,ceil_obj);
room_instance_add(argument0,384,320,ceil_obj);
room_instance_add(argument0,384,352,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,224,288,ceil_obj);
room_instance_add(argument0,224,256,ceil_obj);
room_instance_add(argument0,224,224,ceil_obj);
room_instance_add(argument0,256,224,ceil_obj);
room_instance_add(argument0,288,224,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,304,wall_hor_obj);
room_instance_add(argument0,256,304,wall_hor_obj);
room_instance_add(argument0,288,304,wall_hor_obj);
room_instance_add(argument0,288,336,wall_hor_obj);
room_instance_add(argument0,256,336,wall_hor_obj);
room_instance_add(argument0,224,336,wall_hor_obj);
room_instance_add(argument0,224,368,wall_hor_obj);
room_instance_add(argument0,288,368,wall_hor_obj);
room_instance_add(argument0,256,400,wall_hor_obj);
room_instance_add(argument0,352,304,wall_hor_obj);
room_instance_add(argument0,352,336,wall_hor_obj);
room_instance_add(argument0,384,368,wall_hor_obj);
room_instance_add(argument0,352,368,wall_hor_obj);
room_instance_add(argument0,320,368,wall_hor_obj);
room_instance_add(argument0,384,272,wall_hor_obj);
room_instance_add(argument0,352,272,wall_hor_obj);
room_instance_add(argument0,320,272,wall_hor_obj);
room_instance_add(argument0,288,272,wall_hor_obj);
room_instance_add(argument0,256,272,wall_hor_obj);
room_instance_add(argument0,256,240,wall_hor_obj);
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,288,208,wall_hor_obj);
room_instance_add(argument0,256,208,wall_hor_obj);
room_instance_add(argument0,224,208,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,352,wall_vert_obj);
room_instance_add(argument0,208,224,wall_vert_obj);
room_instance_add(argument0,304,224,wall_vert_obj);
room_instance_add(argument0,240,256,wall_vert_obj);
room_instance_add(argument0,208,256,wall_vert_obj);
room_instance_add(argument0,208,288,wall_vert_obj);
room_instance_add(argument0,304,320,wall_vert_obj);
room_instance_add(argument0,336,320,wall_vert_obj);
room_instance_add(argument0,368,320,wall_vert_obj);
room_instance_add(argument0,400,288,wall_vert_obj);
room_instance_add(argument0,400,320,wall_vert_obj);
room_instance_add(argument0,400,352,wall_vert_obj);
room_instance_add(argument0,272,384,wall_vert_obj);
room_instance_add(argument0,240,384,wall_vert_obj);
// Siren
room_instance_add(argument0,256,416,siren_spawn_obj);
// Grates
room_instance_add(argument0,256,368,wall_grate_hor_obj);