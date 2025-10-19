/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 19';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 480;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 368;
    global.spawn_arr[1,1] = 416;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 240;
    global.mark_arr[0,1] = 480;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 368;
    global.mark_arr[1,1] = 480;
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
room_instance_add(argument0,176,480,floor_obj);
room_instance_add(argument0,208,480,floor_obj);
room_instance_add(argument0,240,480,floor_obj);
room_instance_add(argument0,272,480,floor_obj);
room_instance_add(argument0,304,480,floor_obj);
room_instance_add(argument0,336,480,floor_obj);
room_instance_add(argument0,368,480,floor_obj);
room_instance_add(argument0,368,448,floor_obj);
room_instance_add(argument0,368,416,floor_obj);
// Ceilings
room_instance_add(argument0,176,480,ceil_obj);
room_instance_add(argument0,208,480,ceil_obj);
room_instance_add(argument0,240,480,ceil_obj);
room_instance_add(argument0,272,480,ceil_obj);
room_instance_add(argument0,304,480,ceil_obj);
room_instance_add(argument0,336,480,ceil_obj);
room_instance_add(argument0,368,480,ceil_obj);
room_instance_add(argument0,368,448,ceil_obj);
room_instance_add(argument0,368,416,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,368,400,wall_hor_obj);
room_instance_add(argument0,340,464,wall_hor_obj);
room_instance_add(argument0,308,464,wall_hor_obj);
room_instance_add(argument0,276,464,wall_hor_obj);
room_instance_add(argument0,244,464,wall_hor_obj);
room_instance_add(argument0,212,464,wall_hor_obj);
room_instance_add(argument0,180,464,wall_hor_obj);
room_instance_add(argument0,148,464,wall_hor_obj);
room_instance_add(argument0,180,496,wall_hor_obj);
room_instance_add(argument0,212,496,wall_hor_obj);
room_instance_add(argument0,148,496,wall_hor_obj);
room_instance_add(argument0,244,496,wall_hor_obj);
room_instance_add(argument0,276,496,wall_hor_obj);
room_instance_add(argument0,308,496,wall_hor_obj);
room_instance_add(argument0,340,496,wall_hor_obj);
room_instance_add(argument0,372,496,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,380,416,wall_vert_obj);
room_instance_add(argument0,380,448,wall_vert_obj);
room_instance_add(argument0,380,480,wall_vert_obj);
room_instance_add(argument0,356,416,wall_vert_obj);
room_instance_add(argument0,356,448,wall_vert_obj);
room_instance_add(argument0,160,480,wall_vert_obj);
// Torches
room_instance_add(argument0,208,464,torch_north_obj);
room_instance_add(argument0,272,464,torch_north_obj);
room_instance_add(argument0,336,464,torch_north_obj);
room_instance_add(argument0,208,496,torch_south_obj);
room_instance_add(argument0,272,496,torch_south_obj);
room_instance_add(argument0,336,496,torch_south_obj);
// Webs
room_instance_add(argument0,294,471,web_rand_obj);
room_instance_add(argument0,373,437,web_rand_obj);
// Jumpscare
room_instance_add(argument0,324,496,js_obj);