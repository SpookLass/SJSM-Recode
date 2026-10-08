/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","lab","ROOM_lab")+" ?";
    local.hole = ini_read_string("UI","hole","UI_hole");
    local.lock = ini_read_string("UI","run","UI_run");
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 160;    // X
    global.spawn_arr[0,1] = 256;    // Y
    global.spawn_arr[0,2] = 0;      // Z
    global.spawn_arr[0,3] = 0;      // Angle (0 is right, 90 is up, etc)
    // Spawn 1 (exit)
    global.spawn_arr[1,0] = 544;
    global.spawn_arr[1,1] = 256;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,load_par_obj.brain_doorframe_obj,false,load_par_obj.brain_door_trig_obj);
    with instance_create(152,256,spawn_door_trig_obj)
    {
        global.spawn_arr[0,4] = id;
        spawn_var = 0;
        rm_spawn_var = 1;
        rm_count_var = -1;
        rm_var = brain_01_rm;
        snd_len_var = 0;
        txt_var = local.hole;
        txt_lock_var = local.lock;
    }
    with spawn_arr[1,4] { txt_lock_var = ""; lock_var = (global.diff_var != 0); }
    // Lights
    with instance_create(352,224,load_par_obj.bug_dead_light_obj) { light_var = 1; event_user(0); } // Entrance
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
room_instance_add(argument0,160,256,argument1.lab_floor_obj);
room_instance_add(argument0,192,256,argument1.lab_floor_obj);
room_instance_add(argument0,224,256,argument1.lab_floor_obj);
room_instance_add(argument0,256,256,argument1.lab_floor_obj);
room_instance_add(argument0,256,288,argument1.lab_floor_obj);
room_instance_add(argument0,256,320,argument1.lab_floor_obj);
room_instance_add(argument0,288,320,argument1.lab_floor_obj);
room_instance_add(argument0,320,320,argument1.lab_floor_obj);
room_instance_add(argument0,320,288,argument1.lab_floor_obj);
room_instance_add(argument0,320,256,argument1.lab_floor_obj);
room_instance_add(argument0,352,256,argument1.lab_floor_obj);
room_instance_add(argument0,384,256,argument1.lab_floor_obj);
room_instance_add(argument0,384,288,argument1.lab_floor_obj);
room_instance_add(argument0,384,320,argument1.lab_floor_obj);
room_instance_add(argument0,416,320,argument1.lab_floor_obj);
room_instance_add(argument0,448,320,argument1.lab_floor_obj);
room_instance_add(argument0,448,288,argument1.lab_floor_obj);
room_instance_add(argument0,448,256,argument1.lab_floor_obj);
room_instance_add(argument0,480,256,argument1.lab_floor_obj);
room_instance_add(argument0,512,256,argument1.lab_floor_obj);
room_instance_add(argument0,352,224,argument1.lab_floor_obj);
room_instance_add(argument0,544,256,argument1.lab_floor_obj);
room_instance_add(argument0,352,192,argument1.lab_floor_obj);
room_instance_add(argument0,320,192,argument1.lab_floor_obj);
room_instance_add(argument0,384,192,argument1.lab_floor_obj);
room_instance_add(argument0,416,192,argument1.lab_floor_obj);
room_instance_add(argument0,288,192,argument1.lab_floor_obj);
room_instance_add(argument0,320,160,argument1.lab_floor_obj);
room_instance_add(argument0,352,160,argument1.lab_floor_obj);
room_instance_add(argument0,384,160,argument1.lab_floor_obj);
room_instance_add(argument0,416,160,argument1.lab_floor_obj);
room_instance_add(argument0,416,128,argument1.lab_floor_obj);
room_instance_add(argument0,384,128,argument1.lab_floor_obj);
room_instance_add(argument0,352,128,argument1.lab_floor_obj);
room_instance_add(argument0,320,128,argument1.lab_floor_obj);
room_instance_add(argument0,288,128,argument1.lab_floor_obj);
room_instance_add(argument0,288,160,argument1.lab_floor_obj);
room_instance_add(argument0,320,96,argument1.lab_floor_obj);
room_instance_add(argument0,352,96,argument1.lab_floor_obj);
room_instance_add(argument0,384,96,argument1.lab_floor_obj);
room_instance_add(argument0,416,96,argument1.lab_floor_obj);
room_instance_add(argument0,288,96,argument1.lab_floor_obj);
room_instance_add(argument0,352,64,argument1.lab_floor_obj);
room_instance_add(argument0,320,64,argument1.lab_floor_obj);
room_instance_add(argument0,384,64,argument1.lab_floor_obj);
// Ceilings
room_instance_add(argument0,160,256,argument1.lab_ceil_obj);
room_instance_add(argument0,192,256,argument1.lab_ceil_obj);
room_instance_add(argument0,224,256,argument1.lab_ceil_obj);
room_instance_add(argument0,256,256,argument1.lab_ceil_obj);
room_instance_add(argument0,256,288,argument1.lab_ceil_obj);
room_instance_add(argument0,256,320,argument1.lab_ceil_obj);
room_instance_add(argument0,288,320,argument1.lab_ceil_obj);
room_instance_add(argument0,320,320,argument1.lab_ceil_obj);
room_instance_add(argument0,320,288,argument1.lab_ceil_obj);
room_instance_add(argument0,320,256,argument1.lab_ceil_obj);
room_instance_add(argument0,352,256,argument1.lab_ceil_obj);
room_instance_add(argument0,384,256,argument1.lab_ceil_obj);
room_instance_add(argument0,384,288,argument1.lab_ceil_obj);
room_instance_add(argument0,384,320,argument1.lab_ceil_obj);
room_instance_add(argument0,416,320,argument1.lab_ceil_obj);
room_instance_add(argument0,448,320,argument1.lab_ceil_obj);
room_instance_add(argument0,448,288,argument1.lab_ceil_obj);
room_instance_add(argument0,448,256,argument1.lab_ceil_obj);
room_instance_add(argument0,480,256,argument1.lab_ceil_obj);
room_instance_add(argument0,512,256,argument1.lab_ceil_obj);
room_instance_add(argument0,352,224,argument1.lab_ceil_obj);
room_instance_add(argument0,544,256,argument1.lab_ceil_obj);
room_instance_add(argument0,352,192,argument1.lab_ceil_obj);
room_instance_add(argument0,320,192,argument1.lab_ceil_obj);
room_instance_add(argument0,384,192,argument1.lab_ceil_obj);
room_instance_add(argument0,416,192,argument1.lab_ceil_obj);
room_instance_add(argument0,288,192,argument1.lab_ceil_obj);
room_instance_add(argument0,320,160,argument1.lab_ceil_obj);
room_instance_add(argument0,352,160,argument1.lab_ceil_obj);
room_instance_add(argument0,384,160,argument1.lab_ceil_obj);
room_instance_add(argument0,416,160,argument1.lab_ceil_obj);
room_instance_add(argument0,416,128,argument1.lab_ceil_obj);
room_instance_add(argument0,384,128,argument1.lab_ceil_obj);
room_instance_add(argument0,352,128,argument1.lab_ceil_obj);
room_instance_add(argument0,320,128,argument1.lab_ceil_obj);
room_instance_add(argument0,288,128,argument1.lab_ceil_obj);
room_instance_add(argument0,288,160,argument1.lab_ceil_obj);
room_instance_add(argument0,320,96,argument1.lab_ceil_obj);
room_instance_add(argument0,352,96,argument1.lab_ceil_obj);
room_instance_add(argument0,384,96,argument1.lab_ceil_obj);
room_instance_add(argument0,416,96,argument1.lab_ceil_obj);
room_instance_add(argument0,288,96,argument1.lab_ceil_obj);
room_instance_add(argument0,352,64,argument1.lab_ceil_obj);
room_instance_add(argument0,320,64,argument1.lab_ceil_obj);
room_instance_add(argument0,384,64,argument1.lab_ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,160,240,argument1.lab_wall_hor_obj);
room_instance_add(argument0,192,240,argument1.lab_wall_hor_obj);
room_instance_add(argument0,192,272,argument1.lab_wall_hor_obj);
room_instance_add(argument0,160,272,argument1.lab_wall_hor_obj);
room_instance_add(argument0,224,240,argument1.lab_wall_hor_obj);
room_instance_add(argument0,256,240,argument1.lab_wall_hor_obj);
room_instance_add(argument0,288,304,argument1.lab_wall_hor_obj);
room_instance_add(argument0,416,304,argument1.lab_wall_hor_obj);
room_instance_add(argument0,416,336,argument1.lab_wall_hor_obj);
room_instance_add(argument0,448,336,argument1.lab_wall_hor_obj);
room_instance_add(argument0,384,336,argument1.lab_wall_hor_obj);
room_instance_add(argument0,480,272,argument1.lab_wall_hor_obj);
room_instance_add(argument0,512,272,argument1.lab_wall_hor_obj);
room_instance_add(argument0,544,272,argument1.lab_wall_hor_obj);
room_instance_add(argument0,544,240,argument1.lab_wall_hor_obj);
room_instance_add(argument0,512,240,argument1.lab_wall_hor_obj);
room_instance_add(argument0,480,240,argument1.lab_wall_hor_obj);
room_instance_add(argument0,448,240,argument1.lab_wall_hor_obj);
room_instance_add(argument0,384,240,argument1.lab_wall_hor_obj);
room_instance_add(argument0,320,240,argument1.lab_wall_hor_obj);
room_instance_add(argument0,256,336,argument1.lab_wall_hor_obj);
room_instance_add(argument0,288,336,argument1.lab_wall_hor_obj);
room_instance_add(argument0,320,336,argument1.lab_wall_hor_obj);
room_instance_add(argument0,352,272,argument1.lab_wall_hor_obj);
room_instance_add(argument0,224,272,argument1.lab_wall_hor_obj);
room_instance_add(argument0,288,80,argument1.lab_wall_hor_obj);
room_instance_add(argument0,320,48,argument1.lab_wall_hor_obj);
room_instance_add(argument0,352,48,argument1.lab_wall_hor_obj);
room_instance_add(argument0,384,48,argument1.lab_wall_hor_obj);
room_instance_add(argument0,416,80,argument1.lab_wall_hor_obj);
room_instance_add(argument0,288,208,argument1.lab_wall_hor_obj);
room_instance_add(argument0,320,208,argument1.lab_wall_hor_obj);
room_instance_add(argument0,384,208,argument1.lab_wall_hor_obj);
room_instance_add(argument0,416,208,argument1.lab_wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,144,256,argument1.lab_wall_vert_obj);
room_instance_add(argument0,560,256,argument1.lab_wall_vert_obj);
room_instance_add(argument0,464,288,argument1.lab_wall_vert_obj);
room_instance_add(argument0,464,320,argument1.lab_wall_vert_obj);
room_instance_add(argument0,432,288,argument1.lab_wall_vert_obj);
room_instance_add(argument0,432,256,argument1.lab_wall_vert_obj);
room_instance_add(argument0,400,256,argument1.lab_wall_vert_obj);
room_instance_add(argument0,400,288,argument1.lab_wall_vert_obj);
room_instance_add(argument0,336,288,argument1.lab_wall_vert_obj);
room_instance_add(argument0,368,288,argument1.lab_wall_vert_obj);
room_instance_add(argument0,368,320,argument1.lab_wall_vert_obj);
room_instance_add(argument0,336,320,argument1.lab_wall_vert_obj);
room_instance_add(argument0,304,256,argument1.lab_wall_vert_obj);
room_instance_add(argument0,304,288,argument1.lab_wall_vert_obj);
room_instance_add(argument0,240,320,argument1.lab_wall_vert_obj);
room_instance_add(argument0,336,224,argument1.lab_wall_vert_obj);
room_instance_add(argument0,368,224,argument1.lab_wall_vert_obj);
room_instance_add(argument0,272,288,argument1.lab_wall_vert_obj);
room_instance_add(argument0,272,256,argument1.lab_wall_vert_obj);
room_instance_add(argument0,240,288,argument1.lab_wall_vert_obj);
room_instance_add(argument0,272,192,argument1.lab_wall_vert_obj);
room_instance_add(argument0,272,160,argument1.lab_wall_vert_obj);
room_instance_add(argument0,272,128,argument1.lab_wall_vert_obj);
room_instance_add(argument0,272,96,argument1.lab_wall_vert_obj);
room_instance_add(argument0,304,64,argument1.lab_wall_vert_obj);
room_instance_add(argument0,400,64,argument1.lab_wall_vert_obj);
room_instance_add(argument0,432,96,argument1.lab_wall_vert_obj);
room_instance_add(argument0,432,128,argument1.lab_wall_vert_obj);
room_instance_add(argument0,432,160,argument1.lab_wall_vert_obj);
room_instance_add(argument0,432,192,argument1.lab_wall_vert_obj);
// Torches
/*room_instance_add(argument0,336,224,torch_west_obj);
room_instance_add(argument0,368,224,torch_east_obj);*/
// Props
room_instance_add(argument0,416,192,table_metal_obj);
room_instance_add(argument0,288,192,table_metal_obj);
room_instance_add(argument0,336,96,blood_rand_obj);
room_instance_add(argument0,368,80,blood_rand_obj);
room_instance_add(argument0,336,72,blood_rand_obj);
room_instance_add(argument0,320,64,pc_big_obj);
room_instance_add(argument0,384,64,pc_big_obj);
room_instance_add(argument0,416,96,pc_big_obj);
room_instance_add(argument0,288,96,pc_big_obj);
room_instance_add(argument0,288,116,pc_small_obj);
room_instance_add(argument0,416,116,pc_small_obj);
room_instance_add(argument0,352,224,argument1.brain_note_03_obj);
// Brain
room_instance_add(argument0,352,64,brain_obj);
room_instance_add(argument0,352,64,brain_tank_obj);
