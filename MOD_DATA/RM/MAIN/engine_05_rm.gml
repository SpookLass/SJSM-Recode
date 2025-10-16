/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','engine','ROOM_engine')+' 5';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 144;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 240;
    global.spawn_arr[1,1] = 416;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,144,256,floor_obj);
room_instance_add(argument0,176,256,floor_obj);
room_instance_add(argument0,208,256,floor_obj);
room_instance_add(argument0,208,224,floor_obj);
room_instance_add(argument0,240,224,floor_obj);
room_instance_add(argument0,240,256,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
room_instance_add(argument0,240,288,floor_obj);
room_instance_add(argument0,272,288,floor_obj);
room_instance_add(argument0,272,256,floor_obj);
room_instance_add(argument0,272,224,floor_obj);
room_instance_add(argument0,272,320,floor_obj);
room_instance_add(argument0,240,320,floor_obj);
room_instance_add(argument0,208,320,floor_obj);
room_instance_add(argument0,272,352,floor_obj);
room_instance_add(argument0,240,352,floor_obj);
room_instance_add(argument0,208,352,floor_obj);
room_instance_add(argument0,208,384,floor_obj);
room_instance_add(argument0,240,384,floor_obj);
room_instance_add(argument0,272,384,floor_obj);
room_instance_add(argument0,208,416,floor_obj);
room_instance_add(argument0,240,416,floor_obj);
room_instance_add(argument0,272,416,floor_obj);
// Ceilings
room_instance_add(argument0,144,256,ceil_obj);
room_instance_add(argument0,176,256,ceil_obj);
room_instance_add(argument0,208,256,ceil_obj);
room_instance_add(argument0,208,224,ceil_obj);
room_instance_add(argument0,240,224,ceil_obj);
room_instance_add(argument0,240,256,ceil_obj);
room_instance_add(argument0,208,288,ceil_obj);
room_instance_add(argument0,240,288,ceil_obj);
room_instance_add(argument0,272,288,ceil_obj);
room_instance_add(argument0,272,256,ceil_obj);
room_instance_add(argument0,272,224,ceil_obj);
room_instance_add(argument0,272,320,ceil_obj);
room_instance_add(argument0,240,320,ceil_obj);
room_instance_add(argument0,208,320,ceil_obj);
room_instance_add(argument0,272,352,ceil_obj);
room_instance_add(argument0,240,352,ceil_obj);
room_instance_add(argument0,208,352,ceil_obj);
room_instance_add(argument0,208,384,ceil_obj);
room_instance_add(argument0,240,384,ceil_obj);
room_instance_add(argument0,272,384,ceil_obj);
room_instance_add(argument0,208,416,ceil_obj);
room_instance_add(argument0,240,416,ceil_obj);
room_instance_add(argument0,272,416,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,144,240,wall_hor_obj);
room_instance_add(argument0,176,240,wall_hor_obj);
room_instance_add(argument0,176,272,wall_hor_obj);
room_instance_add(argument0,144,272,wall_hor_obj);
room_instance_add(argument0,208,432,wall_hor_obj);
room_instance_add(argument0,240,432,wall_hor_obj);
room_instance_add(argument0,272,432,wall_hor_obj);
room_instance_add(argument0,272,208,wall_hor_obj);
room_instance_add(argument0,240,208,wall_hor_obj);
room_instance_add(argument0,208,208,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,128,256,wall_vert_obj);
room_instance_add(argument0,192,224,wall_vert_obj);
room_instance_add(argument0,192,288,wall_vert_obj);
room_instance_add(argument0,192,320,wall_vert_obj);
room_instance_add(argument0,192,352,wall_vert_obj);
room_instance_add(argument0,192,384,wall_vert_obj);
room_instance_add(argument0,192,416,wall_vert_obj);
room_instance_add(argument0,288,416,wall_vert_obj);
room_instance_add(argument0,288,384,wall_vert_obj);
room_instance_add(argument0,288,352,wall_vert_obj);
room_instance_add(argument0,288,320,wall_vert_obj);
room_instance_add(argument0,288,288,wall_vert_obj);
room_instance_add(argument0,288,256,wall_vert_obj);
room_instance_add(argument0,288,224,wall_vert_obj);
// Engineering
room_instance_add(argument0,272,256,engine_rand_obj);
room_instance_add(argument0,272,320,engine_rand_obj);
room_instance_add(argument0,272,384,engine_rand_obj);
room_instance_add(argument0,208,384,engine_rand_obj);
room_instance_add(argument0,208,320,engine_rand_obj);
room_instance_add(argument0,272,256,pole_metal_obj);
room_instance_add(argument0,272,320,pole_metal_obj);
room_instance_add(argument0,272,384,pole_metal_obj);
room_instance_add(argument0,208,384,pole_metal_obj);
room_instance_add(argument0,208,320,pole_metal_obj);
room_instance_add(argument0,272,224,runner_obj);
room_instance_add(argument0,272,256,runner_obj);
room_instance_add(argument0,272,288,runner_obj);
room_instance_add(argument0,272,320,runner_obj);
room_instance_add(argument0,272,352,runner_obj);
room_instance_add(argument0,272,384,runner_obj);
room_instance_add(argument0,272,416,runner_obj);
room_instance_add(argument0,208,416,runner_obj);
room_instance_add(argument0,208,384,runner_obj);
room_instance_add(argument0,208,352,runner_obj);
room_instance_add(argument0,208,320,runner_obj);
room_instance_add(argument0,208,288,runner_obj);
room_instance_add(argument0,208,256,runner_obj);
room_instance_add(argument0,208,224,runner_obj);
// Not yet