/*
Argument 0: Room Variable (same for all rooms)
*/
// Spawn spots// Name
room_set_code
(
    argument0,"
    ini_open(global.lang_var);
	global.rm_name_var = ini_read_string('ROOM','jail','ROOM_jail')+' 15';
	ini_close();
    // Spawn
    global.spawn_len_var = 4;
    global.spawn_arr[0,0] = 112;
    global.spawn_arr[0,1] = 304;
    global.spawn_arr[0,2] = 0;
    global.spawn_arr[0,3] = 0;
    global.spawn_arr[1,0] = 368;
    global.spawn_arr[1,1] = 304;
    global.spawn_arr[1,2] = 0;
    global.spawn_arr[1,3] = 180;
    global.spawn_arr[2,0] = 208;
    global.spawn_arr[2,1] = 112;
    global.spawn_arr[2,2] = 0;
    global.spawn_arr[2,3] = 270;
    global.spawn_arr[3,0] = 208;
    global.spawn_arr[3,1] = 496;
    global.spawn_arr[3,2] = 0;
    global.spawn_arr[3,3] = 90;
    // Mark
    global.mark_len_var = 4;
    global.mark_arr[0,0] = 211;
    global.mark_arr[0,1] = 186;
    global.mark_arr[0,2] = 0;
    global.mark_arr[1,0] = 213;
    global.mark_arr[1,1] = 132;
    global.mark_arr[1,2] = 0;
    global.mark_arr[2,0] = 186;
    global.mark_arr[2,1] = 301;
    global.mark_arr[2,2] = 0;
    global.mark_arr[2,0] = 304;
    global.mark_arr[2,1] = 308;
    global.mark_arr[2,2] = 0;
    // 3D Draw
    d3d_start();
    global.draw_3d_var = true;
    // Doors
    local.entrance = instance_create(global.spawn_arr[0,0]-lengthdir_x(16,global.spawn_arr[0,3]),global.spawn_arr[0,1]-lengthdir_y(16,global.spawn_arr[0,3]),door_entrance_obj);
    local.entrance.z = global.spawn_arr[0,2];
    local.entrance.direction = global.spawn_arr[0,3]+180;
    for (local.i=1; local.i<global.spawn_len_var; local.i+=1;)
    {
        local.exitdoor = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(16,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(16,global.spawn_arr[local.i,3]),door_obj);
        local.exitdoor.direction = global.spawn_arr[local.i,3]+180;
        local.exittrig = instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),door_trig_obj);
        local.exittrig.z = global.spawn_arr[local.i,2];
    }
