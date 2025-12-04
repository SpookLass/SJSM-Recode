/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 3 '+ini_read_string('ROOM','old','ROOM_old');
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 96;
    global.spawn_arr[0,1] = 384;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 224;
    global.spawn_arr[1,1] = 384;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 2;
    global.mark_arr[0,0] = 160;
    global.mark_arr[0,1] = 384;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 192;
    global.mark_arr[1,1] = 384;
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
room_instance_add(argument0,96,384,floor_obj);
room_instance_add(argument0,128,384,floor_obj);
room_instance_add(argument0,160,384,floor_obj);
room_instance_add(argument0,192,384,floor_obj);
room_instance_add(argument0,224,384,floor_obj);
room_instance_add(argument0,96,384,ceil_obj);
room_instance_add(argument0,128,384,ceil_obj);
room_instance_add(argument0,160,384,ceil_obj);
room_instance_add(argument0,192,384,ceil_obj);
room_instance_add(argument0,224,384,ceil_obj);
room_instance_add(argument0,96,376,wall_hor_obj);
room_instance_add(argument0,96,392,wall_hor_obj);
room_instance_add(argument0,128,392,wall_hor_obj);
room_instance_add(argument0,128,376,wall_hor_obj);
room_instance_add(argument0,160,376,wall_hor_obj);
room_instance_add(argument0,160,392,wall_hor_obj);
room_instance_add(argument0,192,392,wall_hor_obj);
room_instance_add(argument0,192,376,wall_hor_obj);
room_instance_add(argument0,224,376,wall_hor_obj);
room_instance_add(argument0,224,392,wall_hor_obj);
room_instance_add(argument0,240,384,wall_vert_obj);
room_instance_add(argument0,80,384,wall_vert_obj);
