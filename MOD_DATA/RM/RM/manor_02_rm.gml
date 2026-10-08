/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,
    '
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","manor","ROOM_manor")+" 2";
    ini_close();
    // Spawns
        global.spawn_len_var = 3;
        // Spawn 0 (entrance)
            global.spawn_arr[0,0] = 176;    // X
            global.spawn_arr[0,1] = 288;    // Y
            global.spawn_arr[0,2] = 0;      // Z
            global.spawn_arr[0,3] = 0;      // Angle (0 is right, 90 is up, etc)
        // Spawn 1 (exit)
            global.spawn_arr[1,0] = 336;
            global.spawn_arr[1,1] = 224;
            global.spawn_arr[1,2] = 0;
            global.spawn_arr[1,3] = 180;
        // Spawn 2 (exit)
            global.spawn_arr[2,0] = 336;
            global.spawn_arr[2,1] = 352;
            global.spawn_arr[2,2] = 0;
            global.spawn_arr[2,3] = 180;
    // Jumpscare Marks
        global.js_mark_len_var = 8;
        global.js_mark_arr[0,0] = 224;
        global.js_mark_arr[0,1] = 304;
        global.js_mark_arr[0,2] = 0;
        global.js_mark_arr[0,3] = 180;
        global.js_mark_arr[0,4] = true; // Left
        global.js_mark_arr[1,0] = 192;
        global.js_mark_arr[1,1] = 304;
        global.js_mark_arr[1,2] = 32; // 0
        global.js_mark_arr[1,3] = 180;
        global.js_mark_arr[1,4] = true; // Left
        global.js_mark_arr[2,0] = 272;
        global.js_mark_arr[2,1] = 336;
        global.js_mark_arr[2,2] = 16; // 0
        global.js_mark_arr[2,3] = 180;
        global.js_mark_arr[2,4] = true; // Left
        global.js_mark_arr[3,0] = 224;
        global.js_mark_arr[3,1] = 240;
        global.js_mark_arr[3,2] = 0;
        global.js_mark_arr[3,3] = 180;
        global.js_mark_arr[3,4] = false; // Right
        global.js_mark_arr[4,0] = 208;
        global.js_mark_arr[4,1] = 240;
        global.js_mark_arr[4,2] = 0;
        global.js_mark_arr[4,3] = 180;
        global.js_mark_arr[4,4] = false; // Right
        // New
        global.js_mark_arr[5,0] = 232;
        global.js_mark_arr[5,1] = 304;
        global.js_mark_arr[5,2] = 32;
        global.js_mark_arr[5,3] = 180;
        global.js_mark_arr[5,4] = true; // Left
        global.js_mark_arr[6,0] = 240;
        global.js_mark_arr[6,1] = 240;
        global.js_mark_arr[6,2] = 32;
        global.js_mark_arr[6,3] = 180;
        global.js_mark_arr[6,4] = false; // Right
        global.js_mark_arr[7,0] = 208;
        global.js_mark_arr[7,1] = 240;
        global.js_mark_arr[7,2] = 32;
        global.js_mark_arr[7,3] = 180;
        global.js_mark_arr[7,4] = false; // Right
        mark_create_scr();
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
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
// room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,reflect_eff_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
    room_instance_add(argument0,176,288,floor_manor_obj);
    room_instance_add(argument0,208,288,floor_manor_obj);
    room_instance_add(argument0,176,256,floor_manor_obj);
    room_instance_add(argument0,208,256,floor_manor_obj);
    room_instance_add(argument0,208,320,floor_manor_obj);
    room_instance_add(argument0,176,320,floor_manor_obj);
    room_instance_add(argument0,240,320,floor_manor_obj);
    room_instance_add(argument0,272,320,floor_manor_obj);
    room_instance_add(argument0,272,288,floor_manor_obj);
    room_instance_add(argument0,240,256,floor_manor_obj);
    room_instance_add(argument0,240,288,floor_manor_obj);
    room_instance_add(argument0,272,256,floor_manor_obj);
    room_instance_add(argument0,304,256,floor_manor_obj);
    room_instance_add(argument0,304,288,floor_manor_obj);
    room_instance_add(argument0,304,320,floor_manor_obj);
    room_instance_add(argument0,336,320,floor_manor_obj);
    room_instance_add(argument0,336,288,floor_manor_obj);
    room_instance_add(argument0,336,256,floor_manor_obj);
    room_instance_add(argument0,336,224,floor_manor_obj);
    room_instance_add(argument0,304,224,floor_manor_obj);
    room_instance_add(argument0,272,224,floor_manor_obj);
    room_instance_add(argument0,272,352,floor_manor_obj);
    room_instance_add(argument0,304,352,floor_manor_obj);
    room_instance_add(argument0,336,352,floor_manor_obj);
    room_instance_add(argument0,368,320,floor_manor_obj);
    room_instance_add(argument0,368,256,floor_manor_obj);
    room_instance_add(argument0,368,288,floor_manor_obj);
