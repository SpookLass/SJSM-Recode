/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","amn_hall","ROOM_amn_hall")+" 13";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 480;
    global.spawn_arr[1,1] = 352;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 8;
    global.mark_arr[0,0] = 223;
    global.mark_arr[0,1] = 404;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 250;
    global.mark_arr[1,1] = 339;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 277;
    global.mark_arr[2,1] = 410;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 236;
    global.mark_arr[3,1] = 482;
    global.mark_arr[3,2] = 0;
    global.mark_arr[4,0] = 326;
    global.mark_arr[4,1] = 450;
    global.mark_arr[4,2] = 0;
    global.mark_arr[5,0] = 341;
    global.mark_arr[5,1] = 375;
    global.mark_arr[5,2] = 0;
    global.mark_arr[6,0] = 371;
    global.mark_arr[6,1] = 318;
    global.mark_arr[6,2] = 0;
    global.mark_arr[7,0] = 428;
    global.mark_arr[7,1] = 359;
    global.mark_arr[7,2] = 0;
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
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,256,320,floor_obj);
room_instance_add(argument0,224,320,floor_obj);
room_instance_add(argument0,224,384,floor_obj);
room_instance_add(argument0,256,384,floor_obj);
room_instance_add(argument0,288,384,floor_obj);
room_instance_add(argument0,288,416,floor_obj);
room_instance_add(argument0,256,416,floor_obj);
room_instance_add(argument0,224,416,floor_obj);
room_instance_add(argument0,224,448,floor_obj);
room_instance_add(argument0,224,480,floor_obj);
room_instance_add(argument0,256,448,floor_obj);
room_instance_add(argument0,288,448,floor_obj);
room_instance_add(argument0,288,480,floor_obj);
room_instance_add(argument0,256,480,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,320,448,floor_obj);
room_instance_add(argument0,352,448,floor_obj);
room_instance_add(argument0,352,384,floor_obj);
room_instance_add(argument0,352,352,floor_obj);
room_instance_add(argument0,384,352,floor_obj);
room_instance_add(argument0,416,352,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
room_instance_add(argument0,384,320,floor_obj);
room_instance_add(argument0,416,320,floor_obj);
room_instance_add(argument0,448,320,floor_obj);
room_instance_add(argument0,480,320,floor_obj);
room_instance_add(argument0,480,352,floor_obj);
room_instance_add(argument0,448,352,floor_obj);
room_instance_add(argument0,480,384,floor_obj);
room_instance_add(argument0,448,384,floor_obj);
room_instance_add(argument0,416,384,floor_obj);
room_instance_add(argument0,384,384,floor_obj);
room_instance_add(argument0,320,384,floor_obj);
room_instance_add(argument0,320,352,floor_obj);
room_instance_add(argument0,320,320,floor_obj);
room_instance_add(argument0,352,416,floor_obj);
//Ceilings
room_instance_add(argument0,224,352,ceil_obj);
room_instance_add(argument0,256,352,ceil_obj);
room_instance_add(argument0,288,352,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
room_instance_add(argument0,256,320,ceil_obj);
room_instance_add(argument0,224,320,ceil_obj);
room_instance_add(argument0,224,384,ceil_obj);
room_instance_add(argument0,256,384,ceil_obj);
room_instance_add(argument0,288,384,ceil_obj);
room_instance_add(argument0,288,416,ceil_obj);
room_instance_add(argument0,256,416,ceil_obj);
room_instance_add(argument0,224,416,ceil_obj);
room_instance_add(argument0,224,448,ceil_obj);
room_instance_add(argument0,224,480,ceil_obj);
room_instance_add(argument0,256,448,ceil_obj);
room_instance_add(argument0,288,448,ceil_obj);
room_instance_add(argument0,288,480,ceil_obj);
room_instance_add(argument0,256,480,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,320,448,ceil_obj);
room_instance_add(argument0,352,448,ceil_obj);
room_instance_add(argument0,352,384,ceil_obj);
room_instance_add(argument0,352,352,ceil_obj);
room_instance_add(argument0,384,352,ceil_obj);
room_instance_add(argument0,416,352,ceil_obj);
room_instance_add(argument0,352,320,ceil_obj);
room_instance_add(argument0,384,320,ceil_obj);
room_instance_add(argument0,416,320,ceil_obj);
room_instance_add(argument0,448,320,ceil_obj);
room_instance_add(argument0,480,320,ceil_obj);
room_instance_add(argument0,480,352,ceil_obj);
room_instance_add(argument0,448,352,ceil_obj);
room_instance_add(argument0,480,384,ceil_obj);
room_instance_add(argument0,448,384,ceil_obj);
room_instance_add(argument0,416,384,ceil_obj);
room_instance_add(argument0,384,384,ceil_obj);
room_instance_add(argument0,320,384,ceil_obj);
room_instance_add(argument0,320,352,ceil_obj);
room_instance_add(argument0,320,320,ceil_obj);
room_instance_add(argument0,352,416,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,304,wall_hor_obj);
room_instance_add(argument0,256,272,wall_hor_obj);
room_instance_add(argument0,288,304,wall_hor_obj);
room_instance_add(argument0,320,304,wall_hor_obj);
room_instance_add(argument0,320,400,wall_hor_obj);
room_instance_add(argument0,320,432,wall_hor_obj);
room_instance_add(argument0,352,464,wall_hor_obj);
room_instance_add(argument0,320,464,wall_hor_obj);
room_instance_add(argument0,288,496,wall_hor_obj);
room_instance_add(argument0,256,496,wall_hor_obj);
room_instance_add(argument0,224,496,wall_hor_obj);
room_instance_add(argument0,384,400,wall_hor_obj);
room_instance_add(argument0,416,400,wall_hor_obj);
room_instance_add(argument0,448,400,wall_hor_obj);
room_instance_add(argument0,480,400,wall_hor_obj);
room_instance_add(argument0,480,304,wall_hor_obj);
room_instance_add(argument0,448,304,wall_hor_obj);
room_instance_add(argument0,416,304,wall_hor_obj);
room_instance_add(argument0,384,304,wall_hor_obj);
room_instance_add(argument0,352,304,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,352,wall_vert_obj);
room_instance_add(argument0,208,320,wall_vert_obj);
room_instance_add(argument0,208,384,wall_vert_obj);
room_instance_add(argument0,304,416,wall_vert_obj);
room_instance_add(argument0,304,384,wall_vert_obj);
room_instance_add(argument0,304,352,wall_vert_obj);
room_instance_add(argument0,304,320,wall_vert_obj);
room_instance_add(argument0,304,480,wall_vert_obj);
room_instance_add(argument0,336,416,wall_vert_obj);
room_instance_add(argument0,368,416,wall_vert_obj);
room_instance_add(argument0,368,448,wall_vert_obj);
room_instance_add(argument0,496,384,wall_vert_obj);
room_instance_add(argument0,496,352,wall_vert_obj);
room_instance_add(argument0,496,320,wall_vert_obj);
room_instance_add(argument0,272,288,wall_vert_obj);
room_instance_add(argument0,240,288,wall_vert_obj);
room_instance_add(argument0,208,480,wall_vert_obj);
room_instance_add(argument0,208,448,wall_vert_obj);
room_instance_add(argument0,208,416,wall_vert_obj);
// Siren
room_instance_add(argument0,256,288,siren_spawn_obj);
// Grates
room_instance_add(argument0,256,304,wall_grate_hor_obj);