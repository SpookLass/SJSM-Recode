/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open("lang_"+global.lang_var+".ini");
	global.rm_name_var = ini_read_string("ROOM","dead","ROOM_dead");
	ini_close();
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors (lazy)
    with instance_create(112,160,sg_dead_door_obj) { direction = 270; }
    with instance_create(208,160,sg_dead_door_obj) { direction = 270; }
    with instance_create(304,160,sg_dead_door_obj) { direction = 270; }
    with instance_create(112,224,sg_dead_door_obj) { direction = 90; }
    with instance_create(208,224,sg_dead_door_obj) { direction = 90; }
    with instance_create(304,224,sg_dead_door_obj) { direction = 90; }
    with instance_create(384,112,sg_dead_door_obj) { direction = 0; }
    with instance_create(448,112,sg_dead_door_obj) { direction = 180; }
    // Big Doors
    with instance_create(32,192,sg_dead_door_wide_obj) { direction = 0; }
    with instance_create(416,32,sg_dead_door_wide_obj) { direction = 270; }
    // Focus Door
    with instance_create(448,192,sg_dead_door_obj) { direction = 180; }
');
// Room settings
room_set_width(argument0,1280);
room_set_height(argument0,720);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Floors
room_instance_add(argument0,48,176,spawn_floor_obj);
room_instance_add(argument0,48,208,spawn_floor_obj);
room_instance_add(argument0,80,176,spawn_floor_obj);
room_instance_add(argument0,80,208,spawn_floor_obj);
room_instance_add(argument0,112,176,spawn_floor_obj);
room_instance_add(argument0,112,208,spawn_floor_obj);
room_instance_add(argument0,144,176,spawn_floor_obj);
room_instance_add(argument0,144,208,spawn_floor_obj);
room_instance_add(argument0,176,176,spawn_floor_obj);
room_instance_add(argument0,176,208,spawn_floor_obj);
room_instance_add(argument0,208,176,spawn_floor_obj);
room_instance_add(argument0,208,208,spawn_floor_obj);
room_instance_add(argument0,240,176,spawn_floor_obj);
room_instance_add(argument0,240,208,spawn_floor_obj);
room_instance_add(argument0,272,176,spawn_floor_obj);
room_instance_add(argument0,272,208,spawn_floor_obj);
room_instance_add(argument0,304,176,spawn_floor_obj);
room_instance_add(argument0,304,208,spawn_floor_obj);
room_instance_add(argument0,336,176,spawn_floor_obj);
room_instance_add(argument0,336,208,spawn_floor_obj);
room_instance_add(argument0,368,176,spawn_floor_obj);
room_instance_add(argument0,368,208,spawn_floor_obj);
room_instance_add(argument0,400,48,spawn_floor_obj);
room_instance_add(argument0,400,80,spawn_floor_obj);
room_instance_add(argument0,400,112,spawn_floor_obj);
room_instance_add(argument0,400,144,spawn_floor_obj);
room_instance_add(argument0,400,176,spawn_floor_obj);
room_instance_add(argument0,400,208,spawn_floor_obj);
room_instance_add(argument0,432,48,spawn_floor_obj);
room_instance_add(argument0,432,80,spawn_floor_obj);
room_instance_add(argument0,432,112,spawn_floor_obj);
room_instance_add(argument0,432,144,spawn_floor_obj);
room_instance_add(argument0,432,176,spawn_floor_obj);
room_instance_add(argument0,432,208,spawn_floor_obj);
// Ceilings
room_instance_add(argument0,48,176,spawn_ceil_obj);
room_instance_add(argument0,48,208,spawn_ceil_obj);
room_instance_add(argument0,80,176,spawn_ceil_obj);
room_instance_add(argument0,80,208,spawn_ceil_obj);
room_instance_add(argument0,112,176,spawn_ceil_obj);
room_instance_add(argument0,112,208,spawn_ceil_obj);
room_instance_add(argument0,144,176,spawn_ceil_obj);
room_instance_add(argument0,144,208,spawn_ceil_obj);
room_instance_add(argument0,176,176,spawn_ceil_obj);
room_instance_add(argument0,176,208,spawn_ceil_obj);
room_instance_add(argument0,208,176,spawn_ceil_obj);
room_instance_add(argument0,208,208,spawn_ceil_obj);
room_instance_add(argument0,240,176,spawn_ceil_obj);
room_instance_add(argument0,240,208,spawn_ceil_obj);
room_instance_add(argument0,272,176,spawn_ceil_obj);
room_instance_add(argument0,272,208,spawn_ceil_obj);
room_instance_add(argument0,304,176,spawn_ceil_obj);
room_instance_add(argument0,304,208,spawn_ceil_obj);
room_instance_add(argument0,336,176,spawn_ceil_obj);
room_instance_add(argument0,336,208,spawn_ceil_obj);
room_instance_add(argument0,368,176,spawn_ceil_obj);
room_instance_add(argument0,368,208,spawn_ceil_obj);
room_instance_add(argument0,400,48,spawn_ceil_obj);
room_instance_add(argument0,400,80,spawn_ceil_obj);
room_instance_add(argument0,400,112,spawn_ceil_obj);
room_instance_add(argument0,400,144,spawn_ceil_obj);
room_instance_add(argument0,400,176,spawn_ceil_obj);
room_instance_add(argument0,400,208,spawn_ceil_obj);
room_instance_add(argument0,432,48,spawn_ceil_obj);
room_instance_add(argument0,432,80,spawn_ceil_obj);
room_instance_add(argument0,432,112,spawn_ceil_obj);
room_instance_add(argument0,432,144,spawn_ceil_obj);
room_instance_add(argument0,432,176,spawn_ceil_obj);
room_instance_add(argument0,432,208,spawn_ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,48,160,spawn_wall_hor_obj);
room_instance_add(argument0,48,224,spawn_wall_hor_obj);
room_instance_add(argument0,80,160,spawn_wall_hor_obj);
room_instance_add(argument0,80,224,spawn_wall_hor_obj);
room_instance_add(argument0,112,160,spawn_wall_hor_obj);
room_instance_add(argument0,112,224,spawn_wall_hor_obj);
room_instance_add(argument0,144,160,spawn_wall_hor_obj);
room_instance_add(argument0,144,224,spawn_wall_hor_obj);
room_instance_add(argument0,176,160,spawn_wall_hor_obj);
room_instance_add(argument0,176,224,spawn_wall_hor_obj);
room_instance_add(argument0,208,160,spawn_wall_hor_obj);
room_instance_add(argument0,208,224,spawn_wall_hor_obj);
room_instance_add(argument0,240,160,spawn_wall_hor_obj);
room_instance_add(argument0,240,224,spawn_wall_hor_obj);
room_instance_add(argument0,272,160,spawn_wall_hor_obj);
room_instance_add(argument0,272,224,spawn_wall_hor_obj);
room_instance_add(argument0,304,160,spawn_wall_hor_obj);
room_instance_add(argument0,304,224,spawn_wall_hor_obj);
room_instance_add(argument0,336,160,spawn_wall_hor_obj);
room_instance_add(argument0,336,224,spawn_wall_hor_obj);
room_instance_add(argument0,368,160,spawn_wall_hor_obj);
room_instance_add(argument0,368,224,spawn_wall_hor_obj);
room_instance_add(argument0,400,32,spawn_wall_hor_obj);
room_instance_add(argument0,400,224,spawn_wall_hor_obj);
room_instance_add(argument0,432,32,spawn_wall_hor_obj);
room_instance_add(argument0,432,224,spawn_wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,32,176,spawn_wall_vert_obj);
room_instance_add(argument0,32,208,spawn_wall_vert_obj);
room_instance_add(argument0,384,48,spawn_wall_vert_obj);
room_instance_add(argument0,384,80,spawn_wall_vert_obj);
room_instance_add(argument0,384,112,spawn_wall_vert_obj);
room_instance_add(argument0,384,144,spawn_wall_vert_obj);
room_instance_add(argument0,448,48,spawn_wall_vert_obj);
room_instance_add(argument0,448,80,spawn_wall_vert_obj);
room_instance_add(argument0,448,112,spawn_wall_vert_obj);
room_instance_add(argument0,448,144,spawn_wall_vert_obj);
room_instance_add(argument0,448,176,spawn_wall_vert_obj);
room_instance_add(argument0,448,208,spawn_wall_vert_obj);
// Props
room_instance_add(argument0,440,192,sg_dead_3d_obj);
room_instance_add(argument0,435,194,sg_dead_blood_obj);
room_instance_add(argument0,256,160,sg_dead_art_obj);
room_instance_add(argument0,448,192,sg_dead_sign_obj);
room_instance_add(argument0,0,0,sg_dead_obj);