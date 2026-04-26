/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,'
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","flesh","ROOM_flesh")+" 4";
    ini_close();
    // Spawn
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 432;
    global.spawn_arr[0,1] = 352;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 720;
    global.spawn_arr[1,1] = 256;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 720; // New
    global.spawn_arr[2,1] = 352;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 180;
    global.spawn_arr[3,0] = 720;
    global.spawn_arr[3,1] = 448;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 180;
    // Doors
    local.lock = lock_scr();
    local.gold = gold_scr(local.lock); // Not sure how to handle this without hardcoding
    spawn_create_scr(true,local.lock);
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,464,352,floor_obj);
room_instance_add(argument0,496,352,floor_obj);
room_instance_add(argument0,560,352,floor_obj);
room_instance_add(argument0,592,352,floor_obj);
room_instance_add(argument0,624,352,floor_obj);
room_instance_add(argument0,528,352,floor_obj);
room_instance_add(argument0,528,320,floor_obj);
room_instance_add(argument0,528,288,floor_obj);
room_instance_add(argument0,560,288,floor_obj);
room_instance_add(argument0,592,288,floor_obj);
room_instance_add(argument0,592,256,floor_obj);
room_instance_add(argument0,624,256,floor_obj);
room_instance_add(argument0,656,256,floor_obj);
room_instance_add(argument0,528,384,floor_obj);
room_instance_add(argument0,528,416,floor_obj);
room_instance_add(argument0,560,416,floor_obj);
room_instance_add(argument0,592,416,floor_obj);
room_instance_add(argument0,656,352,floor_obj);
room_instance_add(argument0,656,320,floor_obj);
room_instance_add(argument0,656,288,floor_obj);
room_instance_add(argument0,688,256,floor_obj);
room_instance_add(argument0,688,352,floor_obj);
room_instance_add(argument0,720,256,floor_obj);
room_instance_add(argument0,432,352,floor_obj); // New
room_instance_add(argument0,720,352,floor_obj);
room_instance_add(argument0,592,448,floor_obj);
room_instance_add(argument0,624,448,floor_obj);
room_instance_add(argument0,656,384,floor_obj);
room_instance_add(argument0,656,416,floor_obj);
room_instance_add(argument0,656,448,floor_obj);
room_instance_add(argument0,688,448,floor_obj);
room_instance_add(argument0,720,448,floor_obj);
// Ceilings
room_instance_add(argument0,464,352,ceil_obj);
room_instance_add(argument0,496,352,ceil_obj);
room_instance_add(argument0,560,352,ceil_obj);
room_instance_add(argument0,592,352,ceil_obj);
room_instance_add(argument0,624,352,ceil_obj);
room_instance_add(argument0,528,352,ceil_obj);
room_instance_add(argument0,528,320,ceil_obj);
room_instance_add(argument0,528,288,ceil_obj);
room_instance_add(argument0,560,288,ceil_obj);
room_instance_add(argument0,592,288,ceil_obj);
room_instance_add(argument0,592,256,ceil_obj);
room_instance_add(argument0,624,256,ceil_obj);
room_instance_add(argument0,656,256,ceil_obj);
room_instance_add(argument0,528,384,ceil_obj);
room_instance_add(argument0,528,416,ceil_obj);
room_instance_add(argument0,560,416,ceil_obj);
room_instance_add(argument0,592,416,ceil_obj);
room_instance_add(argument0,656,352,ceil_obj);
room_instance_add(argument0,656,320,ceil_obj);
room_instance_add(argument0,656,288,ceil_obj);
room_instance_add(argument0,688,256,ceil_obj);
room_instance_add(argument0,688,352,ceil_obj);
room_instance_add(argument0,720,256,ceil_obj);
room_instance_add(argument0,432,352,ceil_obj); // New
room_instance_add(argument0,720,352,ceil_obj);
room_instance_add(argument0,592,448,ceil_obj);
room_instance_add(argument0,624,448,ceil_obj);
room_instance_add(argument0,656,384,ceil_obj);
room_instance_add(argument0,656,416,ceil_obj);
room_instance_add(argument0,656,448,ceil_obj);
room_instance_add(argument0,688,448,ceil_obj);
room_instance_add(argument0,720,448,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,464,368,wall_hor_obj);
room_instance_add(argument0,464,336,wall_hor_obj);
room_instance_add(argument0,496,336,wall_hor_obj);
room_instance_add(argument0,592,336,wall_hor_obj);
room_instance_add(argument0,560,336,wall_hor_obj);
room_instance_add(argument0,496,368,wall_hor_obj);
room_instance_add(argument0,560,368,wall_hor_obj);
room_instance_add(argument0,592,368,wall_hor_obj);
room_instance_add(argument0,624,368,wall_hor_obj);
room_instance_add(argument0,528,432,wall_hor_obj);
room_instance_add(argument0,592,400,wall_hor_obj);
room_instance_add(argument0,560,400,wall_hor_obj);
room_instance_add(argument0,592,304,wall_hor_obj);
room_instance_add(argument0,560,304,wall_hor_obj);
room_instance_add(argument0,528,272,wall_hor_obj);
room_instance_add(argument0,592,240,wall_hor_obj);
room_instance_add(argument0,624,240,wall_hor_obj);
room_instance_add(argument0,656,240,wall_hor_obj);
room_instance_add(argument0,720,240,wall_hor_obj);
room_instance_add(argument0,720,272,wall_hor_obj);
room_instance_add(argument0,688,272,wall_hor_obj);
room_instance_add(argument0,688,336,wall_hor_obj);
room_instance_add(argument0,624,272,wall_hor_obj);
room_instance_add(argument0,432,368,wall_hor_obj); // New
room_instance_add(argument0,432,336,wall_hor_obj);
room_instance_add(argument0,720,368,wall_hor_obj);
room_instance_add(argument0,720,336,wall_hor_obj);
room_instance_add(argument0,592,464,wall_hor_obj);
room_instance_add(argument0,624,432,wall_hor_obj);
room_instance_add(argument0,624,464,wall_hor_obj);
room_instance_add(argument0,656,464,wall_hor_obj);
room_instance_add(argument0,688,432,wall_hor_obj);
room_instance_add(argument0,688,464,wall_hor_obj);
room_instance_add(argument0,720,432,wall_hor_obj);
room_instance_add(argument0,720,464,wall_hor_obj);
// room_instance_add(argument0,656,368,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,736,256,wall_vert_obj);
room_instance_add(argument0,608,416,wall_vert_obj);
room_instance_add(argument0,512,416,wall_vert_obj);
room_instance_add(argument0,512,384,wall_vert_obj);
room_instance_add(argument0,672,320,wall_vert_obj);
room_instance_add(argument0,672,288,wall_vert_obj);
room_instance_add(argument0,640,320,wall_vert_obj);
room_instance_add(argument0,512,288,wall_vert_obj);
room_instance_add(argument0,544,320,wall_vert_obj);
room_instance_add(argument0,512,320,wall_vert_obj);
room_instance_add(argument0,576,256,wall_vert_obj);
room_instance_add(argument0,416,352,wall_vert_obj); // New
room_instance_add(argument0,736,352,wall_vert_obj);
room_instance_add(argument0,736,448,wall_vert_obj);
room_instance_add(argument0,576,448,wall_vert_obj);
room_instance_add(argument0,640,384,wall_vert_obj);
room_instance_add(argument0,640,416,wall_vert_obj);
room_instance_add(argument0,672,384,wall_vert_obj);
room_instance_add(argument0,672,416,wall_vert_obj);
// Walls Mon (Horizontal)
room_instance_add(argument0,688,240,wall_mon_hor_obj);
room_instance_add(argument0,624,336,wall_mon_hor_obj);
room_instance_add(argument0,560,432,wall_mon_hor_obj);
room_instance_add(argument0,560,272,wall_mon_hor_obj);
room_instance_add(argument0,688,368,wall_mon_hor_obj);
// Walls Mon (Vertical)
room_instance_add(argument0,608,288,wall_mon_vert_obj);
room_instance_add(argument0,640,288,wall_mon_vert_obj);
room_instance_add(argument0,544,384,wall_mon_vert_obj);
// Props
room_instance_add(argument0,528,352,flesh_arrow_obj);