/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','fish','ROOM_fish')+' 13';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 160;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 288;
    global.spawn_arr[1,1] = 64;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 0;
    /*global.mark_arr[0,0] = 374;
    global.mark_arr[0,1] = 262;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 477;
    global.mark_arr[1,1] = 260;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 477;
    global.mark_arr[2,1] = 450;
    global.mark_arr[2,2] = 0;*/
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
room_instance_add(argument0,0,0,color_control_med_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,160,256,floor_obj);
room_instance_add(argument0,192,256,floor_obj);
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,256,224,floor_obj);
room_instance_add(argument0,256,192,floor_obj);
room_instance_add(argument0,288,192,floor_obj);
room_instance_add(argument0,288,224,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,256,160,floor_obj);
room_instance_add(argument0,288,160,floor_obj);
room_instance_add(argument0,256,128,floor_obj);
room_instance_add(argument0,256,96,floor_obj);
room_instance_add(argument0,256,64,floor_obj);
room_instance_add(argument0,288,64,floor_obj);
room_instance_add(argument0,288,96,floor_obj);
room_instance_add(argument0,288,128,floor_obj);
room_instance_add(argument0,256,32,floor_obj);
room_instance_add(argument0,288,32,floor_obj);
// Ceilings
room_instance_add(argument0,160,256,ceil_obj);
room_instance_add(argument0,192,256,ceil_obj);
room_instance_add(argument0,224,256,ceil_obj);
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,256,224,ceil_obj);
room_instance_add(argument0,256,192,ceil_obj);
room_instance_add(argument0,288,192,ceil_obj);
room_instance_add(argument0,288,224,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,256,160,ceil_obj);
room_instance_add(argument0,288,160,ceil_obj);
room_instance_add(argument0,256,128,ceil_obj);
room_instance_add(argument0,256,96,ceil_obj);
room_instance_add(argument0,256,64,ceil_obj);
room_instance_add(argument0,288,64,ceil_obj);
room_instance_add(argument0,288,96,ceil_obj);
room_instance_add(argument0,288,128,ceil_obj);
room_instance_add(argument0,256,32,ceil_obj);
room_instance_add(argument0,288,32,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,160,240,wall_hor_obj);
room_instance_add(argument0,192,240,wall_hor_obj);
room_instance_add(argument0,224,240,wall_hor_obj);
room_instance_add(argument0,160,272,wall_hor_obj);
room_instance_add(argument0,192,272,wall_hor_obj);
room_instance_add(argument0,224,272,wall_hor_obj);
room_instance_add(argument0,256,16,wall_hor_obj);
room_instance_add(argument0,288,16,wall_hor_obj);
room_instance_add(argument0,256,304,wall_hor_obj);
room_instance_add(argument0,288,304,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,144,256,wall_vert_obj);
room_instance_add(argument0,240,288,wall_vert_obj);
room_instance_add(argument0,240,224,wall_vert_obj);
room_instance_add(argument0,240,192,wall_vert_obj);
room_instance_add(argument0,240,160,wall_vert_obj);
room_instance_add(argument0,240,128,wall_vert_obj);
room_instance_add(argument0,240,96,wall_vert_obj);
room_instance_add(argument0,240,64,wall_vert_obj);
room_instance_add(argument0,240,32,wall_vert_obj);
room_instance_add(argument0,304,32,wall_vert_obj);
room_instance_add(argument0,304,64,wall_vert_obj);
room_instance_add(argument0,304,96,wall_vert_obj);
room_instance_add(argument0,304,128,wall_vert_obj);
room_instance_add(argument0,304,160,wall_vert_obj);
room_instance_add(argument0,304,192,wall_vert_obj);
room_instance_add(argument0,304,224,wall_vert_obj);
room_instance_add(argument0,304,256,wall_vert_obj);
room_instance_add(argument0,304,288,wall_vert_obj);
// Torches
room_instance_add(argument0,192,240,torch_north_obj);
room_instance_add(argument0,192,272,torch_south_obj);
// Props
room_instance_add(argument0,288,96,tank_rand_obj);
room_instance_add(argument0,288,128,tank_rand_obj);
room_instance_add(argument0,288,160,tank_rand_obj);
room_instance_add(argument0,288,192,tank_rand_obj);
room_instance_add(argument0,288,224,tank_rand_obj);
// Not yet