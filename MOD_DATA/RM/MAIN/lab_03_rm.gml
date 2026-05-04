/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","lab","ROOM_lab")+" 3"
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
    // Exit
    with instance_create(600,240,spawn_door_trig_obj)
    {
        global.spawn_arr[0,4] = id;
        ini_open(global.lang_var);
        txt_lock_var = ini_read_string("UI","run","UI_run");
        ini_close();
        rm_var = lab_01_rm;
        spawn_var = 3;
        snd_len_var = 1;
        snd_arr[0] = door_m_02_snd;
    }
    with instance_create(576,240,lab_door_obj) { global.spawn_arr[0,5] = id; direction = 0; }
    with instance_create(1040,136,spawn_leave_door_trig_obj) { global.spawn_arr[1,4] = id; }
    with instance_create(1040,344,spawn_door_trig_obj) { global.spawn_arr[2,4] = id; lock_var = true; }
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
room_instance_add(argument0,592,240,lab_floor_obj);
room_instance_add(argument0,624,240,lab_floor_obj);
room_instance_add(argument0,656,240,lab_floor_obj);
room_instance_add(argument0,720,240,lab_floor_obj);
room_instance_add(argument0,784,240,lab_floor_obj);
room_instance_add(argument0,688,208,lab_floor_obj);
room_instance_add(argument0,720,208,lab_floor_obj);
room_instance_add(argument0,752,208,lab_floor_obj);
room_instance_add(argument0,784,208,lab_floor_obj);
room_instance_add(argument0,784,272,lab_floor_obj);
room_instance_add(argument0,752,272,lab_floor_obj);
room_instance_add(argument0,720,272,lab_floor_obj);
room_instance_add(argument0,688,272,lab_floor_obj);
room_instance_add(argument0,816,208,lab_floor_obj);
room_instance_add(argument0,816,240,lab_floor_obj);
room_instance_add(argument0,816,272,lab_floor_obj);
room_instance_add(argument0,848,272,lab_floor_obj);
room_instance_add(argument0,848,240,lab_floor_obj);
room_instance_add(argument0,848,208,lab_floor_obj);
room_instance_add(argument0,880,208,lab_floor_obj);
room_instance_add(argument0,880,240,lab_floor_obj);
room_instance_add(argument0,880,272,lab_floor_obj);
room_instance_add(argument0,912,240,lab_floor_obj);
room_instance_add(argument0,944,240,lab_floor_obj);
room_instance_add(argument0,976,240,lab_floor_obj);
room_instance_add(argument0,1008,240,lab_floor_obj);
room_instance_add(argument0,1040,240,lab_floor_obj);
room_instance_add(argument0,1040,272,lab_floor_obj);
room_instance_add(argument0,1040,304,lab_floor_obj);
room_instance_add(argument0,1040,336,lab_floor_obj);
room_instance_add(argument0,1040,208,lab_floor_obj);
room_instance_add(argument0,1040,176,lab_floor_obj);
room_instance_add(argument0,1040,144,lab_floor_obj);
room_instance_add(argument0,688,240,lab_floor_obj);
room_instance_add(argument0,752,240,lab_floor_obj);
// Ceilings
room_instance_add(argument0,592,240,spawn_ceil_2high_obj);
room_instance_add(argument0,624,240,spawn_ceil_2high_obj);
room_instance_add(argument0,656,240,spawn_ceil_2high_obj);
room_instance_add(argument0,720,240,spawn_ceil_2high_obj);
room_instance_add(argument0,784,240,spawn_ceil_2high_obj);
room_instance_add(argument0,688,208,spawn_ceil_2high_obj);
room_instance_add(argument0,720,208,spawn_ceil_2high_obj);
room_instance_add(argument0,752,208,spawn_ceil_2high_obj);
room_instance_add(argument0,784,208,spawn_ceil_2high_obj);
room_instance_add(argument0,784,272,spawn_ceil_2high_obj);
room_instance_add(argument0,752,272,spawn_ceil_2high_obj);
room_instance_add(argument0,720,272,spawn_ceil_2high_obj);
room_instance_add(argument0,688,272,spawn_ceil_2high_obj);
room_instance_add(argument0,816,208,spawn_ceil_2high_obj);
room_instance_add(argument0,816,240,spawn_ceil_2high_obj);
room_instance_add(argument0,816,272,spawn_ceil_2high_obj);
room_instance_add(argument0,848,272,spawn_ceil_2high_obj);
room_instance_add(argument0,848,240,spawn_ceil_2high_obj);
room_instance_add(argument0,848,208,spawn_ceil_2high_obj);
room_instance_add(argument0,880,208,spawn_ceil_2high_obj);
room_instance_add(argument0,880,240,spawn_ceil_2high_obj);
room_instance_add(argument0,880,272,spawn_ceil_2high_obj);
room_instance_add(argument0,912,240,spawn_ceil_2high_obj);
room_instance_add(argument0,944,240,spawn_ceil_2high_obj);
room_instance_add(argument0,976,240,spawn_ceil_2high_obj);
room_instance_add(argument0,1008,240,spawn_ceil_2high_obj);
room_instance_add(argument0,1040,240,spawn_ceil_2high_obj);
room_instance_add(argument0,1040,272,spawn_ceil_2high_obj);
room_instance_add(argument0,1040,304,spawn_ceil_2high_obj);
room_instance_add(argument0,1040,336,spawn_ceil_2high_obj);
room_instance_add(argument0,1040,208,spawn_ceil_2high_obj);
room_instance_add(argument0,1040,176,spawn_ceil_2high_obj);
room_instance_add(argument0,1040,144,spawn_ceil_2high_obj);
room_instance_add(argument0,688,240,spawn_ceil_2high_obj);
room_instance_add(argument0,752,240,spawn_ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,688,192,spawn_wall_hor_obj);
room_instance_add(argument0,688,288,spawn_wall_hor_obj);
room_instance_add(argument0,720,288,spawn_wall_hor_obj);
room_instance_add(argument0,752,288,spawn_wall_hor_obj);
room_instance_add(argument0,784,288,spawn_wall_hor_obj);
room_instance_add(argument0,816,288,spawn_wall_hor_obj);
room_instance_add(argument0,848,288,spawn_wall_hor_obj);
room_instance_add(argument0,880,288,spawn_wall_hor_obj);
room_instance_add(argument0,912,224,spawn_wall_hor_obj);
room_instance_add(argument0,944,224,spawn_wall_hor_obj);
room_instance_add(argument0,976,224,spawn_wall_hor_obj);
room_instance_add(argument0,1008,224,spawn_wall_hor_obj);
room_instance_add(argument0,1008,256,spawn_wall_hor_obj);
room_instance_add(argument0,976,256,spawn_wall_hor_obj);
room_instance_add(argument0,944,256,spawn_wall_hor_obj);
room_instance_add(argument0,912,256,spawn_wall_hor_obj);
room_instance_add(argument0,880,192,spawn_wall_hor_obj);
room_instance_add(argument0,848,192,spawn_wall_hor_obj);
room_instance_add(argument0,816,192,spawn_wall_hor_obj);
room_instance_add(argument0,784,192,spawn_wall_hor_obj);
room_instance_add(argument0,656,224,spawn_wall_hor_obj);
room_instance_add(argument0,624,224,spawn_wall_hor_obj);
room_instance_add(argument0,592,224,spawn_wall_hor_obj);
room_instance_add(argument0,592,256,spawn_wall_hor_obj);
room_instance_add(argument0,624,256,spawn_wall_hor_obj);
room_instance_add(argument0,656,256,spawn_wall_hor_obj);
room_instance_add(argument0,1040,128,spawn_wall_hor_obj);
room_instance_add(argument0,1040,352,spawn_wall_hor_obj);
room_instance_add(argument0,720,192,spawn_wall_hor_obj);
room_instance_add(argument0,752,192,spawn_wall_hor_obj);

