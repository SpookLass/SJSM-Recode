/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","chasm","ROOM_chasm")+" 10 A";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_len_extra_var = 6;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 448;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 336;
    global.spawn_arr[2,1] = 288;
    global.spawn_arr[2,2] = 60;
    global.spawn_arr[2,3] = 270;
    global.spawn_arr[3,0] = 336;
    global.spawn_arr[3,1] = 320;
    global.spawn_arr[3,2] = 60;
    global.spawn_arr[3,3] = 90;
    global.spawn_arr[4,0] = 256;
    global.spawn_arr[4,1] = 288;
    global.spawn_arr[4,2] = -56;
    global.spawn_arr[4,3] = 270;
    global.spawn_arr[5,0] = 256;
    global.spawn_arr[5,1] = 320;
    global.spawn_arr[5,2] = -56;
    global.spawn_arr[5,3] = 90;
    // Mark
    global.mark_len_var = 0;
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
room_instance_add(argument0,416,304,floor_bridge_hor_obj);
room_instance_add(argument0,448,304,floor_bridge_hor_obj);
room_instance_add(argument0,336,288,floor_bridge_fake_60px_vert_obj);
room_instance_add(argument0,336,320,floor_bridge_fake_60px_vert_obj);
room_instance_add(argument0,256,288,floor_bridge_fake_n56px_vert_obj);
room_instance_add(argument0,256,320,floor_bridge_fake_n56px_vert_obj);
// Walls (Horizontal)
room_instance_add(argument0,240,272,wall_chasm_wide_hor_obj);
room_instance_add(argument0,240,336,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,336,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,272,wall_chasm_wide_hor_obj);
room_instance_add(argument0,368,272,wall_chasm_wide_hor_obj);
room_instance_add(argument0,368,336,wall_chasm_wide_hor_obj);
room_instance_add(argument0,432,336,wall_chasm_wide_hor_obj);
room_instance_add(argument0,432,272,wall_chasm_wide_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,304,wall_chasm_wide_vert_obj);
room_instance_add(argument0,464,304,wall_chasm_wide_vert_obj);
// Rails
room_instance_add(argument0,224,288,rail_wood_hor_obj);
room_instance_add(argument0,224,320,rail_wood_hor_obj);
room_instance_add(argument0,256,320,rail_wood_hor_obj);
room_instance_add(argument0,256,288,rail_wood_hor_obj);
room_instance_add(argument0,288,288,rail_wood_hor_obj);
room_instance_add(argument0,320,288,rail_wood_hor_obj);
room_instance_add(argument0,352,288,rail_wood_hor_obj);
room_instance_add(argument0,384,288,rail_wood_hor_obj);
room_instance_add(argument0,416,288,rail_wood_hor_obj);
room_instance_add(argument0,448,288,rail_wood_hor_obj);
room_instance_add(argument0,448,320,rail_wood_hor_obj);
room_instance_add(argument0,416,320,rail_wood_hor_obj);
room_instance_add(argument0,384,320,rail_wood_hor_obj);
room_instance_add(argument0,352,320,rail_wood_hor_obj);
room_instance_add(argument0,320,320,rail_wood_hor_obj);
room_instance_add(argument0,288,320,rail_wood_hor_obj);
room_instance_add(argument0,320,288,rail_wood_fake_60px_vert_obj);
room_instance_add(argument0,320,320,rail_wood_fake_60px_vert_obj);
room_instance_add(argument0,352,288,rail_wood_fake_60px_vert_obj);
room_instance_add(argument0,352,320,rail_wood_fake_60px_vert_obj);
room_instance_add(argument0,240,288,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,240,320,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,272,288,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,272,320,rail_wood_fake_n56px_vert_obj);
// Torches