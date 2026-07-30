/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","school","ROOM_school")+" 1"
    ini_close();
    // Spawns
    global.spawn_len_var = 7;
    global.spawn_arr[0,0] = 208;
    global.spawn_arr[0,1] = 336;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 336;
    global.spawn_arr[1,1] = 320;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    global.spawn_arr[2,0] = 336;
    global.spawn_arr[2,1] = 352;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 90;
    global.spawn_arr[3,0] = 560;
    global.spawn_arr[3,1] = 320;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 270;
    global.spawn_arr[4,0] = 560;
    global.spawn_arr[4,1] = 352;
    global.spawn_arr[4,2] = 0;
    global.spawn_arr[4,3] = 90;
    global.spawn_arr[5,0] = 688;
    global.spawn_arr[5,1] = 320;
    global.spawn_arr[5,2] = 0;
    global.spawn_arr[5,3] = 270;
    global.spawn_arr[6,0] = 672;
    global.spawn_arr[6,1] = 480;
    global.spawn_arr[6,2] = 0;
    global.spawn_arr[6,3] = 90;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,false,school_door_obj,spawn_door_trig_obj);
    with spawn_arr[1,4] { rm_var = school_class_01_rm; }
    with spawn_arr[2,4] { lock_var = true; }
    with spawn_arr[3,4] { rm_var = school_class_02_rm; }
    with spawn_arr[4,4] { rm_var = school_class_04_rm; }
    with spawn_arr[5,4] { rm_var = school_class_03_rm; }
    with spawn_arr[6,4] { rm_var = school_02_rm; rm_count_var = 1; }
