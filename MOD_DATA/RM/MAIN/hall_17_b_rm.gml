/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 17 B'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 272;
    global.spawn_arr[0,1] = 272;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 592;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 464;
    global.mark_arr[0,1] = 272;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 368;
    global.mark_arr[1,1] = 272;
    global.mark_arr[1,2] = 0;
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
room_instance_add(argument0,272,272,floor_obj);
room_instance_add(argument0,304,272,floor_obj);
room_instance_add(argument0,336,272,floor_obj);
room_instance_add(argument0,368,272,floor_obj);
room_instance_add(argument0,400,272,floor_obj);
room_instance_add(argument0,432,272,floor_obj);
room_instance_add(argument0,464,272,floor_obj);
room_instance_add(argument0,496,272,floor_obj);
room_instance_add(argument0,528,272,floor_obj);
room_instance_add(argument0,560,272,floor_obj);
room_instance_add(argument0,592,272,floor_obj);
room_instance_add(argument0,592,304,floor_obj);
// Ceilings
room_instance_add(argument0,272,272,ceil_obj);
room_instance_add(argument0,304,272,ceil_obj);
room_instance_add(argument0,336,272,ceil_obj);
room_instance_add(argument0,368,272,ceil_obj);
room_instance_add(argument0,400,272,ceil_obj);
room_instance_add(argument0,432,272,ceil_obj);
room_instance_add(argument0,464,272,ceil_obj);
room_instance_add(argument0,496,272,ceil_obj);
room_instance_add(argument0,528,272,ceil_obj);
room_instance_add(argument0,560,272,ceil_obj);
room_instance_add(argument0,592,272,ceil_obj);
room_instance_add(argument0,592,304,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,272,264,wall_hor_obj);
room_instance_add(argument0,272,280,wall_hor_obj);
room_instance_add(argument0,304,264,wall_hor_obj);
room_instance_add(argument0,336,264,wall_hor_obj);
room_instance_add(argument0,368,264,wall_hor_obj);
room_instance_add(argument0,400,264,wall_hor_obj);
room_instance_add(argument0,432,264,wall_hor_obj);
room_instance_add(argument0,464,264,wall_hor_obj);
room_instance_add(argument0,496,264,wall_hor_obj);
room_instance_add(argument0,528,264,wall_hor_obj);
room_instance_add(argument0,560,264,wall_hor_obj);
room_instance_add(argument0,592,264,wall_hor_obj);
room_instance_add(argument0,304,280,wall_hor_obj);
room_instance_add(argument0,336,280,wall_hor_obj);
room_instance_add(argument0,368,280,wall_hor_obj);
room_instance_add(argument0,400,280,wall_hor_obj);
room_instance_add(argument0,432,280,wall_hor_obj);
room_instance_add(argument0,464,280,wall_hor_obj);
room_instance_add(argument0,496,280,wall_hor_obj);
room_instance_add(argument0,528,280,wall_hor_obj);
room_instance_add(argument0,560,280,wall_hor_obj);
room_instance_add(argument0,592,320,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,256,272,wall_vert_obj);
room_instance_add(argument0,576,296,wall_vert_obj);
room_instance_add(argument0,576,328,wall_vert_obj);
room_instance_add(argument0,608,328,wall_vert_obj);
room_instance_add(argument0,608,296,wall_vert_obj);
room_instance_add(argument0,608,264,wall_vert_obj);
// Torches
room_instance_add(argument0,160,132,torch_north_obj);
room_instance_add(argument0,288,132,torch_north_obj);
room_instance_add(argument0,416,132,torch_north_obj);
room_instance_add(argument0,544,132,torch_north_obj);
room_instance_add(argument0,672,132,torch_north_obj);
room_instance_add(argument0,800,132,torch_north_obj);
room_instance_add(argument0,928,132,torch_north_obj);
room_instance_add(argument0,1056,132,torch_north_obj);
room_instance_add(argument0,1056,156,torch_south_obj);
room_instance_add(argument0,928,156,torch_south_obj);
room_instance_add(argument0,800,156,torch_south_obj);
room_instance_add(argument0,672,156,torch_south_obj);
room_instance_add(argument0,544,156,torch_south_obj);
room_instance_add(argument0,416,156,torch_south_obj);
room_instance_add(argument0,288,156,torch_south_obj);
room_instance_add(argument0,160,156,torch_south_obj);
// Not yet
/**/