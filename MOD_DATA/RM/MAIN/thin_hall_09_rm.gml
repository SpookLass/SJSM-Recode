
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string("ROOM","thin","ROOM_thin")+" 9";
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 48;
    global.spawn_arr[0,1] = 48;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 392;
    global.spawn_arr[1,1] = 112;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
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
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,112,80,floor_obj);
room_instance_add(argument0,144,80,floor_obj);
room_instance_add(argument0,176,80,floor_obj);
room_instance_add(argument0,48,48,floor_obj);
room_instance_add(argument0,80,48,floor_obj);
room_instance_add(argument0,112,48,floor_obj);
room_instance_add(argument0,144,48,floor_obj);
room_instance_add(argument0,176,48,floor_obj);
room_instance_add(argument0,208,48,floor_obj);
room_instance_add(argument0,240,48,floor_obj);
room_instance_add(argument0,208,80,floor_obj);
room_instance_add(argument0,240,80,floor_obj);
room_instance_add(argument0,208,112,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
room_instance_add(argument0,272,112,floor_obj);
room_instance_add(argument0,304,112,floor_obj);
room_instance_add(argument0,336,112,floor_obj);
room_instance_add(argument0,368,112,floor_obj);
room_instance_add(argument0,400,112,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
// Ceilings
room_instance_add(argument0,112,80,ceil_low_obj);
room_instance_add(argument0,144,80,ceil_low_obj);
room_instance_add(argument0,176,80,ceil_low_obj);
room_instance_add(argument0,48,48,ceil_low_obj);
room_instance_add(argument0,80,48,ceil_low_obj);
room_instance_add(argument0,112,48,ceil_low_obj);
room_instance_add(argument0,144,48,ceil_low_obj);
room_instance_add(argument0,176,48,ceil_low_obj);
room_instance_add(argument0,208,48,ceil_low_obj);
room_instance_add(argument0,240,48,ceil_low_obj);
room_instance_add(argument0,208,80,ceil_low_obj);
room_instance_add(argument0,240,80,ceil_low_obj);
room_instance_add(argument0,208,112,ceil_low_obj);
room_instance_add(argument0,240,112,ceil_low_obj);
room_instance_add(argument0,272,112,ceil_low_obj);
room_instance_add(argument0,304,112,ceil_low_obj);
room_instance_add(argument0,336,112,ceil_low_obj);
room_instance_add(argument0,368,112,ceil_low_obj);
room_instance_add(argument0,400,112,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,240,144,ceil_low_obj);
room_instance_add(argument0,272,144,ceil_low_obj);
room_instance_add(argument0,304,144,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,48,36,wall_hor_obj);
room_instance_add(argument0,80,36,wall_hor_obj);
room_instance_add(argument0,112,36,wall_hor_obj);
room_instance_add(argument0,48,60,wall_hor_obj);
room_instance_add(argument0,80,60,wall_hor_obj);
room_instance_add(argument0,136,68,wall_hor_obj);
room_instance_add(argument0,112,92,wall_hor_obj);
room_instance_add(argument0,144,92,wall_hor_obj);
room_instance_add(argument0,176,92,wall_hor_obj);
room_instance_add(argument0,168,36,wall_hor_obj);
room_instance_add(argument0,200,36,wall_hor_obj);
room_instance_add(argument0,232,36,wall_hor_obj);
room_instance_add(argument0,192,60,wall_hor_obj);
room_instance_add(argument0,248,100,wall_hor_obj);
room_instance_add(argument0,280,100,wall_hor_obj);
room_instance_add(argument0,312,100,wall_hor_obj);
room_instance_add(argument0,344,100,wall_hor_obj);
room_instance_add(argument0,376,100,wall_hor_obj);
room_instance_add(argument0,408,100,wall_hor_obj);
room_instance_add(argument0,224,156,wall_hor_obj);
room_instance_add(argument0,256,156,wall_hor_obj);
room_instance_add(argument0,288,156,wall_hor_obj);
room_instance_add(argument0,320,156,wall_hor_obj);
room_instance_add(argument0,392,124,wall_hor_obj);
room_instance_add(argument0,360,124,wall_hor_obj);
room_instance_add(argument0,328,124,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,120,52,wall_vert_obj);
room_instance_add(argument0,152,52,wall_vert_obj);
room_instance_add(argument0,96,76,wall_vert_obj);
room_instance_add(argument0,176,76,wall_vert_obj);
room_instance_add(argument0,32,48,wall_vert_obj);
room_instance_add(argument0,208,76,wall_vert_obj);
room_instance_add(argument0,208,108,wall_vert_obj);
room_instance_add(argument0,208,140,wall_vert_obj);
room_instance_add(argument0,232,52,wall_vert_obj);
room_instance_add(argument0,232,84,wall_vert_obj);
room_instance_add(argument0,408,112,wall_vert_obj);
room_instance_add(argument0,312,140,wall_vert_obj);