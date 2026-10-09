
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","asy","ROOM_asy")+" 1"
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 576;
    global.spawn_arr[1,1] = 352;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,false,asy_door_obj,spawn_door_trig_obj);
    with spawn_arr[1,4] { rm_var = asy_02_rm; rm_count_var = 1; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
');
// Effects
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,argument1.asy_mus_obj);
room_instance_add(argument0,0,0,argument1.asy_flash_obj);
room_instance_add(argument0,0,0,argument1.asy_static_obj);
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
// Walls (Horizontal)
room_instance_add(argument0,320,304,argument1.asy_wall_hor_obj);
room_instance_add(argument0,384,304,argument1.asy_wall_hor_obj);
room_instance_add(argument0,448,304,argument1.asy_wall_hor_obj);
room_instance_add(argument0,512,304,argument1.asy_wall_hor_obj);
room_instance_add(argument0,576,304,argument1.asy_wall_hor_obj);
room_instance_add(argument0,576,400,argument1.asy_wall_hor_obj);
room_instance_add(argument0,512,400,argument1.asy_wall_hor_obj);
room_instance_add(argument0,448,400,argument1.asy_wall_hor_obj);
room_instance_add(argument0,384,400,argument1.asy_wall_hor_obj);
room_instance_add(argument0,320,400,argument1.asy_wall_hor_obj);
room_instance_add(argument0,256,336,argument1.asy_wall_hor_obj);
room_instance_add(argument0,256,368,argument1.asy_wall_hor_obj);
room_instance_add(argument0,288,304,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,352,304,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,416,304,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,480,304,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,544,304,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,544,400,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,480,400,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,416,400,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,352,400,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,288,400,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,224,336,argument1.asy_wall_flip_hor_obj);
room_instance_add(argument0,224,368,argument1.asy_wall_flip_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,272,320,argument1.asy_wall_vert_obj);
room_instance_add(argument0,208,352,argument1.asy_wall_vert_obj);
room_instance_add(argument0,272,384,argument1.asy_wall_vert_obj);
room_instance_add(argument0,592,320,argument1.asy_wall_flip_vert_obj);
room_instance_add(argument0,592,384,argument1.asy_wall_vert_obj);
room_instance_add(argument0,592,352,argument1.asy_wall_flip_vert_obj);
// Props
room_instance_add(argument0,584,336,argument1.asy_pole_obj);
room_instance_add(argument0,584,368,argument1.asy_pole_obj);
room_instance_add(argument0,584,312,argument1.asy_pole_obj);
room_instance_add(argument0,584,392,argument1.asy_pole_obj);
room_instance_add(argument0,432,312,argument1.asy_pole_obj);
room_instance_add(argument0,432,392,argument1.asy_pole_obj);
room_instance_add(argument0,280,312,argument1.asy_pole_obj);
room_instance_add(argument0,280,392,argument1.asy_pole_obj);
room_instance_add(argument0,280,368,argument1.asy_pole_obj);
room_instance_add(argument0,280,336,argument1.asy_pole_obj);