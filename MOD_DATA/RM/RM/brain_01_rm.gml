/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","lab","ROOM_lab")+" 1?";
    local.rust = ini_read_string("UI","rust","UI_rust");
    local.hole = ini_read_string("UI","hole","UI_hole");
    local.lock = ini_read_string("UI","keycard_hint","UI_keycard_hint");
    ini_close();
    // Spawns
    global.spawn_len_var = 4;
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
    global.spawn_arr[3,0] = 528;
    global.spawn_arr[3,1] = 240;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,false,load_par_obj.lab_door_obj,spawn_door_trig_obj);
    // Exit
    with spawn_arr[1,4]
    {
        rm_var = brain_03_rm;
        rm_count_var = 1;
        lock_var = !load_par_obj.door_var;
        txt_lock_var = local.rust;
        txt_var = local.hole;
        snd_len_var = 0;
    }
    with spawn_arr[1,5]
    {
        if load_par_obj.door_var
        {
            mdl_var = load_par_obj.mdl_arr_var[2,0];
            mdl_02_var = load_par_obj.mdl_arr_var[3,0];
            type_var = 0; // Model
        }
    }
    with spawn_arr[2,4] { rm_var = brain_02_rm; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    with spawn_arr[3,4] { lock_var = true; txt_lock_var = local.lock; snd_len_var = 1; snd_arr[0] = door_m_02_snd; }
    // Lights
    with instance_create(176,240,load_par_obj.bug_dead_light_obj) { light_var = 0.6; event_user(0); } // Entrance
    with instance_create(304,240,load_par_obj.bug_dead_light_obj) { light_var = 0.4; event_user(0); }
    with instance_create(400,160,load_par_obj.bug_dead_light_obj) { light_var = 1; event_user(0); } // Left Door
    with instance_create(400,240,load_par_obj.bug_dead_light_obj) { light_var = 0.9; event_user(0); } // Center
    with instance_create(400,320,load_par_obj.bug_dead_light_obj) { light_var = 0.8; event_user(0); } // Right Door
    with instance_create(448,272,load_par_obj.bug_dead_light_obj) { light_var = 0.7; event_user(0); } // Table
    with instance_create(512,240,load_par_obj.bug_dead_light_obj) { light_var = 0.5; event_user(0); } // Forward Door
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
room_instance_add(argument0,0,0,argument1.brain_mus_obj);
// Floors
room_instance_add(argument0,176,240,argument1.lab_floor_obj);
room_instance_add(argument0,208,240,argument1.lab_floor_obj);
room_instance_add(argument0,240,240,argument1.lab_floor_obj);
room_instance_add(argument0,272,240,argument1.lab_floor_obj);
room_instance_add(argument0,304,240,argument1.lab_floor_obj);
room_instance_add(argument0,336,240,argument1.lab_floor_obj);
room_instance_add(argument0,368,240,argument1.lab_floor_obj);
room_instance_add(argument0,400,240,argument1.lab_floor_obj);
room_instance_add(argument0,336,208,argument1.lab_floor_obj);
room_instance_add(argument0,368,208,argument1.lab_floor_obj);
room_instance_add(argument0,400,208,argument1.lab_floor_obj);
room_instance_add(argument0,400,272,argument1.lab_floor_obj);
room_instance_add(argument0,368,272,argument1.lab_floor_obj);
room_instance_add(argument0,336,272,argument1.lab_floor_obj);
room_instance_add(argument0,432,208,argument1.lab_floor_obj);
room_instance_add(argument0,432,240,argument1.lab_floor_obj);
room_instance_add(argument0,432,272,argument1.lab_floor_obj);
room_instance_add(argument0,464,208,argument1.lab_floor_obj);
room_instance_add(argument0,464,240,argument1.lab_floor_obj);
room_instance_add(argument0,496,240,argument1.lab_floor_obj);
room_instance_add(argument0,528,240,argument1.lab_floor_obj);
room_instance_add(argument0,400,176,argument1.lab_floor_obj);
room_instance_add(argument0,400,144,argument1.lab_floor_obj);
room_instance_add(argument0,400,304,argument1.lab_floor_obj);
room_instance_add(argument0,400,336,argument1.lab_floor_obj);
room_instance_add(argument0,464,272,argument1.lab_floor_obj);
// Ceilings
room_instance_add(argument0,176,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,208,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,240,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,272,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,304,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,336,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,368,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,336,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,368,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,368,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,336,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,432,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,432,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,432,272,argument1.lab_ceil_high_obj);
room_instance_add(argument0,464,208,argument1.lab_ceil_high_obj);
room_instance_add(argument0,464,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,496,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,528,240,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,176,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,144,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,304,argument1.lab_ceil_high_obj);
room_instance_add(argument0,400,336,argument1.lab_ceil_high_obj);
room_instance_add(argument0,464,272,argument1.lab_ceil_high_obj);
// Walls (Horizontal)
room_instance_add(argument0,304,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,304,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,272,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,240,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,208,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,176,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,176,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,208,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,240,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,272,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,336,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,368,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,496,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,528,224,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,528,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,496,256,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,464,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,432,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,368,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,336,288,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,400,128,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,400,352,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,432,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,464,192,argument1.lab_wall_down_hor_obj);
room_instance_add(argument0,304,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,304,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,272,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,240,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,208,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,176,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,176,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,208,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,240,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,272,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,336,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,368,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,496,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,528,224,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,528,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,496,256,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,464,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,432,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,368,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,336,288,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,400,128,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,400,352,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,432,192,argument1.lab_wall_up_hor_obj);
room_instance_add(argument0,464,192,argument1.lab_wall_up_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,320,272,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,160,240,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,320,208,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,480,208,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,480,272,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,384,176,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,384,304,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,416,304,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,416,336,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,384,336,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,416,176,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,416,144,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,384,144,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,544,240,argument1.lab_wall_down_vert_obj);
room_instance_add(argument0,320,272,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,160,240,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,320,208,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,480,208,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,480,272,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,384,176,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,384,304,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,416,304,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,416,336,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,384,336,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,416,176,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,416,144,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,384,144,argument1.lab_wall_up_vert_obj);
room_instance_add(argument0,544,240,argument1.lab_wall_up_vert_obj);
// Props
room_instance_add(argument0,464,208,table_metal_obj);
room_instance_add(argument0,464,272,table_metal_obj);
room_instance_add(argument0,464,272,argument1.brain_note_01_obj);