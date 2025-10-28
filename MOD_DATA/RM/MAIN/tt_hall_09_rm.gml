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
	global.rm_name_var = ini_read_string('ROOM','tt','ROOM_tt')+' 9';
	ini_close();
    global.spawn_len_var = 2;
    // Spawn 0 (entrance)
    global.spawn_arr[0,0] = 176;
    global.spawn_arr[0,1] = 112;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 560;
    global.spawn_arr[1,1] = 192;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 239;
    global.mark_arr[0,1] = 113;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 322;
    global.mark_arr[1,1] = 114;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 347;
    global.mark_arr[2,1] = 184;
    global.mark_arr[2,2] = 0;
    global.mark_arr[3,0] = 396;
    global.mark_arr[3,1] = 195;
    global.mark_arr[3,2] = 0;
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
// Floors
room_instance_add(argument0,176,128,floor_obj);
room_instance_add(argument0,208,128,floor_obj);
room_instance_add(argument0,240,128,floor_obj);
room_instance_add(argument0,176,96,floor_obj);
room_instance_add(argument0,208,96,floor_obj);
room_instance_add(argument0,240,96,floor_obj);
room_instance_add(argument0,272,96,floor_obj);
room_instance_add(argument0,272,128,floor_obj);
room_instance_add(argument0,304,128,floor_obj);
room_instance_add(argument0,304,96,floor_obj);
room_instance_add(argument0,336,96,floor_obj);
room_instance_add(argument0,336,128,floor_obj);
room_instance_add(argument0,368,128,floor_obj);
room_instance_add(argument0,368,96,floor_obj);
room_instance_add(argument0,368,160,floor_obj);
room_instance_add(argument0,336,160,floor_obj);
room_instance_add(argument0,336,192,floor_obj);
room_instance_add(argument0,368,192,floor_obj);
room_instance_add(argument0,368,224,floor_obj);
room_instance_add(argument0,336,224,floor_obj);
room_instance_add(argument0,400,192,floor_obj);
room_instance_add(argument0,432,192,floor_obj);
room_instance_add(argument0,464,192,floor_obj);
room_instance_add(argument0,496,192,floor_obj);
room_instance_add(argument0,528,192,floor_obj);
room_instance_add(argument0,304,224,floor_obj);
room_instance_add(argument0,304,160,floor_obj);
room_instance_add(argument0,304,192,floor_obj);
room_instance_add(argument0,560,192,floor_obj);
// Ceilings
room_instance_add(argument0,176,128,ceil_obj);
room_instance_add(argument0,208,128,ceil_obj);
room_instance_add(argument0,240,128,ceil_obj);
room_instance_add(argument0,176,96,ceil_obj);
room_instance_add(argument0,208,96,ceil_obj);
room_instance_add(argument0,240,96,ceil_obj);
room_instance_add(argument0,272,96,ceil_obj);
room_instance_add(argument0,272,128,ceil_obj);
room_instance_add(argument0,304,128,ceil_obj);
room_instance_add(argument0,304,96,ceil_obj);
room_instance_add(argument0,336,96,ceil_obj);
room_instance_add(argument0,336,128,ceil_obj);
room_instance_add(argument0,368,128,ceil_obj);
room_instance_add(argument0,368,96,ceil_obj);
room_instance_add(argument0,368,160,ceil_obj);
room_instance_add(argument0,336,160,ceil_obj);
room_instance_add(argument0,336,192,ceil_obj);
room_instance_add(argument0,368,192,ceil_obj);
room_instance_add(argument0,368,224,ceil_obj);
room_instance_add(argument0,336,224,ceil_obj);
room_instance_add(argument0,400,192,ceil_obj);
room_instance_add(argument0,432,192,ceil_obj);
room_instance_add(argument0,464,192,ceil_obj);
room_instance_add(argument0,496,192,ceil_obj);
room_instance_add(argument0,528,192,ceil_obj);
room_instance_add(argument0,304,224,ceil_obj);
room_instance_add(argument0,304,160,ceil_obj);
room_instance_add(argument0,304,192,ceil_obj);
room_instance_add(argument0,560,192,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,400,176,wall_hor_obj);
room_instance_add(argument0,400,208,wall_hor_obj);
room_instance_add(argument0,432,176,wall_hor_obj);
room_instance_add(argument0,432,208,wall_hor_obj);
room_instance_add(argument0,464,176,wall_hor_obj);
room_instance_add(argument0,464,208,wall_hor_obj);
room_instance_add(argument0,496,208,wall_hor_obj);
room_instance_add(argument0,496,176,wall_hor_obj);
room_instance_add(argument0,528,176,wall_hor_obj);
room_instance_add(argument0,528,208,wall_hor_obj);
room_instance_add(argument0,560,176,wall_hor_obj);
room_instance_add(argument0,560,208,wall_hor_obj);
room_instance_add(argument0,176,80,wall_tt_hor_obj);
room_instance_add(argument0,272,144,wall_tt_hor_obj);
room_instance_add(argument0,240,144,wall_tt_hor_obj);
room_instance_add(argument0,208,144,wall_tt_hor_obj);
room_instance_add(argument0,176,144,wall_tt_hor_obj);
room_instance_add(argument0,304,240,wall_tt_hor_obj);
room_instance_add(argument0,336,240,wall_tt_hor_obj);
room_instance_add(argument0,368,240,wall_tt_hor_obj);
room_instance_add(argument0,368,80,wall_tt_hor_obj);
room_instance_add(argument0,336,80,wall_tt_hor_obj);
room_instance_add(argument0,304,80,wall_tt_hor_obj);
room_instance_add(argument0,272,80,wall_tt_hor_obj);
room_instance_add(argument0,240,80,wall_tt_hor_obj);
room_instance_add(argument0,208,80,wall_tt_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,576,192,wall_vert_obj);
room_instance_add(argument0,288,160,wall_tt_vert_obj);
room_instance_add(argument0,288,192,wall_tt_vert_obj);
room_instance_add(argument0,288,224,wall_tt_vert_obj);
room_instance_add(argument0,384,224,wall_tt_vert_obj);
room_instance_add(argument0,384,160,wall_tt_vert_obj);
room_instance_add(argument0,384,128,wall_tt_vert_obj);
room_instance_add(argument0,384,96,wall_tt_vert_obj);
room_instance_add(argument0,160,96,wall_tt_vert_obj);
room_instance_add(argument0,160,128,wall_tt_vert_obj);
// Jumpscare
room_instance_add(argument0,480,208,js_obj);