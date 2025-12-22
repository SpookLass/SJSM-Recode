/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,
    '
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","ele","ROOM_ele");
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 48;
    global.spawn_arr[0,1] = 80;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    // Spawn 1 (exit)
    global.spawn_arr[1,0] = 112;
    global.spawn_arr[1,1] = 80;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
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
room_instance_add(argument0,0,0,amb_control_obj);
room_instance_add(argument0,0,0,ele_rock_obj);
room_instance_add(argument0,0,0,destroy_mon_obj);
// Walls (Horizontal)
room_instance_add(argument0,80,32,ele_wall_hor_obj);
room_instance_add(argument0,80,128,ele_wall_hor_obj);
room_instance_add(argument0,48,32,ele_window_hor_obj);
room_instance_add(argument0,112,32,ele_window_hor_obj);
room_instance_add(argument0,48,128,ele_window_hor_obj);
room_instance_add(argument0,112,128,ele_window_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,28,80,wall_inv_vert_obj);
room_instance_add(argument0,32,48,ele_wall_vert_obj);
room_instance_add(argument0,32,112,ele_wall_vert_obj);
room_instance_add(argument0,128,48,ele_wall_vert_obj);
room_instance_add(argument0,128,112,ele_wall_vert_obj);
room_instance_add(argument0,132,80,wall_inv_vert_obj);
// Floors
room_instance_add(argument0,48,48,ele_floor_obj);
room_instance_add(argument0,80,48,ele_floor_obj);
room_instance_add(argument0,112,48,ele_floor_obj);
room_instance_add(argument0,48,80,ele_floor_obj);
room_instance_add(argument0,80,80,ele_floor_obj);
room_instance_add(argument0,112,80,ele_floor_obj);
room_instance_add(argument0,48,112,ele_floor_obj);
room_instance_add(argument0,80,112,ele_floor_obj);
room_instance_add(argument0,112,112,ele_floor_obj);
// Ceilings
room_instance_add(argument0,48,48,ele_ceil_obj);
room_instance_add(argument0,80,48,ele_ceil_obj);
room_instance_add(argument0,112,48,ele_ceil_obj);
room_instance_add(argument0,48,80,ele_ceil_obj);
room_instance_add(argument0,80,80,ele_ceil_obj);
room_instance_add(argument0,112,80,ele_ceil_obj);
room_instance_add(argument0,48,112,ele_ceil_obj);
room_instance_add(argument0,80,112,ele_ceil_obj);
room_instance_add(argument0,112,112,ele_ceil_obj);
// Props
room_instance_add(argument0,28,80,flat_door_obj);
room_instance_add(argument0,30,80,ele_frame_01_vert_obj);
room_instance_add(argument0,32,80,ele_frame_02_vert_obj);
room_instance_add(argument0,128,80,ele_frame_02_vert_obj);
room_instance_add(argument0,130,80,ele_frame_01_vert_obj);
room_instance_add(argument0,132,80,ele_door_obj);
room_instance_add(argument0,128,102,ele_button_obj);
room_instance_add(argument0,80,40,save_ped_obj);
room_instance_add(argument0,80,40,save_cross_obj);
room_instance_add(argument0,80,120,table_note_obj);
room_instance_add(argument0,36,40,pole_metal_obj);
room_instance_add(argument0,124,40,pole_metal_obj);
room_instance_add(argument0,68,40,pole_metal_obj);
room_instance_add(argument0,92,40,pole_metal_obj);
room_instance_add(argument0,36,120,pole_metal_obj);
room_instance_add(argument0,124,120,pole_metal_obj);
room_instance_add(argument0,68,120,pole_metal_obj);
room_instance_add(argument0,92,120,pole_metal_obj);
room_instance_add(argument0,80,128,poster_01_obj);
room_instance_add(argument0,32,108,poster_02_obj);