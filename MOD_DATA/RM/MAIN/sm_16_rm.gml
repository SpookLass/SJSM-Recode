/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sm','ROOM_sm')+' 16';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 320;
    global.spawn_arr[1,1] = 528;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    // Mark
    global.mark_len_var = 1;
    global.mark_arr[0,0] = 300;
    global.mark_arr[0,1] = 468;
    global.mark_arr[0,2] = 0;
    mark_create_scr();
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
room_instance_add(argument0,224,464,floor_obj);
room_instance_add(argument0,256,464,floor_obj);
room_instance_add(argument0,256,496,floor_obj);
room_instance_add(argument0,224,496,floor_obj);
room_instance_add(argument0,224,528,floor_obj);
room_instance_add(argument0,256,528,floor_obj);
room_instance_add(argument0,288,528,floor_obj);
room_instance_add(argument0,288,496,floor_obj);
room_instance_add(argument0,288,464,floor_obj);
room_instance_add(argument0,320,464,floor_obj);
room_instance_add(argument0,320,496,floor_obj);
room_instance_add(argument0,320,528,floor_obj);
// Ceilings
room_instance_add(argument0,224,464,ceil_obj);
room_instance_add(argument0,256,464,ceil_obj);
room_instance_add(argument0,256,496,ceil_obj);
room_instance_add(argument0,224,496,ceil_obj);
room_instance_add(argument0,224,528,ceil_obj);
room_instance_add(argument0,256,528,ceil_obj);
room_instance_add(argument0,288,528,ceil_obj);
room_instance_add(argument0,288,496,ceil_obj);
room_instance_add(argument0,288,464,ceil_obj);
room_instance_add(argument0,320,464,ceil_obj);
room_instance_add(argument0,320,496,ceil_obj);
room_instance_add(argument0,320,528,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,448,wall_hor_obj);
room_instance_add(argument0,256,544,wall_hor_obj);
room_instance_add(argument0,224,544,wall_hor_obj);
room_instance_add(argument0,256,448,wall_hor_obj);
room_instance_add(argument0,288,448,wall_hor_obj);
room_instance_add(argument0,320,448,wall_hor_obj);
room_instance_add(argument0,320,544,wall_hor_obj);
room_instance_add(argument0,288,544,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,464,wall_vert_obj);
room_instance_add(argument0,208,496,wall_vert_obj);
room_instance_add(argument0,208,528,wall_vert_obj);
room_instance_add(argument0,336,464,wall_vert_obj);
room_instance_add(argument0,336,496,wall_vert_obj);
room_instance_add(argument0,336,528,wall_vert_obj);
// Torches
room_instance_add(argument0,208,496,torch_west_obj);
room_instance_add(argument0,336,496,torch_east_obj);
// Props
room_instance_add(argument0,272,532,table_rand_obj);
room_instance_add(argument0,224,528,chair_rand_obj);
room_instance_add(argument0,272,448,frame_hor_rand_obj);
room_instance_add(argument0,272,512,rug_rand_rot_obj);