room_instance_add(argument0,688,192,spawn_wall_up_hor_obj);
room_instance_add(argument0,688,288,spawn_wall_up_hor_obj);
room_instance_add(argument0,720,288,spawn_wall_up_hor_obj);
room_instance_add(argument0,752,288,spawn_wall_up_hor_obj);
room_instance_add(argument0,784,288,spawn_wall_up_hor_obj);
room_instance_add(argument0,816,288,spawn_wall_up_hor_obj);
room_instance_add(argument0,848,288,spawn_wall_up_hor_obj);
room_instance_add(argument0,880,288,spawn_wall_up_hor_obj);
room_instance_add(argument0,912,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,944,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,976,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,1008,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,1008,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,976,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,944,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,912,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,880,192,spawn_wall_up_hor_obj);
room_instance_add(argument0,848,192,spawn_wall_up_hor_obj);
room_instance_add(argument0,816,192,spawn_wall_up_hor_obj);
room_instance_add(argument0,784,192,spawn_wall_up_hor_obj);
room_instance_add(argument0,656,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,624,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,592,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,592,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,624,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,656,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,1040,128,spawn_wall_up_hor_obj);
room_instance_add(argument0,1040,352,spawn_wall_up_hor_obj);
room_instance_add(argument0,720,192,spawn_wall_up_hor_obj);
room_instance_add(argument0,752,192,spawn_wall_up_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,576,240,spawn_wall_vert_obj);
room_instance_add(argument0,672,208,spawn_wall_vert_obj);
room_instance_add(argument0,672,272,spawn_wall_vert_obj);
room_instance_add(argument0,896,272,spawn_wall_vert_obj);
room_instance_add(argument0,896,208,spawn_wall_vert_obj);
room_instance_add(argument0,1024,208,spawn_wall_vert_obj);
room_instance_add(argument0,1056,208,spawn_wall_vert_obj);
room_instance_add(argument0,1056,176,spawn_wall_vert_obj);
room_instance_add(argument0,1056,144,spawn_wall_vert_obj);
room_instance_add(argument0,1024,176,spawn_wall_vert_obj);
room_instance_add(argument0,1024,144,spawn_wall_vert_obj);
room_instance_add(argument0,1024,272,spawn_wall_vert_obj);
room_instance_add(argument0,1056,240,spawn_wall_vert_obj);
room_instance_add(argument0,1056,272,spawn_wall_vert_obj);
room_instance_add(argument0,1056,304,spawn_wall_vert_obj);
room_instance_add(argument0,1056,336,spawn_wall_vert_obj);
room_instance_add(argument0,1024,336,spawn_wall_vert_obj);
room_instance_add(argument0,1024,304,spawn_wall_vert_obj);

