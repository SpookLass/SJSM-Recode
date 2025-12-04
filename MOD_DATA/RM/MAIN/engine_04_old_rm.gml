/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','engine','ROOM_engine')+' 4 '+ini_read_string('ROOM','old','ROOM_old');
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 144;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 208;
    global.spawn_arr[1,1] = 384;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
")
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
room_instance_add(argument0,144,256,floor_obj);
room_instance_add(argument0,176,256,floor_obj);
room_instance_add(argument0,144,224,floor_obj);
room_instance_add(argument0,176,224,floor_obj);
room_instance_add(argument0,208,224,floor_obj);
room_instance_add(argument0,208,256,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,144,288,floor_obj);
room_instance_add(argument0,144,320,floor_obj);
room_instance_add(argument0,176,320,floor_obj);
room_instance_add(argument0,208,320,floor_obj);
room_instance_add(argument0,208,352,floor_obj);
room_instance_add(argument0,176,352,floor_obj);
room_instance_add(argument0,144,352,floor_obj);
room_instance_add(argument0,144,384,floor_obj);
room_instance_add(argument0,176,384,floor_obj);
room_instance_add(argument0,208,384,floor_obj);
room_instance_add(argument0,208,416,floor_obj);
room_instance_add(argument0,176,416,floor_obj);
room_instance_add(argument0,144,416,floor_obj);
// Ceilings
room_instance_add(argument0,144,256,ceil_obj);
room_instance_add(argument0,176,256,ceil_obj);
room_instance_add(argument0,144,224,ceil_obj);
room_instance_add(argument0,176,224,ceil_obj);
room_instance_add(argument0,208,224,ceil_obj);
room_instance_add(argument0,208,256,ceil_obj);
room_instance_add(argument0,208,288,ceil_obj);
room_instance_add(argument0,176,288,ceil_obj);
room_instance_add(argument0,144,288,ceil_obj);
room_instance_add(argument0,144,320,ceil_obj);
room_instance_add(argument0,176,320,ceil_obj);
room_instance_add(argument0,208,320,ceil_obj);
room_instance_add(argument0,208,352,ceil_obj);
room_instance_add(argument0,176,352,ceil_obj);
room_instance_add(argument0,144,352,ceil_obj);
room_instance_add(argument0,144,384,ceil_obj);
room_instance_add(argument0,176,384,ceil_obj);
room_instance_add(argument0,208,384,ceil_obj);
room_instance_add(argument0,208,416,ceil_obj);
room_instance_add(argument0,176,416,ceil_obj);
room_instance_add(argument0,144,416,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,208,wall_hor_obj);
room_instance_add(argument0,176,208,wall_hor_obj);
room_instance_add(argument0,208,208,wall_hor_obj);
room_instance_add(argument0,208,432,wall_hor_obj);
room_instance_add(argument0,176,432,wall_hor_obj);
room_instance_add(argument0,144,432,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,128,224,wall_vert_obj);
room_instance_add(argument0,128,256,wall_vert_obj);
room_instance_add(argument0,128,288,wall_vert_obj);
room_instance_add(argument0,128,320,wall_vert_obj);
room_instance_add(argument0,128,352,wall_vert_obj);
room_instance_add(argument0,128,384,wall_vert_obj);
room_instance_add(argument0,128,416,wall_vert_obj);
room_instance_add(argument0,224,416,wall_vert_obj);
room_instance_add(argument0,224,384,wall_vert_obj);
room_instance_add(argument0,224,352,wall_vert_obj);
room_instance_add(argument0,224,320,wall_vert_obj);
room_instance_add(argument0,224,288,wall_vert_obj);
room_instance_add(argument0,224,256,wall_vert_obj);
room_instance_add(argument0,224,224,wall_vert_obj);
// Engineering
room_instance_add(argument0,176,256,engine_rand_obj);
room_instance_add(argument0,176,320,engine_rand_obj);
room_instance_add(argument0,176,384,engine_rand_obj);
room_instance_add(argument0,144,224,pole_metal_obj);
room_instance_add(argument0,176,320,pole_metal_obj);
room_instance_add(argument0,176,256,pole_metal_obj);
room_instance_add(argument0,176,384,pole_metal_obj);
room_instance_add(argument0,144,416,pole_metal_obj);
room_instance_add(argument0,208,416,pole_metal_obj);
room_instance_add(argument0,208,224,pole_metal_obj);
room_instance_add(argument0,176,416,runner_obj);
room_instance_add(argument0,176,384,runner_obj);
room_instance_add(argument0,176,352,runner_obj);
room_instance_add(argument0,176,320,runner_obj);
room_instance_add(argument0,176,288,runner_obj);
room_instance_add(argument0,176,256,runner_obj);
room_instance_add(argument0,176,224,runner_obj);