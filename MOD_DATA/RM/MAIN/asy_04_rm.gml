
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","asy","ROOM_asy")+" 4";
    local.lock = ini_read_string("UI","run","UI_run");
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 896;
    global.spawn_arr[1,1] = 352;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 1;
    global.mark_arr[0,0] = 432;
    global.mark_arr[0,1] = 192;
    global.mark_arr[0,2] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,asy_door_obj,false,spawn_leave_door_trig_obj);
    with instance_create(216,352,spawn_door_trig_obj)
    {
        global.spawn_arr[0,4] = id;
        txt_lock_var = local.lock;
        rm_var = asy_02_rm;
        rm_count_var = -1;
        rm_spawn_var = 1;
        snd_len_var = 1;
        snd_arr[0] = door_m_02_snd;
    }
    // Gate
    with instance_create(416,288,asy_cage_fake_obj) { direction = 90; yaw_var = 180; }
    with instance_create(448,288,asy_cage_fake_obj) { direction = 90; yaw_var = 0; }
');
// Effects
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,asy_flash_obj);
room_instance_add(argument0,0,0,asy_static_obj);
room_instance_add(argument0,0,0,spawn_mus_obj);
// Floors
room_instance_add(argument0,288,352,spawn_floor_metal_obj);
room_instance_add(argument0,288,320,spawn_floor_metal_obj);
room_instance_add(argument0,320,352,spawn_floor_metal_obj);
room_instance_add(argument0,352,352,spawn_floor_metal_obj);
room_instance_add(argument0,384,352,spawn_floor_metal_obj);
room_instance_add(argument0,416,320,spawn_floor_metal_obj);
room_instance_add(argument0,416,352,spawn_floor_metal_obj);
room_instance_add(argument0,416,384,spawn_floor_metal_obj);
room_instance_add(argument0,288,384,spawn_floor_metal_obj);
room_instance_add(argument0,448,320,spawn_floor_metal_obj);
room_instance_add(argument0,448,352,spawn_floor_metal_obj);
room_instance_add(argument0,448,384,spawn_floor_metal_obj);
room_instance_add(argument0,480,352,spawn_floor_metal_obj);
room_instance_add(argument0,512,352,spawn_floor_metal_obj);
room_instance_add(argument0,544,352,spawn_floor_metal_obj);
room_instance_add(argument0,576,352,spawn_floor_metal_obj);
room_instance_add(argument0,576,384,spawn_floor_metal_obj);
room_instance_add(argument0,576,320,spawn_floor_metal_obj);
room_instance_add(argument0,608,352,spawn_floor_metal_obj);
room_instance_add(argument0,640,352,spawn_floor_metal_obj);
room_instance_add(argument0,672,352,spawn_floor_metal_obj);
room_instance_add(argument0,704,352,spawn_floor_metal_obj);
room_instance_add(argument0,736,352,spawn_floor_metal_obj);
room_instance_add(argument0,768,352,spawn_floor_metal_obj);
room_instance_add(argument0,800,352,spawn_floor_metal_obj);
room_instance_add(argument0,832,352,spawn_floor_metal_obj);
room_instance_add(argument0,864,352,spawn_floor_metal_obj);
room_instance_add(argument0,896,352,spawn_floor_metal_obj);
room_instance_add(argument0,224,352,spawn_floor_alt_metal_obj);
room_instance_add(argument0,256,352,spawn_floor_alt_metal_obj);
room_instance_add(argument0,320,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,320,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,352,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,352,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,384,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,384,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,480,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,512,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,544,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,544,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,512,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,480,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,416,288,spawn_floor_alt_metal_obj);
room_instance_add(argument0,448,288,spawn_floor_alt_metal_obj);
room_instance_add(argument0,448,256,spawn_floor_alt_metal_obj);
room_instance_add(argument0,416,256,spawn_floor_alt_metal_obj);
room_instance_add(argument0,416,224,spawn_floor_alt_metal_obj);
room_instance_add(argument0,448,224,spawn_floor_alt_metal_obj);
room_instance_add(argument0,448,192,spawn_floor_alt_metal_obj);
room_instance_add(argument0,416,192,spawn_floor_alt_metal_obj);
// Ceilings
room_instance_add(argument0,288,352,spawn_ceil_obj);
room_instance_add(argument0,288,320,spawn_ceil_obj);
room_instance_add(argument0,320,352,spawn_ceil_obj);
room_instance_add(argument0,352,352,spawn_ceil_obj);
room_instance_add(argument0,384,352,spawn_ceil_obj);
room_instance_add(argument0,416,320,spawn_ceil_obj);
room_instance_add(argument0,416,352,spawn_ceil_obj);
room_instance_add(argument0,416,384,spawn_ceil_obj);
room_instance_add(argument0,288,384,spawn_ceil_obj);
room_instance_add(argument0,448,320,spawn_ceil_obj);
room_instance_add(argument0,448,352,spawn_ceil_obj);
room_instance_add(argument0,448,384,spawn_ceil_obj);
room_instance_add(argument0,480,352,spawn_ceil_obj);
room_instance_add(argument0,512,352,spawn_ceil_obj);
room_instance_add(argument0,544,352,spawn_ceil_obj);
room_instance_add(argument0,576,352,spawn_ceil_obj);
room_instance_add(argument0,576,384,spawn_ceil_obj);
room_instance_add(argument0,576,320,spawn_ceil_obj);
room_instance_add(argument0,608,352,spawn_ceil_obj);
room_instance_add(argument0,640,352,spawn_ceil_obj);
room_instance_add(argument0,672,352,spawn_ceil_obj);
room_instance_add(argument0,704,352,spawn_ceil_obj);
room_instance_add(argument0,736,352,spawn_ceil_obj);
room_instance_add(argument0,768,352,spawn_ceil_obj);
room_instance_add(argument0,800,352,spawn_ceil_obj);
room_instance_add(argument0,832,352,spawn_ceil_obj);
room_instance_add(argument0,864,352,spawn_ceil_obj);
room_instance_add(argument0,896,352,spawn_ceil_obj);
room_instance_add(argument0,224,352,spawn_ceil_obj);
room_instance_add(argument0,256,352,spawn_ceil_obj);
room_instance_add(argument0,320,320,spawn_ceil_obj);
room_instance_add(argument0,320,384,spawn_ceil_obj);
room_instance_add(argument0,352,320,spawn_ceil_obj);
room_instance_add(argument0,352,384,spawn_ceil_obj);
room_instance_add(argument0,384,320,spawn_ceil_obj);
room_instance_add(argument0,384,384,spawn_ceil_obj);
room_instance_add(argument0,480,384,spawn_ceil_obj);
room_instance_add(argument0,512,384,spawn_ceil_obj);
room_instance_add(argument0,544,384,spawn_ceil_obj);
room_instance_add(argument0,544,320,spawn_ceil_obj);
room_instance_add(argument0,512,320,spawn_ceil_obj);
room_instance_add(argument0,480,320,spawn_ceil_obj);
room_instance_add(argument0,416,288,spawn_ceil_obj);
room_instance_add(argument0,448,288,spawn_ceil_obj);
room_instance_add(argument0,448,256,spawn_ceil_obj);
room_instance_add(argument0,416,256,spawn_ceil_obj);
room_instance_add(argument0,416,224,spawn_ceil_obj);
room_instance_add(argument0,448,224,spawn_ceil_obj);
room_instance_add(argument0,448,192,spawn_ceil_obj);
room_instance_add(argument0,416,192,spawn_ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,288,304,spawn_wall_hor_obj);
room_instance_add(argument0,352,304,spawn_wall_hor_obj);
room_instance_add(argument0,480,304,spawn_wall_hor_obj);
room_instance_add(argument0,544,304,spawn_wall_hor_obj);
room_instance_add(argument0,544,400,spawn_wall_hor_obj);
room_instance_add(argument0,480,400,spawn_wall_hor_obj);
room_instance_add(argument0,416,400,spawn_wall_hor_obj);
room_instance_add(argument0,352,400,spawn_wall_hor_obj);
room_instance_add(argument0,288,400,spawn_wall_hor_obj);
room_instance_add(argument0,224,336,spawn_wall_hor_obj);
room_instance_add(argument0,224,368,spawn_wall_hor_obj);
room_instance_add(argument0,608,336,spawn_wall_hor_obj);
room_instance_add(argument0,608,368,spawn_wall_hor_obj);
room_instance_add(argument0,672,336,spawn_wall_hor_obj);
room_instance_add(argument0,672,368,spawn_wall_hor_obj);
room_instance_add(argument0,736,336,spawn_wall_hor_obj);
room_instance_add(argument0,736,368,spawn_wall_hor_obj);
room_instance_add(argument0,800,336,spawn_wall_hor_obj);
room_instance_add(argument0,800,368,spawn_wall_hor_obj);
room_instance_add(argument0,864,336,spawn_wall_hor_obj);
room_instance_add(argument0,864,368,spawn_wall_hor_obj);
room_instance_add(argument0,416,176,spawn_wall_hor_obj);
room_instance_add(argument0,320,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,384,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,512,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,576,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,576,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,512,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,448,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,384,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,320,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,256,336,spawn_wall_flip_hor_obj);
room_instance_add(argument0,256,368,spawn_wall_flip_hor_obj);
room_instance_add(argument0,640,336,spawn_wall_flip_hor_obj);
room_instance_add(argument0,640,368,spawn_wall_flip_hor_obj);
room_instance_add(argument0,704,336,spawn_wall_flip_hor_obj);
room_instance_add(argument0,704,368,spawn_wall_flip_hor_obj);
room_instance_add(argument0,768,336,spawn_wall_flip_hor_obj);
room_instance_add(argument0,768,368,spawn_wall_flip_hor_obj);
room_instance_add(argument0,832,336,spawn_wall_flip_hor_obj);
room_instance_add(argument0,832,368,spawn_wall_flip_hor_obj);
room_instance_add(argument0,896,336,spawn_wall_flip_hor_obj);
room_instance_add(argument0,896,368,spawn_wall_flip_hor_obj);
room_instance_add(argument0,448,176,spawn_wall_flip_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,352,spawn_wall_vert_obj);
room_instance_add(argument0,912,352,spawn_wall_vert_obj);
room_instance_add(argument0,272,320,spawn_wall_vert_obj);
room_instance_add(argument0,272,384,spawn_wall_vert_obj);
room_instance_add(argument0,592,384,spawn_wall_vert_obj);
room_instance_add(argument0,592,320,spawn_wall_vert_obj);
room_instance_add(argument0,400,288,spawn_wall_vert_obj);
room_instance_add(argument0,464,288,spawn_wall_vert_obj);
room_instance_add(argument0,400,224,spawn_wall_vert_obj);
room_instance_add(argument0,464,224,spawn_wall_vert_obj);
room_instance_add(argument0,400,256,spawn_wall_flip_vert_obj);
room_instance_add(argument0,464,256,spawn_wall_flip_vert_obj);
room_instance_add(argument0,400,192,spawn_wall_flip_vert_obj);
room_instance_add(argument0,464,192,spawn_wall_flip_vert_obj);
// Props
room_instance_add(argument0,584,336,asy_pole_obj);
room_instance_add(argument0,584,368,asy_pole_obj);
room_instance_add(argument0,584,312,asy_pole_obj);
room_instance_add(argument0,584,392,asy_pole_obj);
room_instance_add(argument0,400,312,asy_pole_obj);
room_instance_add(argument0,280,312,asy_pole_obj);
room_instance_add(argument0,280,392,asy_pole_obj);
room_instance_add(argument0,280,368,asy_pole_obj);
room_instance_add(argument0,280,336,asy_pole_obj);
room_instance_add(argument0,464,312,asy_pole_obj);
room_instance_add(argument0,336,352,asy_trig_obj);
