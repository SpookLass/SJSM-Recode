/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","mad","ROOM_mad")+" 2";
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 464;
    global.spawn_arr[0,1] = 336;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 688;
    global.spawn_arr[1,1] = 336;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    if global.diff_var != 0
    {
        with instance_create(597,349,mad_cat_obj)
        {
            snd_id_var = 11;
            translate_id_var = "cat_06";
            event_user(1);
        }
        spawn_create_scr(true,false,mad_door_obj,mad_door_obj,spawn_door_trig_obj);
        with spawn_arr[1,4] { rm_var = mad_06_rm; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    }
    else
    {
        spawn_create_scr(true,false,mad_door_obj,mad_door_obj,spawn_leave_door_trig_obj);
        with spawn_arr[1,4] { snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    }
    with instance_create(456,336,spawn_door_trig_obj)
    { rm_var = mad_01_rm; rm_spawn_var = 4; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[1,5] { spot_var = true; }
');
// Effects
room_instance_add(argument0,80,32,fog_01_obj);
// Floors
room_instance_add(argument0,464,304,floor_inv_obj);
room_instance_add(argument0,496,304,floor_inv_obj);
room_instance_add(argument0,528,304,floor_inv_obj);
room_instance_add(argument0,560,304,floor_inv_obj);
room_instance_add(argument0,592,304,floor_inv_obj);
room_instance_add(argument0,624,304,floor_inv_obj);
room_instance_add(argument0,656,304,floor_inv_obj);
room_instance_add(argument0,688,304,floor_inv_obj);
room_instance_add(argument0,464,336,floor_inv_obj);
room_instance_add(argument0,496,336,floor_inv_obj);
room_instance_add(argument0,528,336,floor_inv_obj);
room_instance_add(argument0,560,336,floor_inv_obj);
room_instance_add(argument0,592,336,floor_inv_obj);
room_instance_add(argument0,624,336,floor_inv_obj);
room_instance_add(argument0,656,336,floor_inv_obj);
room_instance_add(argument0,464,368,floor_inv_obj);
room_instance_add(argument0,496,368,floor_inv_obj);
room_instance_add(argument0,528,368,floor_inv_obj);
room_instance_add(argument0,560,368,floor_inv_obj);
room_instance_add(argument0,592,368,floor_inv_obj);
room_instance_add(argument0,624,368,floor_inv_obj);
room_instance_add(argument0,656,368,floor_inv_obj);
room_instance_add(argument0,688,368,floor_inv_obj);
// Walls (Horizontal)
room_instance_add(argument0,464,288,wall_inv_hor_obj);
room_instance_add(argument0,464,384,wall_inv_hor_obj);
room_instance_add(argument0,496,288,wall_inv_hor_obj);
room_instance_add(argument0,496,384,wall_inv_hor_obj);
room_instance_add(argument0,528,384,wall_inv_hor_obj);
room_instance_add(argument0,528,288,wall_inv_hor_obj);
room_instance_add(argument0,560,288,wall_inv_hor_obj);
room_instance_add(argument0,592,288,wall_inv_hor_obj);
room_instance_add(argument0,624,288,wall_inv_hor_obj);
room_instance_add(argument0,624,384,wall_inv_hor_obj);
room_instance_add(argument0,592,384,wall_inv_hor_obj);
room_instance_add(argument0,560,384,wall_inv_hor_obj);
room_instance_add(argument0,656,384,wall_inv_hor_obj);
room_instance_add(argument0,656,288,wall_inv_hor_obj);
room_instance_add(argument0,688,288,wall_inv_hor_obj);
room_instance_add(argument0,688,384,wall_inv_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,448,336,wall_inv_vert_obj);
room_instance_add(argument0,448,304,wall_inv_vert_obj);
room_instance_add(argument0,448,368,wall_inv_vert_obj);
room_instance_add(argument0,704,304,wall_inv_vert_obj);
room_instance_add(argument0,704,336,wall_inv_vert_obj);
room_instance_add(argument0,704,368,wall_inv_vert_obj);
// Props
room_instance_add(argument0,688,336,mad_spot_obj);