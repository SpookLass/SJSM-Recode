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
	global.rm_name_var = ini_read_string('ROOM','fish','ROOM_fish')+' 15';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 160;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 384;
    global.spawn_arr[1,1] = 480;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 254;
    global.mark_arr[0,1] = 363;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 263;
    global.mark_arr[1,1] = 452;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 333;
    global.mark_arr[2,1] = 486;
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
room_instance_add(argument0,0,0,color_control_med_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
// Floors
room_instance_add(argument0,160,256,floor_obj);
room_instance_add(argument0,192,256,floor_obj);
room_instance_add(argument0,224,256,floor_obj);
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,256,288,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,256,320,floor_obj);
room_instance_add(argument0,256,352,floor_obj);
room_instance_add(argument0,288,352,floor_obj);
room_instance_add(argument0,288,384,floor_obj);
room_instance_add(argument0,256,384,floor_obj);
room_instance_add(argument0,256,416,floor_obj);
room_instance_add(argument0,288,416,floor_obj);
room_instance_add(argument0,256,448,floor_obj);
room_instance_add(argument0,288,448,floor_obj);
room_instance_add(argument0,288,480,floor_obj);
room_instance_add(argument0,256,480,floor_obj);
room_instance_add(argument0,320,480,floor_obj);
room_instance_add(argument0,352,480,floor_obj);
room_instance_add(argument0,384,480,floor_obj);
// Ceilings
room_instance_add(argument0,160,256,ceil_obj);
room_instance_add(argument0,192,256,ceil_obj);
room_instance_add(argument0,224,256,ceil_obj);
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,256,288,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
room_instance_add(argument0,256,320,ceil_obj);
room_instance_add(argument0,256,352,ceil_obj);
room_instance_add(argument0,288,352,ceil_obj);
room_instance_add(argument0,288,384,ceil_obj);
room_instance_add(argument0,256,384,ceil_obj);
room_instance_add(argument0,256,416,ceil_obj);
room_instance_add(argument0,288,416,ceil_obj);
room_instance_add(argument0,256,448,ceil_obj);
room_instance_add(argument0,288,448,ceil_obj);
room_instance_add(argument0,288,480,ceil_obj);
room_instance_add(argument0,256,480,ceil_obj);
room_instance_add(argument0,320,480,ceil_obj);
room_instance_add(argument0,352,480,ceil_obj);
room_instance_add(argument0,384,480,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,160,240,wall_hor_obj);
room_instance_add(argument0,192,240,wall_hor_obj);
room_instance_add(argument0,224,240,wall_hor_obj);
room_instance_add(argument0,256,240,wall_hor_obj);
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,160,272,wall_hor_obj);
room_instance_add(argument0,192,272,wall_hor_obj);
room_instance_add(argument0,224,272,wall_hor_obj);
room_instance_add(argument0,320,464,wall_hor_obj);
room_instance_add(argument0,352,464,wall_hor_obj);
room_instance_add(argument0,384,464,wall_hor_obj);
room_instance_add(argument0,384,496,wall_hor_obj);
room_instance_add(argument0,352,496,wall_hor_obj);
room_instance_add(argument0,320,496,wall_hor_obj);
room_instance_add(argument0,288,496,wall_hor_obj);
room_instance_add(argument0,256,496,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,144,256,wall_vert_obj);
room_instance_add(argument0,240,480,wall_vert_obj);
room_instance_add(argument0,240,448,wall_vert_obj);
room_instance_add(argument0,240,416,wall_vert_obj);
room_instance_add(argument0,240,384,wall_vert_obj);
room_instance_add(argument0,240,352,wall_vert_obj);
room_instance_add(argument0,240,320,wall_vert_obj);
room_instance_add(argument0,240,288,wall_vert_obj);
room_instance_add(argument0,304,256,wall_vert_obj);
room_instance_add(argument0,304,288,wall_vert_obj);
room_instance_add(argument0,304,320,wall_vert_obj);
room_instance_add(argument0,304,352,wall_vert_obj);
room_instance_add(argument0,304,384,wall_vert_obj);
room_instance_add(argument0,304,416,wall_vert_obj);
room_instance_add(argument0,304,448,wall_vert_obj);
room_instance_add(argument0,400,480,wall_vert_obj);
// Torches
room_instance_add(argument0,192,240,torch_north_obj);
room_instance_add(argument0,192,272,torch_south_obj);
// Props
room_instance_add(argument0,288,288,tank_rand_obj);
room_instance_add(argument0,288,320,tank_rand_obj);
room_instance_add(argument0,288,352,tank_rand_obj);
room_instance_add(argument0,288,384,tank_rand_obj);
room_instance_add(argument0,288,416,tank_rand_obj);
room_instance_add(argument0,288,448,tank_rand_obj);
// Not yet