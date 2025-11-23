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
	global.rm_name_var = ini_read_string('ROOM','thin','ROOM_thin')+' 8 '+ini_read_string('ROOM','old','ROOM_old');
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 488;
    global.spawn_arr[1,1] = 176;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 0;
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
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,272,208,floor_obj);
room_instance_add(argument0,304,208,floor_obj);
room_instance_add(argument0,336,208,floor_obj);
room_instance_add(argument0,336,176,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,368,144,floor_obj);
room_instance_add(argument0,368,176,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,400,176,floor_obj);
room_instance_add(argument0,432,176,floor_obj);
room_instance_add(argument0,464,176,floor_obj);
room_instance_add(argument0,496,176,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,240,144,ceil_low_obj);
room_instance_add(argument0,272,144,ceil_low_obj);
room_instance_add(argument0,272,176,ceil_low_obj);
room_instance_add(argument0,272,208,ceil_low_obj);
room_instance_add(argument0,304,208,ceil_low_obj);
room_instance_add(argument0,336,208,ceil_low_obj);
room_instance_add(argument0,336,176,ceil_low_obj);
room_instance_add(argument0,336,144,ceil_low_obj);
room_instance_add(argument0,368,144,ceil_low_obj);
room_instance_add(argument0,368,176,ceil_low_obj);
room_instance_add(argument0,304,144,ceil_low_obj);
room_instance_add(argument0,304,176,ceil_low_obj);
room_instance_add(argument0,400,176,ceil_low_obj);
room_instance_add(argument0,432,176,ceil_low_obj);
room_instance_add(argument0,464,176,ceil_low_obj);
room_instance_add(argument0,496,176,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,136,wall_hor_obj);
room_instance_add(argument0,176,152,wall_hor_obj);
room_instance_add(argument0,208,136,wall_hor_obj);
room_instance_add(argument0,208,152,wall_hor_obj);
room_instance_add(argument0,240,152,wall_hor_obj);
room_instance_add(argument0,240,136,wall_hor_obj);
room_instance_add(argument0,272,136,wall_hor_obj);
room_instance_add(argument0,296,200,wall_hor_obj);
room_instance_add(argument0,272,216,wall_hor_obj);
room_instance_add(argument0,304,216,wall_hor_obj);
room_instance_add(argument0,336,216,wall_hor_obj);
room_instance_add(argument0,328,136,wall_hor_obj);
room_instance_add(argument0,360,136,wall_hor_obj);
room_instance_add(argument0,344,152,wall_hor_obj);
room_instance_add(argument0,376,184,wall_hor_obj);
room_instance_add(argument0,408,184,wall_hor_obj);
room_instance_add(argument0,392,168,wall_hor_obj);
room_instance_add(argument0,424,168,wall_hor_obj);
room_instance_add(argument0,456,168,wall_hor_obj);
room_instance_add(argument0,488,168,wall_hor_obj);
room_instance_add(argument0,440,184,wall_hor_obj);
room_instance_add(argument0,472,184,wall_hor_obj);
room_instance_add(argument0,504,184,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,256,168,wall_vert_obj);
room_instance_add(argument0,280,152,wall_vert_obj);
room_instance_add(argument0,280,184,wall_vert_obj);
room_instance_add(argument0,256,200,wall_vert_obj);
room_instance_add(argument0,312,184,wall_vert_obj);
room_instance_add(argument0,312,152,wall_vert_obj);
room_instance_add(argument0,328,200,wall_vert_obj);
room_instance_add(argument0,328,168,wall_vert_obj);
room_instance_add(argument0,376,152,wall_vert_obj);
room_instance_add(argument0,360,168,wall_vert_obj);
room_instance_add(argument0,504,176,wall_vert_obj);