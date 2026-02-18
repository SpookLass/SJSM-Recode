/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","chasm","ROOM_chasm")+" 12";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 384;
    global.spawn_arr[1,1] = 304;
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
room_instance_add(argument0,0,0,fog_chasm_obj);
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,224,304,floor_bridge_hor_obj);
room_instance_add(argument0,256,304,floor_bridge_hor_obj);
room_instance_add(argument0,288,304,floor_bridge_hor_obj);
room_instance_add(argument0,320,304,floor_bridge_hor_obj);
room_instance_add(argument0,352,304,floor_bridge_hor_obj);
room_instance_add(argument0,384,304,floor_bridge_hor_obj);
// Walls (Horizontal)
room_instance_add(argument0,368,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,240,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,240,368,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,368,wall_chasm_wide_hor_obj);
room_instance_add(argument0,368,368,wall_chasm_wide_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,336,wall_chasm_wide_vert_obj);
room_instance_add(argument0,400,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,400,336,wall_chasm_wide_vert_obj);
// Rails
room_instance_add(argument0,224,288,rail_wood_hor_obj);
room_instance_add(argument0,224,320,rail_wood_hor_obj);
room_instance_add(argument0,256,320,rail_wood_hor_obj);
room_instance_add(argument0,256,288,rail_wood_hor_obj);
room_instance_add(argument0,288,288,rail_wood_hor_obj);
room_instance_add(argument0,288,320,rail_wood_hor_obj);
room_instance_add(argument0,320,288,rail_wood_hor_obj);
room_instance_add(argument0,320,320,rail_wood_hor_obj);
room_instance_add(argument0,352,320,rail_wood_hor_obj);
room_instance_add(argument0,352,288,rail_wood_hor_obj);
room_instance_add(argument0,384,288,rail_wood_hor_obj);
room_instance_add(argument0,384,320,rail_wood_hor_obj);
// Torches
room_instance_add(argument0,240,240,torch_north_obj);
room_instance_add(argument0,304,240,torch_north_obj);
room_instance_add(argument0,368,240,torch_north_obj);
room_instance_add(argument0,240,368,torch_south_obj);
room_instance_add(argument0,304,368,torch_south_obj);
room_instance_add(argument0,368,368,torch_south_obj);
// Jumpscare
room_instance_add(argument0,336,320,js_obj);