")
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
room_instance_add(argument0,112,304,floor_obj);
room_instance_add(argument0,144,304,floor_obj);
room_instance_add(argument0,176,304,floor_obj);
room_instance_add(argument0,208,304,floor_obj);
room_instance_add(argument0,208,272,floor_obj);
room_instance_add(argument0,208,240,floor_obj);
room_instance_add(argument0,176,240,floor_obj);
room_instance_add(argument0,176,208,floor_obj);
room_instance_add(argument0,176,176,floor_obj);
room_instance_add(argument0,208,176,floor_obj);
room_instance_add(argument0,208,208,floor_obj);
room_instance_add(argument0,176,144,floor_obj);
room_instance_add(argument0,176,112,floor_obj);
room_instance_add(argument0,208,144,floor_obj);
room_instance_add(argument0,208,112,floor_obj);
room_instance_add(argument0,240,112,floor_obj);
room_instance_add(argument0,240,144,floor_obj);
room_instance_add(argument0,240,176,floor_obj);
room_instance_add(argument0,240,208,floor_obj);
room_instance_add(argument0,240,240,floor_obj);
room_instance_add(argument0,240,304,floor_obj);
room_instance_add(argument0,272,304,floor_obj);
room_instance_add(argument0,304,304,floor_obj);
room_instance_add(argument0,272,176,floor_obj);
room_instance_add(argument0,304,176,floor_obj);
room_instance_add(argument0,304,208,floor_obj);
room_instance_add(argument0,304,240,floor_obj);
room_instance_add(argument0,304,272,floor_obj);
room_instance_add(argument0,336,304,floor_obj);
room_instance_add(argument0,368,304,floor_obj);
room_instance_add(argument0,208,336,floor_obj);
room_instance_add(argument0,176,368,floor_obj);
room_instance_add(argument0,208,368,floor_obj);
room_instance_add(argument0,240,368,floor_obj);
room_instance_add(argument0,240,400,floor_obj);
room_instance_add(argument0,208,400,floor_obj);
room_instance_add(argument0,176,400,floor_obj);
room_instance_add(argument0,176,432,floor_obj);
room_instance_add(argument0,208,432,floor_obj);
room_instance_add(argument0,240,432,floor_obj);
room_instance_add(argument0,240,464,floor_obj);
room_instance_add(argument0,240,496,floor_obj);
room_instance_add(argument0,208,464,floor_obj);
room_instance_add(argument0,208,496,floor_obj);
room_instance_add(argument0,176,464,floor_obj);
room_instance_add(argument0,176,496,floor_obj);
room_instance_add(argument0,304,336,floor_obj);
room_instance_add(argument0,304,368,floor_obj);
room_instance_add(argument0,272,432,floor_obj);
room_instance_add(argument0,304,432,floor_obj);
room_instance_add(argument0,304,400,floor_obj);
// Ceilings
room_instance_add(argument0,112,304,ceil_obj);
room_instance_add(argument0,144,304,ceil_obj);
room_instance_add(argument0,176,304,ceil_obj);
room_instance_add(argument0,208,304,ceil_obj);
room_instance_add(argument0,208,272,ceil_obj);
room_instance_add(argument0,208,240,ceil_obj);
room_instance_add(argument0,176,240,ceil_obj);
room_instance_add(argument0,176,208,ceil_obj);
room_instance_add(argument0,176,176,ceil_obj);
room_instance_add(argument0,208,176,ceil_obj);
room_instance_add(argument0,208,208,ceil_obj);
room_instance_add(argument0,176,144,ceil_obj);
room_instance_add(argument0,176,112,ceil_obj);
room_instance_add(argument0,208,144,ceil_obj);
room_instance_add(argument0,208,112,ceil_obj);
room_instance_add(argument0,240,112,ceil_obj);
room_instance_add(argument0,240,144,ceil_obj);
room_instance_add(argument0,240,176,ceil_obj);
room_instance_add(argument0,240,208,ceil_obj);
room_instance_add(argument0,240,240,ceil_obj);
room_instance_add(argument0,240,304,ceil_obj);
room_instance_add(argument0,272,304,ceil_obj);
room_instance_add(argument0,304,304,ceil_obj);
room_instance_add(argument0,272,176,ceil_obj);
room_instance_add(argument0,304,176,ceil_obj);
room_instance_add(argument0,304,208,ceil_obj);
room_instance_add(argument0,304,240,ceil_obj);
room_instance_add(argument0,304,272,ceil_obj);
room_instance_add(argument0,336,304,ceil_obj);
room_instance_add(argument0,368,304,ceil_obj);
room_instance_add(argument0,208,336,ceil_obj);
room_instance_add(argument0,176,368,ceil_obj);
room_instance_add(argument0,208,368,ceil_obj);
room_instance_add(argument0,240,368,ceil_obj);
room_instance_add(argument0,240,400,ceil_obj);
room_instance_add(argument0,208,400,ceil_obj);
room_instance_add(argument0,176,400,ceil_obj);
room_instance_add(argument0,176,432,ceil_obj);
room_instance_add(argument0,208,432,ceil_obj);
room_instance_add(argument0,240,432,ceil_obj);
room_instance_add(argument0,240,464,ceil_obj);
room_instance_add(argument0,240,496,ceil_obj);
room_instance_add(argument0,208,464,ceil_obj);
room_instance_add(argument0,208,496,ceil_obj);
room_instance_add(argument0,176,464,ceil_obj);
room_instance_add(argument0,176,496,ceil_obj);
room_instance_add(argument0,304,336,ceil_obj);
room_instance_add(argument0,304,368,ceil_obj);
room_instance_add(argument0,272,432,ceil_obj);
room_instance_add(argument0,304,432,ceil_obj);
room_instance_add(argument0,304,400,ceil_obj);
// Walls (Horizontal)
room_instance_add(argument0,112,288,wall_hor_obj);
room_instance_add(argument0,112,320,wall_hor_obj);
room_instance_add(argument0,176,256,wall_hor_obj);
room_instance_add(argument0,240,256,wall_hor_obj);
room_instance_add(argument0,272,192,wall_hor_obj);
room_instance_add(argument0,272,160,wall_hor_obj);
room_instance_add(argument0,240,96,wall_hor_obj);
room_instance_add(argument0,208,96,wall_hor_obj);
room_instance_add(argument0,176,96,wall_hor_obj);
room_instance_add(argument0,240,288,wall_hor_obj);
room_instance_add(argument0,176,288,wall_hor_obj);
room_instance_add(argument0,144,288,wall_hor_obj);
room_instance_add(argument0,144,320,wall_hor_obj);
room_instance_add(argument0,176,320,wall_hor_obj);
room_instance_add(argument0,240,320,wall_hor_obj);
room_instance_add(argument0,176,352,wall_hor_obj);
room_instance_add(argument0,240,352,wall_hor_obj);
room_instance_add(argument0,272,320,wall_hor_obj);
room_instance_add(argument0,272,288,wall_hor_obj);
room_instance_add(argument0,336,288,wall_hor_obj);
room_instance_add(argument0,368,288,wall_hor_obj);
room_instance_add(argument0,368,320,wall_hor_obj);
room_instance_add(argument0,336,320,wall_hor_obj);
room_instance_add(argument0,304,160,wall_hor_obj);
room_instance_add(argument0,304,448,wall_hor_obj);
room_instance_add(argument0,272,448,wall_hor_obj);
room_instance_add(argument0,272,416,wall_hor_obj);
room_instance_add(argument0,176,512,wall_hor_obj);
room_instance_add(argument0,208,512,wall_hor_obj);
room_instance_add(argument0,240,512,wall_hor_obj);
// Walls (Vertical)
room_instance_add(argument0,96,304,wall_vert_obj);
room_instance_add(argument0,224,336,wall_vert_obj);
room_instance_add(argument0,192,336,wall_vert_obj);
room_instance_add(argument0,192,272,wall_vert_obj);
room_instance_add(argument0,224,272,wall_vert_obj);
room_instance_add(argument0,256,240,wall_vert_obj);
room_instance_add(argument0,256,208,wall_vert_obj);
room_instance_add(argument0,320,176,wall_vert_obj);
room_instance_add(argument0,288,208,wall_vert_obj);
room_instance_add(argument0,288,336,wall_vert_obj);
room_instance_add(argument0,320,336,wall_vert_obj);
room_instance_add(argument0,384,304,wall_vert_obj);
room_instance_add(argument0,320,208,wall_vert_obj);
room_instance_add(argument0,320,240,wall_vert_obj);
room_instance_add(argument0,288,240,wall_vert_obj);
room_instance_add(argument0,288,272,wall_vert_obj);
room_instance_add(argument0,320,272,wall_vert_obj);
room_instance_add(argument0,320,368,wall_vert_obj);
room_instance_add(argument0,288,368,wall_vert_obj);
room_instance_add(argument0,288,400,wall_vert_obj);
room_instance_add(argument0,320,400,wall_vert_obj);
room_instance_add(argument0,320,432,wall_vert_obj);
room_instance_add(argument0,256,400,wall_vert_obj);
room_instance_add(argument0,256,368,wall_vert_obj);
room_instance_add(argument0,160,368,wall_vert_obj);
room_instance_add(argument0,160,400,wall_vert_obj);
room_instance_add(argument0,256,464,wall_vert_obj);
room_instance_add(argument0,256,496,wall_vert_obj);
room_instance_add(argument0,160,432,wall_vert_obj);
room_instance_add(argument0,160,464,wall_vert_obj);
room_instance_add(argument0,160,496,wall_vert_obj);
room_instance_add(argument0,256,112,wall_vert_obj);
room_instance_add(argument0,256,144,wall_vert_obj);
room_instance_add(argument0,160,112,wall_vert_obj);
room_instance_add(argument0,160,144,wall_vert_obj);
room_instance_add(argument0,160,176,wall_vert_obj);
room_instance_add(argument0,160,208,wall_vert_obj);
room_instance_add(argument0,160,240,wall_vert_obj);
// Torches
// Props
room_instance_add(argument0,208,272,bar_hor_obj);
room_instance_add(argument0,208,336,bar_hor_obj);
room_instance_add(argument0,304,400,bar_hor_obj);
// Jumpscare
room_instance_add(argument0,272,320,js_obj)