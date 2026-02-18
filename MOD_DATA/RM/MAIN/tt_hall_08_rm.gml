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
	global.rm_name_var = ini_read_string('ROOM','tt','ROOM_tt')+' 8';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 128;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 176;
    global.spawn_arr[1,1] = 256;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 0;
    // Marks (Slime spawners)
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 251;
    global.mark_arr[0,1] = 263;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 297;
    global.mark_arr[1,1] = 239;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 297;
    global.mark_arr[2,1] = 101;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 308;
    global.mark_arr[3,1] = 142;
    global.mark_arr[3,2] = 0;
    mark_create_scr();
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
room_instance_add(argument0,176,128,floor_obj);
room_instance_add(argument0,208,128,floor_obj);
room_instance_add(argument0,240,128,floor_obj);
room_instance_add(argument0,272,128,floor_obj);
room_instance_add(argument0,272,96,floor_obj);
room_instance_add(argument0,304,96,floor_obj);
room_instance_add(argument0,304,128,floor_obj);
room_instance_add(argument0,272,160,floor_obj);
room_instance_add(argument0,304,160,floor_obj);
room_instance_add(argument0,336,160,floor_obj);
room_instance_add(argument0,336,128,floor_obj);
room_instance_add(argument0,336,96,floor_obj);
room_instance_add(argument0,304,192,floor_obj);
room_instance_add(argument0,304,224,floor_obj);
room_instance_add(argument0,272,224,floor_obj);
room_instance_add(argument0,336,224,floor_obj);
room_instance_add(argument0,336,256,floor_obj);
room_instance_add(argument0,304,256,floor_obj);
room_instance_add(argument0,272,256,floor_obj);
room_instance_add(argument0,272,288,floor_obj);
room_instance_add(argument0,304,288,floor_obj);
room_instance_add(argument0,336,288,floor_obj);
room_instance_add(argument0,240,256,floor_obj);
room_instance_add(argument0,208,256,floor_obj);
room_instance_add(argument0,176,256,floor_obj);
// Ceilings
room_instance_add(argument0,176,128,ceil_obj);
room_instance_add(argument0,208,128,ceil_obj);
room_instance_add(argument0,240,128,ceil_obj);
room_instance_add(argument0,272,128,ceil_obj);
room_instance_add(argument0,272,96,ceil_obj);
room_instance_add(argument0,304,96,ceil_obj);
room_instance_add(argument0,304,128,ceil_obj);
room_instance_add(argument0,272,160,ceil_obj);
room_instance_add(argument0,304,160,ceil_obj);
room_instance_add(argument0,336,160,ceil_obj);
room_instance_add(argument0,336,128,ceil_obj);
room_instance_add(argument0,336,96,ceil_obj);
room_instance_add(argument0,304,192,ceil_obj);
room_instance_add(argument0,304,224,ceil_obj);
room_instance_add(argument0,272,224,ceil_obj);
room_instance_add(argument0,336,224,ceil_obj);
room_instance_add(argument0,336,256,ceil_obj);
room_instance_add(argument0,304,256,ceil_obj);
room_instance_add(argument0,272,256,ceil_obj);
room_instance_add(argument0,272,288,ceil_obj);
room_instance_add(argument0,304,288,ceil_obj);
room_instance_add(argument0,336,288,ceil_obj);
room_instance_add(argument0,240,256,ceil_obj);
room_instance_add(argument0,208,256,ceil_obj);
room_instance_add(argument0,176,256,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,240,144,wall_hor_obj);
room_instance_add(argument0,240,112,wall_hor_obj);
room_instance_add(argument0,208,112,wall_hor_obj);
room_instance_add(argument0,176,112,wall_hor_obj);
room_instance_add(argument0,176,144,wall_hor_obj);
room_instance_add(argument0,208,144,wall_hor_obj);
room_instance_add(argument0,240,240,wall_hor_obj);
room_instance_add(argument0,208,240,wall_hor_obj);
room_instance_add(argument0,176,240,wall_hor_obj);
room_instance_add(argument0,176,272,wall_hor_obj);
room_instance_add(argument0,208,272,wall_hor_obj);
room_instance_add(argument0,240,272,wall_hor_obj);
room_instance_add(argument0,272,176,wall_tt_hor_obj);
room_instance_add(argument0,336,176,wall_tt_hor_obj);
room_instance_add(argument0,336,208,wall_tt_hor_obj);
room_instance_add(argument0,272,208,wall_tt_hor_obj);
room_instance_add(argument0,272,304,wall_tt_hor_obj);
room_instance_add(argument0,304,304,wall_tt_hor_obj);
room_instance_add(argument0,336,304,wall_tt_hor_obj);
room_instance_add(argument0,336,80,wall_tt_hor_obj);
room_instance_add(argument0,304,80,wall_tt_hor_obj);
room_instance_add(argument0,272,80,wall_tt_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,160,128,wall_vert_obj);
room_instance_add(argument0,288,192,wall_vert_obj);
room_instance_add(argument0,320,192,wall_vert_obj);
room_instance_add(argument0,160,256,wall_vert_obj);
room_instance_add(argument0,256,160,wall_tt_vert_obj);
room_instance_add(argument0,256,96,wall_tt_vert_obj);
room_instance_add(argument0,352,96,wall_tt_vert_obj);
room_instance_add(argument0,352,128,wall_tt_vert_obj);
room_instance_add(argument0,352,160,wall_tt_vert_obj);
room_instance_add(argument0,352,224,wall_tt_vert_obj);
room_instance_add(argument0,352,256,wall_tt_vert_obj);
room_instance_add(argument0,352,288,wall_tt_vert_obj);
room_instance_add(argument0,256,288,wall_tt_vert_obj);
room_instance_add(argument0,256,224,wall_tt_vert_obj);
// Torches
// Props