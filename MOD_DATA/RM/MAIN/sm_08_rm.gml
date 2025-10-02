/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Small Room 8'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 224;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 384;
    global.spawn_arr[1,1] = 320;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;

    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 320;
    global.mark_arr[0,1] = 285;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 353;
    global.mark_arr[1,1] = 328;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 303;
    global.mark_arr[2,1] = 224;
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
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,224,224,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,320,224,floor_obj);
room_instance_add(argument0,320,256,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,320,288,floor_obj);
room_instance_add(argument0,352,288,floor_obj);
room_instance_add(argument0,352,320,floor_obj);
room_instance_add(argument0,320,320,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,288,352,floor_obj);
room_instance_add(argument0,320,352,floor_obj);
room_instance_add(argument0,352,352,floor_obj);
room_instance_add(argument0,384,352,floor_obj);
room_instance_add(argument0,384,320,floor_obj);
room_instance_add(argument0,384,288,floor_obj);
// Ceilings
room_instance_add(argument0,224,224,ceil_obj);
room_instance_add(argument0,256,224,ceil_obj);
room_instance_add(argument0,288,224,ceil_obj);
room_instance_add(argument0,320,224,ceil_obj);
room_instance_add(argument0,320,256,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,320,288,ceil_obj);
room_instance_add(argument0,352,288,ceil_obj);
room_instance_add(argument0,352,320,ceil_obj);
room_instance_add(argument0,320,320,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
room_instance_add(argument0,288,352,ceil_obj);
room_instance_add(argument0,320,352,ceil_obj);
room_instance_add(argument0,352,352,ceil_obj);
room_instance_add(argument0,384,352,ceil_obj);
room_instance_add(argument0,384,320,ceil_obj);
room_instance_add(argument0,384,288,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,208,wall_hor_obj);
room_instance_add(argument0,224,240,wall_hor_obj);
room_instance_add(argument0,256,240,wall_hor_obj);
room_instance_add(argument0,256,208,wall_hor_obj);
room_instance_add(argument0,288,208,wall_hor_obj);
room_instance_add(argument0,320,208,wall_hor_obj);
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,288,272,wall_hor_obj);
room_instance_add(argument0,352,272,wall_hor_obj);
room_instance_add(argument0,384,272,wall_hor_obj);
room_instance_add(argument0,384,368,wall_hor_obj);
room_instance_add(argument0,352,368,wall_hor_obj);
room_instance_add(argument0,320,368,wall_hor_obj);
room_instance_add(argument0,288,368,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,224,wall_vert_obj);
room_instance_add(argument0,304,256,wall_vert_obj);
room_instance_add(argument0,336,224,wall_vert_obj);
room_instance_add(argument0,336,256,wall_vert_obj);
room_instance_add(argument0,400,288,wall_vert_obj);
room_instance_add(argument0,400,320,wall_vert_obj);
room_instance_add(argument0,400,352,wall_vert_obj);
room_instance_add(argument0,272,288,wall_vert_obj);
room_instance_add(argument0,272,320,wall_vert_obj);
room_instance_add(argument0,272,352,wall_vert_obj);
// Torches
room_instance_add(argument0,400,288,torch_east_obj);
room_instance_add(argument0,400,352,torch_east_obj);
// Props
room_instance_add(argument0,288,288,chair_rand_obj);
room_instance_add(argument0,288,352,table_rand_obj);
room_instance_add(argument0,345,357,bone_rand_obj);