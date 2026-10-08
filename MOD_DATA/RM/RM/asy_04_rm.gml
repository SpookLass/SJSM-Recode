
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
    spawn_create_scr(true,false,load_par_obj.asy_door_obj,false,spawn_leave_door_trig_obj);
    with instance_create(216,352,spawn_door_trig_obj)
    {
        global.spawn_arr[0,4] = id;
        txt_lock_var = local.lock;
        rm_var = asy_03_rm;
        rm_count_var = -1;
        rm_spawn_var = 1;
        snd_len_var = 1;
        snd_arr[0] = door_m_02_snd;
    }
    // Gate
    with instance_create(416,288,load_par_obj.asy_cage_fake_obj) { direction = 90; yaw_var = 180; }
    with instance_create(448,288,load_par_obj.asy_cage_fake_obj) { direction = 90; yaw_var = 0; }
');
// Effects
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,argument1.asy_flash_obj);
room_instance_add(argument0,0,0,argument1.asy_static_obj);
room_instance_add(argument0,0,0,argument1.asy_mus_obj);
// Floors
room_instance_add(argument0,288,352,argument1.asy_floor_obj);
room_instance_add(argument0,288,320,argument1.asy_floor_obj);
room_instance_add(argument0,320,352,argument1.asy_floor_obj);
room_instance_add(argument0,352,352,argument1.asy_floor_obj);
room_instance_add(argument0,384,352,argument1.asy_floor_obj);
room_instance_add(argument0,416,320,argument1.asy_floor_obj);
room_instance_add(argument0,416,352,argument1.asy_floor_obj);
room_instance_add(argument0,416,384,argument1.asy_floor_obj);
room_instance_add(argument0,288,384,argument1.asy_floor_obj);
room_instance_add(argument0,448,320,argument1.asy_floor_obj);
room_instance_add(argument0,448,352,argument1.asy_floor_obj);
room_instance_add(argument0,448,384,argument1.asy_floor_obj);
room_instance_add(argument0,480,352,argument1.asy_floor_obj);
room_instance_add(argument0,512,352,argument1.asy_floor_obj);
room_instance_add(argument0,544,352,argument1.asy_floor_obj);
room_instance_add(argument0,576,352,argument1.asy_floor_obj);
room_instance_add(argument0,576,384,argument1.asy_floor_obj);
room_instance_add(argument0,576,320,argument1.asy_floor_obj);
room_instance_add(argument0,608,352,argument1.asy_floor_obj);
room_instance_add(argument0,640,352,argument1.asy_floor_obj);
room_instance_add(argument0,672,352,argument1.asy_floor_obj);
room_instance_add(argument0,704,352,argument1.asy_floor_obj);
room_instance_add(argument0,736,352,argument1.asy_floor_obj);
room_instance_add(argument0,768,352,argument1.asy_floor_obj);
room_instance_add(argument0,800,352,argument1.asy_floor_obj);
room_instance_add(argument0,832,352,argument1.asy_floor_obj);
room_instance_add(argument0,864,352,argument1.asy_floor_obj);
room_instance_add(argument0,896,352,argument1.asy_floor_obj);
room_instance_add(argument0,224,352,argument1.asy_grate_obj);
room_instance_add(argument0,256,352,argument1.asy_grate_obj);
room_instance_add(argument0,320,320,argument1.asy_grate_obj);
room_instance_add(argument0,320,384,argument1.asy_grate_obj);
room_instance_add(argument0,352,320,argument1.asy_grate_obj);
room_instance_add(argument0,352,384,argument1.asy_grate_obj);
room_instance_add(argument0,384,320,argument1.asy_grate_obj);
room_instance_add(argument0,384,384,argument1.asy_grate_obj);
room_instance_add(argument0,480,384,argument1.asy_grate_obj);
room_instance_add(argument0,512,384,argument1.asy_grate_obj);
room_instance_add(argument0,544,384,argument1.asy_grate_obj);
room_instance_add(argument0,544,320,argument1.asy_grate_obj);
room_instance_add(argument0,512,320,argument1.asy_grate_obj);
room_instance_add(argument0,480,320,argument1.asy_grate_obj);
room_instance_add(argument0,416,288,argument1.asy_grate_obj);
room_instance_add(argument0,448,288,argument1.asy_grate_obj);
room_instance_add(argument0,448,256,argument1.asy_grate_obj);
room_instance_add(argument0,416,256,argument1.asy_grate_obj);
room_instance_add(argument0,416,224,argument1.asy_grate_obj);
room_instance_add(argument0,448,224,argument1.asy_grate_obj);
room_instance_add(argument0,448,192,argument1.asy_grate_obj);
room_instance_add(argument0,416,192,argument1.asy_grate_obj);
// Ceilings
room_instance_add(argument0,288,352,argument1.asy_ceil_obj);
room_instance_add(argument0,288,320,argument1.asy_ceil_obj);
room_instance_add(argument0,320,352,argument1.asy_ceil_obj);
room_instance_add(argument0,352,352,argument1.asy_ceil_obj);
room_instance_add(argument0,384,352,argument1.asy_ceil_obj);
room_instance_add(argument0,416,320,argument1.asy_ceil_obj);
room_instance_add(argument0,416,352,argument1.asy_ceil_obj);
room_instance_add(argument0,416,384,argument1.asy_ceil_obj);
room_instance_add(argument0,288,384,argument1.asy_ceil_obj);
room_instance_add(argument0,448,320,argument1.asy_ceil_obj);
room_instance_add(argument0,448,352,argument1.asy_ceil_obj);
room_instance_add(argument0,448,384,argument1.asy_ceil_obj);
room_instance_add(argument0,480,352,argument1.asy_ceil_obj);
room_instance_add(argument0,512,352,argument1.asy_ceil_obj);
room_instance_add(argument0,544,352,argument1.asy_ceil_obj);
room_instance_add(argument0,576,352,argument1.asy_ceil_obj);
room_instance_add(argument0,576,384,argument1.asy_ceil_obj);
room_instance_add(argument0,576,320,argument1.asy_ceil_obj);
room_instance_add(argument0,608,352,argument1.asy_ceil_obj);
room_instance_add(argument0,640,352,argument1.asy_ceil_obj);
room_instance_add(argument0,672,352,argument1.asy_ceil_obj);
room_instance_add(argument0,704,352,argument1.asy_ceil_obj);
room_instance_add(argument0,736,352,argument1.asy_ceil_obj);
room_instance_add(argument0,768,352,argument1.asy_ceil_obj);
room_instance_add(argument0,800,352,argument1.asy_ceil_obj);
room_instance_add(argument0,832,352,argument1.asy_ceil_obj);
room_instance_add(argument0,864,352,argument1.asy_ceil_obj);
room_instance_add(argument0,896,352,argument1.asy_ceil_obj);
room_instance_add(argument0,224,352,argument1.asy_ceil_obj);
room_instance_add(argument0,256,352,argument1.asy_ceil_obj);
room_instance_add(argument0,320,320,argument1.asy_ceil_obj);
room_instance_add(argument0,320,384,argument1.asy_ceil_obj);
room_instance_add(argument0,352,320,argument1.asy_ceil_obj);
room_instance_add(argument0,352,384,argument1.asy_ceil_obj);
room_instance_add(argument0,384,320,argument1.asy_ceil_obj);
room_instance_add(argument0,384,384,argument1.asy_ceil_obj);
room_instance_add(argument0,480,384,argument1.asy_ceil_obj);
room_instance_add(argument0,512,384,argument1.asy_ceil_obj);
room_instance_add(argument0,544,384,argument1.asy_ceil_obj);
room_instance_add(argument0,544,320,argument1.asy_ceil_obj);
room_instance_add(argument0,512,320,argument1.asy_ceil_obj);
room_instance_add(argument0,480,320,argument1.asy_ceil_obj);
room_instance_add(argument0,416,288,argument1.asy_ceil_obj);
room_instance_add(argument0,448,288,argument1.asy_ceil_obj);
room_instance_add(argument0,448,256,argument1.asy_ceil_obj);
room_instance_add(argument0,416,256,argument1.asy_ceil_obj);
room_instance_add(argument0,416,224,argument1.asy_ceil_obj);
room_instance_add(argument0,448,224,argument1.asy_ceil_obj);
room_instance_add(argument0,448,192,argument1.asy_ceil_obj);
room_instance_add(argument0,416,192,argument1.asy_ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,288,304,argument1.asy_wall_hor_obj);
room_instance_add(argument0,352,304,argument1.asy_wall_hor_obj);
room_instance_add(argument0,480,304,argument1.asy_wall_hor_obj);
room_instance_add(argument0,544,304,argument1.asy_wall_hor_obj);
room_instance_add(argument0,544,400,argument1.asy_wall_hor_obj);
room_instance_add(argument0,480,400,argument1.asy_wall_hor_obj);
room_instance_add(argument0,416,400,argument1.asy_wall_hor_obj);
room_instance_add(argument0,352,400,argument1.asy_wall_hor_obj);
room_instance_add(argument0,288,400,argument1.asy_wall_hor_obj);
room_instance_add(argument0,224,336,argument1.asy_wall_hor_obj);
room_instance_add(argument0,224,368,argument1.asy_wall_hor_obj);
room_instance_add(argument0,608,336,argument1.asy_wall_hor_obj);
room_instance_add(argument0,608,368,argument1.asy_wall_hor_obj);
room_instance_add(argument0,672,336,argument1.asy_wall_hor_obj);
room_instance_add(argument0,672,368,argument1.asy_wall_hor_obj);
room_instance_add(argument0,736,336,argument1.asy_wall_hor_obj);
room_instance_add(argument0,736,368,argument1.asy_wall_hor_obj);
room_instance_add(argument0,800,336,argument1.asy_wall_hor_obj);
room_instance_add(argument0,800,368,argument1.asy_wall_hor_obj);
room_instance_add(argument0,864,336,argument1.asy_wall_hor_obj);
room_instance_add(argument0,864,368,argument1.asy_wall_hor_obj);
room_instance_add(argument0,416,176,argument1.asy_wall_hor_obj);
room_instance_add(argument0,320,304,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,384,304,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,512,304,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,576,304,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,576,400,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,512,400,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,448,400,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,384,400,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,320,400,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,256,336,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,256,368,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,640,336,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,640,368,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,704,336,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,704,368,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,768,336,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,768,368,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,832,336,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,832,368,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,896,336,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,896,368,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,448,176,argument1.asy_wall_flip_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,208,352,argument1.asy_wall_vert_obj);
room_instance_add(argument0,912,352,argument1.asy_wall_vert_obj);
room_instance_add(argument0,272,320,argument1.asy_wall_vert_obj);
room_instance_add(argument0,272,384,argument1.asy_wall_vert_obj);
room_instance_add(argument0,592,384,argument1.asy_wall_vert_obj);
room_instance_add(argument0,592,320,argument1.asy_wall_vert_obj);
room_instance_add(argument0,400,288,argument1.asy_wall_vert_obj);
room_instance_add(argument0,464,288,argument1.asy_wall_vert_obj);
room_instance_add(argument0,400,224,argument1.asy_wall_vert_obj);
room_instance_add(argument0,464,224,argument1.asy_wall_vert_obj);
room_instance_add(argument0,400,256,argument1.asy_wall_flip_vert_obj);
room_instance_add(argument0,464,256,argument1.asy_wall_flip_vert_obj);
room_instance_add(argument0,400,192,argument1.asy_wall_flip_vert_obj);
room_instance_add(argument0,464,192,argument1.asy_wall_flip_vert_obj);
// Props
room_instance_add(argument0,584,336,argument1.asy_pole_obj);
room_instance_add(argument0,584,368,argument1.asy_pole_obj);
room_instance_add(argument0,584,312,argument1.asy_pole_obj);
room_instance_add(argument0,584,392,argument1.asy_pole_obj);
room_instance_add(argument0,400,312,argument1.asy_pole_obj);
room_instance_add(argument0,280,312,argument1.asy_pole_obj);
room_instance_add(argument0,280,392,argument1.asy_pole_obj);
room_instance_add(argument0,280,368,argument1.asy_pole_obj);
room_instance_add(argument0,280,336,argument1.asy_pole_obj);
room_instance_add(argument0,464,312,argument1.asy_pole_obj);
room_instance_add(argument0,336,352,argument1.asy_trig_obj);
