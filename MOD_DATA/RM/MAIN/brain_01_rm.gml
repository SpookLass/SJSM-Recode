/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","lab","ROOM_lab")+" 1?"
    ini_close();
    // Spawns
    global.spawn_len_var = 1;
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 240;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 400;
    global.spawn_arr[1,1] = 144;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 270;
    global.spawn_arr[2,0] = 400;
    global.spawn_arr[2,1] = 336;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 90;
    global.spawn_arr[3,0] = 520;
    global.spawn_arr[3,1] = 240;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
    // Exit
    with instance_create(400,136,spawn_door_trig_obj)
    {
        global.spawn_arr[1,4] = id;
        spawn_var = 0;
        rm_var = brain_03_rm;
        // lock_var = true;
        ini_open(global.lang_var);
        txt_lock_var = ini_read_string("UI","broke","UI_broke");
        ini_close();
    }
    with instance_create(400,128,lab_door_obj) { global.spawn_arr[1,5] = id; direction = 270; }
    with instance_create(400,344,spawn_door_trig_obj)
    {
        global.spawn_arr[2,4] = id;
        rm_var = test_spawn_rm;
    }
    with instance_create(400,352,lab_door_obj) { global.spawn_arr[2,5] = id; direction = 90; }
    with instance_create(536,240,spawn_door_trig_obj)
    {
        global.spawn_arr[3,4] = id; 
        lock_var = true;
        ini_open(global.lang_var);
        txt_lock_var = ini_read_string("UI","keycard_hint","UI_keycard_hint");
        ini_close();
    }
    with instance_create(544,240,lab_door_obj) { global.spawn_arr[3,5] = id; direction = 180; }
    // Lights
    with instance_create(176,240,brain_light_obj) { light_var = 0.6; event_user(0); } // Entrance
    with instance_create(304,240,brain_light_obj) { light_var = 0.4; event_user(0); }
    with instance_create(400,160,brain_light_obj) { light_var = 1; event_user(0); } // Left Door
    with instance_create(400,240,brain_light_obj) { light_var = 0.9; event_user(0); } // Center
    with instance_create(400,320,brain_light_obj) { light_var = 0.8; event_user(0); } // Right Door
    with instance_create(448,272,brain_light_obj) { light_var = 0.7; event_user(0); } // Table
    with instance_create(512,240,brain_light_obj) { light_var = 0.5; event_user(0); } // Forward Door
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
room_instance_add(argument0,176,240,spawn_floor_metal_obj);
room_instance_add(argument0,208,240,spawn_floor_metal_obj);
room_instance_add(argument0,240,240,spawn_floor_metal_obj);
room_instance_add(argument0,272,240,spawn_floor_metal_obj);
room_instance_add(argument0,304,240,spawn_floor_metal_obj);
room_instance_add(argument0,336,240,spawn_floor_metal_obj);
room_instance_add(argument0,368,240,spawn_floor_metal_obj);
room_instance_add(argument0,400,240,spawn_floor_metal_obj);
room_instance_add(argument0,336,208,spawn_floor_metal_obj);
room_instance_add(argument0,368,208,spawn_floor_metal_obj);
room_instance_add(argument0,400,208,spawn_floor_metal_obj);
room_instance_add(argument0,400,272,spawn_floor_metal_obj);
room_instance_add(argument0,368,272,spawn_floor_metal_obj);
room_instance_add(argument0,336,272,spawn_floor_metal_obj);
room_instance_add(argument0,432,208,spawn_floor_metal_obj);
room_instance_add(argument0,432,240,spawn_floor_metal_obj);
room_instance_add(argument0,432,272,spawn_floor_metal_obj);
room_instance_add(argument0,464,208,spawn_floor_metal_obj);
room_instance_add(argument0,464,240,spawn_floor_metal_obj);
room_instance_add(argument0,496,240,spawn_floor_metal_obj);
room_instance_add(argument0,528,240,spawn_floor_metal_obj);
room_instance_add(argument0,400,176,spawn_floor_metal_obj);
room_instance_add(argument0,400,144,spawn_floor_metal_obj);
room_instance_add(argument0,400,304,spawn_floor_metal_obj);
room_instance_add(argument0,400,336,spawn_floor_metal_obj);
room_instance_add(argument0,464,272,spawn_floor_metal_obj);
// Ceilings
room_instance_add(argument0,176,240,spawn_ceil_2high_obj);
room_instance_add(argument0,208,240,spawn_ceil_2high_obj);
room_instance_add(argument0,240,240,spawn_ceil_2high_obj);
room_instance_add(argument0,272,240,spawn_ceil_2high_obj);
room_instance_add(argument0,304,240,spawn_ceil_2high_obj);
room_instance_add(argument0,336,240,spawn_ceil_2high_obj);
room_instance_add(argument0,368,240,spawn_ceil_2high_obj);
room_instance_add(argument0,400,240,spawn_ceil_2high_obj);
room_instance_add(argument0,336,208,spawn_ceil_2high_obj);
room_instance_add(argument0,368,208,spawn_ceil_2high_obj);
room_instance_add(argument0,400,208,spawn_ceil_2high_obj);
room_instance_add(argument0,400,272,spawn_ceil_2high_obj);
room_instance_add(argument0,368,272,spawn_ceil_2high_obj);
room_instance_add(argument0,336,272,spawn_ceil_2high_obj);
room_instance_add(argument0,432,208,spawn_ceil_2high_obj);
room_instance_add(argument0,432,240,spawn_ceil_2high_obj);
room_instance_add(argument0,432,272,spawn_ceil_2high_obj);
room_instance_add(argument0,464,208,spawn_ceil_2high_obj);
room_instance_add(argument0,464,240,spawn_ceil_2high_obj);
room_instance_add(argument0,496,240,spawn_ceil_2high_obj);
room_instance_add(argument0,528,240,spawn_ceil_2high_obj);
room_instance_add(argument0,400,176,spawn_ceil_2high_obj);
room_instance_add(argument0,400,144,spawn_ceil_2high_obj);
room_instance_add(argument0,400,304,spawn_ceil_2high_obj);
room_instance_add(argument0,400,336,spawn_ceil_2high_obj);
room_instance_add(argument0,464,272,spawn_ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,304,224,spawn_wall_hor_obj);
room_instance_add(argument0,304,256,spawn_wall_hor_obj);
room_instance_add(argument0,272,256,spawn_wall_hor_obj);
room_instance_add(argument0,240,256,spawn_wall_hor_obj);
room_instance_add(argument0,208,256,spawn_wall_hor_obj);
room_instance_add(argument0,176,256,spawn_wall_hor_obj);
room_instance_add(argument0,176,224,spawn_wall_hor_obj);
room_instance_add(argument0,208,224,spawn_wall_hor_obj);
room_instance_add(argument0,240,224,spawn_wall_hor_obj);
room_instance_add(argument0,272,224,spawn_wall_hor_obj);
room_instance_add(argument0,336,192,spawn_wall_hor_obj);
room_instance_add(argument0,368,192,spawn_wall_hor_obj);
room_instance_add(argument0,496,224,spawn_wall_hor_obj);
room_instance_add(argument0,528,224,spawn_wall_hor_obj);
room_instance_add(argument0,528,256,spawn_wall_hor_obj);
room_instance_add(argument0,496,256,spawn_wall_hor_obj);
room_instance_add(argument0,464,288,spawn_wall_hor_obj);
room_instance_add(argument0,432,288,spawn_wall_hor_obj);
room_instance_add(argument0,368,288,spawn_wall_hor_obj);
room_instance_add(argument0,336,288,spawn_wall_hor_obj);
room_instance_add(argument0,400,128,spawn_wall_hor_obj);
room_instance_add(argument0,400,352,spawn_wall_hor_obj);
room_instance_add(argument0,432,192,spawn_wall_hor_obj);
room_instance_add(argument0,464,192,spawn_wall_hor_obj);
room_instance_add(argument0,304,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,304,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,272,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,240,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,208,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,176,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,176,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,208,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,240,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,272,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,336,192,spawn_wall_up_hor_obj);
room_instance_add(argument0,368,192,spawn_wall_up_hor_obj);
room_instance_add(argument0,496,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,528,224,spawn_wall_up_hor_obj);
room_instance_add(argument0,528,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,496,256,spawn_wall_up_hor_obj);
room_instance_add(argument0,464,288,spawn_wall_up_hor_obj);
room_instance_add(argument0,432,288,spawn_wall_up_hor_obj);
room_instance_add(argument0,368,288,spawn_wall_up_hor_obj);
room_instance_add(argument0,336,288,spawn_wall_up_hor_obj);
room_instance_add(argument0,400,128,spawn_wall_up_hor_obj);
room_instance_add(argument0,400,352,spawn_wall_up_hor_obj);
room_instance_add(argument0,432,192,spawn_wall_up_hor_obj);
room_instance_add(argument0,464,192,spawn_wall_up_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,320,272,spawn_wall_vert_obj);
room_instance_add(argument0,160,240,spawn_wall_vert_obj);
room_instance_add(argument0,320,208,spawn_wall_vert_obj);
room_instance_add(argument0,480,208,spawn_wall_vert_obj);
room_instance_add(argument0,480,272,spawn_wall_vert_obj);
room_instance_add(argument0,384,176,spawn_wall_vert_obj);
room_instance_add(argument0,384,304,spawn_wall_vert_obj);
room_instance_add(argument0,416,304,spawn_wall_vert_obj);
room_instance_add(argument0,416,336,spawn_wall_vert_obj);
room_instance_add(argument0,384,336,spawn_wall_vert_obj);
room_instance_add(argument0,416,176,spawn_wall_vert_obj);
room_instance_add(argument0,416,144,spawn_wall_vert_obj);
room_instance_add(argument0,384,144,spawn_wall_vert_obj);
room_instance_add(argument0,544,240,spawn_wall_vert_obj);
room_instance_add(argument0,320,272,spawn_wall_up_vert_obj);
room_instance_add(argument0,160,240,spawn_wall_up_vert_obj);
room_instance_add(argument0,320,208,spawn_wall_up_vert_obj);
room_instance_add(argument0,480,208,spawn_wall_up_vert_obj);
room_instance_add(argument0,480,272,spawn_wall_up_vert_obj);
room_instance_add(argument0,384,176,spawn_wall_up_vert_obj);
room_instance_add(argument0,384,304,spawn_wall_up_vert_obj);
room_instance_add(argument0,416,304,spawn_wall_up_vert_obj);
room_instance_add(argument0,416,336,spawn_wall_up_vert_obj);
room_instance_add(argument0,384,336,spawn_wall_up_vert_obj);
room_instance_add(argument0,416,176,spawn_wall_up_vert_obj);
room_instance_add(argument0,416,144,spawn_wall_up_vert_obj);
room_instance_add(argument0,384,144,spawn_wall_up_vert_obj);
room_instance_add(argument0,544,240,spawn_wall_up_vert_obj);
// Props
// room_instance_add(argument0,240,240,lab_light_flicker_obj);
// room_instance_add(argument0,352,208,lab_light_flicker_obj);
// room_instance_add(argument0,352,272,lab_light_flicker_obj);
// room_instance_add(argument0,448,208,lab_light_flicker_obj);
room_instance_add(argument0,464,208,table_metal_obj);
room_instance_add(argument0,464,272,table_metal_obj);