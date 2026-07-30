
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","asy","ROOM_asy")+" 2";
    local.broke = ini_read_string("UI","broke","UI_broke");
    ini_close();
    // Spawns
    global.spawn_len_var = 16;
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 672;
    global.spawn_arr[1,1] = 576;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    global.spawn_arr[2,0] = 384;
    global.spawn_arr[2,1] = 320;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    global.spawn_arr[3,0] = 480;
    global.spawn_arr[3,1] = 320;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 270;
    global.spawn_arr[4,0] = 576;
    global.spawn_arr[4,1] = 384;
    global.spawn_arr[4,2] = 0;
    global.spawn_arr[4,3] = 90;
    global.spawn_arr[5,0] = 672;
    global.spawn_arr[5,1] = 320;
    global.spawn_arr[5,2] = 0;
    global.spawn_arr[5,3] = 270;
    global.spawn_arr[6,0] = 384;
    global.spawn_arr[6,1] = 384;
    global.spawn_arr[6,2] = 0;
    global.spawn_arr[6,3] = 90;
    global.spawn_arr[7,0] = 480;
    global.spawn_arr[7,1] = 384;
    global.spawn_arr[7,2] = 0;
    global.spawn_arr[7,3] = 90;
    global.spawn_arr[8,0] = 288;
    global.spawn_arr[8,1] = 320;
    global.spawn_arr[8,2] = 0;
    global.spawn_arr[8,3] = 270;
    global.spawn_arr[9,0] = 576;
    global.spawn_arr[9,1] = 320;
    global.spawn_arr[9,2] = 0;
    global.spawn_arr[9,3] = 270;
    global.spawn_arr[10,0] = 288;
    global.spawn_arr[10,1] = 384;
    global.spawn_arr[10,2] = 0;
    global.spawn_arr[10,3] = 90;
    global.spawn_arr[11,0] = 704;
    global.spawn_arr[11,1] = 352;
    global.spawn_arr[11,2] = 0;
    global.spawn_arr[11,3] = 180;
    global.spawn_arr[12,0] = 640;
    global.spawn_arr[12,1] = 544;
    global.spawn_arr[12,2] = 0;
    global.spawn_arr[12,3] = 0;
    global.spawn_arr[13,0] = 704;
    global.spawn_arr[13,1] = 544;
    global.spawn_arr[13,2] = 0;
    global.spawn_arr[13,3] = 180;
    global.spawn_arr[14,0] = 640;
    global.spawn_arr[14,1] = 448;
    global.spawn_arr[14,2] = 0;
    global.spawn_arr[14,3] = 0;
    global.spawn_arr[15,0] = 704;
    global.spawn_arr[15,1] = 448;
    global.spawn_arr[15,2] = 0;
    global.spawn_arr[15,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,asy_door_obj,asy_door_obj,spawn_door_trig_obj);
    with instance_create(248,352,spawn_door_trig_obj)
    { global.spawn_arr[0,4] = id; rm_var = asy_01_rm; rm_count_var = -1; rm_spawn_var = 1; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[1,4] { rm_var = asy_03_rm; rm_count_var = 1; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[2,4] { rm_var = asy_cell_01_rm; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[3,4] { rm_var = asy_cell_02_rm; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[4,4] { rm_var = asy_cell_03_rm; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[5,4] { rm_var = asy_cell_04_rm; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    for (local.i=2; local.i<6; local.i+=1;)
    {
        with spawn_arr[local.i,5]
        {
            if instance_exists(load_par_obj)
            {
                store_tex_var = background_get_texture(load_par_obj.bg_arr_var[10,0]);
                tex_var = store_tex_var;
            }
        }
    }
    for (local.i=6; local.i<global.spawn_len_var; local.i+=1;)
    {
        with spawn_arr[local.i,4] { txt_lock_var = local.broke; lock_var = true; }
        with spawn_arr[local.i,5]
        {
            if instance_exists(load_par_obj)
            {
                store_tex_var = background_get_texture(load_par_obj.bg_arr_var[11,0]);
                tex_var = store_tex_var;
            }
        }
    }
    // Bodies
    with instance_create(608,320,asy_body_obj) { direction = 270; }
    with instance_create(704,384,asy_body_obj) { direction = 180; }
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
room_instance_add(argument0,384,320,spawn_floor_metal_obj);
room_instance_add(argument0,384,352,spawn_floor_metal_obj);
room_instance_add(argument0,384,384,spawn_floor_metal_obj);
room_instance_add(argument0,416,352,spawn_floor_metal_obj);
room_instance_add(argument0,448,352,spawn_floor_metal_obj);
room_instance_add(argument0,480,352,spawn_floor_metal_obj);
room_instance_add(argument0,480,320,spawn_floor_metal_obj);
room_instance_add(argument0,480,384,spawn_floor_metal_obj);
room_instance_add(argument0,512,352,spawn_floor_metal_obj);
room_instance_add(argument0,544,352,spawn_floor_metal_obj);
room_instance_add(argument0,576,352,spawn_floor_metal_obj);
room_instance_add(argument0,576,320,spawn_floor_metal_obj);
room_instance_add(argument0,576,384,spawn_floor_metal_obj);
room_instance_add(argument0,608,352,spawn_floor_metal_obj);
room_instance_add(argument0,640,352,spawn_floor_metal_obj);
room_instance_add(argument0,672,416,spawn_floor_metal_obj);
room_instance_add(argument0,672,352,spawn_floor_metal_obj);
room_instance_add(argument0,672,384,spawn_floor_metal_obj);
room_instance_add(argument0,672,448,spawn_floor_metal_obj);
room_instance_add(argument0,640,448,spawn_floor_metal_obj);
room_instance_add(argument0,704,448,spawn_floor_metal_obj);
room_instance_add(argument0,672,480,spawn_floor_metal_obj);
room_instance_add(argument0,672,512,spawn_floor_metal_obj);
room_instance_add(argument0,640,544,spawn_floor_metal_obj);
room_instance_add(argument0,672,544,spawn_floor_metal_obj);
room_instance_add(argument0,704,544,spawn_floor_metal_obj);
room_instance_add(argument0,672,320,spawn_floor_metal_obj);
room_instance_add(argument0,704,352,spawn_floor_metal_obj);
room_instance_add(argument0,672,576,spawn_floor_metal_obj);
room_instance_add(argument0,256,352,spawn_floor_metal_obj);
room_instance_add(argument0,288,384,spawn_floor_metal_obj);
room_instance_add(argument0,320,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,320,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,352,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,352,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,416,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,448,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,512,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,544,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,608,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,640,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,704,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,704,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,704,416,spawn_floor_alt_metal_obj);
room_instance_add(argument0,640,416,spawn_floor_alt_metal_obj);
room_instance_add(argument0,640,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,608,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,544,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,512,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,448,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,416,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,640,480,spawn_floor_alt_metal_obj);
room_instance_add(argument0,704,480,spawn_floor_alt_metal_obj);
room_instance_add(argument0,704,512,spawn_floor_alt_metal_obj);
room_instance_add(argument0,640,512,spawn_floor_alt_metal_obj);
room_instance_add(argument0,256,320,spawn_floor_alt_metal_obj);
room_instance_add(argument0,256,384,spawn_floor_alt_metal_obj);
room_instance_add(argument0,640,576,spawn_floor_alt_metal_obj);
room_instance_add(argument0,704,576,spawn_floor_alt_metal_obj);
// Ceilings
room_instance_add(argument0,288,352,spawn_ceil_obj);
room_instance_add(argument0,288,320,spawn_ceil_obj);
room_instance_add(argument0,320,352,spawn_ceil_obj);
room_instance_add(argument0,352,352,spawn_ceil_obj);
room_instance_add(argument0,384,320,spawn_ceil_obj);
room_instance_add(argument0,384,352,spawn_ceil_obj);
room_instance_add(argument0,384,384,spawn_ceil_obj);
room_instance_add(argument0,416,352,spawn_ceil_obj);
room_instance_add(argument0,448,352,spawn_ceil_obj);
room_instance_add(argument0,480,352,spawn_ceil_obj);
room_instance_add(argument0,480,320,spawn_ceil_obj);
room_instance_add(argument0,480,384,spawn_ceil_obj);
room_instance_add(argument0,512,352,spawn_ceil_obj);
room_instance_add(argument0,544,352,spawn_ceil_obj);
room_instance_add(argument0,576,352,spawn_ceil_obj);
room_instance_add(argument0,576,320,spawn_ceil_obj);
room_instance_add(argument0,576,384,spawn_ceil_obj);
room_instance_add(argument0,608,352,spawn_ceil_obj);
room_instance_add(argument0,640,352,spawn_ceil_obj);
room_instance_add(argument0,672,416,spawn_ceil_obj);
room_instance_add(argument0,672,352,spawn_ceil_obj);
room_instance_add(argument0,672,384,spawn_ceil_obj);
room_instance_add(argument0,672,448,spawn_ceil_obj);
room_instance_add(argument0,640,448,spawn_ceil_obj);
room_instance_add(argument0,704,448,spawn_ceil_obj);
room_instance_add(argument0,672,480,spawn_ceil_obj);
room_instance_add(argument0,672,512,spawn_ceil_obj);
room_instance_add(argument0,640,544,spawn_ceil_obj);
room_instance_add(argument0,672,544,spawn_ceil_obj);
room_instance_add(argument0,704,544,spawn_ceil_obj);
room_instance_add(argument0,672,320,spawn_ceil_obj);
room_instance_add(argument0,704,352,spawn_ceil_obj);
room_instance_add(argument0,672,576,spawn_ceil_obj);
room_instance_add(argument0,256,352,spawn_ceil_obj);
room_instance_add(argument0,288,384,spawn_ceil_obj);
room_instance_add(argument0,608,320,spawn_ceil_obj);
room_instance_add(argument0,704,384,spawn_ceil_obj);
room_instance_add(argument0,640,512,spawn_ceil_obj);
room_instance_add(argument0,320,320,spawn_ceil_obj);
room_instance_add(argument0,320,384,spawn_ceil_obj);
room_instance_add(argument0,352,384,spawn_ceil_obj);
room_instance_add(argument0,352,320,spawn_ceil_obj);
room_instance_add(argument0,416,320,spawn_ceil_obj);
room_instance_add(argument0,448,320,spawn_ceil_obj);
room_instance_add(argument0,512,320,spawn_ceil_obj);
room_instance_add(argument0,544,320,spawn_ceil_obj);
room_instance_add(argument0,608,320,spawn_ceil_obj);
room_instance_add(argument0,640,320,spawn_ceil_obj);
room_instance_add(argument0,704,320,spawn_ceil_obj);
room_instance_add(argument0,704,384,spawn_ceil_obj);
room_instance_add(argument0,704,416,spawn_ceil_obj);
room_instance_add(argument0,640,416,spawn_ceil_obj);
room_instance_add(argument0,640,384,spawn_ceil_obj);
room_instance_add(argument0,608,384,spawn_ceil_obj);
room_instance_add(argument0,544,384,spawn_ceil_obj);
room_instance_add(argument0,512,384,spawn_ceil_obj);
room_instance_add(argument0,448,384,spawn_ceil_obj);
room_instance_add(argument0,416,384,spawn_ceil_obj);
room_instance_add(argument0,640,480,spawn_ceil_obj);
room_instance_add(argument0,704,480,spawn_ceil_obj);
room_instance_add(argument0,704,512,spawn_ceil_obj);
room_instance_add(argument0,640,512,spawn_ceil_obj);
room_instance_add(argument0,256,320,spawn_ceil_obj);
room_instance_add(argument0,256,384,spawn_ceil_obj);
room_instance_add(argument0,640,576,spawn_ceil_obj);
room_instance_add(argument0,704,576,spawn_ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,256,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,288,304,spawn_wall_hor_obj);
room_instance_add(argument0,320,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,352,304,spawn_wall_hor_obj);
room_instance_add(argument0,384,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,416,304,spawn_wall_hor_obj);
room_instance_add(argument0,448,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,480,304,spawn_wall_hor_obj);
room_instance_add(argument0,512,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,544,304,spawn_wall_hor_obj);
room_instance_add(argument0,576,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,608,304,spawn_wall_hor_obj);
room_instance_add(argument0,640,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,672,304,spawn_wall_hor_obj);
room_instance_add(argument0,704,304,spawn_wall_flip_hor_obj);
room_instance_add(argument0,256,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,288,400,spawn_wall_hor_obj);
room_instance_add(argument0,320,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,352,400,spawn_wall_hor_obj);
room_instance_add(argument0,384,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,416,400,spawn_wall_hor_obj);
room_instance_add(argument0,448,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,480,400,spawn_wall_hor_obj);
room_instance_add(argument0,512,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,544,400,spawn_wall_hor_obj);
room_instance_add(argument0,576,400,spawn_wall_flip_hor_obj);
room_instance_add(argument0,608,400,spawn_wall_hor_obj);
room_instance_add(argument0,640,592,spawn_wall_flip_hor_obj);
room_instance_add(argument0,672,592,spawn_wall_hor_obj);
room_instance_add(argument0,704,592,spawn_wall_flip_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,320,spawn_wall_flip_vert_obj);
room_instance_add(argument0,240,352,spawn_wall_vert_obj);
room_instance_add(argument0,240,384,spawn_wall_flip_vert_obj);
room_instance_add(argument0,624,416,spawn_wall_vert_obj);
room_instance_add(argument0,624,448,spawn_wall_flip_vert_obj);
room_instance_add(argument0,624,480,spawn_wall_vert_obj);
room_instance_add(argument0,624,512,spawn_wall_flip_vert_obj);
room_instance_add(argument0,624,544,spawn_wall_vert_obj);
room_instance_add(argument0,624,576,spawn_wall_flip_vert_obj);
room_instance_add(argument0,720,320,spawn_wall_flip_vert_obj);
room_instance_add(argument0,720,352,spawn_wall_vert_obj);
room_instance_add(argument0,720,384,spawn_wall_flip_vert_obj);
room_instance_add(argument0,720,416,spawn_wall_vert_obj);
room_instance_add(argument0,720,448,spawn_wall_flip_vert_obj);
room_instance_add(argument0,720,480,spawn_wall_vert_obj);
room_instance_add(argument0,720,512,spawn_wall_flip_vert_obj);
room_instance_add(argument0,720,544,spawn_wall_vert_obj);
room_instance_add(argument0,720,576,spawn_wall_flip_vert_obj);
// Props
room_instance_add(argument0,248,312,asy_pole_obj);
room_instance_add(argument0,248,392,asy_pole_obj);
room_instance_add(argument0,632,584,asy_pole_obj);
room_instance_add(argument0,712,584,asy_pole_obj);
room_instance_add(argument0,628,396,asy_pole_obj);
room_instance_add(argument0,712,312,asy_pole_obj);
room_instance_add(argument0,528,312,asy_pole_obj);
room_instance_add(argument0,528,392,asy_pole_obj);
room_instance_add(argument0,432,392,asy_pole_obj);
room_instance_add(argument0,432,312,asy_pole_obj);
room_instance_add(argument0,248,336,asy_pole_obj);
room_instance_add(argument0,248,368,asy_pole_obj);
room_instance_add(argument0,656,584,asy_pole_obj);
room_instance_add(argument0,688,584,asy_pole_obj);
room_instance_add(argument0,716,432,asy_pole_obj);
room_instance_add(argument0,716,464,asy_pole_obj);
room_instance_add(argument0,716,448,asy_cage_vert_obj);
room_instance_add(argument0,640,512,asy_body_obj);