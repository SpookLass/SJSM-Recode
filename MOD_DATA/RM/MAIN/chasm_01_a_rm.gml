/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Chasm Room 1 A'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 320;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
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
room_instance_add(argument0,0,0,color_control_02_obj);
// Floors
room_instance_add(argument0,224,304,floor_bridge_hor_obj);
room_instance_add(argument0,256,304,floor_bridge_hor_obj);
room_instance_add(argument0,288,304,floor_bridge_hor_obj);
room_instance_add(argument0,320,304,floor_bridge_hor_obj);
room_instance_add(argument0,304,256,floor_bridge_fake_n56px_hor_obj);
room_instance_add(argument0,272,256,floor_bridge_fake_n56px_hor_obj);
room_instance_add(argument0,240,256,floor_bridge_fake_n56px_hor_obj);
room_instance_add(argument0,208,256,floor_bridge_fake_n56px_hor_obj);
room_instance_add(argument0,288,240,floor_bridge_fake_60px_vert_obj);
room_instance_add(argument0,288,272,floor_bridge_fake_60px_vert_obj);
room_instance_add(argument0,288,304,floor_bridge_fake_60px_vert_obj);
room_instance_add(argument0,288,336,floor_bridge_fake_60px_vert_obj);
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
room_instance_add(argument0,224,288,rail_wood_hor_obj);
room_instance_add(argument0,256,288,rail_wood_hor_obj);
room_instance_add(argument0,288,288,rail_wood_hor_obj);
room_instance_add(argument0,320,288,rail_wood_hor_obj);
room_instance_add(argument0,320,320,rail_wood_hor_obj);
room_instance_add(argument0,288,320,rail_wood_hor_obj);
room_instance_add(argument0,256,320,rail_wood_hor_obj);
room_instance_add(argument0,224,320,rail_wood_hor_obj);
// Torches
room_instance_add(argument0,272,240,torch_north_obj);
room_instance_add(argument0,272,368,torch_south_obj);