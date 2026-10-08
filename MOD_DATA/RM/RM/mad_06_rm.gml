/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","mad","ROOM_mad")+" 3";
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 480;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 784;
    global.spawn_arr[1,1] = 480;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,load_par_obj.mad_flesh_door_obj,load_par_obj.mad_flesh_door_obj,load_par_obj.mad_door_trig_obj);
    with spawn_arr[1,4] { snd_len_var = 0; }
');
// Effects
room_instance_add(argument0,0,0,argument1.mad_fog_obj);
room_instance_add(argument0,0,0,argument1.mad_flesh_obj);
// Floors
room_instance_add(argument0,176,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,208,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,240,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,272,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,304,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,336,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,368,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,400,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,432,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,464,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,496,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,528,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,560,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,592,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,624,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,656,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,688,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,720,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,752,480,argument1.mad_flesh_floor_obj);
room_instance_add(argument0,784,480,argument1.mad_flesh_floor_obj);
// Ceilings
room_instance_add(argument0,176,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,208,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,240,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,272,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,304,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,336,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,368,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,400,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,432,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,464,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,496,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,528,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,560,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,592,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,624,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,656,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,688,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,720,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,752,480,argument1.mad_flesh_ceil_obj);
room_instance_add(argument0,784,480,argument1.mad_flesh_ceil_obj);
// Walls (North)
room_instance_add(argument0,176,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,208,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,240,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,272,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,304,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,336,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,368,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,400,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,432,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,464,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,496,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,528,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,560,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,592,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,624,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,656,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,688,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,720,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,752,464,argument1.mad_flesh_wall_north_obj);
room_instance_add(argument0,784,464,argument1.mad_flesh_wall_north_obj);
// Walls (South)
room_instance_add(argument0,176,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,208,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,240,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,272,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,304,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,336,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,368,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,400,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,432,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,464,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,496,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,528,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,560,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,592,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,624,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,656,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,688,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,720,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,752,496,argument1.mad_flesh_wall_south_obj);
room_instance_add(argument0,784,496,argument1.mad_flesh_wall_south_obj);
// Walls (Vertical)
room_instance_add(argument0,160,480,wall_inv_vert_obj);
room_instance_add(argument0,800,480,wall_inv_vert_obj);