/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,'
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string("ROOM","dead","ROOM_dead");
	ini_close();
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
');
// Room settings
room_set_width(argument0,1280);
room_set_height(argument0,720);
room_set_background_color(argument0,c_black,true);
room_set_view_enabled(argument0,true);
for (local.i=0; local.i<8; local.i+=1;)
{ room_set_view(argument0,local.i,false,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone); }
room_set_view(argument0,0,true,0,0,1280,720,0,0,1280,720,32,32,-1,-1,noone);
// Control
room_instance_add(argument0,32,96,clown_dead_ctrl_obj);
room_instance_add(argument0,32,96,clown_dead_fog_obj);
room_instance_add(argument0,56,96,cam_dead_obj);
// Floors
room_instance_add(argument0,48,48,spawn_floor_obj);
room_instance_add(argument0,80,48,spawn_floor_obj);
room_instance_add(argument0,112,48,spawn_floor_obj);
room_instance_add(argument0,144,48,spawn_floor_obj);
room_instance_add(argument0,176,48,spawn_floor_obj);
room_instance_add(argument0,48,80,spawn_floor_obj);
room_instance_add(argument0,80,80,spawn_floor_obj);
room_instance_add(argument0,112,80,spawn_floor_obj);
room_instance_add(argument0,144,80,spawn_floor_obj);
room_instance_add(argument0,176,80,spawn_floor_obj);
room_instance_add(argument0,48,112,spawn_floor_obj);
room_instance_add(argument0,80,112,spawn_floor_obj);
room_instance_add(argument0,112,112,spawn_floor_obj);
room_instance_add(argument0,144,112,spawn_floor_obj);
room_instance_add(argument0,176,112,spawn_floor_obj);
room_instance_add(argument0,48,144,spawn_floor_obj);
room_instance_add(argument0,80,144,spawn_floor_obj);
room_instance_add(argument0,112,144,spawn_floor_obj);
room_instance_add(argument0,144,144,spawn_floor_obj);
room_instance_add(argument0,176,144,spawn_floor_obj);
room_instance_add(argument0,48,176,spawn_floor_obj);
room_instance_add(argument0,80,176,spawn_floor_obj);
room_instance_add(argument0,112,176,spawn_floor_obj);
// Ceilings
room_instance_add(argument0,48,48,spawn_ceil_obj);
room_instance_add(argument0,80,48,spawn_ceil_obj);
room_instance_add(argument0,112,48,spawn_ceil_obj);
room_instance_add(argument0,144,48,spawn_ceil_obj);
room_instance_add(argument0,176,48,spawn_ceil_obj);
room_instance_add(argument0,48,80,spawn_ceil_obj);
room_instance_add(argument0,80,80,spawn_ceil_obj);
room_instance_add(argument0,112,80,spawn_ceil_obj);
room_instance_add(argument0,144,80,spawn_ceil_obj);
room_instance_add(argument0,176,80,spawn_ceil_obj);
room_instance_add(argument0,48,112,spawn_ceil_obj);
room_instance_add(argument0,80,112,spawn_ceil_obj);
room_instance_add(argument0,112,112,spawn_ceil_obj);
room_instance_add(argument0,144,112,spawn_ceil_obj);
room_instance_add(argument0,176,112,spawn_ceil_obj);
room_instance_add(argument0,48,144,spawn_ceil_obj);
room_instance_add(argument0,80,144,spawn_ceil_obj);
room_instance_add(argument0,112,144,spawn_ceil_obj);
room_instance_add(argument0,144,144,spawn_ceil_obj);
room_instance_add(argument0,176,144,spawn_ceil_obj);
room_instance_add(argument0,48,176,spawn_ceil_obj);
room_instance_add(argument0,80,176,spawn_ceil_obj);
room_instance_add(argument0,112,176,spawn_ceil_obj);
// Walls (Vertical)
room_instance_add(argument0,32,48,spawn_wall_vert_obj);
room_instance_add(argument0,32,80,spawn_wall_vert_obj);
room_instance_add(argument0,32,112,spawn_wall_vert_obj);
room_instance_add(argument0,32,144,spawn_wall_vert_obj);
room_instance_add(argument0,32,176,spawn_wall_vert_obj);
room_instance_add(argument0,128,176,spawn_wall_vert_obj);
room_instance_add(argument0,192,48,spawn_wall_vert_obj);
room_instance_add(argument0,192,80,spawn_wall_vert_obj);
room_instance_add(argument0,192,112,spawn_wall_vert_obj);
room_instance_add(argument0,192,144,spawn_wall_vert_obj);
// Walls (Horizontal)
room_instance_add(argument0,48,32,spawn_wall_hor_obj);
room_instance_add(argument0,80,32,spawn_wall_hor_obj);
room_instance_add(argument0,112,32,spawn_wall_hor_obj);
room_instance_add(argument0,176,32,spawn_wall_hor_obj);
room_instance_add(argument0,144,160,spawn_wall_hor_obj);
room_instance_add(argument0,176,160,spawn_wall_hor_obj);
room_instance_add(argument0,48,176,spawn_wall_hor_obj);
room_instance_add(argument0,80,176,spawn_wall_hor_obj);
room_instance_add(argument0,112,176,spawn_wall_hor_obj);
// Props
room_instance_add(argument0,32,32,clown_dead_pillar_obj);
room_instance_add(argument0,192,32,clown_dead_pillar_obj);
room_instance_add(argument0,192,160,clown_dead_pillar_obj);
room_instance_add(argument0,128,160,clown_dead_pillar_obj);
room_instance_add(argument0,128,176,clown_dead_pillar_obj);
room_instance_add(argument0,32,176,clown_dead_pillar_obj);
room_instance_add(argument0,176,48,clown_dead_table_obj);
room_instance_add(argument0,176,144,clown_dead_table_obj);
room_instance_add(argument0,192,64,clown_dead_window_obj);
room_instance_add(argument0,192,96,clown_dead_window_obj);
room_instance_add(argument0,192,128,clown_dead_window_obj);
room_instance_add(argument0,144,32,clown_dead_door_obj);
room_instance_add(argument0,56,96,clown_dead_cage_obj);
room_instance_add(argument0,100,96,clown_dead_obj);