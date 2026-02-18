/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","chasm","ROOM_chasm")+" 16 B";
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_len_extra_var = 6;
    global.spawn_arr[0,0] = 432;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = -56;
    global.spawn_arr[0,3] = 270;
    global.spawn_arr[1,0] = 704;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 224;
    global.spawn_arr[2,1] = 304;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 0;
    global.spawn_arr[3,0] = 432;
    global.spawn_arr[3,1] = 352;
    global.spawn_arr[3,2] = -56;
    global.spawn_arr[3,3] = 90;
    global.spawn_arr[4,0] = 496;
    global.spawn_arr[4,1] = 256;
    global.spawn_arr[4,2] = -56;
    global.spawn_arr[4,3] = 270;
    global.spawn_arr[5,0] = 496;
    global.spawn_arr[5,1] = 352;
    global.spawn_arr[5,2] = -56;
    global.spawn_arr[5,3] = 90;
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
room_instance_add(argument0,224,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,256,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,288,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,320,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,352,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,384,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,416,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,448,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,480,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,512,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,544,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,576,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,608,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,640,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,672,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,704,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,432,352,floor_bridge_n56px_vert_obj);
room_instance_add(argument0,432,320,floor_bridge_n56px_vert_obj);
room_instance_add(argument0,432,288,floor_bridge_n56px_vert_obj);
room_instance_add(argument0,432,256,floor_bridge_n56px_vert_obj);
room_instance_add(argument0,496,256,floor_bridge_fake_n56px_vert_obj);
room_instance_add(argument0,496,288,floor_bridge_fake_n56px_vert_obj);
room_instance_add(argument0,496,320,floor_bridge_fake_n56px_vert_obj);
room_instance_add(argument0,496,352,floor_bridge_fake_n56px_vert_obj);
// Walls (Horizontal)
room_instance_add(argument0,240,336,wall_chasm_wide_hor_obj);
room_instance_add(argument0,240,272,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,272,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,336,wall_chasm_wide_hor_obj);
room_instance_add(argument0,368,368,wall_chasm_wide_hor_obj);
room_instance_add(argument0,432,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,432,368,wall_chasm_wide_hor_obj);
room_instance_add(argument0,496,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,496,368,wall_chasm_wide_hor_obj);
room_instance_add(argument0,560,368,wall_chasm_wide_hor_obj);
room_instance_add(argument0,560,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,624,272,wall_chasm_wide_hor_obj);
room_instance_add(argument0,624,336,wall_chasm_wide_hor_obj);
room_instance_add(argument0,688,272,wall_chasm_wide_hor_obj);
room_instance_add(argument0,688,336,wall_chasm_wide_hor_obj);
room_instance_add(argument0,368,240,wall_chasm_wide_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,304,wall_chasm_wide_vert_obj);
room_instance_add(argument0,336,240,wall_chasm_wide_vert_obj);
room_instance_add(argument0,336,368,wall_chasm_wide_vert_obj);
room_instance_add(argument0,592,368,wall_chasm_wide_vert_obj);
room_instance_add(argument0,720,304,wall_chasm_wide_vert_obj);
room_instance_add(argument0,592,240,wall_chasm_wide_vert_obj);
// Rails
room_instance_add(argument0,224,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,224,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,256,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,256,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,288,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,288,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,320,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,320,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,352,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,352,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,384,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,384,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,416,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,416,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,448,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,448,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,480,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,480,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,512,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,512,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,544,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,544,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,576,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,576,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,608,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,608,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,640,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,640,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,672,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,672,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,704,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,704,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,416,352,rail_wood_n56px_vert_obj);
room_instance_add(argument0,416,320,rail_wood_n56px_vert_obj);
room_instance_add(argument0,416,288,rail_wood_n56px_vert_obj);
room_instance_add(argument0,416,256,rail_wood_n56px_vert_obj);
room_instance_add(argument0,448,352,rail_wood_n56px_vert_obj);
room_instance_add(argument0,448,320,rail_wood_n56px_vert_obj);
room_instance_add(argument0,448,288,rail_wood_n56px_vert_obj);
room_instance_add(argument0,448,256,rail_wood_n56px_vert_obj);
room_instance_add(argument0,480,256,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,480,288,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,480,320,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,480,352,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,512,256,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,512,288,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,512,320,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,512,352,rail_wood_fake_n56px_vert_obj);
// Torches
room_instance_add(argument0,400,240,torch_north_obj);
room_instance_add(argument0,528,240,torch_north_obj);
room_instance_add(argument0,464,240,torch_north_obj);
room_instance_add(argument0,400,368,torch_south_obj);
room_instance_add(argument0,464,368,torch_south_obj);
room_instance_add(argument0,528,368,torch_south_obj);
// Jumpscare
room_instance_add(argument0,368,320,js_obj);