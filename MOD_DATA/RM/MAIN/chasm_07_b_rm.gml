/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Chasm Room 7 B'
    // Spawn
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 512;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 384;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 224;
    global.spawn_arr[2,1] = 304;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 0;
    global.spawn_arr[3,0] = 384;
    global.spawn_arr[3,1] = 512;
    global.spawn_arr[3,2] = 0;
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
room_instance_add(argument0,224,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,256,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,288,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,320,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,352,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,384,304,floor_bridge_fake_hor_obj);
room_instance_add(argument0,224,512,floor_bridge_hor_obj);
room_instance_add(argument0,256,512,floor_bridge_hor_obj);
room_instance_add(argument0,288,512,floor_bridge_hor_obj);
room_instance_add(argument0,320,512,floor_bridge_hor_obj);
room_instance_add(argument0,352,512,floor_bridge_hor_obj);
room_instance_add(argument0,384,512,floor_bridge_hor_obj);
// Walls (Horizontal)
room_instance_add(argument0,368,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,240,240,wall_chasm_wide_hor_obj);
room_instance_add(argument0,240,560,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,560,wall_chasm_wide_hor_obj);
room_instance_add(argument0,368,560,wall_chasm_wide_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,336,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,400,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,464,wall_chasm_wide_vert_obj);
room_instance_add(argument0,400,464,wall_chasm_wide_vert_obj);
room_instance_add(argument0,400,400,wall_chasm_wide_vert_obj);
room_instance_add(argument0,400,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,400,336,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,528,wall_chasm_wide_vert_obj);
room_instance_add(argument0,400,528,wall_chasm_wide_vert_obj);
// Rails
room_instance_add(argument0,224,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,224,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,256,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,256,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,288,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,288,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,320,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,320,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,352,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,352,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,384,288,rail_wood_fake_hor_obj);
room_instance_add(argument0,384,320,rail_wood_fake_hor_obj);
room_instance_add(argument0,224,496,rail_wood_hor_obj);
room_instance_add(argument0,224,528,rail_wood_hor_obj);
room_instance_add(argument0,256,528,rail_wood_hor_obj);
room_instance_add(argument0,256,496,rail_wood_hor_obj);
room_instance_add(argument0,288,496,rail_wood_hor_obj);
room_instance_add(argument0,288,528,rail_wood_hor_obj);
room_instance_add(argument0,320,496,rail_wood_hor_obj);
room_instance_add(argument0,320,528,rail_wood_hor_obj);
room_instance_add(argument0,352,528,rail_wood_hor_obj);
room_instance_add(argument0,352,496,rail_wood_hor_obj);
room_instance_add(argument0,384,496,rail_wood_hor_obj);
room_instance_add(argument0,384,528,rail_wood_hor_obj);
// Torches
room_instance_add(argument0,304,240,torch_north_obj);
room_instance_add(argument0,304,560,torch_south_obj);