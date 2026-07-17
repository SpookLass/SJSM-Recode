
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","asy_cell","ROOM_asy_cell")+" 5"
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 160;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 256;
    global.spawn_arr[1,1] = 160;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(false,false,false,asy_door_obj,spawn_door_trig_obj);
    with spawn_arr[1,4] { rm_var = asy_03_rm; spawn_var = 2; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[1,5]
    {
        if instance_exists(load_par_obj)
        {
            store_tex_var = background_get_texture(load_par_obj.bg_arr_var[10,0]);
            tex_var = store_tex_var;
        }
    }
');
// Effects
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,asy_flash_obj);
room_instance_add(argument0,0,0,asy_static_obj);
room_instance_add(argument0,0,0,spawn_mus_obj);
// Floors
room_instance_add(argument0,256,160,asy_womb_floor_obj);
room_instance_add(argument0,288,128,asy_womb_floor_obj);
room_instance_add(argument0,288,160,asy_womb_floor_obj);
room_instance_add(argument0,288,192,asy_womb_floor_obj);
room_instance_add(argument0,320,192,asy_womb_floor_obj);
room_instance_add(argument0,320,160,asy_womb_floor_obj);
room_instance_add(argument0,320,128,asy_womb_floor_obj);
room_instance_add(argument0,352,128,asy_womb_floor_obj);
room_instance_add(argument0,352,160,asy_womb_floor_obj);
room_instance_add(argument0,352,192,asy_womb_floor_obj);
// Ceilings
room_instance_add(argument0,256,160,asy_womb_ceil_obj);
room_instance_add(argument0,288,128,asy_womb_ceil_obj);
room_instance_add(argument0,288,160,asy_womb_ceil_obj);
room_instance_add(argument0,288,192,asy_womb_ceil_obj);
room_instance_add(argument0,320,192,asy_womb_ceil_obj);
room_instance_add(argument0,320,160,asy_womb_ceil_obj);
room_instance_add(argument0,320,128,asy_womb_ceil_obj);
room_instance_add(argument0,352,128,asy_womb_ceil_obj);
room_instance_add(argument0,352,160,asy_womb_ceil_obj);
room_instance_add(argument0,352,192,asy_womb_ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,288,112,asy_womb_wall_hor_obj);
room_instance_add(argument0,320,112,asy_womb_wall_hor_obj);
room_instance_add(argument0,256,144,asy_womb_wall_hor_obj);
room_instance_add(argument0,256,176,asy_womb_wall_hor_obj);
room_instance_add(argument0,288,208,asy_womb_wall_hor_obj);
room_instance_add(argument0,320,208,asy_womb_wall_hor_obj);
room_instance_add(argument0,352,208,asy_womb_wall_hor_obj);
room_instance_add(argument0,352,112,asy_womb_wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,160,asy_womb_wall_vert_obj);
room_instance_add(argument0,272,128,asy_womb_wall_vert_obj);
room_instance_add(argument0,272,192,asy_womb_wall_vert_obj);
room_instance_add(argument0,368,128,asy_womb_wall_vert_obj);
room_instance_add(argument0,368,160,asy_womb_wall_vert_obj);
room_instance_add(argument0,368,192,asy_womb_wall_vert_obj);
// Props
room_instance_add(argument0,320,160,asy_baby_obj);