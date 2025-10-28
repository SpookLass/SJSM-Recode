/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Chasm Room 13 B'
    // Spawn
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = -56;
    global.spawn_arr[0,3] = 270;
    global.spawn_arr[1,0] = 352;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 224;
    global.spawn_arr[2,1] = 304;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 0;
    global.spawn_arr[3,0] = 256;
    global.spawn_arr[3,1] = 352;
    global.spawn_arr[3,2] = -56;
    global.spawn_arr[3,3] = 90;
room_instance_add(argument0,208,304,door1_fake_west);
room_instance_add(argument0,368,304,door1_vert);
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
// Floors
room_instance_add(argument0,224,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,256,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,288,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,320,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,352,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,256,256,floor_bridge_n56px_vert_obj);
room_instance_add(argument0,256,288,floor_bridge_n56px_vert_obj);
room_instance_add(argument0,256,320,floor_bridge_n56px_vert_obj);
room_instance_add(argument0,256,352,floor_bridge_n56px_vert_obj);
// Walls (Horizontal)
room_instance_add(argument0,240,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,240,368,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,368,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,368,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,368,368,wall_chasm_wide_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,336,wall_chasm_wide_vert_obj);
room_instance_add(argument0,368,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,368,336,wall_chasm_wide_vert_obj);
// Rails
room_instance_add(argument0,224,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,224,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,256,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,256,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,288,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,320,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,352,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,352,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,320,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,288,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,240,256,rail_wood_n56px_vert_obj);
room_instance_add(argument0,240,288,rail_wood_n56px_vert_obj);
room_instance_add(argument0,240,320,rail_wood_n56px_vert_obj);
room_instance_add(argument0,240,352,rail_wood_n56px_vert_obj);
room_instance_add(argument0,272,256,rail_wood_n56px_vert_obj);
room_instance_add(argument0,272,288,rail_wood_n56px_vert_obj);
room_instance_add(argument0,272,320,rail_wood_n56px_vert_obj);
room_instance_add(argument0,272,352,rail_wood_n56px_vert_obj);
// Torches