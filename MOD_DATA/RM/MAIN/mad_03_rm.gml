/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","mad_daycare","ROOM_mad_daycare");
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
    with spawn_arr[1,4] { rm_var = mad_01_rm; spawn_var = 2; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with instance_create(560,368,mad_cat_obj)
    {
        snd_id_var = 9;
        translate_id_var = "cat_04";
        event_user(1);
    }
');
// Effects
room_instance_add(argument0,0,0,fog_01_obj);
// Floors
room_instance_add(argument0,464,320,spawn_floor_alt_02_obj);
room_instance_add(argument0,496,320,spawn_floor_alt_02_obj);
room_instance_add(argument0,528,320,spawn_floor_alt_02_obj);
room_instance_add(argument0,560,320,spawn_floor_alt_02_obj);
room_instance_add(argument0,592,320,spawn_floor_alt_02_obj);
room_instance_add(argument0,624,320,spawn_floor_alt_02_obj);
room_instance_add(argument0,464,288,spawn_floor_alt_02_obj);
room_instance_add(argument0,496,288,spawn_floor_alt_02_obj);
room_instance_add(argument0,528,288,spawn_floor_alt_02_obj);
room_instance_add(argument0,560,288,spawn_floor_alt_02_obj);
room_instance_add(argument0,592,288,spawn_floor_alt_02_obj);
room_instance_add(argument0,624,288,spawn_floor_alt_02_obj);
room_instance_add(argument0,656,288,spawn_floor_alt_02_obj);
room_instance_add(argument0,656,320,spawn_floor_alt_02_obj);
room_instance_add(argument0,464,352,mad_daycare_floor_obj);
room_instance_add(argument0,464,384,mad_daycare_floor_obj);
room_instance_add(argument0,496,384,mad_daycare_floor_obj);
room_instance_add(argument0,496,352,mad_daycare_floor_obj);
room_instance_add(argument0,528,352,mad_daycare_floor_obj);
room_instance_add(argument0,528,384,mad_daycare_floor_obj);
room_instance_add(argument0,560,352,mad_daycare_floor_obj);
room_instance_add(argument0,560,384,mad_daycare_floor_obj);
room_instance_add(argument0,592,352,mad_daycare_floor_obj);
room_instance_add(argument0,592,384,mad_daycare_floor_obj);
room_instance_add(argument0,624,352,mad_daycare_floor_obj);
room_instance_add(argument0,624,384,mad_daycare_floor_obj);
room_instance_add(argument0,656,352,mad_daycare_floor_obj);
room_instance_add(argument0,656,384,mad_daycare_floor_obj);
// Ceilings
room_instance_add(argument0,464,320,spawn_ceil_alt_02_obj);
room_instance_add(argument0,496,320,spawn_ceil_alt_02_obj);
room_instance_add(argument0,528,320,spawn_ceil_alt_02_obj);
room_instance_add(argument0,560,320,spawn_ceil_alt_02_obj);
room_instance_add(argument0,592,320,spawn_ceil_alt_02_obj);
room_instance_add(argument0,624,320,spawn_ceil_alt_02_obj);
room_instance_add(argument0,464,288,spawn_ceil_alt_02_obj);
room_instance_add(argument0,496,288,spawn_ceil_alt_02_obj);
room_instance_add(argument0,528,288,spawn_ceil_alt_02_obj);
room_instance_add(argument0,560,288,spawn_ceil_alt_02_obj);
room_instance_add(argument0,592,288,spawn_ceil_alt_02_obj);
room_instance_add(argument0,624,288,spawn_ceil_alt_02_obj);
room_instance_add(argument0,656,288,spawn_ceil_alt_02_obj);
room_instance_add(argument0,656,320,spawn_ceil_alt_02_obj);
room_instance_add(argument0,464,352,spawn_ceil_alt_02_obj);
room_instance_add(argument0,464,384,spawn_ceil_alt_02_obj);
room_instance_add(argument0,496,384,spawn_ceil_alt_02_obj);
room_instance_add(argument0,496,352,spawn_ceil_alt_02_obj);
room_instance_add(argument0,528,352,spawn_ceil_alt_02_obj);
room_instance_add(argument0,528,384,spawn_ceil_alt_02_obj);
room_instance_add(argument0,560,352,spawn_ceil_alt_02_obj);
room_instance_add(argument0,560,384,spawn_ceil_alt_02_obj);
room_instance_add(argument0,592,352,spawn_ceil_alt_02_obj);
room_instance_add(argument0,592,384,spawn_ceil_alt_02_obj);
room_instance_add(argument0,624,352,spawn_ceil_alt_02_obj);
room_instance_add(argument0,624,384,spawn_ceil_alt_02_obj);
room_instance_add(argument0,656,352,spawn_ceil_alt_02_obj);
room_instance_add(argument0,656,384,spawn_ceil_alt_02_obj);
// Walls (Horizontal)
room_instance_add(argument0,464,272,spawn_wall_alt_02_hor_obj);
room_instance_add(argument0,496,272,spawn_wall_alt_02_hor_obj);
room_instance_add(argument0,528,272,spawn_wall_alt_02_hor_obj);
room_instance_add(argument0,560,272,spawn_wall_alt_02_hor_obj);
room_instance_add(argument0,592,272,spawn_wall_alt_02_hor_obj);
room_instance_add(argument0,624,272,spawn_wall_alt_02_hor_obj);
room_instance_add(argument0,656,272,spawn_wall_alt_02_hor_obj);
room_instance_add(argument0,464,400,mad_daycare_wall_hor_obj);
room_instance_add(argument0,496,400,mad_daycare_wall_hor_obj);
room_instance_add(argument0,528,400,mad_daycare_wall_hor_obj);
room_instance_add(argument0,560,400,mad_daycare_wall_hor_obj);
room_instance_add(argument0,592,400,mad_daycare_wall_hor_obj);
room_instance_add(argument0,624,400,mad_daycare_wall_hor_obj);
room_instance_add(argument0,656,400,mad_daycare_wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,448,320,spawn_wall_alt_02_vert_obj);
room_instance_add(argument0,448,288,spawn_wall_alt_02_vert_obj);
room_instance_add(argument0,672,320,spawn_wall_alt_02_vert_obj);
room_instance_add(argument0,672,288,spawn_wall_alt_02_vert_obj);
room_instance_add(argument0,448,352,mad_daycare_wall_vert_obj);
room_instance_add(argument0,448,384,mad_daycare_wall_vert_obj);
room_instance_add(argument0,672,384,mad_daycare_wall_vert_obj);
room_instance_add(argument0,672,352,mad_daycare_wall_vert_obj);
// Props
room_instance_add(argument0,624,336,mad_arrow_obj);
room_instance_add(argument0,506,304,mad_slug_obj);
room_instance_add(argument0,480,368,mad_slug_obj);
room_instance_add(argument0,544,304,mad_slug_obj);
room_instance_add(argument0,576,352,mad_slug_obj);
room_instance_add(argument0,592,304,mad_slug_obj);
room_instance_add(argument0,657,356,mad_slug_obj);
room_instance_add(argument0,468,298,mad_slug_obj);
room_instance_add(argument0,527,327,mad_slug_obj);
room_instance_add(argument0,520,370,mad_slug_obj);