room_instance_add(argument0,576,240,spawn_wall_up_vert_obj);
room_instance_add(argument0,672,208,spawn_wall_up_vert_obj);
room_instance_add(argument0,672,272,spawn_wall_up_vert_obj);
room_instance_add(argument0,896,272,spawn_wall_up_vert_obj);
room_instance_add(argument0,896,208,spawn_wall_up_vert_obj);
room_instance_add(argument0,1024,208,spawn_wall_up_vert_obj);
room_instance_add(argument0,1056,208,spawn_wall_up_vert_obj);
room_instance_add(argument0,1056,176,spawn_wall_up_vert_obj);
room_instance_add(argument0,1056,144,spawn_wall_up_vert_obj);
room_instance_add(argument0,1024,176,spawn_wall_up_vert_obj);
room_instance_add(argument0,1024,144,spawn_wall_up_vert_obj);
room_instance_add(argument0,1024,272,spawn_wall_up_vert_obj);
room_instance_add(argument0,1056,240,spawn_wall_up_vert_obj);
room_instance_add(argument0,1056,272,spawn_wall_up_vert_obj);
room_instance_add(argument0,1056,304,spawn_wall_up_vert_obj);
room_instance_add(argument0,1056,336,spawn_wall_up_vert_obj);
room_instance_add(argument0,1024,336,spawn_wall_up_vert_obj);
room_instance_add(argument0,1024,304,spawn_wall_up_vert_obj);
// Props
room_instance_add(argument0,1040,176,lab_light_obj);
room_instance_add(argument0,1040,240,lab_light_obj);
room_instance_add(argument0,1040,304,lab_light_obj);
room_instance_add(argument0,976,240,lab_light_obj);
room_instance_add(argument0,912,240,lab_light_obj);
room_instance_add(argument0,656,240,lab_light_obj);
room_instance_add(argument0,592,240,lab_light_obj);
room_instance_add(argument0,848,240,lab_light_obj);
room_instance_add(argument0,720,240,lab_light_obj);
room_instance_add(argument0,784,240,lab_light_obj);
room_instance_add(argument0,928,240,lab_trig_obj);
room_instance_add(argument0,752,272,lab_hole_obj);
room_instance_add(argument0,816,224,lab_note_02_obj);
room_instance_add(argument0,1040,128,door_north_obj);
room_instance_add(argument0,1040,352,door_south_obj);