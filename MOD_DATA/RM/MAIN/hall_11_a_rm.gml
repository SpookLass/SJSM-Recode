/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 11 A';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 240;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 368;
    global.spawn_arr[1,1] = 240;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 256;
    global.mark_arr[0,1] = 240;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 352;
    global.mark_arr[1,1] = 240;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 208;
    global.mark_arr[2,1] = 240;
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
room_instance_add(argument0,112,240,floor_obj);
room_instance_add(argument0,144,240,floor_obj);
room_instance_add(argument0,176,240,floor_obj);
room_instance_add(argument0,208,240,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
room_instance_add(argument0,272,240,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,336,240,floor_obj);
room_instance_add(argument0,368,240,floor_obj);
room_instance_add(argument0,240,208,floor_obj);
// Ceilings
room_instance_add(argument0,112,240,ceil_obj);
room_instance_add(argument0,144,240,ceil_obj);
room_instance_add(argument0,176,240,ceil_obj);
room_instance_add(argument0,208,240,ceil_obj);
room_instance_add(argument0,240,240,ceil_obj);
room_instance_add(argument0,272,240,ceil_obj);
room_instance_add(argument0,304,240,ceil_obj);
room_instance_add(argument0,336,240,ceil_obj);
room_instance_add(argument0,368,240,ceil_obj);
room_instance_add(argument0,240,208,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,224,wall_hor_obj);
room_instance_add(argument0,240,192,wall_hor_obj);
room_instance_add(argument0,208,224,wall_hor_obj);
room_instance_add(argument0,240,256,wall_hor_obj);
room_instance_add(argument0,208,256,wall_hor_obj);
room_instance_add(argument0,176,256,wall_hor_obj);
room_instance_add(argument0,176,224,wall_hor_obj);
room_instance_add(argument0,144,224,wall_hor_obj);
room_instance_add(argument0,144,256,wall_hor_obj);
room_instance_add(argument0,112,256,wall_hor_obj);
room_instance_add(argument0,272,256,wall_hor_obj);
room_instance_add(argument0,304,256,wall_hor_obj);
room_instance_add(argument0,304,224,wall_hor_obj);
room_instance_add(argument0,272,224,wall_hor_obj);
room_instance_add(argument0,336,224,wall_hor_obj);
room_instance_add(argument0,368,224,wall_hor_obj);
room_instance_add(argument0,368,256,wall_hor_obj);
room_instance_add(argument0,336,256,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,240,wall_vert_obj);
room_instance_add(argument0,224,208,wall_vert_obj);
room_instance_add(argument0,256,208,wall_vert_obj);
room_instance_add(argument0,384,240,wall_vert_obj)
// Torches
room_instance_add(argument0,176,224,torch_north_obj);
room_instance_add(argument0,304,224,torch_north_obj);
room_instance_add(argument0,176,256,torch_south_obj);
room_instance_add(argument0,304,256,torch_south_obj);
// Props
room_instance_add(argument0,240,208,table_rand_obj);
room_instance_add(argument0,278,253,web_rand_obj);
// Jumpscare
room_instance_add(argument0,224,256,js_obj);