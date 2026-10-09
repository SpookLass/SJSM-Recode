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
    with instance_create(112,160,load_par_obj.sg_dead_door_obj) { direction = 270; }
    with instance_create(208,160,load_par_obj.sg_dead_door_obj) { direction = 270; }
    with instance_create(304,160,load_par_obj.sg_dead_door_obj) { direction = 270; }
    with instance_create(112,224,load_par_obj.sg_dead_door_obj) { direction = 90; }
    with instance_create(208,224,load_par_obj.sg_dead_door_obj) { direction = 90; }
    with instance_create(304,224,load_par_obj.sg_dead_door_obj) { direction = 90; }
    with instance_create(384,112,load_par_obj.sg_dead_door_obj) { direction = 0; }
    with instance_create(448,112,load_par_obj.sg_dead_door_obj) { direction = 180; }
    // Big Doors
    with instance_create(32,192,load_par_obj.sg_dead_door_wide_obj) { direction = 0; }
    with instance_create(416,32,load_par_obj.sg_dead_door_wide_obj) { direction = 270; }
    // Focus Door
    with instance_create(448,192,load_par_obj.sg_dead_door_obj) { direction = 180; }
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
room_instance_add(argument0,48,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,48,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,80,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,80,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,112,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,112,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,144,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,144,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,176,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,176,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,208,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,208,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,240,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,240,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,272,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,272,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,304,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,304,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,336,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,336,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,368,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,368,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,400,48,argument1.sg_dead_floor_obj);
room_instance_add(argument0,400,80,argument1.sg_dead_floor_obj);
room_instance_add(argument0,400,112,argument1.sg_dead_floor_obj);
room_instance_add(argument0,400,144,argument1.sg_dead_floor_obj);
room_instance_add(argument0,400,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,400,208,argument1.sg_dead_floor_obj);
room_instance_add(argument0,432,48,argument1.sg_dead_floor_obj);
room_instance_add(argument0,432,80,argument1.sg_dead_floor_obj);
room_instance_add(argument0,432,112,argument1.sg_dead_floor_obj);
room_instance_add(argument0,432,144,argument1.sg_dead_floor_obj);
room_instance_add(argument0,432,176,argument1.sg_dead_floor_obj);
room_instance_add(argument0,432,208,argument1.sg_dead_floor_obj);
// Ceilings
room_instance_add(argument0,48,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,48,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,80,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,80,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,112,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,112,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,144,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,144,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,176,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,176,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,208,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,208,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,240,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,240,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,272,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,272,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,304,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,304,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,336,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,336,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,368,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,368,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,400,48,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,400,80,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,400,112,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,400,144,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,400,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,400,208,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,432,48,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,432,80,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,432,112,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,432,144,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,432,176,argument1.sg_dead_ceil_obj);
room_instance_add(argument0,432,208,argument1.sg_dead_ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,48,160,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,48,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,80,160,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,80,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,112,160,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,112,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,144,160,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,144,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,176,160,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,176,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,208,160,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,208,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,240,160,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,240,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,272,160,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,272,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,304,160,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,304,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,336,160,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,336,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,368,160,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,368,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,400,32,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,400,224,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,432,32,argument1.sg_dead_wall_hor_obj);
room_instance_add(argument0,432,224,argument1.sg_dead_wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,32,176,argument1.sg_dead_wall_vert_obj);
room_instance_add(argument0,32,208,argument1.sg_dead_wall_vert_obj);
room_instance_add(argument0,384,48,argument1.sg_dead_wall_vert_obj);
room_instance_add(argument0,384,80,argument1.sg_dead_wall_vert_obj);
room_instance_add(argument0,384,112,argument1.sg_dead_wall_vert_obj);
room_instance_add(argument0,384,144,argument1.sg_dead_wall_vert_obj);
room_instance_add(argument0,448,48,argument1.sg_dead_wall_vert_obj);
room_instance_add(argument0,448,80,argument1.sg_dead_wall_vert_obj);
room_instance_add(argument0,448,112,argument1.sg_dead_wall_vert_obj);
room_instance_add(argument0,448,144,argument1.sg_dead_wall_vert_obj);
room_instance_add(argument0,448,176,argument1.sg_dead_wall_vert_obj);
room_instance_add(argument0,448,208,argument1.sg_dead_wall_vert_obj);
// Props
room_instance_add(argument0,440,192,argument1.sg_dead_3d_obj);
room_instance_add(argument0,435,194,argument1.sg_dead_blood_obj);
room_instance_add(argument0,256,160,argument1.sg_dead_art_obj);
room_instance_add(argument0,448,192,argument1.sg_dead_sign_obj);
room_instance_add(argument0,0,0,argument1.sg_dead_obj);