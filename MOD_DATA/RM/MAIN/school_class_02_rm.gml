/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code 
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","school_class","ROOM_school_class")+" 2"
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 336;
    global.spawn_arr[0,1] = 288;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 90;
    global.spawn_arr[1,0] = 336;
    global.spawn_arr[1,1] = 288;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(false,false,false,school_door_obj,spawn_door_trig_obj);
    with spawn_arr[1,4] { rm_var = school_01_rm; spawn_var = 3; }
    with instance_create(0,0,reflect_eff_obj) { reflect_pos_var = 176; reflect_axis_var = 1; }
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
room_instance_add(argument0,0,0,school_color_obj);
room_instance_add(argument0,0,0,fog_01_obj);
room_instance_add(argument0,0,0,reflect_eff_obj);
// Floors
room_instance_add(argument0,144,256,spawn_floor_obj);
room_instance_add(argument0,336,288,spawn_floor_obj);
room_instance_add(argument0,208,288,spawn_floor_obj);
room_instance_add(argument0,240,288,spawn_floor_obj);
room_instance_add(argument0,272,288,spawn_floor_obj);
room_instance_add(argument0,304,288,spawn_floor_obj);
room_instance_add(argument0,336,256,spawn_floor_obj);
room_instance_add(argument0,304,256,spawn_floor_obj);
room_instance_add(argument0,272,256,spawn_floor_obj);
room_instance_add(argument0,240,256,spawn_floor_obj);
room_instance_add(argument0,208,256,spawn_floor_obj);
room_instance_add(argument0,208,224,spawn_floor_obj);
room_instance_add(argument0,240,224,spawn_floor_obj);
room_instance_add(argument0,272,224,spawn_floor_obj);
room_instance_add(argument0,304,224,spawn_floor_obj);
room_instance_add(argument0,336,224,spawn_floor_obj);
room_instance_add(argument0,368,288,spawn_floor_obj);
room_instance_add(argument0,368,256,spawn_floor_obj);
room_instance_add(argument0,368,224,spawn_floor_obj);
room_instance_add(argument0,368,192,spawn_floor_obj);
room_instance_add(argument0,336,192,spawn_floor_obj);
room_instance_add(argument0,304,192,spawn_floor_obj);
room_instance_add(argument0,272,192,spawn_floor_obj);
room_instance_add(argument0,240,192,spawn_floor_obj);
room_instance_add(argument0,208,192,spawn_floor_obj);
// Ceilings
room_instance_add(argument0,144,256,spawn_ceil_48px_obj);
room_instance_add(argument0,336,288,spawn_ceil_48px_obj);
room_instance_add(argument0,208,288,spawn_ceil_48px_obj);
room_instance_add(argument0,240,288,spawn_ceil_48px_obj);
room_instance_add(argument0,272,288,spawn_ceil_48px_obj);
room_instance_add(argument0,304,288,spawn_ceil_48px_obj);
room_instance_add(argument0,336,256,spawn_ceil_48px_obj);
room_instance_add(argument0,304,256,spawn_ceil_48px_obj);
room_instance_add(argument0,272,256,spawn_ceil_48px_obj);
room_instance_add(argument0,240,256,spawn_ceil_48px_obj);
room_instance_add(argument0,208,256,spawn_ceil_48px_obj);
room_instance_add(argument0,208,224,spawn_ceil_48px_obj);
room_instance_add(argument0,240,224,spawn_ceil_48px_obj);
room_instance_add(argument0,272,224,spawn_ceil_48px_obj);
room_instance_add(argument0,304,224,spawn_ceil_48px_obj);
room_instance_add(argument0,336,224,spawn_ceil_48px_obj);
room_instance_add(argument0,368,288,spawn_ceil_48px_obj);
room_instance_add(argument0,368,256,spawn_ceil_48px_obj);
room_instance_add(argument0,368,224,spawn_ceil_48px_obj);
room_instance_add(argument0,368,192,spawn_ceil_48px_obj);
room_instance_add(argument0,336,192,spawn_ceil_48px_obj);
room_instance_add(argument0,304,192,spawn_ceil_48px_obj);
room_instance_add(argument0,272,192,spawn_ceil_48px_obj);
room_instance_add(argument0,240,192,spawn_ceil_48px_obj);
room_instance_add(argument0,208,192,spawn_ceil_48px_obj);
// Walls (Horizontal)
room_instance_add(argument0,208,304,spawn_wall_hor_obj);
room_instance_add(argument0,240,304,spawn_wall_hor_obj);
room_instance_add(argument0,272,304,spawn_wall_hor_obj);
room_instance_add(argument0,304,304,spawn_wall_hor_obj);
room_instance_add(argument0,368,304,spawn_wall_hor_obj);
room_instance_add(argument0,336,304,spawn_wall_hor_obj);
room_instance_add(argument0,208,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,240,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,272,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,304,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,368,304,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,336,304,spawn_wall_16px_up_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,384,288,spawn_wall_vert_obj);
room_instance_add(argument0,384,256,spawn_wall_vert_obj);
room_instance_add(argument0,384,224,spawn_wall_vert_obj);
room_instance_add(argument0,192,288,spawn_wall_vert_obj);
room_instance_add(argument0,192,256,spawn_wall_vert_obj);
room_instance_add(argument0,192,224,spawn_wall_vert_obj);
room_instance_add(argument0,192,192,spawn_wall_vert_obj);
room_instance_add(argument0,384,192,spawn_wall_vert_obj);
room_instance_add(argument0,384,288,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,384,256,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,384,224,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,192,288,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,192,256,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,192,224,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,192,192,spawn_wall_16px_up_vert_obj);
room_instance_add(argument0,384,192,spawn_wall_16px_up_vert_obj);
// Windows
room_instance_add(argument0,208,176,school_window_hor_obj);
room_instance_add(argument0,240,176,school_window_hor_obj);
room_instance_add(argument0,272,176,school_window_hor_obj);
room_instance_add(argument0,304,176,school_window_hor_obj);
room_instance_add(argument0,336,176,school_window_hor_obj);
room_instance_add(argument0,368,176,school_window_hor_obj);
room_instance_add(argument0,208,176,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,240,176,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,272,176,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,304,176,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,336,176,spawn_wall_16px_up_hor_obj);
room_instance_add(argument0,368,176,spawn_wall_16px_up_hor_obj);
// Props
room_instance_add(argument0,224,192,school_desk_obj);
room_instance_add(argument0,288,192,school_desk_obj);
room_instance_add(argument0,288,288,school_desk_obj);
room_instance_add(argument0,288,224,school_desk_obj);
room_instance_add(argument0,228,256,school_desk_obj);
room_instance_add(argument0,224,224,school_desk_obj);
room_instance_add(argument0,292,256,school_desk_obj);
room_instance_add(argument0,256,220,school_desk_obj);
room_instance_add(argument0,256,256,school_desk_obj);
room_instance_add(argument0,256,288,school_desk_obj);
room_instance_add(argument0,352,240,school_desk_teacher_obj);
room_instance_add(argument0,384,240,school_chalk_obj);
room_instance_add(argument0,384,240,school_clock_obj);
room_instance_add(argument0,384,204,school_poster_01_obj);
room_instance_add(argument0,192,284,school_poster_02_obj);
room_instance_add(argument0,384,276,school_poster_03_obj);
room_instance_add(argument0,208,192,ghost_obj);
room_instance_add(argument0,208,256,ghost_obj);
room_instance_add(argument0,272,224,ghost_obj);
room_instance_add(argument0,240,288,ghost_obj);
room_instance_add(argument0,372,188,chair_rand_obj);
room_instance_add(argument0,360,188,chair_rand_obj);
room_instance_add(argument0,364,204,chair_rand_obj);
room_instance_add(argument0,348,196,chair_rand_obj);
room_instance_add(argument0,289,288,school_note_01_obj);