');
// Effects
room_instance_add(argument0,0,0,school_color_obj);
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,reflect_eff_obj);
// Floors
room_instance_add(argument0,208,448,spawn_floor_obj);
room_instance_add(argument0,208,352,spawn_floor_obj);
room_instance_add(argument0,240,352,spawn_floor_obj);
room_instance_add(argument0,272,352,spawn_floor_obj);
room_instance_add(argument0,208,320,spawn_floor_obj);
room_instance_add(argument0,240,320,spawn_floor_obj);
room_instance_add(argument0,272,320,spawn_floor_obj);
room_instance_add(argument0,304,320,spawn_floor_obj);
room_instance_add(argument0,304,352,spawn_floor_obj);
room_instance_add(argument0,336,352,spawn_floor_obj);
room_instance_add(argument0,336,320,spawn_floor_obj);
room_instance_add(argument0,368,320,spawn_floor_obj);
room_instance_add(argument0,368,352,spawn_floor_obj);
room_instance_add(argument0,400,352,spawn_floor_obj);
room_instance_add(argument0,400,320,spawn_floor_obj);
room_instance_add(argument0,432,320,spawn_floor_obj);
room_instance_add(argument0,432,352,spawn_floor_obj);
room_instance_add(argument0,464,352,spawn_floor_obj);
room_instance_add(argument0,464,320,spawn_floor_obj);
room_instance_add(argument0,496,320,spawn_floor_obj);
room_instance_add(argument0,496,352,spawn_floor_obj);
room_instance_add(argument0,528,352,spawn_floor_obj);
room_instance_add(argument0,528,320,spawn_floor_obj);
room_instance_add(argument0,560,320,spawn_floor_obj);
room_instance_add(argument0,560,352,spawn_floor_obj);
room_instance_add(argument0,592,352,spawn_floor_obj);
room_instance_add(argument0,592,320,spawn_floor_obj);
room_instance_add(argument0,624,320,spawn_floor_obj);
room_instance_add(argument0,624,352,spawn_floor_obj);
room_instance_add(argument0,656,320,spawn_floor_obj);
room_instance_add(argument0,688,320,spawn_floor_obj);
room_instance_add(argument0,688,352,spawn_floor_obj);
room_instance_add(argument0,656,352,spawn_floor_obj);
room_instance_add(argument0,656,384,spawn_floor_obj);
room_instance_add(argument0,688,384,spawn_floor_obj);
room_instance_add(argument0,688,416,spawn_floor_obj);
room_instance_add(argument0,656,416,spawn_floor_obj);
room_instance_add(argument0,656,448,spawn_floor_obj);
room_instance_add(argument0,688,448,spawn_floor_obj);
room_instance_add(argument0,688,480,spawn_floor_obj);
room_instance_add(argument0,656,480,spawn_floor_obj);
room_instance_add(argument0,208,448,spawn_ceil_48px_obj);
room_instance_add(argument0,208,352,spawn_ceil_48px_obj);
room_instance_add(argument0,240,352,spawn_ceil_48px_obj);
room_instance_add(argument0,272,352,spawn_ceil_48px_obj);
room_instance_add(argument0,208,320,spawn_ceil_48px_obj);
room_instance_add(argument0,240,320,spawn_ceil_48px_obj);
room_instance_add(argument0,272,320,spawn_ceil_48px_obj);
room_instance_add(argument0,304,320,spawn_ceil_48px_obj);
room_instance_add(argument0,304,352,spawn_ceil_48px_obj);
room_instance_add(argument0,336,352,spawn_ceil_48px_obj);
room_instance_add(argument0,336,320,spawn_ceil_48px_obj);
room_instance_add(argument0,368,320,spawn_ceil_48px_obj);
room_instance_add(argument0,368,352,spawn_ceil_48px_obj);
room_instance_add(argument0,400,352,spawn_ceil_48px_obj);
room_instance_add(argument0,400,320,spawn_ceil_48px_obj);
room_instance_add(argument0,432,320,spawn_ceil_48px_obj);
room_instance_add(argument0,432,352,spawn_ceil_48px_obj);
room_instance_add(argument0,464,352,spawn_ceil_48px_obj);
room_instance_add(argument0,464,320,spawn_ceil_48px_obj);
room_instance_add(argument0,496,320,spawn_ceil_48px_obj);
room_instance_add(argument0,496,352,spawn_ceil_48px_obj);
room_instance_add(argument0,528,352,spawn_ceil_48px_obj);
room_instance_add(argument0,528,320,spawn_ceil_48px_obj);
room_instance_add(argument0,560,320,spawn_ceil_48px_obj);
room_instance_add(argument0,560,352,spawn_ceil_48px_obj);
room_instance_add(argument0,592,352,spawn_ceil_48px_obj);
room_instance_add(argument0,592,320,spawn_ceil_48px_obj);
room_instance_add(argument0,624,320,spawn_ceil_48px_obj);
room_instance_add(argument0,624,352,spawn_ceil_48px_obj);
room_instance_add(argument0,656,320,spawn_ceil_48px_obj);
room_instance_add(argument0,688,320,spawn_ceil_48px_obj);
room_instance_add(argument0,688,352,spawn_ceil_48px_obj);
room_instance_add(argument0,656,352,spawn_ceil_48px_obj);
room_instance_add(argument0,656,384,spawn_ceil_48px_obj);
room_instance_add(argument0,688,384,spawn_ceil_48px_obj);
room_instance_add(argument0,688,416,spawn_ceil_48px_obj);
room_instance_add(argument0,656,416,spawn_ceil_48px_obj);
room_instance_add(argument0,656,448,spawn_ceil_48px_obj);
room_instance_add(argument0,688,448,spawn_ceil_48px_obj);
room_instance_add(argument0,688,480,spawn_ceil_48px_obj);
room_instance_add(argument0,656,480,spawn_ceil_48px_obj);
// Walls (Horizontal)
room_instance_add(argument0,208,368,spawn_wall_hor_obj);
room_instance_add(argument0,240,368,spawn_wall_hor_obj);
room_instance_add(argument0,272,368,spawn_wall_hor_obj);
room_instance_add(argument0,304,368,spawn_wall_hor_obj);
room_instance_add(argument0,400,304,spawn_wall_hor_obj);
room_instance_add(argument0,624,368,spawn_wall_hor_obj);
room_instance_add(argument0,400,368,spawn_wall_hor_obj);
room_instance_add(argument0,208,304,spawn_wall_hor_obj);
room_instance_add(argument0,240,304,spawn_wall_hor_obj);
room_instance_add(argument0,272,304,spawn_wall_hor_obj);
room_instance_add(argument0,304,304,spawn_wall_hor_obj);
room_instance_add(argument0,368,304,spawn_wall_hor_obj);
room_instance_add(argument0,368,368,spawn_wall_hor_obj);
room_instance_add(argument0,432,304,spawn_wall_hor_obj);
room_instance_add(argument0,592,304,spawn_wall_hor_obj);
room_instance_add(argument0,528,304,spawn_wall_hor_obj);
room_instance_add(argument0,496,304,spawn_wall_hor_obj);
room_instance_add(argument0,464,304,spawn_wall_hor_obj);
room_instance_add(argument0,656,304,spawn_wall_hor_obj);
room_instance_add(argument0,624,304,spawn_wall_hor_obj);
room_instance_add(argument0,592,368,spawn_wall_hor_obj);
room_instance_add(argument0,528,368,spawn_wall_hor_obj);
room_instance_add(argument0,496,368,spawn_wall_hor_obj);
room_instance_add(argument0,464,368,spawn_wall_hor_obj);
room_instance_add(argument0,432,368,spawn_wall_hor_obj);
room_instance_add(argument0,656,496,spawn_wall_hor_obj);
room_instance_add(argument0,688,496,spawn_wall_hor_obj);
room_instance_add(argument0,336,304,spawn_wall_hor_obj);
room_instance_add(argument0,560,304,spawn_wall_hor_obj);
room_instance_add(argument0,688,304,spawn_wall_hor_obj);
room_instance_add(argument0,336,368,spawn_wall_hor_obj);
room_instance_add(argument0,560,368,spawn_wall_hor_obj);
room_instance_add(argument0,208,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,240,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,272,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,304,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,400,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,624,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,400,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,208,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,240,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,272,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,304,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,368,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,368,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,432,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,592,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,528,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,496,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,464,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,656,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,624,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,592,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,528,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,496,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,464,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,432,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,656,496,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,688,496,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,336,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,560,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,688,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,336,368,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,560,368,spawn_wall_16px_up_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,704,320,spawn_wall_vert_obj);
room_instance_add(argument0,704,352,spawn_wall_vert_obj);
room_instance_add(argument0,704,384,spawn_wall_vert_obj);
room_instance_add(argument0,640,384,spawn_wall_vert_obj);
room_instance_add(argument0,704,416,spawn_wall_vert_obj);
room_instance_add(argument0,704,448,spawn_wall_vert_obj);
room_instance_add(argument0,704,480,spawn_wall_vert_obj);
room_instance_add(argument0,640,416,spawn_wall_vert_obj);
room_instance_add(argument0,640,448,spawn_wall_vert_obj);
room_instance_add(argument0,640,480,spawn_wall_vert_obj);
room_instance_add(argument0,192,352,spawn_wall_vert_obj);
room_instance_add(argument0,192,320,spawn_wall_vert_obj);
room_instance_add(argument0,704,320,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,704,352,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,704,384,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,640,384,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,704,416,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,704,448,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,704,480,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,640,416,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,640,448,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,640,480,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,192,352,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,192,320,spawn_wall_16px_up_vert_obj);
// Props
room_instance_add(argument0,288,308,school_locker_north_obj); // 310
room_instance_add(argument0,384,308,school_locker_north_obj);
room_instance_add(argument0,448,308,school_locker_north_obj);
room_instance_add(argument0,512,308,school_locker_north_obj);
room_instance_add(argument0,448,364,school_locker_south_obj); // 362
room_instance_add(argument0,512,364,school_locker_south_obj);
room_instance_add(argument0,400,368,school_poster_05_obj);
room_instance_add(argument0,288,368,school_poster_06_obj);