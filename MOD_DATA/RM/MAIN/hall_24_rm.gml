/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    global.rm_name_var = 'Hall 24'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 128;
    global.spawn_arr[0,1] = 560;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 384;
    global.spawn_arr[1,1] = 624;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 224;
    global.mark_arr[0,1] = 560;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 320;
    global.mark_arr[1,1] = 592;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 320;
    global.mark_arr[2,1] = 624;
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
// Floors
room_instance_add(argument0,128,560,floor_obj);
room_instance_add(argument0,160,560,floor_obj);
room_instance_add(argument0,192,560,floor_obj);
room_instance_add(argument0,224,560,floor_obj);
room_instance_add(argument0,256,560,floor_obj);
room_instance_add(argument0,288,560,floor_obj);
room_instance_add(argument0,320,560,floor_obj);
room_instance_add(argument0,320,592,floor_obj);
room_instance_add(argument0,320,624,floor_obj);
room_instance_add(argument0,352,624,floor_obj);
room_instance_add(argument0,384,624,floor_obj);
// Ceilings
room_instance_add(argument0,128,560,ceil_obj);
room_instance_add(argument0,160,560,ceil_obj);
room_instance_add(argument0,192,560,ceil_obj);
room_instance_add(argument0,224,560,ceil_obj);
room_instance_add(argument0,256,560,ceil_obj);
room_instance_add(argument0,288,560,ceil_obj);
room_instance_add(argument0,320,560,ceil_obj);
room_instance_add(argument0,320,592,ceil_obj);
room_instance_add(argument0,320,624,ceil_obj);
room_instance_add(argument0,352,624,ceil_obj);
room_instance_add(argument0,384,624,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,352,608,wall_hor_obj);
room_instance_add(argument0,384,608,wall_hor_obj);
room_instance_add(argument0,352,640,wall_hor_obj);
room_instance_add(argument0,320,640,wall_hor_obj);
room_instance_add(argument0,128,548,wall_hor_obj);
room_instance_add(argument0,160,548,wall_hor_obj);
room_instance_add(argument0,160,572,wall_hor_obj);
room_instance_add(argument0,128,572,wall_hor_obj);
room_instance_add(argument0,192,572,wall_hor_obj);
room_instance_add(argument0,224,572,wall_hor_obj);
room_instance_add(argument0,256,572,wall_hor_obj);
room_instance_add(argument0,288,572,wall_hor_obj);
room_instance_add(argument0,288,548,wall_hor_obj);
room_instance_add(argument0,320,548,wall_hor_obj);
room_instance_add(argument0,256,548,wall_hor_obj);
room_instance_add(argument0,224,548,wall_hor_obj);
room_instance_add(argument0,192,548,wall_hor_obj);
room_instance_add(argument0,384,640,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,112,560,wall_vert_obj);
room_instance_add(argument0,336,592,wall_vert_obj);
room_instance_add(argument0,336,560,wall_vert_obj);
room_instance_add(argument0,304,588,wall_vert_obj);
room_instance_add(argument0,304,620,wall_vert_obj);
room_instance_add(argument0,304,652,wall_vert_obj);
room_instance_add(argument0,400,624,wall_vert_obj);
// Torches
room_instance_add(argument0,192,548,torch_north_obj);
room_instance_add(argument0,256,548,torch_north_obj);
room_instance_add(argument0,352,608,torch_north_obj);
room_instance_add(argument0,192,572,torch_south_obj);
room_instance_add(argument0,256,572,torch_south_obj);
room_instance_add(argument0,352,640,torch_south_obj);
// Props
room_instance_add(argument0,325,552,web_rand_obj);
// Not yet
/*room_instance_add(argument0,368,640,random_scare_mark1);*/