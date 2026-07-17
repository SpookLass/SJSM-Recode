/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","ben","ROOM_ben")+" 1"
    ini_close();
    // Spawns
    global.spawn_len_var = 1;
    global.spawn_arr[0,0] = 240;
    global.spawn_arr[0,1] = 384;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,false,ben_door_obj,spawn_door_trig_obj);
');
// Effects
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,spawn_mus_obj);
// Floors
room_instance_add(argument0,336,384,spawn_floor_obj);
room_instance_add(argument0,336,352,spawn_floor_obj);
room_instance_add(argument0,336,416,spawn_floor_obj);
room_instance_add(argument0,368,384,spawn_floor_obj);
room_instance_add(argument0,368,352,spawn_floor_obj);
room_instance_add(argument0,368,416,spawn_floor_obj);
room_instance_add(argument0,400,416,spawn_floor_obj);
room_instance_add(argument0,400,384,spawn_floor_obj);
room_instance_add(argument0,400,352,spawn_floor_obj);
room_instance_add(argument0,432,352,spawn_floor_obj);
room_instance_add(argument0,464,352,spawn_floor_obj);
room_instance_add(argument0,464,384,spawn_floor_obj);
room_instance_add(argument0,432,384,spawn_floor_obj);
room_instance_add(argument0,432,416,spawn_floor_obj);
room_instance_add(argument0,464,416,spawn_floor_obj);
room_instance_add(argument0,464,320,spawn_floor_obj);
room_instance_add(argument0,432,320,spawn_floor_obj);
room_instance_add(argument0,400,320,spawn_floor_obj);
room_instance_add(argument0,368,320,spawn_floor_obj);
room_instance_add(argument0,336,320,spawn_floor_obj);
room_instance_add(argument0,336,448,spawn_floor_obj);
room_instance_add(argument0,368,448,spawn_floor_obj);
room_instance_add(argument0,400,448,spawn_floor_obj);
room_instance_add(argument0,432,448,spawn_floor_obj);
room_instance_add(argument0,464,448,spawn_floor_obj);
room_instance_add(argument0,240,384,spawn_floor_alt_obj); // Tunnel
room_instance_add(argument0,272,384,spawn_floor_alt_obj);
room_instance_add(argument0,304,384,spawn_floor_alt_obj);
room_instance_add(argument0,496,384,spawn_floor_alt_obj);
room_instance_add(argument0,528,384,spawn_floor_alt_obj);
room_instance_add(argument0,560,384,spawn_floor_alt_obj);
room_instance_add(argument0,400,480,spawn_floor_alt_obj);
room_instance_add(argument0,400,512,spawn_floor_alt_obj);
room_instance_add(argument0,400,544,spawn_floor_alt_obj);
// Ceilings
room_instance_add(argument0,336,384,spawn_ceil_2high_obj);
room_instance_add(argument0,336,352,spawn_ceil_2high_obj);
room_instance_add(argument0,336,416,spawn_ceil_2high_obj);
room_instance_add(argument0,368,384,spawn_ceil_2high_obj);
room_instance_add(argument0,368,352,spawn_ceil_2high_obj);
room_instance_add(argument0,368,416,spawn_ceil_2high_obj);
room_instance_add(argument0,400,416,spawn_ceil_2high_obj);
room_instance_add(argument0,400,384,spawn_ceil_2high_obj);
room_instance_add(argument0,400,352,spawn_ceil_2high_obj);
room_instance_add(argument0,432,352,spawn_ceil_2high_obj);
room_instance_add(argument0,464,352,spawn_ceil_2high_obj);
room_instance_add(argument0,464,384,spawn_ceil_2high_obj);
room_instance_add(argument0,432,384,spawn_ceil_2high_obj);
room_instance_add(argument0,432,416,spawn_ceil_2high_obj);
room_instance_add(argument0,464,416,spawn_ceil_2high_obj);
room_instance_add(argument0,464,320,spawn_ceil_2high_obj);
room_instance_add(argument0,432,320,spawn_ceil_2high_obj);
room_instance_add(argument0,400,320,spawn_ceil_2high_obj);
room_instance_add(argument0,368,320,spawn_ceil_2high_obj);
room_instance_add(argument0,336,320,spawn_ceil_2high_obj);
room_instance_add(argument0,336,448,spawn_ceil_2high_obj);
room_instance_add(argument0,368,448,spawn_ceil_2high_obj);
room_instance_add(argument0,400,448,spawn_ceil_2high_obj);
room_instance_add(argument0,432,448,spawn_ceil_2high_obj);
room_instance_add(argument0,464,448,spawn_ceil_2high_obj);
room_instance_add(argument0,240,384,spawn_ceil_alt_obj); // Tunnel
room_instance_add(argument0,272,384,spawn_ceil_alt_obj);
room_instance_add(argument0,304,384,spawn_ceil_alt_obj);
room_instance_add(argument0,496,384,spawn_ceil_alt_obj);
room_instance_add(argument0,528,384,spawn_ceil_alt_obj);
room_instance_add(argument0,560,384,spawn_ceil_alt_obj);
room_instance_add(argument0,400,480,spawn_ceil_alt_obj);
room_instance_add(argument0,400,512,spawn_ceil_alt_obj);
room_instance_add(argument0,400,544,spawn_ceil_alt_obj);
// Walls (Horizontal)
room_instance_add(argument0,304,368,spawn_wall_hor_obj);
room_instance_add(argument0,304,400,spawn_wall_hor_obj);
room_instance_add(argument0,496,368,spawn_wall_hor_obj);
room_instance_add(argument0,496,400,spawn_wall_hor_obj);
room_instance_add(argument0,272,368,spawn_wall_hor_obj);
room_instance_add(argument0,240,368,spawn_wall_hor_obj);
room_instance_add(argument0,240,400,spawn_wall_hor_obj);
room_instance_add(argument0,272,400,spawn_wall_hor_obj);
room_instance_add(argument0,528,368,spawn_wall_hor_obj);
room_instance_add(argument0,528,400,spawn_wall_hor_obj);
room_instance_add(argument0,560,368,spawn_wall_hor_obj);
room_instance_add(argument0,560,400,spawn_wall_hor_obj);
room_instance_add(argument0,400,560,spawn_wall_hor_obj);
room_instance_add(argument0,368,304,spawn_wall_hor_obj);
room_instance_add(argument0,336,304,spawn_wall_hor_obj);
room_instance_add(argument0,432,304,spawn_wall_hor_obj);
room_instance_add(argument0,464,304,spawn_wall_hor_obj);
room_instance_add(argument0,464,464,spawn_wall_hor_obj);
room_instance_add(argument0,432,464,spawn_wall_hor_obj);
room_instance_add(argument0,368,464,spawn_wall_hor_obj);
room_instance_add(argument0,336,464,spawn_wall_hor_obj);
room_instance_add(argument0,368,304,spawn_wall_up_hor_obj);
room_instance_add(argument0,336,304,spawn_wall_up_hor_obj);
room_instance_add(argument0,400,304,spawn_wall_up_hor_obj);
room_instance_add(argument0,432,304,spawn_wall_up_hor_obj);
room_instance_add(argument0,464,304,spawn_wall_up_hor_obj);
room_instance_add(argument0,464,464,spawn_wall_up_hor_obj);
room_instance_add(argument0,432,464,spawn_wall_up_hor_obj);
room_instance_add(argument0,400,464,spawn_wall_up_hor_obj);
room_instance_add(argument0,368,464,spawn_wall_up_hor_obj);
room_instance_add(argument0,336,464,spawn_wall_up_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,224,384,spawn_wall_vert_obj);
room_instance_add(argument0,576,384,spawn_wall_vert_obj);
room_instance_add(argument0,416,480,spawn_wall_vert_obj);
room_instance_add(argument0,384,480,spawn_wall_vert_obj);
room_instance_add(argument0,384,512,spawn_wall_vert_obj);
room_instance_add(argument0,416,512,spawn_wall_vert_obj);
room_instance_add(argument0,416,544,spawn_wall_vert_obj);
room_instance_add(argument0,384,544,spawn_wall_vert_obj);
room_instance_add(argument0,320,320,spawn_wall_vert_obj);
room_instance_add(argument0,320,352,spawn_wall_vert_obj);
room_instance_add(argument0,320,416,spawn_wall_vert_obj);
room_instance_add(argument0,320,448,spawn_wall_vert_obj);
room_instance_add(argument0,480,448,spawn_wall_vert_obj);
room_instance_add(argument0,480,416,spawn_wall_vert_obj);
room_instance_add(argument0,480,352,spawn_wall_vert_obj);
room_instance_add(argument0,480,320,spawn_wall_vert_obj);
room_instance_add(argument0,320,320,spawn_wall_up_vert_obj);
room_instance_add(argument0,320,352,spawn_wall_up_vert_obj);
room_instance_add(argument0,320,384,spawn_wall_up_vert_obj);
room_instance_add(argument0,320,416,spawn_wall_up_vert_obj);
room_instance_add(argument0,320,448,spawn_wall_up_vert_obj);
room_instance_add(argument0,480,320,spawn_wall_up_vert_obj);
room_instance_add(argument0,480,352,spawn_wall_up_vert_obj);
room_instance_add(argument0,480,384,spawn_wall_up_vert_obj);
room_instance_add(argument0,480,416,spawn_wall_up_vert_obj);
room_instance_add(argument0,480,448,spawn_wall_up_vert_obj);
// Props
room_instance_add(argument0,352,336,ben_torch_obj); // BEN_torch
room_instance_add(argument0,448,336,ben_torch_obj);
room_instance_add(argument0,352,432,ben_torch_obj);
room_instance_add(argument0,448,432,ben_torch_obj);
room_instance_add(argument0,400,384,ben_circle_obj); // BEN_circle
// room_instance_add(argument0,400,304,ben_door_2);
// room_instance_add(argument0,400,464,ben_door_1);
// room_instance_add(argument0,480,384,ben_door_3);