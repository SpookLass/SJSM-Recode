/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code 
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","school","ROOM_school")+" 2"
    local.lock = ini_read_string("UI","run","UI_run");
    ini_close();
    // Spawns
    global.spawn_len_var = 3;
    global.spawn_arr[0,0] = 208;
    global.spawn_arr[0,1] = 336;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 480;
    global.spawn_arr[1,1] = 224;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    global.spawn_arr[2,0] = 480;
    global.spawn_arr[2,1] = 448;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 90;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,load_par_obj.school_door_obj,false,spawn_leave_door_trig_obj);
    with instance_create(200,336,spawn_door_trig_obj)
    {
        global.spawn_arr[0,4] = id;
        txt_lock_var = local.lock;
        rm_var = load_par_obj.school_01_rm;
        rm_count_var = -1;
        rm_spawn_var = 6;
        spawn_var = 0;
    }
    with spawn_arr[1,4] { lock_var = true; }
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
room_instance_add(argument0,208,448,argument1.school_floor_obj);
room_instance_add(argument0,208,352,argument1.school_floor_obj);
room_instance_add(argument0,240,352,argument1.school_floor_obj);
room_instance_add(argument0,272,352,argument1.school_floor_obj);
room_instance_add(argument0,208,320,argument1.school_floor_obj);
room_instance_add(argument0,240,320,argument1.school_floor_obj);
room_instance_add(argument0,272,320,argument1.school_floor_obj);
room_instance_add(argument0,304,320,argument1.school_floor_obj);
room_instance_add(argument0,304,352,argument1.school_floor_obj);
room_instance_add(argument0,336,352,argument1.school_floor_obj);
room_instance_add(argument0,336,320,argument1.school_floor_obj);
room_instance_add(argument0,368,320,argument1.school_floor_obj);
room_instance_add(argument0,368,352,argument1.school_floor_obj);
room_instance_add(argument0,400,352,argument1.school_floor_obj);
room_instance_add(argument0,400,320,argument1.school_floor_obj);
room_instance_add(argument0,432,320,argument1.school_floor_obj);
room_instance_add(argument0,432,352,argument1.school_floor_obj);
room_instance_add(argument0,464,352,argument1.school_floor_obj);
room_instance_add(argument0,464,320,argument1.school_floor_obj);
room_instance_add(argument0,496,352,argument1.school_floor_obj);
room_instance_add(argument0,496,320,argument1.school_floor_obj);
room_instance_add(argument0,464,288,argument1.school_floor_obj);
room_instance_add(argument0,496,288,argument1.school_floor_obj);
room_instance_add(argument0,496,256,argument1.school_floor_obj);
room_instance_add(argument0,464,256,argument1.school_floor_obj);
room_instance_add(argument0,464,224,argument1.school_floor_obj);
room_instance_add(argument0,496,224,argument1.school_floor_obj);
room_instance_add(argument0,464,384,argument1.school_floor_obj);
room_instance_add(argument0,496,384,argument1.school_floor_obj);
room_instance_add(argument0,496,416,argument1.school_floor_obj);
room_instance_add(argument0,464,416,argument1.school_floor_obj);
room_instance_add(argument0,464,448,argument1.school_floor_obj);
room_instance_add(argument0,496,448,argument1.school_floor_obj);
// Ceilings
room_instance_add(argument0,208,448,argument1.school_ceil_obj);
room_instance_add(argument0,208,352,argument1.school_ceil_obj);
room_instance_add(argument0,240,352,argument1.school_ceil_obj);
room_instance_add(argument0,272,352,argument1.school_ceil_obj);
room_instance_add(argument0,208,320,argument1.school_ceil_obj);
room_instance_add(argument0,240,320,argument1.school_ceil_obj);
room_instance_add(argument0,272,320,argument1.school_ceil_obj);
room_instance_add(argument0,304,320,argument1.school_ceil_obj);
room_instance_add(argument0,304,352,argument1.school_ceil_obj);
room_instance_add(argument0,336,352,argument1.school_ceil_obj);
room_instance_add(argument0,336,320,argument1.school_ceil_obj);
room_instance_add(argument0,368,320,argument1.school_ceil_obj);
room_instance_add(argument0,368,352,argument1.school_ceil_obj);
room_instance_add(argument0,400,352,argument1.school_ceil_obj);
room_instance_add(argument0,400,320,argument1.school_ceil_obj);
room_instance_add(argument0,432,320,argument1.school_ceil_obj);
room_instance_add(argument0,432,352,argument1.school_ceil_obj);
room_instance_add(argument0,464,352,argument1.school_ceil_obj);
room_instance_add(argument0,464,320,argument1.school_ceil_obj);
room_instance_add(argument0,496,352,argument1.school_ceil_obj);
room_instance_add(argument0,496,320,argument1.school_ceil_obj);
room_instance_add(argument0,464,288,argument1.school_ceil_obj);
room_instance_add(argument0,496,288,argument1.school_ceil_obj);
room_instance_add(argument0,496,256,argument1.school_ceil_obj);
room_instance_add(argument0,464,256,argument1.school_ceil_obj);
room_instance_add(argument0,464,224,argument1.school_ceil_obj);
room_instance_add(argument0,496,224,argument1.school_ceil_obj);
room_instance_add(argument0,464,384,argument1.school_ceil_obj);
room_instance_add(argument0,496,384,argument1.school_ceil_obj);
room_instance_add(argument0,496,416,argument1.school_ceil_obj);
room_instance_add(argument0,464,416,argument1.school_ceil_obj);
room_instance_add(argument0,464,448,argument1.school_ceil_obj);
room_instance_add(argument0,496,448,argument1.school_ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,208,368,argument1.school_wall_hor_obj);
room_instance_add(argument0,240,368,argument1.school_wall_hor_obj);
room_instance_add(argument0,272,368,argument1.school_wall_hor_obj);
room_instance_add(argument0,304,368,argument1.school_wall_hor_obj);
room_instance_add(argument0,208,304,argument1.school_wall_hor_obj);
room_instance_add(argument0,240,304,argument1.school_wall_hor_obj);
room_instance_add(argument0,272,304,argument1.school_wall_hor_obj);
room_instance_add(argument0,304,304,argument1.school_wall_hor_obj);
room_instance_add(argument0,336,304,argument1.school_wall_hor_obj);
room_instance_add(argument0,464,208,argument1.school_wall_hor_obj);
room_instance_add(argument0,496,208,argument1.school_wall_hor_obj);
room_instance_add(argument0,464,464,argument1.school_wall_hor_obj);
room_instance_add(argument0,496,464,argument1.school_wall_hor_obj);
room_instance_add(argument0,336,368,argument1.school_wall_hor_obj);
room_instance_add(argument0,432,368,argument1.school_wall_hor_obj);
room_instance_add(argument0,400,368,argument1.school_wall_hor_obj);
room_instance_add(argument0,368,368,argument1.school_wall_hor_obj);
room_instance_add(argument0,368,304,argument1.school_wall_hor_obj);
room_instance_add(argument0,400,304,argument1.school_wall_hor_obj);
room_instance_add(argument0,432,304,argument1.school_wall_hor_obj);
room_instance_add(argument0,208,368,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,240,368,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,272,368,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,304,368,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,208,304,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,240,304,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,272,304,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,304,304,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,336,304,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,464,208,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,496,208,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,464,464,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,496,464,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,336,368,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,432,368,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,400,368,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,368,368,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,368,304,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,400,304,argument1.school_wall_up_hor_obj);
room_instance_add(argument0,432,304,argument1.school_wall_up_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,192,352,argument1.school_wall_vert_obj);
room_instance_add(argument0,192,320,argument1.school_wall_vert_obj);
room_instance_add(argument0,448,224,argument1.school_wall_vert_obj);
room_instance_add(argument0,448,256,argument1.school_wall_vert_obj);
room_instance_add(argument0,448,288,argument1.school_wall_vert_obj);
room_instance_add(argument0,512,288,argument1.school_wall_vert_obj);
room_instance_add(argument0,512,256,argument1.school_wall_vert_obj);
room_instance_add(argument0,512,224,argument1.school_wall_vert_obj);
room_instance_add(argument0,512,320,argument1.school_wall_vert_obj);
room_instance_add(argument0,512,352,argument1.school_wall_vert_obj);
room_instance_add(argument0,512,384,argument1.school_wall_vert_obj);
room_instance_add(argument0,512,416,argument1.school_wall_vert_obj);
room_instance_add(argument0,512,448,argument1.school_wall_vert_obj);
room_instance_add(argument0,448,384,argument1.school_wall_vert_obj);
room_instance_add(argument0,448,416,argument1.school_wall_vert_obj);
room_instance_add(argument0,448,448,argument1.school_wall_vert_obj);
room_instance_add(argument0,192,352,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,192,320,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,448,224,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,448,256,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,448,288,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,512,288,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,512,256,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,512,224,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,512,320,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,512,352,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,512,384,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,512,416,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,512,448,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,448,384,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,448,416,argument1.school_wall_up_vert_obj);
room_instance_add(argument0,448,448,argument1.school_wall_up_vert_obj);
// Props
room_instance_add(argument0,288,308,argument1.school_locker_north_obj);
room_instance_add(argument0,352,308,argument1.school_locker_north_obj);
room_instance_add(argument0,416,308,argument1.school_locker_north_obj);
room_instance_add(argument0,288,364,argument1.school_locker_south_obj);
room_instance_add(argument0,352,364,argument1.school_locker_south_obj);
room_instance_add(argument0,416,364,argument1.school_locker_south_obj);
room_instance_add(argument0,400,336,argument1.school_trig_obj);