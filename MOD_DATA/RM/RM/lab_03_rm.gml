/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","lab","ROOM_lab")+" 3";
    local.lock = ini_read_string("UI","run","UI_run");
    ini_close();
    // Spawns
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 592;
    global.spawn_arr[0,1] = 240;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 1040;
    global.spawn_arr[1,1] = 144;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    global.spawn_arr[2,0] = 1040;
    global.spawn_arr[2,1] = 336;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 90;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,load_par_obj.lab_door_obj,false,spawn_leave_door_trig_obj);
    // Exit
    with global.spawn_arr[2,4] { lock_var = true; }
    with instance_create(584,240,spawn_door_trig_obj)
    {
        global.spawn_arr[0,4] = id;
        txt_lock_var = local.lock;
        rm_var = load_par_obj.lab_01_rm;
        rm_count_var = -1;
        rm_spawn_var = 3;
        snd_len_var = 1;
        snd_arr[0] = door_m_02_snd;
    }
    // Easiest
    if global.diff_var != 0 { instance_create(757,226,blood_rand_obj); }
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
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,reflect_eff_obj);
// Floors
room_instance_add(argument0,592,240,argument1.lab_floor_obj);
room_instance_add(argument0,624,240,argument1.lab_floor_obj);
room_instance_add(argument0,656,240,argument1.lab_floor_obj);
room_instance_add(argument0,720,240,argument1.lab_floor_obj);
room_instance_add(argument0,784,240,argument1.lab_floor_obj);
room_instance_add(argument0,688,208,argument1.lab_floor_obj);
room_instance_add(argument0,720,208,argument1.lab_floor_obj);
room_instance_add(argument0,752,208,argument1.lab_floor_obj);
room_instance_add(argument0,784,208,argument1.lab_floor_obj);
room_instance_add(argument0,784,272,argument1.lab_floor_obj);
room_instance_add(argument0,752,272,argument1.lab_floor_obj);
room_instance_add(argument0,720,272,argument1.lab_floor_obj);
room_instance_add(argument0,688,272,argument1.lab_floor_obj);
room_instance_add(argument0,816,208,argument1.lab_floor_obj);
room_instance_add(argument0,816,240,argument1.lab_floor_obj);
room_instance_add(argument0,816,272,argument1.lab_floor_obj);
room_instance_add(argument0,848,272,argument1.lab_floor_obj);
room_instance_add(argument0,848,240,argument1.lab_floor_obj);
room_instance_add(argument0,848,208,argument1.lab_floor_obj);
room_instance_add(argument0,880,208,argument1.lab_floor_obj);
room_instance_add(argument0,880,240,argument1.lab_floor_obj);
room_instance_add(argument0,880,272,argument1.lab_floor_obj);
room_instance_add(argument0,912,240,argument1.lab_floor_obj);
room_instance_add(argument0,944,240,argument1.lab_floor_obj);
room_instance_add(argument0,976,240,argument1.lab_floor_obj);
room_instance_add(argument0,1008,240,argument1.lab_floor_obj);
room_instance_add(argument0,1040,240,argument1.lab_floor_obj);
room_instance_add(argument0,1040,272,argument1.lab_floor_obj);
room_instance_add(argument0,1040,304,argument1.lab_floor_obj);
room_instance_add(argument0,1040,336,argument1.lab_floor_obj);
room_instance_add(argument0,1040,208,argument1.lab_floor_obj);
room_instance_add(argument0,1040,176,argument1.lab_floor_obj);
room_instance_add(argument0,1040,144,argument1.lab_floor_obj);
room_instance_add(argument0,688,240,argument1.lab_floor_obj);
room_instance_add(argument0,752,240,argument1.lab_floor_obj);
// Ceilings
room_instance_add(argument0,592,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,624,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,656,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,720,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,784,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,688,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,720,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,752,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,784,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,784,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,752,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,720,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,688,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,816,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,816,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,816,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,848,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,848,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,848,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,880,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,880,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,880,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,912,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,944,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,976,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,1008,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,1040,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,1040,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,1040,304,argument1.lab_ceil_high_obj);
room_instance_add(argument0,1040,336,argument1.lab_ceil_high_obj);
room_instance_add(argument0,1040,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,1040,176,argument1.lab_ceil_high_obj);
room_instance_add(argument0,1040,144,argument1.lab_ceil_high_obj);
room_instance_add(argument0,688,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,752,240,argument1.lab_ceil_high_obj);
// Walls (Horizontal)
room_instance_add(argument0,688,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,688,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,720,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,752,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,784,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,816,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,848,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,880,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,912,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,944,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,976,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,1008,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,1008,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,976,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,944,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,912,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,880,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,848,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,816,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,784,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,656,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,624,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,592,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,592,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,624,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,656,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,1040,128,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,1040,352,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,720,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,752,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,688,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,688,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,720,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,752,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,784,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,816,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,848,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,880,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,912,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,944,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,976,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,1008,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,1008,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,976,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,944,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,912,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,880,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,848,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,816,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,784,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,656,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,624,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,592,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,592,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,624,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,656,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,1040,128,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,1040,352,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,720,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,752,192,argument1.lab_wall_up_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,576,240,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,672,208,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,672,272,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,896,272,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,896,208,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1024,208,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1056,208,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1056,176,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1056,144,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1024,176,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1024,144,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1024,272,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1056,240,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1056,272,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1056,304,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1056,336,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1024,336,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,1024,304,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,576,240,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,672,208,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,672,272,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,896,272,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,896,208,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1024,208,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1056,208,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1056,176,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1056,144,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1024,176,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1024,144,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1024,272,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1056,240,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1056,272,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1056,304,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1056,336,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1024,336,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,1024,304,argument1.lab_wall_up_vert_obj);
// Props
room_instance_add(argument0,1040,176,argument1.lab_light_obj);
room_instance_add(argument0,1040,240,argument1.lab_light_obj);
room_instance_add(argument0,1040,304,argument1.lab_light_obj);
room_instance_add(argument0,976,240,argument1.lab_light_obj);
room_instance_add(argument0,912,240,argument1.lab_light_obj);
room_instance_add(argument0,656,240,argument1.lab_light_obj);
room_instance_add(argument0,592,240,argument1.lab_light_obj);
room_instance_add(argument0,848,240,argument1.lab_light_obj);
room_instance_add(argument0,720,240,argument1.lab_light_obj);
room_instance_add(argument0,784,240,argument1.lab_light_obj);
room_instance_add(argument0,928,240,argument1.lab_trig_obj);
room_instance_add(argument0,752,272,argument1.lab_hole_obj);
room_instance_add(argument0,816,224,argument1.lab_note_02_obj);
room_instance_add(argument0,1040,128,door_north_obj);
room_instance_add(argument0,1040,352,door_south_obj);