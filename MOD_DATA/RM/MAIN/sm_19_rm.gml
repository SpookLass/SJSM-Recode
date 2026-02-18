/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','sm','ROOM_sm')+' 19';
	ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 160;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 288;
    global.spawn_arr[1,1] = 464;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 2;
    global.mark_arr[0,0] = 256;
    global.mark_arr[0,1] = 432;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 224;
    global.mark_arr[1,1] = 464;
    global.mark_arr[1,2] = 0;
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
room_instance_add(argument0,160,432,floor_obj);
room_instance_add(argument0,192,432,floor_obj);
room_instance_add(argument0,224,432,floor_obj);
room_instance_add(argument0,224,464,floor_obj);
room_instance_add(argument0,192,464,floor_obj);
room_instance_add(argument0,160,464,floor_obj);
room_instance_add(argument0,160,496,floor_obj);
room_instance_add(argument0,192,496,floor_obj);
room_instance_add(argument0,224,496,floor_obj);
room_instance_add(argument0,256,496,floor_obj);
room_instance_add(argument0,256,464,floor_obj);
room_instance_add(argument0,256,432,floor_obj);
room_instance_add(argument0,288,432,floor_obj);
room_instance_add(argument0,288,464,floor_obj);
room_instance_add(argument0,288,496,floor_obj);
// Ceilings
room_instance_add(argument0,160,432,ceil_obj);
room_instance_add(argument0,192,432,ceil_obj);
room_instance_add(argument0,224,432,ceil_obj);
room_instance_add(argument0,224,464,ceil_obj);
room_instance_add(argument0,192,464,ceil_obj);
room_instance_add(argument0,160,464,ceil_obj);
room_instance_add(argument0,160,496,ceil_obj);
room_instance_add(argument0,192,496,ceil_obj);
room_instance_add(argument0,224,496,ceil_obj);
room_instance_add(argument0,256,496,ceil_obj);
room_instance_add(argument0,256,464,ceil_obj);
room_instance_add(argument0,256,432,ceil_obj);
room_instance_add(argument0,288,432,ceil_obj);
room_instance_add(argument0,288,464,ceil_obj);
room_instance_add(argument0,288,496,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,160,416,wall_hor_obj);
room_instance_add(argument0,192,416,wall_hor_obj);
room_instance_add(argument0,224,416,wall_hor_obj);
room_instance_add(argument0,256,416,wall_hor_obj);
room_instance_add(argument0,288,416,wall_hor_obj);
room_instance_add(argument0,288,512,wall_hor_obj);
room_instance_add(argument0,256,512,wall_hor_obj);
room_instance_add(argument0,224,512,wall_hor_obj);
room_instance_add(argument0,192,512,wall_hor_obj);
room_instance_add(argument0,160,512,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,144,432,wall_vert_obj);
room_instance_add(argument0,144,464,wall_vert_obj);
room_instance_add(argument0,144,496,wall_vert_obj);
room_instance_add(argument0,304,432,wall_vert_obj);
room_instance_add(argument0,304,464,wall_vert_obj);
room_instance_add(argument0,304,496,wall_vert_obj);
// Torches
room_instance_add(argument0,160,416,torch_north_obj);
room_instance_add(argument0,224,416,torch_north_obj);
room_instance_add(argument0,288,416,torch_north_obj);
room_instance_add(argument0,160,512,torch_south_obj);
room_instance_add(argument0,224,512,torch_south_obj);
room_instance_add(argument0,288,512,torch_south_obj);
// Props
room_instance_add(argument0,192,432,table_rand_obj);
room_instance_add(argument0,256,464,rug_rand_rot_obj);
room_instance_add(argument0,176,495,bone_rand_obj);
room_instance_add(argument0,256,416,frame_hor_rand_obj);
room_instance_add(argument0,256,512,frame_hor_rand_obj);