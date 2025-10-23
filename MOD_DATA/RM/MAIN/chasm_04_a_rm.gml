/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Chasm Room 4 A'
    // Spawn
    global.spawn_len_var = 6;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 448;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 224;
    global.spawn_arr[2,1] = 272;
    global.spawn_arr[2,2] = 96;
    global.spawn_arr[2,3] = 0;
    global.spawn_arr[3,0] = 448;
    global.spawn_arr[3,1] = 272;
    global.spawn_arr[3,2] = 96;
    global.spawn_arr[3,3] = 180;
    global.spawn_arr[4,0] = 368;
    global.spawn_arr[4,1] = 192;
    global.spawn_arr[4,2] = -56;
    global.spawn_arr[4,3] = 270;
    global.spawn_arr[5,0] = 368;
    global.spawn_arr[5,1] = 416;
    global.spawn_arr[5,2] = -56;
    global.spawn_arr[5,3] = 90;
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
// Floors
room_instance_add(argument0,224,304,floor_bridge_hor_obj);
room_instance_add(argument0,256,304,floor_bridge_hor_obj);
room_instance_add(argument0,288,304,floor_bridge_hor_obj);
room_instance_add(argument0,320,304,floor_bridge_hor_obj);
room_instance_add(argument0,352,304,floor_bridge_hor_obj);
room_instance_add(argument0,384,304,floor_bridge_hor_obj);
room_instance_add(argument0,416,304,floor_bridge_hor_obj);
room_instance_add(argument0,448,304,floor_bridge_hor_obj);
room_instance_add(argument0,224,272,floor_bridge_fake_3high_hor_obj);
room_instance_add(argument0,256,272,floor_bridge_fake_3high_hor_obj);
room_instance_add(argument0,288,272,floor_bridge_fake_3high_hor_obj);
room_instance_add(argument0,320,272,floor_bridge_fake_3high_hor_obj);
room_instance_add(argument0,352,272,floor_bridge_fake_3high_hor_obj);
room_instance_add(argument0,384,272,floor_bridge_fake_3high_hor_obj);
room_instance_add(argument0,416,272,floor_bridge_fake_3high_hor_obj);
room_instance_add(argument0,448,272,floor_bridge_fake_3high_hor_obj);
room_instance_add(argument0,368,192,floor_bridge_fake_n56px_vert_obj);
room_instance_add(argument0,368,224,floor_bridge_fake_n56px_vert_obj);
room_instance_add(argument0,368,256,floor_bridge_fake_n56px_vert_obj);
room_instance_add(argument0,368,288,floor_bridge_fake_n56px_vert_obj);
room_instance_add(argument0,368,320,floor_bridge_fake_n56px_vert_obj);
room_instance_add(argument0,368,352,floor_bridge_fake_n56px_vert_obj);
room_instance_add(argument0,368,384,floor_bridge_fake_n56px_vert_obj);
room_instance_add(argument0,368,416,floor_bridge_fake_n56px_vert_obj);
// Walls (Horizontal)
room_instance_add(argument0,240,432,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,432,wall_chasm_wide_hor_obj);
room_instance_add(argument0,368,432,wall_chasm_wide_hor_obj);
room_instance_add(argument0,432,432,wall_chasm_wide_hor_obj);
room_instance_add(argument0,432,176,wall_chasm_wide_hor_obj);
room_instance_add(argument0,368,176,wall_chasm_wide_hor_obj);
room_instance_add(argument0,304,176,wall_chasm_wide_hor_obj);
room_instance_add(argument0,240,176,wall_chasm_wide_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,336,wall_chasm_wide_vert_obj);
room_instance_add(argument0,464,272,wall_chasm_wide_vert_obj);
room_instance_add(argument0,464,336,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,400,wall_chasm_wide_vert_obj);
room_instance_add(argument0,208,208,wall_chasm_wide_vert_obj);
room_instance_add(argument0,464,208,wall_chasm_wide_vert_obj);
room_instance_add(argument0,464,400,wall_chasm_wide_vert_obj);
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
room_instance_add(argument0,448,320,rail_wood_hor_obj);
room_instance_add(argument0,416,320,rail_wood_hor_obj);
room_instance_add(argument0,224,256,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,256,256,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,288,256,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,320,256,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,352,256,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,384,256,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,416,256,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,448,256,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,224,288,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,256,288,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,288,288,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,320,288,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,352,288,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,384,288,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,416,288,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,448,288,rail_wood_fake_3high_hor_obj);
room_instance_add(argument0,352,192,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,352,224,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,352,256,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,352,288,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,352,320,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,352,352,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,352,384,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,352,416,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,384,192,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,384,224,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,384,256,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,384,288,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,384,320,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,384,352,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,384,384,rail_wood_fake_n56px_vert_obj);
room_instance_add(argument0,384,416,rail_wood_fake_n56px_vert_obj);
// Torches
room_instance_add(argument0,464,272,torch_east_obj);
room_instance_add(argument0,464,336,torch_east_obj);