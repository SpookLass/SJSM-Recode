
/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots
room_set_code
(
    argument0,'
    // Name
    ini_open("lang_"+global.lang_var+".ini");
    global.rm_name_var = ini_read_string("ROOM","isolation","ROOM_isolation");
    ini_close();
    // Spawns
    global.spawn_len_var = 2;
    global.spawn_arr[0,0] = 48;
    global.spawn_arr[0,1] = 176;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 336;
    global.spawn_arr[1,1] = 240;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    // Marks (Slime spawners)
    global.mark_len_var = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    spawn_create_scr(true,false,false,false,spawn_leave_door_trig_obj);
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
room_instance_add(argument0,112,176,argument1.mon_spawn_trig_obj);
// Floors
room_instance_add(argument0,48,48,argument1.isolation_floor_obj);
room_instance_add(argument0,80,48,argument1.isolation_floor_obj);
room_instance_add(argument0,112,48,argument1.isolation_floor_obj);
room_instance_add(argument0,144,48,argument1.isolation_floor_obj);
room_instance_add(argument0,176,48,argument1.isolation_floor_obj);
room_instance_add(argument0,208,48,argument1.isolation_floor_obj);
room_instance_add(argument0,240,48,argument1.isolation_floor_obj);
room_instance_add(argument0,48,80,argument1.isolation_floor_obj);
room_instance_add(argument0,112,80,argument1.isolation_floor_obj);
room_instance_add(argument0,176,80,argument1.isolation_floor_obj);
room_instance_add(argument0,176,112,argument1.isolation_floor_obj);
room_instance_add(argument0,176,144,argument1.isolation_floor_obj);
room_instance_add(argument0,176,176,argument1.isolation_floor_obj);
room_instance_add(argument0,48,176,argument1.isolation_floor_obj);
room_instance_add(argument0,80,176,argument1.isolation_floor_obj);
room_instance_add(argument0,112,176,argument1.isolation_floor_obj);
room_instance_add(argument0,144,176,argument1.isolation_floor_obj);
room_instance_add(argument0,48,112,argument1.isolation_floor_obj);
room_instance_add(argument0,80,112,argument1.isolation_floor_obj);
room_instance_add(argument0,112,112,argument1.isolation_floor_obj);
room_instance_add(argument0,144,112,argument1.isolation_floor_obj);
room_instance_add(argument0,240,80,argument1.isolation_floor_obj);
room_instance_add(argument0,240,112,argument1.isolation_floor_obj);
room_instance_add(argument0,240,144,argument1.isolation_floor_obj);
room_instance_add(argument0,240,176,argument1.isolation_floor_obj);
room_instance_add(argument0,240,208,argument1.isolation_floor_obj);
room_instance_add(argument0,240,240,argument1.isolation_floor_obj);
room_instance_add(argument0,272,80,argument1.isolation_floor_obj);
room_instance_add(argument0,304,80,argument1.isolation_floor_obj);
room_instance_add(argument0,336,80,argument1.isolation_floor_obj);
room_instance_add(argument0,176,240,argument1.isolation_floor_obj);
room_instance_add(argument0,208,240,argument1.isolation_floor_obj);
room_instance_add(argument0,240,240,argument1.isolation_floor_obj);
room_instance_add(argument0,48,240,argument1.isolation_floor_obj);
room_instance_add(argument0,80,240,argument1.isolation_floor_obj);
room_instance_add(argument0,112,240,argument1.isolation_floor_obj);
room_instance_add(argument0,112,272,argument1.isolation_floor_obj);
room_instance_add(argument0,144,272,argument1.isolation_floor_obj);
room_instance_add(argument0,176,272,argument1.isolation_floor_obj);
room_instance_add(argument0,48,272,argument1.isolation_floor_obj);
room_instance_add(argument0,48,304,argument1.isolation_floor_obj);
room_instance_add(argument0,48,336,argument1.isolation_floor_obj);
room_instance_add(argument0,80,336,argument1.isolation_floor_obj);
room_instance_add(argument0,112,336,argument1.isolation_floor_obj);
room_instance_add(argument0,144,336,argument1.isolation_floor_obj);
room_instance_add(argument0,176,336,argument1.isolation_floor_obj);
room_instance_add(argument0,208,336,argument1.isolation_floor_obj);
room_instance_add(argument0,240,336,argument1.isolation_floor_obj);
room_instance_add(argument0,240,304,argument1.isolation_floor_obj);
room_instance_add(argument0,272,304,argument1.isolation_floor_obj);
room_instance_add(argument0,304,144,argument1.isolation_floor_obj);
room_instance_add(argument0,304,176,argument1.isolation_floor_obj);
room_instance_add(argument0,304,208,argument1.isolation_floor_obj);
room_instance_add(argument0,304,240,argument1.isolation_floor_obj);
room_instance_add(argument0,304,272,argument1.isolation_floor_obj);
room_instance_add(argument0,304,304,argument1.isolation_floor_obj);
room_instance_add(argument0,304,336,argument1.isolation_floor_obj);
room_instance_add(argument0,336,240,argument1.isolation_floor_obj);
// Ceilings
// Walls (Horizontal)
room_instance_add(argument0,48,32,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,80,32,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,112,32,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,144,32,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,176,32,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,208,32,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,240,32,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,48,128,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,80,128,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,112,128,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,144,128,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,48,160,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,80,160,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,112,160,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,144,160,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,48,192,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,80,192,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,112,192,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,144,192,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,176,192,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,176,224,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,208,224,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,48,224,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,80,224,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,112,224,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,144,256,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,144,64,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,144,96,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,80,96,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,80,64,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,272,64,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,304,64,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,336,64,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,304,128,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,336,224,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,336,256,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,240,288,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,272,288,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,272,320,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,304,352,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,48,352,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,80,352,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,112,352,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,144,352,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,176,352,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,208,352,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,240,352,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,80,320,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,112,320,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,144,320,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,176,320,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,208,320,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,112,288,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,144,288,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,176,288,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,208,256,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,240,256,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,80,256,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,272,96,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,304,96,argument1.isolation_wall_hor_obj);
room_instance_add(argument0,336,96,argument1.isolation_wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,192,80,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,192,112,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,192,144,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,192,176,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,160,144,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,32,48,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,32,80,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,32,112,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,32,176,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,64,80,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,96,80,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,128,80,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,160,80,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,224,80,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,224,112,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,224,144,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,224,176,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,224,208,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,256,112,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,256,144,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,256,176,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,256,208,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,256,240,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,256,48,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,320,144,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,320,176,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,320,208,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,288,144,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,288,176,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,288,208,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,288,240,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,288,272,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,352,240,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,320,272,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,320,304,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,320,336,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,288,336,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,256,336,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,224,304,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,192,272,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,160,240,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,128,240,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,96,272,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,64,272,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,64,304,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,32,240,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,32,272,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,32,304,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,32,336,argument1.isolation_wall_vert_obj);
room_instance_add(argument0,352,80,argument1.isolation_wall_vert_obj);