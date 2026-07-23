/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","mad","ROOM_mad")+" "+ini_read_string("ROOM","mad_space","ROOM_mad_space");
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 464;
    global.spawn_arr[0,1] = 336;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 464;
    global.spawn_arr[1,1] = 336;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(false,false,false,mad_door_obj,spawn_door_trig_obj);
    with spawn_arr[1,4] { rm_var = mad_01_rm; spawn_var = 3; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    if global.diff_var != 0
    {
        with instance_create(572,384,mad_cat_obj)
        {
            snd_id_var = 10;
            translate_id_var = "cat_05";
            event_user(1);
        }
    }
');
// Effects
room_instance_add(argument0,0,0,spawn_mus_03_obj);
room_instance_add(argument0,528,336,mad_space_obj);
// Floors
room_instance_add(argument0,464,272,floor_inv_obj);
room_instance_add(argument0,496,272,floor_inv_obj);
room_instance_add(argument0,528,272,floor_inv_obj);
room_instance_add(argument0,560,272,floor_inv_obj);
room_instance_add(argument0,592,272,floor_inv_obj);
room_instance_add(argument0,464,304,floor_inv_obj);
room_instance_add(argument0,496,304,floor_inv_obj);
room_instance_add(argument0,528,304,floor_inv_obj);
room_instance_add(argument0,560,304,floor_inv_obj);
room_instance_add(argument0,592,304,floor_inv_obj);
room_instance_add(argument0,464,336,floor_inv_obj);
room_instance_add(argument0,496,336,floor_inv_obj);
room_instance_add(argument0,528,336,floor_inv_obj);
room_instance_add(argument0,560,336,floor_inv_obj);
room_instance_add(argument0,592,336,floor_inv_obj);
room_instance_add(argument0,464,368,floor_inv_obj);
room_instance_add(argument0,496,368,floor_inv_obj);
room_instance_add(argument0,528,368,floor_inv_obj);
room_instance_add(argument0,560,368,floor_inv_obj);
room_instance_add(argument0,592,368,floor_inv_obj);
room_instance_add(argument0,464,400,floor_inv_obj);
room_instance_add(argument0,496,400,floor_inv_obj);
room_instance_add(argument0,528,400,floor_inv_obj);
room_instance_add(argument0,560,400,floor_inv_obj);
room_instance_add(argument0,592,400,floor_inv_obj);
// Walls (Horizontal)
room_instance_add(argument0,464,256,wall_inv_hor_obj);
room_instance_add(argument0,464,416,wall_inv_hor_obj);
room_instance_add(argument0,496,416,wall_inv_hor_obj);
room_instance_add(argument0,528,416,wall_inv_hor_obj);
room_instance_add(argument0,560,416,wall_inv_hor_obj);
room_instance_add(argument0,592,416,wall_inv_hor_obj);
room_instance_add(argument0,496,256,wall_inv_hor_obj);
room_instance_add(argument0,528,256,wall_inv_hor_obj);
room_instance_add(argument0,560,256,wall_inv_hor_obj);
room_instance_add(argument0,592,256,wall_inv_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,448,336,wall_inv_vert_obj);
room_instance_add(argument0,448,304,wall_inv_vert_obj);
room_instance_add(argument0,448,368,wall_inv_vert_obj);
room_instance_add(argument0,448,400,wall_inv_vert_obj);
room_instance_add(argument0,448,272,wall_inv_vert_obj);
room_instance_add(argument0,608,272,wall_inv_vert_obj);
room_instance_add(argument0,608,304,wall_inv_vert_obj);
room_instance_add(argument0,608,336,wall_inv_vert_obj);
room_instance_add(argument0,608,368,wall_inv_vert_obj);
room_instance_add(argument0,608,400,wall_inv_vert_obj);