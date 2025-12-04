/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Chasm Room 1 B'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_len_extra_var = 6;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 272;
    global.spawn_arr[0,2] = -56;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 320;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 224;
    global.spawn_arr[2,1] = 304;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 0;
    global.spawn_arr[3,0] = 320;
    global.spawn_arr[3,1] = 272;
    global.spawn_arr[3,2] = -56;
    global.spawn_arr[3,3] = 180;
    global.spawn_arr[4,0] = 304;
    global.spawn_arr[4,1] = 256;
    global.spawn_arr[4,2] = 60;
    global.spawn_arr[4,3] = 270;
    global.spawn_arr[5,0] = 304;
    global.spawn_arr[5,1] = 352;
    global.spawn_arr[5,2] = 60;
    global.spawn_arr[5,3] = 90;
    // Mark
    global.mark_len_var = 0;
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
room_instance_add(argument0,224,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,256,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,288,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,320,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,320,272,floor_bridge_n56px_hor_obj);
room_instance_add(argument0,288,272,floor_bridge_n56px_hor_obj);
room_instance_add(argument0,256,272,floor_bridge_n56px_hor_obj);
room_instance_add(argument0,224,272,floor_bridge_n56px_hor_obj);
room_instance_add(argument0,304,256,floor_bridge_fake_60px_vert_obj);
room_instance_add(argument0,304,288,floor_bridge_fake_60px_vert_obj);
room_instance_add(argument0,304,320,floor_bridge_fake_60px_vert_obj);
room_instance_add(argument0,304,352,floor_bridge_fake_60px_vert_obj);
// Walls (Horizontal)
room_instance_add(argument0,240,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,240,368,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,368,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,240,wall_chasm_wide_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,336,wall_chasm_wide_vert_obj);
room_instance_add(argument0,336,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,336,336,wall_chasm_wide_vert_obj);
// Rails
room_instance_add(argument0,224,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,256,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,288,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,320,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,320,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,288,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,256,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,224,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,320,256,rail_wood_n56px_hor_obj);
room_instance_add(argument0,288,256,rail_wood_n56px_hor_obj);
room_instance_add(argument0,256,256,rail_wood_n56px_hor_obj);
room_instance_add(argument0,224,256,rail_wood_n56px_hor_obj);
room_instance_add(argument0,320,288,rail_wood_n56px_hor_obj);
room_instance_add(argument0,288,288,rail_wood_n56px_hor_obj);
room_instance_add(argument0,256,288,rail_wood_n56px_hor_obj);
room_instance_add(argument0,224,288,rail_wood_n56px_hor_obj);
room_instance_add(argument0,288,256,rail_wood_fake_60px_vert_obj);
room_instance_add(argument0,288,288,rail_wood_fake_60px_vert_obj);
room_instance_add(argument0,288,320,rail_wood_fake_60px_vert_obj);
room_instance_add(argument0,288,352,rail_wood_fake_60px_vert_obj);
room_instance_add(argument0,320,256,rail_wood_fake_60px_vert_obj);
room_instance_add(argument0,320,288,rail_wood_fake_60px_vert_obj);
room_instance_add(argument0,320,320,rail_wood_fake_60px_vert_obj);
room_instance_add(argument0,320,352,rail_wood_fake_60px_vert_obj);
// Torches
room_instance_add(argument0,272,240,torch_north_obj);
room_instance_add(argument0,272,368,torch_south_obj);