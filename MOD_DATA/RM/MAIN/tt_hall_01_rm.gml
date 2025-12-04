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
	global.rm_name_var = ini_read_string('ROOM','tt','ROOM_tt')+' 1';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 128;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 528;
    global.spawn_arr[1,1] = 128;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 3;
    global.mark_arr[0,0] = 229;
    global.mark_arr[0,1] = 142;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 316;
    global.mark_arr[1,1] = 126;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 415;
    global.mark_arr[2,1] = 136;
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
room_instance_add(argument0,0,0,color_control_bright_obj);
room_instance_add(argument0,0,0,rand_mon_spawn_obj);
room_instance_add(argument0,0,0,amb_control_obj);
// Floors
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,176,112,floor_obj);
room_instance_add(argument0,208,112,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
room_instance_add(argument0,272,112,floor_obj);
room_instance_add(argument0,272,144,floor_obj);
room_instance_add(argument0,304,144,floor_obj);
room_instance_add(argument0,304,112,floor_obj);
room_instance_add(argument0,336,112,floor_obj);
room_instance_add(argument0,336,144,floor_obj);
room_instance_add(argument0,368,112,floor_obj);
room_instance_add(argument0,368,144,floor_obj);
room_instance_add(argument0,400,144,floor_obj);
room_instance_add(argument0,400,112,floor_obj);
room_instance_add(argument0,432,144,floor_obj);
room_instance_add(argument0,432,112,floor_obj);
room_instance_add(argument0,464,112,floor_obj);
room_instance_add(argument0,464,144,floor_obj);
room_instance_add(argument0,496,144,floor_obj);
room_instance_add(argument0,496,112,floor_obj);
room_instance_add(argument0,528,112,floor_obj);
room_instance_add(argument0,528,144,floor_obj);
// Ceilings
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,240,144,ceil_obj);
room_instance_add(argument0,176,112,ceil_obj);
room_instance_add(argument0,208,112,ceil_obj);
room_instance_add(argument0,240,112,ceil_obj);
room_instance_add(argument0,272,112,ceil_obj);
room_instance_add(argument0,272,144,ceil_obj);
room_instance_add(argument0,304,144,ceil_obj);
room_instance_add(argument0,304,112,ceil_obj);
room_instance_add(argument0,336,112,ceil_obj);
room_instance_add(argument0,336,144,ceil_obj);
room_instance_add(argument0,368,112,ceil_obj);
room_instance_add(argument0,368,144,ceil_obj);
room_instance_add(argument0,400,144,ceil_obj);
room_instance_add(argument0,400,112,ceil_obj);
room_instance_add(argument0,432,144,ceil_obj);
room_instance_add(argument0,432,112,ceil_obj);
room_instance_add(argument0,464,112,ceil_obj);
room_instance_add(argument0,464,144,ceil_obj);
room_instance_add(argument0,496,144,ceil_obj);
room_instance_add(argument0,496,112,ceil_obj);
room_instance_add(argument0,528,112,ceil_obj);
room_instance_add(argument0,528,144,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,176,96,wall_tt_hor_obj);
room_instance_add(argument0,208,96,wall_tt_hor_obj);
room_instance_add(argument0,240,96,wall_tt_hor_obj);
room_instance_add(argument0,272,96,wall_tt_hor_obj);
room_instance_add(argument0,304,96,wall_tt_hor_obj);
room_instance_add(argument0,336,96,wall_tt_hor_obj);
room_instance_add(argument0,368,96,wall_tt_hor_obj);
room_instance_add(argument0,400,96,wall_tt_hor_obj);
room_instance_add(argument0,432,96,wall_tt_hor_obj);
room_instance_add(argument0,464,96,wall_tt_hor_obj);
room_instance_add(argument0,496,96,wall_tt_hor_obj);
room_instance_add(argument0,528,96,wall_tt_hor_obj);
room_instance_add(argument0,528,160,wall_tt_hor_obj);
room_instance_add(argument0,496,160,wall_tt_hor_obj);
room_instance_add(argument0,464,160,wall_tt_hor_obj);
room_instance_add(argument0,432,160,wall_tt_hor_obj);
room_instance_add(argument0,400,160,wall_tt_hor_obj);
room_instance_add(argument0,368,160,wall_tt_hor_obj);
room_instance_add(argument0,336,160,wall_tt_hor_obj);
room_instance_add(argument0,304,160,wall_tt_hor_obj);
room_instance_add(argument0,272,160,wall_tt_hor_obj);
room_instance_add(argument0,240,160,wall_tt_hor_obj);
room_instance_add(argument0,208,160,wall_tt_hor_obj);
room_instance_add(argument0,176,160,wall_tt_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,112,wall_tt_vert_obj);
room_instance_add(argument0,160,144,wall_tt_vert_obj);
room_instance_add(argument0,544,112,wall_tt_vert_obj);
room_instance_add(argument0,544,144,wall_tt_vert_obj);
// Torches
// Props