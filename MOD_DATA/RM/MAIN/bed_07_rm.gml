/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    global.rm_name_var = 'Bedroom 7'
    // Spawn
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 192;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 320;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Mark
    global.mark_len_var = 0;
    /*global.mark_arr[0,0] = 211;
    global.mark_arr[0,1] = 290;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 242;
    global.mark_arr[1,1] = 327;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 279;
    global.mark_arr[2,1] = 290;
    global.mark_arr[2,2] = 0;*/
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,skybox_control_obj);
room_instance_add(argument0,256,480,rain_window_part_obj);
// Floors
room_instance_add(argument0,192,272,floor_obj);
room_instance_add(argument0,224,272,floor_obj);
room_instance_add(argument0,256,272,floor_obj);
room_instance_add(argument0,192,304,floor_obj);
room_instance_add(argument0,224,304,floor_obj);
room_instance_add(argument0,256,304,floor_obj);
room_instance_add(argument0,288,272,floor_obj);
room_instance_add(argument0,288,304,floor_obj);
room_instance_add(argument0,288,336,floor_obj);
room_instance_add(argument0,256,336,floor_obj);
room_instance_add(argument0,224,336,floor_obj);
room_instance_add(argument0,192,336,floor_obj);
room_instance_add(argument0,192,240,floor_obj);
room_instance_add(argument0,288,240,floor_obj);
room_instance_add(argument0,256,240,floor_obj);
room_instance_add(argument0,224,240,floor_obj);
room_instance_add(argument0,320,336,floor_obj);
room_instance_add(argument0,320,304,floor_obj);
room_instance_add(argument0,320,272,floor_obj);
room_instance_add(argument0,320,240,floor_obj);
//Ceilings
room_instance_add(argument0,192,272,ceil_2high_obj);
room_instance_add(argument0,224,272,ceil_2high_obj);
room_instance_add(argument0,256,272,ceil_2high_obj);
room_instance_add(argument0,192,304,ceil_2high_obj);
room_instance_add(argument0,224,304,ceil_2high_obj);
room_instance_add(argument0,256,304,ceil_2high_obj);
room_instance_add(argument0,288,272,ceil_2high_obj);
room_instance_add(argument0,288,304,ceil_2high_obj);
room_instance_add(argument0,288,336,ceil_2high_obj);
room_instance_add(argument0,256,336,ceil_2high_obj);
room_instance_add(argument0,224,336,ceil_2high_obj);
room_instance_add(argument0,192,336,ceil_2high_obj);
room_instance_add(argument0,192,240,ceil_2high_obj);
room_instance_add(argument0,288,240,ceil_2high_obj);
room_instance_add(argument0,256,240,ceil_2high_obj);
room_instance_add(argument0,224,240,ceil_2high_obj);
room_instance_add(argument0,320,336,ceil_2high_obj);
room_instance_add(argument0,320,304,ceil_2high_obj);
room_instance_add(argument0,320,272,ceil_2high_obj);
room_instance_add(argument0,320,240,ceil_2high_obj);
// Walls (Horizontal)
room_instance_add(argument0,224,352,wall_hor_obj);
room_instance_add(argument0,288,352,wall_hor_obj);
room_instance_add(argument0,192,352,wall_2high_hor_obj);
room_instance_add(argument0,320,352,wall_2high_hor_obj);
room_instance_add(argument0,256,352,wall_2high_hor_obj);
room_instance_add(argument0,320,224,wall_2high_hor_obj);
room_instance_add(argument0,288,224,wall_2high_hor_obj);
room_instance_add(argument0,256,224,wall_2high_hor_obj);
room_instance_add(argument0,224,224,wall_2high_hor_obj);
room_instance_add(argument0,192,224,wall_2high_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,176,272,wall_2high_vert_obj);
room_instance_add(argument0,176,304,wall_2high_vert_obj);
room_instance_add(argument0,176,336,wall_2high_vert_obj);
room_instance_add(argument0,336,336,wall_2high_vert_obj);
room_instance_add(argument0,336,304,wall_2high_vert_obj);
room_instance_add(argument0,336,272,wall_2high_vert_obj);
room_instance_add(argument0,176,240,wall_2high_vert_obj);
room_instance_add(argument0,336,240,wall_2high_vert_obj);
// Props
room_instance_add(argument0,192,256,bed_rand_obj);
room_instance_add(argument0,288,232,drawer_rand_obj);
room_instance_add(argument0,320,232,table_rand_obj);
room_instance_add(argument0,256,304,rug_rand_rot_obj);
room_instance_add(argument0,224,352,window_01_high_hor_obj);
room_instance_add(argument0,288,352,window_01_high_hor_obj);
room_instance_add(argument0,224,352,window_02_high_hor_obj);
room_instance_add(argument0,288,352,window_02_high_hor_obj);