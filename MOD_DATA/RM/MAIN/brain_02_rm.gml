/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","lab","ROOM_lab")+" 2?"
    ini_close();
    // Spawns
    global.spawn_len_var = 1;
    global.spawn_arr[0,0] = 400;
    global.spawn_arr[0,1] = 464;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    with instance_create(392,464,spawn_door_trig_obj)
    {
        global.spawn_arr[0,4] = id;
        rm_var = brain_01_rm;
        spawn_var = 2;
        snd_len_var = 1;
        snd_arr[0] = door_m_02_snd;
    }
    with instance_create(384,464,lab_door_obj) { global.spawn_arr[0,5] = id; direction = 0; }
    // Lights
    with instance_create(432,464,brain_light_obj) { light_var = 0.66; event_user(0); }
    with instance_create(560,464,brain_light_obj) { light_var = 0.33; event_user(0); }
    with instance_create(656,464,brain_light_obj) { light_var = 0.1; event_user(0); }
');
// Room settings
room_set_width(argument0,1280);
room_set_height(argument0,720);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Effects
room_instance_add(argument0,0,0,fog_close_obj);
room_instance_add(argument0,0,0,web_spawn_obj);
room_instance_add(argument0,0,0,dark_color_obj);
room_instance_add(argument0,0,0,spawn_mus_obj);
// Floors
room_instance_add(argument0,400,464,spawn_floor_metal_obj);
room_instance_add(argument0,432,464,spawn_floor_metal_obj);
room_instance_add(argument0,464,464,spawn_floor_metal_obj);
room_instance_add(argument0,496,464,spawn_floor_metal_obj);
room_instance_add(argument0,528,464,spawn_floor_metal_obj);
room_instance_add(argument0,560,464,spawn_floor_metal_obj);
room_instance_add(argument0,592,464,spawn_floor_metal_obj);
room_instance_add(argument0,624,496,spawn_floor_metal_obj);
room_instance_add(argument0,624,464,spawn_floor_metal_obj);
room_instance_add(argument0,624,432,spawn_floor_metal_obj);
room_instance_add(argument0,624,400,spawn_floor_metal_obj);
room_instance_add(argument0,656,400,spawn_floor_metal_obj);
room_instance_add(argument0,656,432,spawn_floor_metal_obj);
room_instance_add(argument0,656,464,spawn_floor_metal_obj);
room_instance_add(argument0,656,496,spawn_floor_metal_obj);
room_instance_add(argument0,656,528,spawn_floor_metal_obj);
room_instance_add(argument0,624,528,spawn_floor_metal_obj);
room_instance_add(argument0,688,528,spawn_floor_metal_obj);
room_instance_add(argument0,688,496,spawn_floor_metal_obj);
room_instance_add(argument0,688,464,spawn_floor_metal_obj);
room_instance_add(argument0,688,432,spawn_floor_metal_obj);
room_instance_add(argument0,688,400,spawn_floor_metal_obj);
// Ceilings
room_instance_add(argument0,400,464,spawn_ceil_obj);
room_instance_add(argument0,432,464,spawn_ceil_obj);
room_instance_add(argument0,464,464,spawn_ceil_obj);
room_instance_add(argument0,496,464,spawn_ceil_obj);
room_instance_add(argument0,528,464,spawn_ceil_obj);
room_instance_add(argument0,560,464,spawn_ceil_obj);
room_instance_add(argument0,592,464,spawn_ceil_obj);
room_instance_add(argument0,624,496,spawn_ceil_obj);
room_instance_add(argument0,624,464,spawn_ceil_obj);
room_instance_add(argument0,624,432,spawn_ceil_obj);
room_instance_add(argument0,624,400,spawn_ceil_obj);
room_instance_add(argument0,656,400,spawn_ceil_obj);
room_instance_add(argument0,656,432,spawn_ceil_obj);
room_instance_add(argument0,656,464,spawn_ceil_obj);
room_instance_add(argument0,656,496,spawn_ceil_obj);
room_instance_add(argument0,656,528,spawn_ceil_obj);
room_instance_add(argument0,624,528,spawn_ceil_obj);
room_instance_add(argument0,688,528,spawn_ceil_obj);
room_instance_add(argument0,688,496,spawn_ceil_obj);
room_instance_add(argument0,688,464,spawn_ceil_obj);
room_instance_add(argument0,688,432,spawn_ceil_obj);
room_instance_add(argument0,688,400,spawn_ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,400,452,lab_wall_hor_obj);
room_instance_add(argument0,400,476,lab_wall_hor_obj);
room_instance_add(argument0,464,476,lab_wall_hor_obj);
room_instance_add(argument0,528,476,lab_wall_hor_obj);
room_instance_add(argument0,592,476,lab_wall_hor_obj);
room_instance_add(argument0,592,452,lab_wall_hor_obj);
room_instance_add(argument0,528,452,lab_wall_hor_obj);
room_instance_add(argument0,464,452,lab_wall_hor_obj);
room_instance_add(argument0,624,388,lab_wall_hor_obj);
room_instance_add(argument0,688,388,lab_wall_hor_obj);
room_instance_add(argument0,624,540,lab_wall_hor_obj);
room_instance_add(argument0,688,540,lab_wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,608,436,lab_wall_vert_obj);
room_instance_add(argument0,608,404,lab_wall_vert_obj);
room_instance_add(argument0,608,492,lab_wall_vert_obj);
room_instance_add(argument0,608,524,lab_wall_vert_obj);
room_instance_add(argument0,704,464,lab_wall_vert_obj);
room_instance_add(argument0,704,496,lab_wall_vert_obj);
room_instance_add(argument0,704,528,lab_wall_vert_obj);
room_instance_add(argument0,704,432,lab_wall_vert_obj);
room_instance_add(argument0,704,400,lab_wall_vert_obj);
room_instance_add(argument0,384,464,lab_wall_vert_obj);
// Tanks
room_instance_add(argument0,432,476,lab_tank_south_obj);
room_instance_add(argument0,496,476,lab_tank_south_obj);
room_instance_add(argument0,656,540,lab_tank_south_obj);
room_instance_add(argument0,432,452,lab_tank_north_obj);
room_instance_add(argument0,496,452,lab_tank_north_obj);
room_instance_add(argument0,560,452,lab_tank_north_obj);
room_instance_add(argument0,560,476,lab_tank_broke_south_obj);
room_instance_add(argument0,656,388,lab_tank_north_obj);
// Props
//room_instance_add(argument0,496,464,lab_light_obj);
//room_instance_add(argument0,656,400,lab_light_obj);
//room_instance_add(argument0,656,528,lab_light_obj);
room_instance_add(argument0,624,404,table_metal_obj);
room_instance_add(argument0,624,524,table_metal_obj);
room_instance_add(argument0,641,496,blood_rand_obj);
room_instance_add(argument0,688,464,table_metal_obj);
room_instance_add(argument0,688,404,pc_big_obj);
room_instance_add(argument0,688,524,pc_big_obj);
room_instance_add(argument0,688,508,pc_small_obj);
room_instance_add(argument0,688,420,pc_small_obj);
//room_instance_add(argument0,690,468,lab_keykard_obj);
room_instance_add(argument0,688,464,brain_note_02_obj);
room_instance_add(argument0,592,464,brain_trig_obj);