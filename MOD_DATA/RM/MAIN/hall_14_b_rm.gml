/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','hall','ROOM_hall')+' 14 B';
    ini_close();
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 464;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 720;
    global.spawn_arr[1,1] = 256;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 496;
    global.mark_arr[0,1] = 256;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 548;
    global.mark_arr[1,1] = 256;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 627;
    global.mark_arr[2,1] = 250;
    global.mark_arr[2,2] = 0;
    // Jumpscare Mark
    global.js_mark_len_var = 3;
    global.js_mark_arr[0,0] = 576;
    global.js_mark_arr[0,1] = 272;
    global.js_mark_arr[0,2] = 0;
    global.js_mark_arr[0,3] = 0;
    global.js_mark_arr[1,0] = 608;
    global.js_mark_arr[1,1] = 272;
    global.js_mark_arr[1,2] = 0;
    global.js_mark_arr[1,3] = 0;
    global.js_mark_arr[2,0] = 672;
    global.js_mark_arr[2,1] = 272;
    global.js_mark_arr[2,2] = 0;
    global.js_mark_arr[2,3] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
");
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
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,464,256,floor_obj);
room_instance_add(argument0,496,256,floor_obj);
room_instance_add(argument0,528,256,floor_obj);
room_instance_add(argument0,560,256,floor_obj);
room_instance_add(argument0,592,240,floor_obj);
room_instance_add(argument0,592,272,floor_obj);
room_instance_add(argument0,624,256,floor_obj);
room_instance_add(argument0,656,272,floor_obj);
room_instance_add(argument0,656,240,floor_obj);
room_instance_add(argument0,688,256,floor_obj);
room_instance_add(argument0,720,256,floor_obj);
// Ceilings
room_instance_add(argument0,464,256,ceil_obj);
room_instance_add(argument0,496,256,ceil_obj);
room_instance_add(argument0,528,256,ceil_obj);
room_instance_add(argument0,560,256,ceil_obj);
room_instance_add(argument0,592,240,ceil_obj);
room_instance_add(argument0,592,272,ceil_obj);
room_instance_add(argument0,624,256,ceil_obj);
room_instance_add(argument0,656,272,ceil_obj);
room_instance_add(argument0,656,240,ceil_obj);
room_instance_add(argument0,688,256,ceil_obj);
room_instance_add(argument0,720,256,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,464,240,wall_hor_obj);
room_instance_add(argument0,464,272,wall_hor_obj);
room_instance_add(argument0,496,272,wall_hor_obj);
room_instance_add(argument0,592,240,wall_hor_obj);
room_instance_add(argument0,656,240,wall_hor_obj);
room_instance_add(argument0,624,240,wall_hor_obj);
room_instance_add(argument0,688,240,wall_hor_obj);
room_instance_add(argument0,720,240,wall_hor_obj);
room_instance_add(argument0,720,272,wall_hor_obj);
room_instance_add(argument0,688,272,wall_hor_obj);
room_instance_add(argument0,656,272,wall_hor_obj);
room_instance_add(argument0,624,272,wall_hor_obj);
room_instance_add(argument0,592,272,wall_hor_obj);
room_instance_add(argument0,560,272,wall_hor_obj);
room_instance_add(argument0,528,272,wall_hor_obj);
room_instance_add(argument0,560,240,wall_hor_obj);
room_instance_add(argument0,528,240,wall_hor_obj);
room_instance_add(argument0,496,240,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,448,256,wall_vert_obj);
room_instance_add(argument0,736,256,wall_vert_obj);
// Jumpscare
room_instance_add(argument0,528,256,multi_js_trig_obj);