/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Chasm Room 8 A'
    // Spawn
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 832;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 224;
    global.spawn_arr[2,1] = 432;
    global.spawn_arr[2,2] = 60;
    global.spawn_arr[2,3] = 0;
    global.spawn_arr[3,0] = 832;
    global.spawn_arr[3,1] = 432;
    global.spawn_arr[3,2] = 60;
    global.spawn_arr[3,3] = 180;
    // Mark
    global.mark_len_var = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    local.entrance = instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),door_entrance_obj);
    local.entrance.z = global.spawn_arr[0,2];
    local.entrance.direction = global.spawn_arr[0,3]+180;
    for (local.i=1; local.i<global.spawn_len_var; local.i+=1;)
    {
        local.exitdoor = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),door_obj);
        local.exitdoor.direction = global.spawn_arr[local.i,3]+180; local.exitdoor.z = global.spawn_arr[local.i,2];
        local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),door_trig_obj);
        local.exittrig.z = global.spawn_arr[local.i,2];
    }
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
room_instance_add(argument0,224,304,floor_bridge_hor_obj);
room_instance_add(argument0,256,304,floor_bridge_hor_obj);
room_instance_add(argument0,288,304,floor_bridge_hor_obj);
room_instance_add(argument0,320,304,floor_bridge_hor_obj);
room_instance_add(argument0,352,304,floor_bridge_hor_obj);
room_instance_add(argument0,384,304,floor_bridge_hor_obj);
room_instance_add(argument0,416,304,floor_bridge_hor_obj);
room_instance_add(argument0,448,304,floor_bridge_hor_obj);
room_instance_add(argument0,480,304,floor_bridge_hor_obj);
room_instance_add(argument0,512,304,floor_bridge_hor_obj);
room_instance_add(argument0,544,304,floor_bridge_hor_obj);
room_instance_add(argument0,576,304,floor_bridge_hor_obj);
room_instance_add(argument0,608,304,floor_bridge_hor_obj);
room_instance_add(argument0,640,304,floor_bridge_hor_obj);
room_instance_add(argument0,672,304,floor_bridge_hor_obj);
room_instance_add(argument0,704,304,floor_bridge_hor_obj);
room_instance_add(argument0,736,304,floor_bridge_hor_obj);
room_instance_add(argument0,768,304,floor_bridge_hor_obj);
room_instance_add(argument0,800,304,floor_bridge_hor_obj);
room_instance_add(argument0,832,304,floor_bridge_hor_obj);
room_instance_add(argument0,224,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,256,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,288,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,320,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,352,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,384,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,416,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,448,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,480,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,512,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,544,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,576,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,608,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,640,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,672,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,704,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,736,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,768,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,800,432,floor_bridge_fake_60px_hor_obj);
room_instance_add(argument0,832,432,floor_bridge_fake_60px_hor_obj);
// Walls (Horizontal)
room_instance_add(argument0,368,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,240,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,496,wall_chasm_wide_hor_obj);
room_instance_add(argument0,432,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,496,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,560,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,624,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,240,496,wall_chasm_wide_hor_obj);
room_instance_add(argument0,368,496,wall_chasm_wide_hor_obj);
room_instance_add(argument0,432,496,wall_chasm_wide_hor_obj);
room_instance_add(argument0,496,496,wall_chasm_wide_hor_obj);
room_instance_add(argument0,560,496,wall_chasm_wide_hor_obj);
room_instance_add(argument0,624,496,wall_chasm_wide_hor_obj);
room_instance_add(argument0,688,496,wall_chasm_wide_hor_obj);
room_instance_add(argument0,688,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,752,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,752,496,wall_chasm_wide_hor_obj);
room_instance_add(argument0,816,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,816,496,wall_chasm_wide_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,336,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,400,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,464,wall_chasm_wide_vert_obj);
room_instance_add(argument0,848,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,848,336,wall_chasm_wide_vert_obj);
room_instance_add(argument0,848,400,wall_chasm_wide_vert_obj);
room_instance_add(argument0,848,464,wall_chasm_wide_vert_obj);
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
room_instance_add(argument0,416,288,rail_wood_hor_obj);
room_instance_add(argument0,448,288,rail_wood_hor_obj);
room_instance_add(argument0,480,288,rail_wood_hor_obj);
room_instance_add(argument0,512,288,rail_wood_hor_obj);
room_instance_add(argument0,544,288,rail_wood_hor_obj);
room_instance_add(argument0,576,288,rail_wood_hor_obj);
room_instance_add(argument0,608,288,rail_wood_hor_obj);
room_instance_add(argument0,640,288,rail_wood_hor_obj);
room_instance_add(argument0,672,288,rail_wood_hor_obj);
room_instance_add(argument0,704,288,rail_wood_hor_obj);
room_instance_add(argument0,736,288,rail_wood_hor_obj);
room_instance_add(argument0,768,288,rail_wood_hor_obj);
room_instance_add(argument0,800,288,rail_wood_hor_obj);
room_instance_add(argument0,832,288,rail_wood_hor_obj);
room_instance_add(argument0,832,320,rail_wood_hor_obj);
room_instance_add(argument0,800,320,rail_wood_hor_obj);
room_instance_add(argument0,768,320,rail_wood_hor_obj);
room_instance_add(argument0,736,320,rail_wood_hor_obj);
room_instance_add(argument0,704,320,rail_wood_hor_obj);
room_instance_add(argument0,672,320,rail_wood_hor_obj);
room_instance_add(argument0,640,320,rail_wood_hor_obj);
room_instance_add(argument0,608,320,rail_wood_hor_obj);
room_instance_add(argument0,576,320,rail_wood_hor_obj);
room_instance_add(argument0,544,320,rail_wood_hor_obj);
room_instance_add(argument0,512,320,rail_wood_hor_obj);
room_instance_add(argument0,480,320,rail_wood_hor_obj);
room_instance_add(argument0,448,320,rail_wood_hor_obj);
room_instance_add(argument0,416,320,rail_wood_hor_obj);

room_instance_add(argument0,224,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,224,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,256,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,256,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,288,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,288,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,320,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,320,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,352,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,352,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,384,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,384,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,416,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,448,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,480,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,512,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,544,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,576,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,608,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,640,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,672,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,704,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,736,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,768,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,800,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,832,416,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,832,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,800,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,768,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,736,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,704,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,672,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,640,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,608,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,576,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,544,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,512,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,480,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,448,448,rail_wood_fake_60px_hor_obj);
room_instance_add(argument0,416,448,rail_wood_fake_60px_hor_obj);
// Torches
room_instance_add(argument0,304,240,torch_north_obj);
room_instance_add(argument0,528,240,torch_north_obj);
room_instance_add(argument0,752,240,torch_north_obj);
room_instance_add(argument0,304,496,torch_south_obj);
room_instance_add(argument0,528,496,torch_south_obj);
room_instance_add(argument0,752,496,torch_south_obj);