/*
Argument 0: Room Variable (same for all rooms)
*/
room_set_code
(
    argument0,
    '
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","argument0","ROOM_manor")+" 1";
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;    // X
    global.spawn_arr[0,1] = 144;    // Y
    global.spawn_arr[0,2] = 0;      // Z
    global.spawn_arr[0,3] = 0;      // Angle (0 is right, 90 is up, etc)
    // Spawn 1 (exit)
    global.spawn_arr[1,0] = 336;
    global.spawn_arr[1,1] = 240;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 90;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    mark_create_scr();
    // Mark 0
    global.mark_arr[0,0] = 240;     // X
    global.mark_arr[0,1] = 144;     // Y
    global.mark_arr[0,2] = 0;       // Z
    // Mark 1
    global.mark_arr[1,0] = 336;
    global.mark_arr[1,1] = 144;
    global.mark_arr[1,2] = 0;
    // Mark 2
    global.mark_arr[2,0] = 336;
    global.mark_arr[2,1] = 176;
    global.mark_arr[2,2] = 0;
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
room_instance_add(argument0,0,0,amb_control_obj);
room_instance_add(argument0,0,0,skybox_control_obj);
room_instance_add(argument0,240,128,rain_window_part_obj);

room_instance_add(argument0,176,288,floor_obj);
room_instance_add(argument0,208,288,floor_obj);
room_instance_add(argument0,176,256,floor_obj);
room_instance_add(argument0,208,256,floor_obj);
room_instance_add(argument0,208,320,floor_obj);
room_instance_add(argument0,176,320,floor_obj);
room_instance_add(argument0,176,352,floor_obj);
room_instance_add(argument0,208,352,floor_obj);
room_instance_add(argument0,208,224,floor_obj);
room_instance_add(argument0,176,224,floor_obj);
room_instance_add(argument0,240,224,floor_obj);
room_instance_add(argument0,272,224,floor_obj);
room_instance_add(argument0,304,224,floor_obj);
room_instance_add(argument0,336,224,floor_obj);
room_instance_add(argument0,368,224,floor_obj);
room_instance_add(argument0,368,256,floor_obj);
room_instance_add(argument0,368,288,floor_obj);
room_instance_add(argument0,368,320,floor_obj);
room_instance_add(argument0,368,352,floor_obj);
room_instance_add(argument0,336,352,floor_obj);
room_instance_add(argument0,304,352,floor_obj);
room_instance_add(argument0,272,352,floor_obj);
room_instance_add(argument0,240,352,floor_obj);
room_instance_add(argument0,240,320,floor_obj);
room_instance_add(argument0,272,320,floor_obj);
room_instance_add(argument0,304,320,floor_obj);
room_instance_add(argument0,336,320,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,304,256,floor_obj);
room_instance_add(argument0,336,256,floor_obj);
room_instance_add(argument0,272,288,floor_obj);
room_instance_add(argument0,240,256,floor_obj);
room_instance_add(argument0,240,288,floor_obj);
room_instance_add(argument0,272,256,floor_obj);
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,400,256,floor_obj);
room_instance_add(argument0,400,288,floor_obj);
room_instance_add(argument0,400,320,floor_obj);

// Walls (Horizontal)
room_instance_add(argument0,176,208,wall_2high_hor_obj);
room_instance_add(argument0,176,368,wall_2high_hor_obj);
room_instance_add(argument0,240,208,wall_2high_hor_obj);
room_instance_add(argument0,304,208,wall_2high_hor_obj);
room_instance_add(argument0,368,208,wall_2high_hor_obj);
room_instance_add(argument0,400,240,wall_2high_hor_obj);
room_instance_add(argument0,400,336,wall_2high_hor_obj);
room_instance_add(argument0,368,368,wall_2high_hor_obj);
room_instance_add(argument0,304,368,wall_2high_hor_obj);
room_instance_add(argument0,240,368,wall_2high_hor_obj);
room_instance_add(argument0,208,208,wall_hor_obj);
room_instance_add(argument0,208,368,wall_hor_obj);
room_instance_add(argument0,272,208,wall_hor_obj);
room_instance_add(argument0,336,208,wall_hor_obj);
room_instance_add(argument0,336,368,wall_hor_obj);
room_instance_add(argument0,272,368,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,224,wall_2high_vert_obj);
room_instance_add(argument0,160,288,wall_2high_vert_obj);
room_instance_add(argument0,160,352,wall_2high_vert_obj);
room_instance_add(argument0,384,224,wall_2high_vert_obj);
room_instance_add(argument0,384,352,wall_2high_vert_obj);
room_instance_add(argument0,416,256,wall_2high_vert_obj);
room_instance_add(argument0,416,320,wall_2high_vert_obj);
room_instance_add(argument0,416,288,wall_2high_vert_obj);
room_instance_add(argument0,160,256,wall_vert_obj);
room_instance_add(argument0,160,320,wall_vert_obj);
room_instance_add(argument0,384,288,wall_vert_obj);
room_instance_add(argument0,384,256,wall_vert_obj);
room_instance_add(argument0,384,320,wall_vert_obj);
// Props
    // Windows
        room_instance_add(argument0,160,256,window_01_high_vert_obj);
        room_instance_add(argument0,160,256,window_02_high_vert_obj);
        room_instance_add(argument0,160,320,window_01_high_vert_obj);
        room_instance_add(argument0,160,320,window_02_high_vert_obj);
        room_instance_add(argument0,208,208,window_01_high_hor_obj);
        room_instance_add(argument0,208,208,window_02_high_hor_obj);
        room_instance_add(argument0,208,368,window_01_high_hor_obj);
        room_instance_add(argument0,208,368,window_02_high_hor_obj);
        room_instance_add(argument0,272,208,window_01_high_hor_obj);
        room_instance_add(argument0,272,208,window_02_high_hor_obj);
        room_instance_add(argument0,336,208,window_01_high_hor_obj);
        room_instance_add(argument0,336,208,window_02_high_hor_obj);
        room_instance_add(argument0,336,368,window_01_high_hor_obj);
        room_instance_add(argument0,336,368,window_02_high_hor_obj);
        room_instance_add(argument0,272,368,window_01_high_hor_obj);
        room_instance_add(argument0,272,368,window_02_high_hor_obj);
    // Torches
        room_instance_add(argument0,176,208,torch_north_obj);
        room_instance_add(argument0,240,208,torch_north_obj);
        room_instance_add(argument0,304,208,torch_north_obj);
        room_instance_add(argument0,368,208,torch_north_obj);
        room_instance_add(argument0,176,368,torch_south_obj);
        room_instance_add(argument0,240,368,torch_south_obj);
        room_instance_add(argument0,304,368,torch_south_obj);
        room_instance_add(argument0,368,368,torch_south_obj);
    // Weird
        // room_instance_add(argument0,384,288,manor_door_frame_obj); // Frame
        // room_instance_add(argument0,160.50,288,door_big_fake_west); // BIG Door
        // room_instance_add(argument0,388,288,spooky_obj_1); // Spooky!
        // room_instance_add(argument0,400,240.50,door_fake_up_N);
        // room_instance_add(argument0,400,335.50,door_fake_up_S);