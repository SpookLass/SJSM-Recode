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
	global.rm_name_var = ini_read_string('ROOM','thin','ROOM_thin')+' 7 '+ini_read_string('ROOM','old','ROOM_old');
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 144;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 272;
    global.spawn_arr[1,1] = 376;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 0;
    global.mark_arr[0,0] = 248;
    global.mark_arr[0,1] = 222;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 225;
    global.mark_arr[1,1] = 289;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 256;
    global.mark_arr[2,1] = 317;
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
room_instance_add(argument0,0,0,color_control_02_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,240,208,floor_obj);
room_instance_add(argument0,208,208,floor_obj);
room_instance_add(argument0,208,240,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
room_instance_add(argument0,272,240,floor_obj);
room_instance_add(argument0,272,208,floor_obj);
room_instance_add(argument0,272,272,floor_obj);
room_instance_add(argument0,240,272,floor_obj);
room_instance_add(argument0,208,272,floor_obj);
room_instance_add(argument0,208,304,floor_obj);
room_instance_add(argument0,240,304,floor_obj);
room_instance_add(argument0,272,304,floor_obj);
room_instance_add(argument0,272,336,floor_obj);
room_instance_add(argument0,240,336,floor_obj);
room_instance_add(argument0,208,336,floor_obj);
room_instance_add(argument0,208,368,floor_obj);
room_instance_add(argument0,240,368,floor_obj);
room_instance_add(argument0,272,368,floor_obj);
room_instance_add(argument0,272,400,floor_obj);
room_instance_add(argument0,240,400,floor_obj);
room_instance_add(argument0,208,400,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_low_obj);
room_instance_add(argument0,208,144,ceil_low_obj);
room_instance_add(argument0,240,144,ceil_low_obj);
room_instance_add(argument0,240,176,ceil_low_obj);
room_instance_add(argument0,240,208,ceil_low_obj);
room_instance_add(argument0,208,208,ceil_low_obj);
room_instance_add(argument0,208,240,ceil_low_obj);
room_instance_add(argument0,240,240,ceil_low_obj);
room_instance_add(argument0,272,240,ceil_low_obj);
room_instance_add(argument0,272,208,ceil_low_obj);
room_instance_add(argument0,272,272,ceil_low_obj);
room_instance_add(argument0,240,272,ceil_low_obj);
room_instance_add(argument0,208,272,ceil_low_obj);
room_instance_add(argument0,208,304,ceil_low_obj);
room_instance_add(argument0,240,304,ceil_low_obj);
room_instance_add(argument0,272,304,ceil_low_obj);
room_instance_add(argument0,272,336,ceil_low_obj);
room_instance_add(argument0,240,336,ceil_low_obj);
room_instance_add(argument0,208,336,ceil_low_obj);
room_instance_add(argument0,208,368,ceil_low_obj);
room_instance_add(argument0,240,368,ceil_low_obj);
room_instance_add(argument0,272,368,ceil_low_obj);
room_instance_add(argument0,272,400,ceil_low_obj);
room_instance_add(argument0,240,400,ceil_low_obj);
room_instance_add(argument0,208,400,ceil_low_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,136,wall_hor_obj);
room_instance_add(argument0,208,136,wall_hor_obj);
room_instance_add(argument0,240,136,wall_hor_obj);
room_instance_add(argument0,176,152,wall_hor_obj);
room_instance_add(argument0,208,152,wall_hor_obj);
room_instance_add(argument0,272,200,wall_hor_obj);
room_instance_add(argument0,208,216,wall_hor_obj);
room_instance_add(argument0,208,408,wall_hor_obj);
room_instance_add(argument0,240,408,wall_hor_obj);
room_instance_add(argument0,272,408,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,256,152,wall_vert_obj);
room_instance_add(argument0,256,184,wall_vert_obj);
room_instance_add(argument0,224,168,wall_vert_obj);
room_instance_add(argument0,224,200,wall_vert_obj);
room_instance_add(argument0,288,216,wall_vert_obj);
room_instance_add(argument0,288,248,wall_vert_obj);
room_instance_add(argument0,288,280,wall_vert_obj);
room_instance_add(argument0,192,232,wall_vert_obj);
room_instance_add(argument0,192,264,wall_vert_obj);
room_instance_add(argument0,192,296,wall_vert_obj);
room_instance_add(argument0,192,328,wall_vert_obj);
room_instance_add(argument0,192,360,wall_vert_obj);
room_instance_add(argument0,192,392,wall_vert_obj);
room_instance_add(argument0,288,312,wall_vert_obj);
room_instance_add(argument0,288,344,wall_vert_obj);
room_instance_add(argument0,288,376,wall_vert_obj);
room_instance_add(argument0,288,408,wall_vert_obj);
// Props
room_instance_add(argument0,208,232,chair_rand_obj);
room_instance_add(argument0,211,257,chair_rand_obj);