/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Small Room 18'
    // Spawn
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 528;
    global.spawn_arr[0,1] = 208;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 592;
    global.spawn_arr[1,1] = 208;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 560;
    global.spawn_arr[2,1] = 304;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 90;
    // Mark
    global.mark_len_var = 1;
    global.mark_arr[0,0] = 560;
    global.mark_arr[0,1] = 236;
    global.mark_arr[0,2] = 0;
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
room_instance_add(argument0,528,208,floor_obj);
room_instance_add(argument0,528,240,floor_obj);
room_instance_add(argument0,528,272,floor_obj);
room_instance_add(argument0,560,272,floor_obj);
room_instance_add(argument0,560,240,floor_obj);
room_instance_add(argument0,560,208,floor_obj);
room_instance_add(argument0,592,272,floor_obj);
room_instance_add(argument0,592,240,floor_obj);
room_instance_add(argument0,592,208,floor_obj);
room_instance_add(argument0,528,304,floor_obj);
room_instance_add(argument0,560,304,floor_obj);
room_instance_add(argument0,592,304,floor_obj);
// Ceilings
room_instance_add(argument0,528,208,ceil_obj);
room_instance_add(argument0,528,240,ceil_obj);
room_instance_add(argument0,528,272,ceil_obj);
room_instance_add(argument0,560,272,ceil_obj);
room_instance_add(argument0,560,240,ceil_obj);
room_instance_add(argument0,560,208,ceil_obj);
room_instance_add(argument0,592,272,ceil_obj);
room_instance_add(argument0,592,240,ceil_obj);
room_instance_add(argument0,592,208,ceil_obj);
room_instance_add(argument0,528,304,ceil_obj);
room_instance_add(argument0,560,304,ceil_obj);
room_instance_add(argument0,592,304,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,528,192,wall_hor_obj);
room_instance_add(argument0,560,192,wall_hor_obj);
room_instance_add(argument0,592,192,wall_hor_obj);
room_instance_add(argument0,528,320,wall_hor_obj);
room_instance_add(argument0,560,320,wall_hor_obj);
room_instance_add(argument0,592,320,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,512,208,wall_vert_obj);
room_instance_add(argument0,512,240,wall_vert_obj);
room_instance_add(argument0,512,272,wall_vert_obj);
room_instance_add(argument0,512,304,wall_vert_obj);
room_instance_add(argument0,608,208,wall_vert_obj);
room_instance_add(argument0,608,240,wall_vert_obj);
room_instance_add(argument0,608,272,wall_vert_obj);
room_instance_add(argument0,608,304,wall_vert_obj);
// Torches
room_instance_add(argument0,528,320,torch_south_obj);
room_instance_add(argument0,592,320,torch_south_obj);
// Props
room_instance_add(argument0,524,256,table_rand_obj);
room_instance_add(argument0,588,256,rug_rand_obj);
room_instance_add(argument0,608,256,frame_vert_rand_obj);