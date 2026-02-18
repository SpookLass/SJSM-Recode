
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,"
    // Name
    ini_open(global.lang_var);
    global.rm_name_var = ini_read_string('ROOM','thin','ROOM_thin')+' 2';
    ini_close();
    // Spawn 0 (entrance)
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 48;
    global.spawn_arr[0,1] = 44;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 344;
    global.spawn_arr[1,1] = 172;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false);
");
// Room settings
room_set_width(argument0,416);
room_set_height(argument0,224);
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
room_instance_add(argument0,48,48,floor_obj);
room_instance_add(argument0,80,48,floor_obj);
room_instance_add(argument0,112,48,floor_obj);
room_instance_add(argument0,144,48,floor_obj);
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,176,80,floor_obj);
room_instance_add(argument0,176,112,floor_obj);
room_instance_add(argument0,208,112,floor_obj);
room_instance_add(argument0,176,48,floor_obj);
room_instance_add(argument0,208,48,floor_obj);
room_instance_add(argument0,208,80,floor_obj);
room_instance_add(argument0,240,48,floor_obj);
room_instance_add(argument0,272,48,floor_obj);
room_instance_add(argument0,240,80,floor_obj);
room_instance_add(argument0,272,80,floor_obj);
room_instance_add(argument0,304,80,floor_obj);
room_instance_add(argument0,336,80,floor_obj);
room_instance_add(argument0,304,112,floor_obj);
room_instance_add(argument0,336,112,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,336,176,floor_obj);
room_instance_add(argument0,368,176,floor_obj);
// Ceilings
room_instance_add(argument0,48,48,ceil_low_obj);
room_instance_add(argument0,80,48,ceil_low_obj);
room_instance_add(argument0,112,48,ceil_low_obj);
room_instance_add(argument0,144,48,ceil_low_obj);
room_instance_add(argument0,176,144,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,176,80,ceil_low_obj);
room_instance_add(argument0,176,112,ceil_low_obj);
room_instance_add(argument0,208,112,ceil_low_obj);
room_instance_add(argument0,176,48,ceil_low_obj);
room_instance_add(argument0,208,48,ceil_low_obj);
room_instance_add(argument0,208,80,ceil_low_obj);
room_instance_add(argument0,240,48,ceil_low_obj);
room_instance_add(argument0,272,48,ceil_low_obj);
room_instance_add(argument0,240,80,ceil_low_obj);
room_instance_add(argument0,272,80,ceil_low_obj);
room_instance_add(argument0,304,80,ceil_low_obj);
room_instance_add(argument0,336,80,ceil_low_obj);
room_instance_add(argument0,304,112,ceil_low_obj);
room_instance_add(argument0,336,112,ceil_low_obj);
room_instance_add(argument0,304,144,ceil_low_obj);
room_instance_add(argument0,336,144,ceil_low_obj);
room_instance_add(argument0,304,176,ceil_low_obj);
room_instance_add(argument0,336,176,ceil_low_obj);
room_instance_add(argument0,368,176,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,48,32,wall_hor_obj);
room_instance_add(argument0,80,32,wall_hor_obj);
room_instance_add(argument0,112,32,wall_hor_obj);
room_instance_add(argument0,144,32,wall_hor_obj);
room_instance_add(argument0,176,32,wall_hor_obj);
room_instance_add(argument0,48,56,wall_hor_obj);
room_instance_add(argument0,80,56,wall_hor_obj);
room_instance_add(argument0,112,56,wall_hor_obj);
room_instance_add(argument0,144,56,wall_hor_obj);
room_instance_add(argument0,176,152,wall_hor_obj);
room_instance_add(argument0,208,152,wall_hor_obj);
room_instance_add(argument0,208,32,wall_hor_obj);
room_instance_add(argument0,224,56,wall_hor_obj);
room_instance_add(argument0,240,32,wall_hor_obj);
room_instance_add(argument0,256,88,wall_hor_obj);
room_instance_add(argument0,272,32,wall_hor_obj);
room_instance_add(argument0,280,64,wall_hor_obj);
room_instance_add(argument0,288,88,wall_hor_obj);
room_instance_add(argument0,312,64,wall_hor_obj);
room_instance_add(argument0,344,160,wall_hor_obj);
room_instance_add(argument0,320,184,wall_hor_obj);
room_instance_add(argument0,352,184,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,32,48,wall_vert_obj);
room_instance_add(argument0,160,72,wall_vert_obj);
room_instance_add(argument0,160,104,wall_vert_obj);
room_instance_add(argument0,160,136,wall_vert_obj);
room_instance_add(argument0,184,48,wall_vert_obj);
room_instance_add(argument0,184,80,wall_vert_obj);
room_instance_add(argument0,184,112,wall_vert_obj);
room_instance_add(argument0,208,136,wall_vert_obj);
room_instance_add(argument0,208,104,wall_vert_obj);
room_instance_add(argument0,208,72,wall_vert_obj);
room_instance_add(argument0,240,72,wall_vert_obj);
room_instance_add(argument0,264,48,wall_vert_obj);
room_instance_add(argument0,304,104,wall_vert_obj);
room_instance_add(argument0,304,136,wall_vert_obj);
room_instance_add(argument0,304,168,wall_vert_obj);
room_instance_add(argument0,328,56,wall_vert_obj);
room_instance_add(argument0,328,88,wall_vert_obj);
room_instance_add(argument0,328,112,wall_vert_obj);
room_instance_add(argument0,328,144,wall_vert_obj);
room_instance_add(argument0,360,176,wall_vert_obj);