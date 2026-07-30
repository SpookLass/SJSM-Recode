
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","asy","ROOM_asy")+" 3"
    ini_close();
    // Spawns
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 224;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 864;
    global.spawn_arr[1,1] = 352;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 448;
    global.spawn_arr[2,1] = 320;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,asy_door_obj,asy_door_obj,spawn_door_trig_obj);
    with instance_create(216,352,spawn_door_trig_obj)
    { global.spawn_arr[0,4] = id; rm_var = asy_02_rm; rm_count_var = -1; rm_spawn_var = 1; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[1,4] { rm_var = asy_04_rm; rm_count_var = 1; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[2,4] { rm_var = asy_cell_05_rm; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[2,5]
    {
        if instance_exists(load_par_obj)
        {
            store_tex_var = background_get_texture(load_par_obj.bg_arr_var[10,0]);
            tex_var = store_tex_var;
        }
    }
');
// Effects
room_instance_add(argument0,0,0,fog_white_obj);
room_instance_add(argument0,0,0,asy_flash_obj);
room_instance_add(argument0,0,0,asy_static_obj);
room_instance_add(argument0,0,0,spawn_mus_obj);
// Floors
room_instance_add(argument0,288,352,spawn_floor_metal_obj);
room_instance_add(argument0,288,320,spawn_floor_metal_obj);
room_instance_add(argument0,320,352,spawn_floor_metal_obj);
room_instance_add(argument0,352,352,spawn_floor_metal_obj);
room_instance_add(argument0,576,352,spawn_floor_metal_obj);
room_instance_add(argument0,384,352,spawn_floor_metal_obj);
room_instance_add(argument0,320,320,spawn_floor_metal_obj);
room_instance_add(argument0,320,384,spawn_floor_metal_obj);
room_instance_add(argument0,352,384,spawn_floor_metal_obj);
room_instance_add(argument0,384,384,spawn_floor_metal_obj);
room_instance_add(argument0,384,320,spawn_floor_metal_obj);
room_instance_add(argument0,352,320,spawn_floor_metal_obj);
room_instance_add(argument0,416,320,spawn_floor_metal_obj);
room_instance_add(argument0,416,352,spawn_floor_metal_obj);
room_instance_add(argument0,416,384,spawn_floor_metal_obj);
room_instance_add(argument0,448,384,spawn_floor_metal_obj);
room_instance_add(argument0,448,352,spawn_floor_metal_obj);
room_instance_add(argument0,448,320,spawn_floor_metal_obj);
room_instance_add(argument0,480,320,spawn_floor_metal_obj);
room_instance_add(argument0,480,352,spawn_floor_metal_obj);
room_instance_add(argument0,480,384,spawn_floor_metal_obj);
room_instance_add(argument0,512,384,spawn_floor_metal_obj);
room_instance_add(argument0,512,352,spawn_floor_metal_obj);
room_instance_add(argument0,512,320,spawn_floor_metal_obj);
room_instance_add(argument0,544,320,spawn_floor_metal_obj);
room_instance_add(argument0,576,320,spawn_floor_metal_obj);
room_instance_add(argument0,256,320,spawn_floor_metal_obj);
room_instance_add(argument0,224,320,spawn_floor_metal_obj);
room_instance_add(argument0,224,352,spawn_floor_metal_obj);
room_instance_add(argument0,224,384,spawn_floor_metal_obj);
room_instance_add(argument0,256,352,spawn_floor_metal_obj);
room_instance_add(argument0,256,384,spawn_floor_metal_obj);
room_instance_add(argument0,288,384,spawn_floor_metal_obj);
room_instance_add(argument0,576,384,spawn_floor_metal_obj);
room_instance_add(argument0,544,384,spawn_floor_metal_obj);
room_instance_add(argument0,544,352,spawn_floor_metal_obj);
room_instance_add(argument0,608,320,spawn_floor_metal_obj);
room_instance_add(argument0,640,320,spawn_floor_metal_obj);
room_instance_add(argument0,640,384,spawn_floor_metal_obj);
room_instance_add(argument0,608,384,spawn_floor_metal_obj);
room_instance_add(argument0,608,352,spawn_floor_metal_obj);
room_instance_add(argument0,640,352,spawn_floor_metal_obj);
room_instance_add(argument0,672,320,spawn_floor_metal_obj);
room_instance_add(argument0,672,352,spawn_floor_metal_obj);
room_instance_add(argument0,672,384,spawn_floor_metal_obj);
room_instance_add(argument0,704,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,736,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,736,352,spawn_floor_alt_metal_obj);
room_instance_add(argument0,704,352,spawn_floor_alt_metal_obj);
room_instance_add(argument0,704,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,736,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,768,352,spawn_floor_alt_metal_obj);
room_instance_add(argument0,768,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,768,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,800,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,800,352,spawn_floor_alt_metal_obj);
room_instance_add(argument0,800,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,832,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,832,352,spawn_floor_alt_metal_obj);
room_instance_add(argument0,832,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,864,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,864,352,spawn_floor_alt_metal_obj);
room_instance_add(argument0,864,384,spawn_floor_alt_metal_obj);
// Ceilings
room_instance_add(argument0,288,352,spawn_ceil_obj);
room_instance_add(argument0,288,320,spawn_ceil_obj);
room_instance_add(argument0,320,352,spawn_ceil_obj);
room_instance_add(argument0,352,352,spawn_ceil_obj);
room_instance_add(argument0,576,352,spawn_ceil_obj);
room_instance_add(argument0,384,352,spawn_ceil_obj);
room_instance_add(argument0,320,320,spawn_ceil_obj);
room_instance_add(argument0,320,384,spawn_ceil_obj);
room_instance_add(argument0,352,384,spawn_ceil_obj);
room_instance_add(argument0,384,384,spawn_ceil_obj);
room_instance_add(argument0,384,320,spawn_ceil_obj);
room_instance_add(argument0,352,320,spawn_ceil_obj);
room_instance_add(argument0,416,320,spawn_ceil_obj);
room_instance_add(argument0,416,352,spawn_ceil_obj);
room_instance_add(argument0,416,384,spawn_ceil_obj);
room_instance_add(argument0,448,384,spawn_ceil_obj);
room_instance_add(argument0,448,352,spawn_ceil_obj);
room_instance_add(argument0,448,320,spawn_ceil_obj);
room_instance_add(argument0,480,320,spawn_ceil_obj);
room_instance_add(argument0,480,352,spawn_ceil_obj);
room_instance_add(argument0,480,384,spawn_ceil_obj);
room_instance_add(argument0,512,384,spawn_ceil_obj);
room_instance_add(argument0,512,352,spawn_ceil_obj);
room_instance_add(argument0,512,320,spawn_ceil_obj);
room_instance_add(argument0,544,320,spawn_ceil_obj);
room_instance_add(argument0,576,320,spawn_ceil_obj);
room_instance_add(argument0,256,320,spawn_ceil_obj);
room_instance_add(argument0,224,320,spawn_ceil_obj);
room_instance_add(argument0,224,352,spawn_ceil_obj);
room_instance_add(argument0,224,384,spawn_ceil_obj);
room_instance_add(argument0,256,352,spawn_ceil_obj);
room_instance_add(argument0,256,384,spawn_ceil_obj);
room_instance_add(argument0,288,384,spawn_ceil_obj);
room_instance_add(argument0,576,384,spawn_ceil_obj);
room_instance_add(argument0,544,384,spawn_ceil_obj);
room_instance_add(argument0,544,352,spawn_ceil_obj);
room_instance_add(argument0,608,320,spawn_ceil_obj);
room_instance_add(argument0,640,320,spawn_ceil_obj);
room_instance_add(argument0,640,384,spawn_ceil_obj);
room_instance_add(argument0,608,384,spawn_ceil_obj);
room_instance_add(argument0,608,352,spawn_ceil_obj);
room_instance_add(argument0,640,352,spawn_ceil_obj);
room_instance_add(argument0,672,320,spawn_ceil_obj);
room_instance_add(argument0,672,352,spawn_ceil_obj);
room_instance_add(argument0,672,384,spawn_ceil_obj);
room_instance_add(argument0,704,320,spawn_ceil_obj);
room_instance_add(argument0,736,320,spawn_ceil_obj);
room_instance_add(argument0,736,352,spawn_ceil_obj);
room_instance_add(argument0,704,352,spawn_ceil_obj);
room_instance_add(argument0,704,384,spawn_ceil_obj);
room_instance_add(argument0,736,384,spawn_ceil_obj);
room_instance_add(argument0,768,352,spawn_ceil_obj);
room_instance_add(argument0,768,320,spawn_ceil_obj);
room_instance_add(argument0,768,384,spawn_ceil_obj);
room_instance_add(argument0,800,320,spawn_ceil_obj);
room_instance_add(argument0,800,352,spawn_ceil_obj);
room_instance_add(argument0,800,384,spawn_ceil_obj);
room_instance_add(argument0,832,384,spawn_ceil_obj);
room_instance_add(argument0,832,352,spawn_ceil_obj);
room_instance_add(argument0,832,320,spawn_ceil_obj);
room_instance_add(argument0,864,320,spawn_ceil_obj);
room_instance_add(argument0,864,352,spawn_ceil_obj);
room_instance_add(argument0,864,384,spawn_ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,736,400,spawn_wall_hor_obj);
room_instance_add(argument0,800,400,spawn_wall_hor_obj);
room_instance_add(argument0,864,400,spawn_wall_hor_obj);
room_instance_add(argument0,864,304,spawn_wall_hor_obj);
room_instance_add(argument0,800,304,spawn_wall_hor_obj);
room_instance_add(argument0,736,304,spawn_wall_hor_obj);
room_instance_add(argument0,704,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,768,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,832,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,832,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,768,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,704,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,224,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,224,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,256,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,288,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,288,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,256,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,320,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,352,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,384,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,416,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,448,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,480,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,512,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,544,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,576,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,608,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,640,400,asy_wood_wall_hor_obj);
room_instance_add(argument0,640,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,608,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,576,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,544,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,512,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,480,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,448,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,416,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,384,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,352,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,320,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,672,304,asy_wood_wall_hor_obj);
room_instance_add(argument0,672,400,asy_wood_wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,880,320,spawn_wall_flip_vert_obj);
room_instance_add(argument0,880,352,spawn_wall_vert_obj);
room_instance_add(argument0,880,384,spawn_wall_flip_vert_obj);
room_instance_add(argument0,208,320,asy_wood_wall_vert_obj);
room_instance_add(argument0,208,352,asy_wood_wall_vert_obj);
room_instance_add(argument0,208,384,asy_wood_wall_vert_obj);