// Ceilings
    room_instance_add(argument0,176,288,ceil_manor_obj);
    room_instance_add(argument0,208,288,ceil_manor_obj);
    room_instance_add(argument0,176,256,ceil_manor_obj);
    room_instance_add(argument0,208,256,ceil_manor_obj);
    room_instance_add(argument0,208,320,ceil_manor_obj);
    room_instance_add(argument0,176,320,ceil_manor_obj);
    room_instance_add(argument0,240,320,ceil_manor_obj);
    room_instance_add(argument0,272,320,ceil_manor_obj);
    room_instance_add(argument0,272,288,ceil_manor_obj);
    room_instance_add(argument0,240,256,ceil_manor_obj);
    room_instance_add(argument0,240,288,ceil_manor_obj);
    room_instance_add(argument0,272,256,ceil_manor_obj);
    room_instance_add(argument0,304,256,ceil_manor_obj);
    room_instance_add(argument0,304,288,ceil_manor_obj);
    room_instance_add(argument0,304,320,ceil_manor_obj);
    room_instance_add(argument0,336,320,ceil_manor_obj);
    room_instance_add(argument0,336,288,ceil_manor_obj);
    room_instance_add(argument0,336,256,ceil_manor_obj);
    room_instance_add(argument0,336,224,ceil_manor_obj);
    room_instance_add(argument0,304,224,ceil_manor_obj);
    room_instance_add(argument0,272,224,ceil_manor_obj);
    room_instance_add(argument0,272,352,ceil_manor_obj);
    room_instance_add(argument0,304,352,ceil_manor_obj);
    room_instance_add(argument0,336,352,ceil_manor_obj);
    room_instance_add(argument0,368,320,ceil_manor_obj);
    room_instance_add(argument0,368,256,ceil_manor_obj);
    room_instance_add(argument0,368,288,ceil_manor_obj);
// Walls (Horizontal)
    room_instance_add(argument0,176,240,wall_manor_down_hor_obj);
    room_instance_add(argument0,176,240,wall_manor_up_hor_obj);
    room_instance_add(argument0,208,240,wall_manor_down_hor_obj);
    room_instance_add(argument0,208,240,wall_manor_up_hor_obj);
    room_instance_add(argument0,240,240,wall_manor_down_hor_obj);
    room_instance_add(argument0,240,240,wall_manor_up_hor_obj);
    room_instance_add(argument0,272,208,wall_manor_down_hor_obj);
    room_instance_add(argument0,272,208,wall_manor_up_hor_obj);
    room_instance_add(argument0,304,208,wall_manor_down_hor_obj);
    room_instance_add(argument0,304,208,wall_manor_up_hor_obj);
    room_instance_add(argument0,336,208,wall_manor_down_hor_obj);
    room_instance_add(argument0,336,208,wall_manor_up_hor_obj);
    room_instance_add(argument0,368,240,wall_manor_down_hor_obj);
    room_instance_add(argument0,368,240,wall_manor_up_hor_obj);
    room_instance_add(argument0,368,336,wall_manor_down_hor_obj);
    room_instance_add(argument0,368,336,wall_manor_up_hor_obj);
    room_instance_add(argument0,336,368,wall_manor_down_hor_obj);
    room_instance_add(argument0,336,368,wall_manor_up_hor_obj);
    room_instance_add(argument0,304,368,wall_manor_down_hor_obj);
    room_instance_add(argument0,304,368,wall_manor_up_hor_obj);
    room_instance_add(argument0,272,368,wall_manor_down_hor_obj);
    room_instance_add(argument0,272,368,wall_manor_up_hor_obj);
    room_instance_add(argument0,240,336,wall_manor_down_hor_obj);
    room_instance_add(argument0,240,336,wall_manor_up_hor_obj);
    room_instance_add(argument0,208,336,wall_manor_down_hor_obj);
    room_instance_add(argument0,208,336,wall_manor_up_hor_obj);
    room_instance_add(argument0,176,336,wall_manor_down_hor_obj);
    room_instance_add(argument0,176,336,wall_manor_up_hor_obj);
// Walls (Vertical)
    room_instance_add(argument0,160,256,wall_manor_down_vert_obj);
    room_instance_add(argument0,160,256,wall_manor_up_vert_obj);
    room_instance_add(argument0,160,288,wall_manor_down_vert_obj);
    room_instance_add(argument0,160,288,wall_manor_up_vert_obj);
    room_instance_add(argument0,160,320,wall_manor_down_vert_obj);
    room_instance_add(argument0,160,320,wall_manor_up_vert_obj);
    room_instance_add(argument0,256,352,wall_manor_down_vert_obj);
    room_instance_add(argument0,256,352,wall_manor_up_vert_obj);
    room_instance_add(argument0,352,352,wall_manor_down_vert_obj);
    room_instance_add(argument0,352,352,wall_manor_up_vert_obj);
    room_instance_add(argument0,384,320,wall_manor_down_vert_obj);
    room_instance_add(argument0,384,320,wall_manor_up_vert_obj);
    room_instance_add(argument0,384,288,wall_manor_down_vert_obj);
    room_instance_add(argument0,384,288,wall_manor_up_vert_obj);
    room_instance_add(argument0,384,256,wall_manor_down_vert_obj);
    room_instance_add(argument0,384,256,wall_manor_up_vert_obj);
    room_instance_add(argument0,352,224,wall_manor_down_vert_obj);
    room_instance_add(argument0,352,224,wall_manor_up_vert_obj);
    room_instance_add(argument0,256,224,wall_manor_down_vert_obj);
    room_instance_add(argument0,256,224,wall_manor_up_vert_obj);
// Props
    room_instance_add(argument0,372,256,table_obj);
    room_instance_add(argument0,372,320,table_obj);
    room_instance_add(argument0,272,224,save_ped_obj);
    room_instance_add(argument0,272,224,save_cross_obj);
    room_instance_add(argument0,320,288,argument1.spooky_02_obj);
    room_instance_add(argument0,384,288,argument1.manor_art_obj);
    room_instance_add(argument0,272,208,argument1.manor_pass_obj);
    room_instance_add(argument0,368,288,argument1.manor_gift_obj);
    // room_instance_add(argument0,272,288,spawn2); What is this for?
// Kill Monster
room_instance_add(argument0,0,0,destroy_mon_obj);