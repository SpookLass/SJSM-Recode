/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 26'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 400;
    global.spawn_arr[1,1] = 464;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 272;
    global.mark_arr[0,1] = 448;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 304;
    global.mark_arr[1,1] = 480;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 368;
    global.mark_arr[2,1] = 448;
    global.mark_arr[2,2] = 0;
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
        local.exitdoor.direction = global.spawn_arr[local.i,3]+180;
        local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),door_trig_obj);
        local.exittrig.z = global.spawn_arr[local.i,2];
    }
")
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
room_instance_add(argument0,176,448,floor_obj);
room_instance_add(argument0,208,448,floor_obj);
room_instance_add(argument0,240,448,floor_obj);
room_instance_add(argument0,272,448,floor_obj);
room_instance_add(argument0,304,448,floor_obj);
room_instance_add(argument0,336,448,floor_obj);
room_instance_add(argument0,368,448,floor_obj);
room_instance_add(argument0,400,448,floor_obj);
room_instance_add(argument0,176,480,floor_obj);
room_instance_add(argument0,208,480,floor_obj);
room_instance_add(argument0,240,480,floor_obj);
room_instance_add(argument0,272,480,floor_obj);
room_instance_add(argument0,304,480,floor_obj);
room_instance_add(argument0,336,480,floor_obj);
room_instance_add(argument0,368,480,floor_obj);
room_instance_add(argument0,400,480,floor_obj);
// Ceilings
room_instance_add(argument0,176,448,ceil_obj);
room_instance_add(argument0,208,448,ceil_obj);
room_instance_add(argument0,240,448,ceil_obj);
room_instance_add(argument0,272,448,ceil_obj);
room_instance_add(argument0,304,448,ceil_obj);
room_instance_add(argument0,336,448,ceil_obj);
room_instance_add(argument0,368,448,ceil_obj);
room_instance_add(argument0,400,448,ceil_obj);
room_instance_add(argument0,176,480,ceil_obj);
room_instance_add(argument0,208,480,ceil_obj);
room_instance_add(argument0,240,480,ceil_obj);
room_instance_add(argument0,272,480,ceil_obj);
room_instance_add(argument0,304,480,ceil_obj);
room_instance_add(argument0,336,480,ceil_obj);
room_instance_add(argument0,368,480,ceil_obj);
room_instance_add(argument0,400,480,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,432,wall_hor_obj);
room_instance_add(argument0,208,432,wall_hor_obj);
room_instance_add(argument0,240,432,wall_hor_obj);
room_instance_add(argument0,272,432,wall_hor_obj);
room_instance_add(argument0,304,432,wall_hor_obj);
room_instance_add(argument0,336,432,wall_hor_obj);
room_instance_add(argument0,368,432,wall_hor_obj);
room_instance_add(argument0,400,432,wall_hor_obj);
room_instance_add(argument0,400,496,wall_hor_obj);
room_instance_add(argument0,368,496,wall_hor_obj);
room_instance_add(argument0,336,496,wall_hor_obj);
room_instance_add(argument0,304,496,wall_hor_obj);
room_instance_add(argument0,272,496,wall_hor_obj);
room_instance_add(argument0,240,496,wall_hor_obj);
room_instance_add(argument0,208,496,wall_hor_obj);
room_instance_add(argument0,176,496,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,448,wall_vert_obj);
room_instance_add(argument0,160,480,wall_vert_obj);
room_instance_add(argument0,416,448,wall_vert_obj);
room_instance_add(argument0,416,480,wall_vert_obj);
// Torches
room_instance_add(argument0,240,432,torch_north_obj);
room_instance_add(argument0,336,432,torch_north_obj);
room_instance_add(argument0,240,496,torch_south_obj);
room_instance_add(argument0,336,496,torch_south_obj);
// Not yet
/*room_instance_add(argument0,209,441,webs_obj);
room_instance_add(argument0,269,488,webs_obj);
room_instance_add(argument0,396,439,webs_obj);*/