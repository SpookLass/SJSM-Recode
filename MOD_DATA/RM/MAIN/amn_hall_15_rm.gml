/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","amn_hall","ROOM_amn_hall")+" 15";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 224;
    global.spawn_arr[1,1] = 288;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 9;
    global.mark_arr[0,0] = 184;
    global.mark_arr[0,1] = 413;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 256;
    global.mark_arr[1,1] = 356;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 319;
    global.mark_arr[2,1] = 350;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 352;
    global.mark_arr[3,1] = 352;
    global.mark_arr[3,2] = 0;
    global.mark_arr[4,0] = 353;
    global.mark_arr[4,1] = 445;
    global.mark_arr[4,2] = 0;
    global.mark_arr[5,0] = 322;
    global.mark_arr[5,1] = 454;
    global.mark_arr[5,2] = 0;
    global.mark_arr[6,0] = 204;
    global.mark_arr[6,1] = 453;
    global.mark_arr[6,2] = 0;
    global.mark_arr[7,0] = 159;
    global.mark_arr[7,1] = 362;
    global.mark_arr[7,2] = 0;
    global.mark_arr[8,0] = 157;
    global.mark_arr[8,1] = 292;
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
room_instance_add(argument0,352,352,floor_obj);
room_instance_add(argument0,352,384,floor_obj);
room_instance_add(argument0,352,416,floor_obj);
room_instance_add(argument0,352,448,floor_obj);
room_instance_add(argument0,320,448,floor_obj);
room_instance_add(argument0,288,448,floor_obj);
room_instance_add(argument0,256,448,floor_obj);
room_instance_add(argument0,224,448,floor_obj);
room_instance_add(argument0,192,448,floor_obj);
room_instance_add(argument0,192,416,floor_obj);
room_instance_add(argument0,160,416,floor_obj);
room_instance_add(argument0,160,384,floor_obj);
room_instance_add(argument0,160,352,floor_obj);
room_instance_add(argument0,160,320,floor_obj);
room_instance_add(argument0,160,288,floor_obj);
room_instance_add(argument0,192,288,floor_obj);
room_instance_add(argument0,224,288,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
//Ceilings
room_instance_add(argument0,224,352,ceil_obj);
room_instance_add(argument0,256,352,ceil_obj);
room_instance_add(argument0,288,352,ceil_obj);
room_instance_add(argument0,320,352,ceil_obj);
room_instance_add(argument0,352,352,ceil_obj);
room_instance_add(argument0,352,384,ceil_obj);
room_instance_add(argument0,352,416,ceil_obj);
room_instance_add(argument0,352,448,ceil_obj);
room_instance_add(argument0,320,448,ceil_obj);
room_instance_add(argument0,288,448,ceil_obj);
room_instance_add(argument0,256,448,ceil_obj);
room_instance_add(argument0,224,448,ceil_obj);
room_instance_add(argument0,192,448,ceil_obj);
room_instance_add(argument0,192,416,ceil_obj);
room_instance_add(argument0,160,416,ceil_obj);
room_instance_add(argument0,160,384,ceil_obj);
room_instance_add(argument0,160,352,ceil_obj);
room_instance_add(argument0,160,320,ceil_obj);
room_instance_add(argument0,160,288,ceil_obj);
room_instance_add(argument0,192,288,ceil_obj);
room_instance_add(argument0,224,288,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,304,wall_hor_obj);
room_instance_add(argument0,224,336,wall_hor_obj);
room_instance_add(argument0,256,336,wall_hor_obj);
room_instance_add(argument0,288,304,wall_hor_obj);
room_instance_add(argument0,320,336,wall_hor_obj);
room_instance_add(argument0,320,368,wall_hor_obj);
room_instance_add(argument0,288,368,wall_hor_obj);
room_instance_add(argument0,256,368,wall_hor_obj);
room_instance_add(argument0,224,368,wall_hor_obj);
room_instance_add(argument0,224,432,wall_hor_obj);
room_instance_add(argument0,192,400,wall_hor_obj);
room_instance_add(argument0,192,464,wall_hor_obj);
room_instance_add(argument0,160,432,wall_hor_obj);
room_instance_add(argument0,160,272,wall_hor_obj);
room_instance_add(argument0,192,304,wall_hor_obj);
room_instance_add(argument0,192,272,wall_hor_obj);
room_instance_add(argument0,224,272,wall_hor_obj);
room_instance_add(argument0,352,336,wall_hor_obj);
room_instance_add(argument0,352,464,wall_hor_obj);
room_instance_add(argument0,320,464,wall_hor_obj);
room_instance_add(argument0,320,432,wall_hor_obj);
room_instance_add(argument0,288,432,wall_hor_obj);
room_instance_add(argument0,256,432,wall_hor_obj);
room_instance_add(argument0,288,464,wall_hor_obj);
room_instance_add(argument0,256,464,wall_hor_obj);
room_instance_add(argument0,224,464,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,352,wall_vert_obj);
room_instance_add(argument0,240,288,wall_vert_obj);
room_instance_add(argument0,272,320,wall_vert_obj);
room_instance_add(argument0,304,320,wall_vert_obj);
room_instance_add(argument0,368,352,wall_vert_obj);
room_instance_add(argument0,368,384,wall_vert_obj);
room_instance_add(argument0,368,416,wall_vert_obj);
room_instance_add(argument0,368,448,wall_vert_obj);
room_instance_add(argument0,336,416,wall_vert_obj);
room_instance_add(argument0,336,384,wall_vert_obj);
room_instance_add(argument0,208,416,wall_vert_obj);
room_instance_add(argument0,176,448,wall_vert_obj);
room_instance_add(argument0,176,384,wall_vert_obj);
room_instance_add(argument0,176,352,wall_vert_obj);
room_instance_add(argument0,176,320,wall_vert_obj);
room_instance_add(argument0,144,288,wall_vert_obj);
room_instance_add(argument0,144,320,wall_vert_obj);
room_instance_add(argument0,144,352,wall_vert_obj);
room_instance_add(argument0,144,384,wall_vert_obj);
room_instance_add(argument0,144,416,wall_vert_obj);
// Siren
room_instance_add(argument0,256,288,siren_spawn_obj);
// Grates
room_instance_add(argument0,288,336,wall_grate_hor_obj);