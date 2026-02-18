/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,'
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","flesh","ROOM_flesh")+" 6";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 464;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 752;
    global.spawn_arr[1,1] = 224;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
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
room_instance_add(argument0,464,352,floor_obj);
room_instance_add(argument0,496,352,floor_obj);
room_instance_add(argument0,528,352,floor_obj);
room_instance_add(argument0,560,352,floor_obj);
room_instance_add(argument0,592,352,floor_obj);
room_instance_add(argument0,592,320,floor_obj);
room_instance_add(argument0,592,288,floor_obj);
room_instance_add(argument0,560,288,floor_obj);
room_instance_add(argument0,560,256,floor_obj);
room_instance_add(argument0,560,224,floor_obj);
room_instance_add(argument0,592,224,floor_obj);
room_instance_add(argument0,624,224,floor_obj);
room_instance_add(argument0,656,224,floor_obj);
room_instance_add(argument0,688,224,floor_obj);
room_instance_add(argument0,720,224,floor_obj);
room_instance_add(argument0,752,224,floor_obj);
room_instance_add(argument0,688,256,floor_obj);
room_instance_add(argument0,688,288,floor_obj);
room_instance_add(argument0,656,288,floor_obj);
// Ceilings
room_instance_add(argument0,464,352,ceil_obj);
room_instance_add(argument0,496,352,ceil_obj);
room_instance_add(argument0,528,352,ceil_obj);
room_instance_add(argument0,560,352,ceil_obj);
room_instance_add(argument0,592,352,ceil_obj);
room_instance_add(argument0,592,320,ceil_obj);
room_instance_add(argument0,592,288,ceil_obj);
room_instance_add(argument0,560,288,ceil_obj);
room_instance_add(argument0,560,256,ceil_obj);
room_instance_add(argument0,560,224,ceil_obj);
room_instance_add(argument0,592,224,ceil_obj);
room_instance_add(argument0,624,224,ceil_obj);
room_instance_add(argument0,656,224,ceil_obj);
room_instance_add(argument0,688,224,ceil_obj);
room_instance_add(argument0,720,224,ceil_obj);
room_instance_add(argument0,752,224,ceil_obj);
room_instance_add(argument0,688,256,ceil_obj);
room_instance_add(argument0,688,288,ceil_obj);
room_instance_add(argument0,656,288,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,464,368,wall_hor_obj);
room_instance_add(argument0,464,336,wall_hor_obj);
room_instance_add(argument0,496,336,wall_hor_obj);
room_instance_add(argument0,560,336,wall_hor_obj);
room_instance_add(argument0,528,368,wall_hor_obj);
room_instance_add(argument0,560,368,wall_hor_obj);
room_instance_add(argument0,528,336,wall_hor_obj);
room_instance_add(argument0,656,272,wall_hor_obj);
room_instance_add(argument0,592,272,wall_hor_obj);
room_instance_add(argument0,560,304,wall_hor_obj);
room_instance_add(argument0,656,304,wall_hor_obj);
room_instance_add(argument0,688,304,wall_hor_obj);
room_instance_add(argument0,720,240,wall_hor_obj);
room_instance_add(argument0,752,240,wall_hor_obj);
room_instance_add(argument0,752,208,wall_hor_obj);
room_instance_add(argument0,720,208,wall_hor_obj);
room_instance_add(argument0,688,208,wall_hor_obj);
room_instance_add(argument0,656,208,wall_hor_obj);
room_instance_add(argument0,592,208,wall_hor_obj);
room_instance_add(argument0,560,208,wall_hor_obj);
room_instance_add(argument0,592,240,wall_hor_obj);
room_instance_add(argument0,624,240,wall_hor_obj);
room_instance_add(argument0,656,240,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,672,256,wall_vert_obj);
room_instance_add(argument0,704,288,wall_vert_obj);
room_instance_add(argument0,768,224,wall_vert_obj);
room_instance_add(argument0,544,224,wall_vert_obj);
room_instance_add(argument0,544,256,wall_vert_obj);
room_instance_add(argument0,544,288,wall_vert_obj);
room_instance_add(argument0,608,288,wall_vert_obj);
room_instance_add(argument0,576,320,wall_vert_obj);
room_instance_add(argument0,608,352,wall_vert_obj);
room_instance_add(argument0,448,352,wall_vert_obj);
// Walls Mon (Horizontal)
room_instance_add(argument0,624,208,wall_mon_hor_obj);
room_instance_add(argument0,592,368,wall_mon_hor_obj);
room_instance_add(argument0,496,368,wall_mon_hor_obj);
// Walls Mon (Vertical)
room_instance_add(argument0,640,288,wall_mon_vert_obj);
room_instance_add(argument0,704,256,wall_mon_vert_obj);
room_instance_add(argument0,576,256,wall_mon_vert_obj);
room_instance_add(argument0,608,320,wall_mon_vert_obj);
// Props
room_instance_add(argument0,688,224,flesh_arrow_obj);