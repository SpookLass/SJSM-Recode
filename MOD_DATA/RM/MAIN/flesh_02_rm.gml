/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','flesh','ROOM_flesh')+' 2';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 464;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 848;
    global.spawn_arr[1,1] = 352;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = -1;
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,464,352,floor_obj);
room_instance_add(argument0,496,352,floor_obj);
room_instance_add(argument0,528,352,floor_obj);
room_instance_add(argument0,560,352,floor_obj);
room_instance_add(argument0,592,352,floor_obj);
room_instance_add(argument0,624,352,floor_obj);
room_instance_add(argument0,656,352,floor_obj);
room_instance_add(argument0,688,352,floor_obj);
room_instance_add(argument0,720,352,floor_obj);
room_instance_add(argument0,752,352,floor_obj);
room_instance_add(argument0,784,352,floor_obj);
room_instance_add(argument0,816,352,floor_obj);
room_instance_add(argument0,848,352,floor_obj);
// Ceilings
room_instance_add(argument0,464,352,ceil_obj);
room_instance_add(argument0,496,352,ceil_obj);
room_instance_add(argument0,528,352,ceil_obj);
room_instance_add(argument0,560,352,ceil_obj);
room_instance_add(argument0,592,352,ceil_obj);
room_instance_add(argument0,624,352,ceil_obj);
room_instance_add(argument0,656,352,ceil_obj);
room_instance_add(argument0,688,352,ceil_obj);
room_instance_add(argument0,720,352,ceil_obj);
room_instance_add(argument0,752,352,ceil_obj);
room_instance_add(argument0,784,352,ceil_obj);
room_instance_add(argument0,816,352,ceil_obj);
room_instance_add(argument0,848,352,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,464,368,wall_hor_obj);
room_instance_add(argument0,464,336,wall_hor_obj);
room_instance_add(argument0,496,336,wall_hor_obj);
room_instance_add(argument0,592,336,wall_hor_obj);
room_instance_add(argument0,560,336,wall_hor_obj);
room_instance_add(argument0,496,368,wall_hor_obj);
room_instance_add(argument0,528,368,wall_hor_obj);
room_instance_add(argument0,560,368,wall_hor_obj);
room_instance_add(argument0,592,368,wall_hor_obj);
room_instance_add(argument0,528,336,wall_hor_obj);
room_instance_add(argument0,624,368,wall_hor_obj);
room_instance_add(argument0,848,368,wall_hor_obj);
room_instance_add(argument0,848,336,wall_hor_obj);
room_instance_add(argument0,816,336,wall_hor_obj);
room_instance_add(argument0,784,336,wall_hor_obj);
room_instance_add(argument0,752,336,wall_hor_obj);
room_instance_add(argument0,720,336,wall_hor_obj);
room_instance_add(argument0,688,336,wall_hor_obj);
room_instance_add(argument0,656,336,wall_hor_obj);
room_instance_add(argument0,624,336,wall_hor_obj);
room_instance_add(argument0,656,368,wall_hor_obj);
room_instance_add(argument0,688,368,wall_hor_obj);
room_instance_add(argument0,720,368,wall_hor_obj);
room_instance_add(argument0,752,368,wall_hor_obj);
room_instance_add(argument0,784,368,wall_hor_obj);
room_instance_add(argument0,816,368,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,448,352,wall_vert_obj);
room_instance_add(argument0,864,352,wall_vert_obj);