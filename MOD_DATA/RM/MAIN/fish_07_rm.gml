/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,
    "
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','fish','ROOM_fish')+' 7';
    ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 256;
    global.spawn_arr[0,1] = 256;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 768;
    global.spawn_arr[1,1] = 256;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 339;
    global.mark_arr[0,1] = 353;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 536;
    global.mark_arr[1,1] = 339;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 631;
    global.mark_arr[2,1] = 360;
    global.mark_arr[2,2] = 0;
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
room_instance_add(argument0,0,0,color_control_med_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,256,256,floor_obj);
room_instance_add(argument0,288,256,floor_obj);
room_instance_add(argument0,288,288,floor_obj);
room_instance_add(argument0,288,320,floor_obj);
room_instance_add(argument0,288,352,floor_obj);
room_instance_add(argument0,320,352,floor_obj);
room_instance_add(argument0,352,352,floor_obj);
room_instance_add(argument0,384,352,floor_obj);
room_instance_add(argument0,384,320,floor_obj);
room_instance_add(argument0,416,320,floor_obj);
room_instance_add(argument0,416,352,floor_obj);
room_instance_add(argument0,384,384,floor_obj);
room_instance_add(argument0,416,384,floor_obj);
room_instance_add(argument0,448,384,floor_obj);
room_instance_add(argument0,448,352,floor_obj);
room_instance_add(argument0,448,320,floor_obj);
room_instance_add(argument0,480,320,floor_obj);
room_instance_add(argument0,480,352,floor_obj);
room_instance_add(argument0,480,384,floor_obj);
room_instance_add(argument0,512,384,floor_obj);
room_instance_add(argument0,512,352,floor_obj);
room_instance_add(argument0,512,320,floor_obj);
room_instance_add(argument0,544,320,floor_obj);
room_instance_add(argument0,544,352,floor_obj);
room_instance_add(argument0,544,384,floor_obj);
room_instance_add(argument0,576,384,floor_obj);
room_instance_add(argument0,576,352,floor_obj);
room_instance_add(argument0,576,320,floor_obj);
room_instance_add(argument0,608,320,floor_obj);
room_instance_add(argument0,608,352,floor_obj);
room_instance_add(argument0,608,384,floor_obj);
room_instance_add(argument0,640,384,floor_obj);
room_instance_add(argument0,640,352,floor_obj);
room_instance_add(argument0,640,320,floor_obj);
room_instance_add(argument0,672,352,floor_obj);
room_instance_add(argument0,704,352,floor_obj);
room_instance_add(argument0,736,352,floor_obj);
room_instance_add(argument0,736,320,floor_obj);
room_instance_add(argument0,736,288,floor_obj);
room_instance_add(argument0,736,256,floor_obj);
room_instance_add(argument0,768,256,floor_obj);
// Ceilings
room_instance_add(argument0,256,256,ceil_obj);
room_instance_add(argument0,288,256,ceil_obj);
room_instance_add(argument0,288,288,ceil_obj);
room_instance_add(argument0,288,320,ceil_obj);
room_instance_add(argument0,288,352,ceil_obj);
room_instance_add(argument0,320,352,ceil_obj);
room_instance_add(argument0,352,352,ceil_obj);
room_instance_add(argument0,384,352,ceil_obj);
room_instance_add(argument0,384,320,ceil_obj);
room_instance_add(argument0,416,320,ceil_obj);
room_instance_add(argument0,416,352,ceil_obj);
room_instance_add(argument0,384,384,ceil_obj);
room_instance_add(argument0,416,384,ceil_obj);
room_instance_add(argument0,448,384,ceil_obj);
room_instance_add(argument0,448,352,ceil_obj);
room_instance_add(argument0,448,320,ceil_obj);
room_instance_add(argument0,480,320,ceil_obj);
room_instance_add(argument0,480,352,ceil_obj);
room_instance_add(argument0,480,384,ceil_obj);
room_instance_add(argument0,512,384,ceil_obj);
room_instance_add(argument0,512,352,ceil_obj);
room_instance_add(argument0,512,320,ceil_obj);
room_instance_add(argument0,544,320,ceil_obj);
room_instance_add(argument0,544,352,ceil_obj);
room_instance_add(argument0,544,384,ceil_obj);
room_instance_add(argument0,576,384,ceil_obj);
room_instance_add(argument0,576,352,ceil_obj);
room_instance_add(argument0,576,320,ceil_obj);
room_instance_add(argument0,608,320,ceil_obj);
room_instance_add(argument0,608,352,ceil_obj);
room_instance_add(argument0,608,384,ceil_obj);
room_instance_add(argument0,640,384,ceil_obj);
room_instance_add(argument0,640,352,ceil_obj);
room_instance_add(argument0,640,320,ceil_obj);
room_instance_add(argument0,672,352,ceil_obj);
room_instance_add(argument0,704,352,ceil_obj);
room_instance_add(argument0,736,352,ceil_obj);
room_instance_add(argument0,736,320,ceil_obj);
room_instance_add(argument0,736,288,ceil_obj);
room_instance_add(argument0,736,256,ceil_obj);
room_instance_add(argument0,768,256,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,256,240,wall_hor_obj);
room_instance_add(argument0,288,240,wall_hor_obj);
room_instance_add(argument0,256,272,wall_hor_obj);
room_instance_add(argument0,320,336,wall_hor_obj);
room_instance_add(argument0,352,336,wall_hor_obj);
room_instance_add(argument0,352,368,wall_hor_obj);
room_instance_add(argument0,320,368,wall_hor_obj);
room_instance_add(argument0,288,368,wall_hor_obj);
room_instance_add(argument0,384,304,wall_hor_obj);
room_instance_add(argument0,384,400,wall_hor_obj);
room_instance_add(argument0,672,336,wall_hor_obj);
room_instance_add(argument0,704,336,wall_hor_obj);
room_instance_add(argument0,704,368,wall_hor_obj);
room_instance_add(argument0,672,368,wall_hor_obj);
room_instance_add(argument0,736,368,wall_hor_obj);
room_instance_add(argument0,736,240,wall_hor_obj);
room_instance_add(argument0,768,240,wall_hor_obj);
room_instance_add(argument0,768,272,wall_hor_obj);
room_instance_add(argument0,416,400,wall_hor_obj);
room_instance_add(argument0,448,400,wall_hor_obj);
room_instance_add(argument0,480,400,wall_hor_obj);
room_instance_add(argument0,512,400,wall_hor_obj);
room_instance_add(argument0,544,400,wall_hor_obj);
room_instance_add(argument0,576,400,wall_hor_obj);
room_instance_add(argument0,608,400,wall_hor_obj);
room_instance_add(argument0,640,400,wall_hor_obj);
room_instance_add(argument0,640,304,wall_hor_obj);
room_instance_add(argument0,608,304,wall_hor_obj);
room_instance_add(argument0,576,304,wall_hor_obj);
room_instance_add(argument0,544,304,wall_hor_obj);
room_instance_add(argument0,512,304,wall_hor_obj);
room_instance_add(argument0,480,304,wall_hor_obj);
room_instance_add(argument0,448,304,wall_hor_obj);
room_instance_add(argument0,416,304,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,240,256,wall_vert_obj);
room_instance_add(argument0,272,352,wall_vert_obj);
room_instance_add(argument0,272,320,wall_vert_obj);
room_instance_add(argument0,272,288,wall_vert_obj);
room_instance_add(argument0,304,256,wall_vert_obj);
room_instance_add(argument0,304,288,wall_vert_obj);
room_instance_add(argument0,304,320,wall_vert_obj);
room_instance_add(argument0,368,320,wall_vert_obj);
room_instance_add(argument0,368,384,wall_vert_obj);
room_instance_add(argument0,656,384,wall_vert_obj);
room_instance_add(argument0,656,320,wall_vert_obj);
room_instance_add(argument0,720,320,wall_vert_obj);
room_instance_add(argument0,752,352,wall_vert_obj);
room_instance_add(argument0,752,320,wall_vert_obj);
room_instance_add(argument0,752,288,wall_vert_obj);
room_instance_add(argument0,720,288,wall_vert_obj);
room_instance_add(argument0,720,256,wall_vert_obj);
room_instance_add(argument0,784,256,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,416,320,tank_rand_obj);
room_instance_add(argument0,416,384,tank_rand_obj);
room_instance_add(argument0,480,320,tank_rand_obj);
room_instance_add(argument0,480,384,tank_rand_obj);
room_instance_add(argument0,608,320,tank_rand_obj);
room_instance_add(argument0,608,384,tank_rand_obj);
room_instance_add(argument0,544,384,tank_rand_obj);
room_instance_add(argument0,544,320,tank_rand_obj);
room_instance_add(argument0,512,320,runner_obj);
room_instance_add(argument0,512,352,runner_obj);
room_instance_add(argument0,512,384,runner_obj);
room_instance_add(argument0,448,384,runner_obj);
room_instance_add(argument0,448,352,runner_obj);
room_instance_add(argument0,448,320,runner_obj);
room_instance_add(argument0,576,320,runner_obj);
room_instance_add(argument0,576,352,runner_obj);
room_instance_add(argument0,576,384,runner_obj);
room_instance_add(argument0,640,384,runner_obj);
room_instance_add(argument0,640,352,runner_obj);
room_instance_add(argument0,640,320,runner_obj);
room_instance_add(argument0,384,320,runner_obj);
room_instance_add(argument0,384,352,runner_obj);
room_instance_add(argument0,384,384,runner_obj);